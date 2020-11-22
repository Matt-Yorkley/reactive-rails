class Subscription < ApplicationRecord
  has_many :users
  has_many :courses

  validates_presence_of :tier, :price
  validates_numericality_of :price

  default_scope { order(price: :asc) }
end
