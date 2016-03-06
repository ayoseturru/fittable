class AddPublicationIdToPlans < ActiveRecord::Migration
  def change
    add_column :plans, :publication_id, :integer
  end
end
