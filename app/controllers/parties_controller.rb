class PartiesController < ApplicationController
  def new
    @party = Party.new
  end

  def review
    @party = Party.where(:user_id => params[:user_id]).where(:event_id => params[:event_id])
    @party.update(:rating => params[:rating], :comment => params[:comment])
    redirect_to(:back)
  end
end
