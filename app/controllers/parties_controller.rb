class PartiesController < ApplicationController
  def new
    @party = Party.new
  end
end
