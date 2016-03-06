class CreatePlans < ActiveRecord::Migration
  def change
    create_table :plans do |t|
      t.string :day

      t.timestamps null: false
    end
  end
end
