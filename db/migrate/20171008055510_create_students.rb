class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students, id: false do |t|
      t.integer :student_id, primary: true 
      t.string :name
      t.string :email

      t.timestamps null: false
    end
  end
end
