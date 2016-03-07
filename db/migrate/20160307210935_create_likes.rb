class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.integer :user_id
      t.integer :publication_id

      t.timestamps null: false
    end
  end
end
