class Party < ApplicationRecord
  belongs_to :user
  belongs_to :event
  has_many :charges

  def self.existing(u_id,e_id)
    where("user_id = ? AND event_id = ?", "#{u_id}", "#{e_id}")
  end

  def self.deletion(e_id)
    where("event_id = ?" , "#{e_id}")
  end

  def self.user_deletion(u_id)
    where("user_id = ?" , "#{u_id}")
  end

  def self.party_exist(user_id, event_id)
    where(:user_id => user_id, :event_id => event_id).exists?
  end


end
