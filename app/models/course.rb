class Course < ApplicationRecord
  belongs_to :subscription

  STATUSES = [:active, :pending, :cancelled]

  before_validation :set_defaults
  validates_presence_of :title, :tutor, :description

  scope :visible, -> { where(public: true) }
  scope :ended, ->(boolean = true) { where("ends < '#{Time.now}'") }
  scope :not_ended, ->(boolean = true) { where("ends > '#{Time.now}'") }

  private

  def set_defaults
    self.image = rand(1..8) if image.nil?
  end

  def self.ransackable_scopes(_auth)
    [:ended, :not_ended]
  end
end
