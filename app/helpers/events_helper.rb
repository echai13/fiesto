require 'open-uri'
require 'ostruct'
require 'json'

module EventsHelper

  def calc_cor (location)
    key = "AIzaSyB8Y2tnZHjBCcyXWJNpqeVqXgeJLLcfk5c"
    url = "https://maps.googleapis.com/maps/api/geocode/json?address=#{location}&key=#{key}"
    json_response = open(url).read
    response = JSON.parse(json_response)
    coordinates = response['results'][0]['geometry']['location']
    return coordinates
  end

  def map
    key = "AIzaSyB8Y2tnZHjBCcyXWJNpqeVqXgeJLLcfk5c"
    url = "https://maps.googleapis.com/maps/api/js?key=#{key}&callback=initMap"
    response = open(url).read
    return response
  end

  def distance
    key = "AIzaSyB8Y2tnZHjBCcyXWJNpqeVqXgeJLLcfk5c"

  end


end
