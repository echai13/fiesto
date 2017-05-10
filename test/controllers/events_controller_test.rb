require 'test_helper'

class EventsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:kelvin)
    @event = events(:one)
    @brandeis = events(:brandeis)
  end

  test "should get index" do
    get events_url
    assert_response :success
  end

  test "should get new" do
    log_in_as(@user)
    get new_event_url
    assert_response :success
  end



  test "should create event" do
    log_in_as(@user)
    get new_event_url
    assert_difference('Event.count') do
      post events_url, params: { event: { date: @event.date, location: @event.location, name: @event.name, time: @event.time} }
    end

    assert_redirected_to event_url(Event.last)
  end


  # test "should expand radius" do
  #   log_in_as(@user)
  #   get events_url
  #   @controller = User.new
  #   puts @controller
  #   current = @controller.send(:radius)
  #   # @user.expand
  #   @controller.send(:expand)
  #   new_rad = @controller.send(:radius)
  #   assert_equal(current + 2,new_rad)
  # end

  # test "should show all parties" do
  #   #log_in_as(@user)
  #   get '/'
  #   if @event != nil
  #     assert_equal(@event, Event.all)
  #   else
  #     assert_equal(0,Event.all.count)
  #   end
  # end

  # test "should show event" do
  #   log_in_as(@user)
  #   get event_url(@brandeis)
  #   assert_response :success
  # end

  # test "should get edit" do
  #   get edit_event_url(@event)
  #   assert_response :success
  # end

  # test "should update event" do
  #   patch event_url(@event), params: { event: { date: @event.date, location: @event.location, name: @event.name, time: @event.time } }
  #   assert_redirected_to event_url(@event)
  # end

  # test "should destroy event" do
  #   assert_difference('Event.count', -1) do
  #     delete event_url(@event)
  #   end
  #
  #   assert_redirected_to events_url
  # end
end
