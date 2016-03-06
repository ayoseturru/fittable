class CreateExercises < ActiveRecord::Migration
  def change
    create_table :exercises do |t|
      t.string :day
      t.integer :publication_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
