class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  include EventsHelper
  helper_method

  # GET /events
  # GET /events.json
  def index
    location_info = request.location
    #retrieves data if logged on
    @heat = FALSE
    if current_user != nil
      if current_user.radius == nil
        current_user.radius = 5
      end
      #search based on search radius
      @my_events = Event.user_deletion(current_user.id)
      @events = Event.near([location_info.latitude, location_info.longitude], current_user.radius)
      current_user.update(:latitude => location_info.latitude)
      current_user.update(:longitude => location_info.longitude)
        new_radius = current_user.radius + 2
      @heat_zone = Event.near([location_info.latitude, location_info.longitude], new_radius)
      if @heat_zone != nil
        if @heat_zone.count(:all) - @events.count(:all) > 2
          @heat = TRUE
        end
      end
    else
      #search based on
      @my_events = nil
      @events = Event.all
    end
  end

  # GET /events/1
  # GET /events/1.json
  def show
    @party = Party.all
    gon.latlong = calc_cor (@event.location)
    @map = map
  end

  #Party Signups
  def join
    if params[:id]
      @party = Party.existing(current_user.id, params[:id]).first
        if @party == nil
          @party = Party.new(user_id: current_user.id, event_id: params[:id])
          @party.save
          flash[:success] = "Sucessfully Joined!"
          redirect_to current_user
        else
          flash[:danger] = "You already signed up for this."
          redirect_to current_user
        end
    end
  end

  # GET /events/new
  def new
    @event = Event.new
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(event_params)
    @current = User.find_by id: session[:user_id]
    @event.user_id = @current.id

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end

    puts @event.routing
    if @event.routing.present? && @event.account.present?
      puts "enter"
      Stripe.api_key = "sk_test_e3a2WOvBkQpgRrufKzprhHhn"

      acct = Stripe::Account.create(
      {
        :country => 'US',
        :managed => true,
        :external_account => {
          :object => 'bank_account',
          :country => 'US',
          :currency => 'usd',
          :routing_number => @event.routing,
          :account_number => @event.account,
        }
      }
      )
      current_user.update_attributes(:account_id => acct.id)
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    #destroys relationships
    Party.deletion(@event.id).each do |temp|
      temp.destroy
    end
    @event.destroy

    respond_to do |format|
      format.html { redirect_to events_url, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:name, :date, :time, :location, :avatar, :price, :routing, :account)
    end
end
