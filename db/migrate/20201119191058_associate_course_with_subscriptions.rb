class AssociateCourseWithSubscriptions < ActiveRecord::Migration[5.2]
  def change
    add_reference :courses, :subscription, foreign_key: true
  end
end
