class Party < ApplicationRecord
  belongs_to :user
  belongs_to :event

  def self.existing(u_id,e_id)
    where("user_id == ? AND event_id == ?", "#{u_id}", "#{e_id}")
  end


end
