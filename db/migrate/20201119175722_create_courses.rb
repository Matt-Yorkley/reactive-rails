class CreateCourses < ActiveRecord::Migration[5.2]
  def change
    create_table :courses do |t|
      t.string :title
      t.text :description
      t.date :starts
      t.date :ends
      t.string :status
      t.boolean :public, default: true

      t.timestamps
    end
  end
end
