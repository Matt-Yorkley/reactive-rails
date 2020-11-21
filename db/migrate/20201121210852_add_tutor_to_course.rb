class AddTutor < ActiveRecord::Migration[5.2]
  def change
    add_column :courses, :tutor, :string
  end
end
