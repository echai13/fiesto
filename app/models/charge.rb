class Charge < ApplicationRecord
  belongs_to :event
  belongs_to :user
  belongs_to :party

  validates_presence_of :email

  attr_accessor :stripe_card_token

end
