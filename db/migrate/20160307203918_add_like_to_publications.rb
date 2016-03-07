class AddLikeToPublications < ActiveRecord::Migration
  def change
    add_column :publications, :like, :integer
  end
end
