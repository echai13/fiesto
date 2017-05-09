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
      #geocoder test
      # puts Event.first.latitude
      # assert_not_nil (@event.latitude)
      # assert_not_nil (@event.longitude)

    end

    assert_redirected_to event_url(Event.last)
  end

  # test "should expand radius" do
  #   log_in_as(@user)
  #   get events_url
  #   current = @user.radius
  #   post expand_url
  #   new_rad = @user.radius
  #   assert_equal(current + 2,new_rad)
  # end

  # test "should show all parties" do
  #   #log_in_as(@user)
  #   get events_url
  #   assert_equal(@events.count, Event.all.count)
  # end

  # test "should show event" do
  #   get event_url(@event)
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
