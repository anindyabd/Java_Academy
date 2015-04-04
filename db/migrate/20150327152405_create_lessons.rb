class CreateLessons < ActiveRecord::Migration
  def change
    create_table :lessons do |t|
      t.integer :number
      t.string :name
      t.text :description
      t.text :instruction
      t.text :skeleton_code

      t.timestamps null: false
    end
  end
end
