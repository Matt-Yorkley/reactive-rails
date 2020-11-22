class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :subscription

  validates_presence_of :username, :email
  validates_uniqueness_of :username

  before_validation :set_defaults

  private

  def set_defaults
    self.subscription = Subscription.first if subscription.nil?
  end
end
