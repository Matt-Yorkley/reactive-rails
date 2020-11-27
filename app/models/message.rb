class Message < ApplicationRecord
  belongs_to :sender, class_name: 'User', foreign_key: 'sender_id'
  belongs_to :receiver, class_name: 'User', foreign_key: 'receiver_id', optional: true

  # validates_presence_of :sender_id, :receiver_id

  default_scope { order(created_at: :desc) }

  scope :latest, ->{ limit(5) }
  scope :receiver, ->(user) { where(receiver_id: user) }
  scope :sender_or_receiver, ->(user) { where(receiver_id: user).or(where(sender_id: user)) }
end
