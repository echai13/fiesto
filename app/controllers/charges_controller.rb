class ChargesController < ApplicationController
  before_action :amount_to_be_charged, only: [:new, :create]
  before_action :find_host_account_id, only: [:create]
  before_action :join_party, only: [:new]
  $amount
  $account_id


  def new
  end

def create
  puts $amount
  Stripe.api_key = Rails.application.secrets.STRIPE_SECRET_KEY
  puts params[:enter].present?
  puts current_user.customer_id

  #charge person who is attending event
  if params[:enter].present?

    user_to_be_charged = User.find_by_id(params[:user_id])
    puts params[:enter]
    if params[:enter].to_i == user_to_be_charged.passcode.to_i

        puts params[:event_price]
        charge = Stripe::Charge.create(
        {
          amount: $amount,
          description: 'Event Fee Payment',
          currency: 'usd',
          destination: $account_id,
          customer: user_to_be_charged.customer_id

        }
        )

      puts "current party"
      @current_party = Party.find_by_id(params[:party_id])
      @current_party.attended = TRUE
      @current_party.save
      flash[:success] = "You have successfully check-in the guest!"
      redirect_to Event.find_by_id(@current_party.event_id)
    else
      flash[:error] = "Guest's passcode is incorrect!"
      @current_party = Party.find_by_id(params[:party_id])
      redirect_to Event.find_by_id(@current_party.event_id)
    end



  elsif !current_user.card_avail #just add card to Stripe without charging
    customer = Stripe::Customer.retrieve(current_user.customer_id)
    customer.source = params[:stripeToken]
    customer.save

    current_user.update_attributes(:card_avail => TRUE)
    join_party
  else #just join_party
    puts "else"
    join_party
  end

  rescue Stripe::CardError => e
    flash[:error] = e.message
  end

  private
    def amount_to_be_charged
      $amount = params[:event_price]
      $amount = $amount.to_i*100
    end

    def find_host_account_id
      $account_id = User.find_by params[:event_host]
      $account_id = $account_id.account_id
    end

    def join_party
      if params[:id]
        @party = Party.existing(current_user.id, params[:id]).first
          if @party == nil
            @party = Party.new(user_id: current_user.id, event_id: params[:id])
            @party.save
          end
        @event = Event.find_by(id: params[:id])
        @event.increment!(:attendees)
        @event.save
      end
    end
  end
