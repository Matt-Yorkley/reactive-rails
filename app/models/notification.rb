class Notification < ApplicationRecord
  default_scope { order(created_at: :desc) }

  scope :latest, ->{ limit(5) }
end
