class AddSeriesAndRepeatsToExercise < ActiveRecord::Migration
  def change
    add_column :exercises, :series, :integer
    add_column :exercises, :repeats, :integer
  end
end
