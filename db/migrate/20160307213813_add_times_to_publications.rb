class AddTimesToPublications < ActiveRecord::Migration
  def change
    add_column :publications, :times, :integer
  end
end
