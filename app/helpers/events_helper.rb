require 'open-uri'
require 'ostruct'
require 'json'

module EventsHelper

  def calc_cor (location)
    key = "AIzaSyB8Y2tnZHjBCcyXWJNpqeVqXgeJLLcfk5c"
    url = "https://maps.googleapis.com/maps/api/geocode/json?address=#{location}&key=#{key}"
    json_response = open(url).read
    response = JSON.parse(json_response)
    begin
      coordinates = response['results'][0]['geometry']['location']
      return coordinates
    rescue NoMethodError
      return JSON.parse('{"lat" : 42.36637398029149,"lng" : -71.2535282197085}')
    end
  end

  def map
    key = "AIzaSyB8Y2tnZHjBCcyXWJNpqeVqXgeJLLcfk5c"
    url = "https://maps.googleapis.com/maps/api/js?key=#{key}&callback=initMap"
    response = open(url).read
    return response
  end

  def guest?
    Party.all.each do |party|
      if party.user_id == current_user.id
        return true
      end
    end
    return false
  end


end
