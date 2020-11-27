class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :subscription

  has_many :sent_messages, class_name: 'Message', foreign_key: 'sender_id'
  has_many :received_messages, class_name: 'Message', foreign_key: 'receiver_id'

  validates_presence_of :username, :email
  validates_uniqueness_of :username

  before_validation :set_defaults

  private

  def set_defaults
    self.subscription = Subscription.first if subscription.nil?
  end
end
