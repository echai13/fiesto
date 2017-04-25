class ChargesController < ApplicationController
  before_action :amount_to_be_charged, only: [:new]
  before_action :find_host_account_id, only: [:create]
  $amount
  $account_id

  def new
  end

def create
  Stripe.api_key = "sk_test_e3a2WOvBkQpgRrufKzprhHhn"
  charge = Stripe::Charge.create(
    {
    amount: $amount,
    description: 'Event Fee Payment',
    source: params[:stripeToken],
    currency: 'usd',
    destination: $account_id
  })

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
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
 end
