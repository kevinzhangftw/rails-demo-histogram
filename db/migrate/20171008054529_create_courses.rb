class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.integer :course_id
      t.string :description

      t.timestamps null: false
    end
  end
end
