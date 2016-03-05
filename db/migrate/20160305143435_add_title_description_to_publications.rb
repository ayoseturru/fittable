class AddTitleDescriptionToPublications < ActiveRecord::Migration
  def change
    add_column :publications, :title, :string
    add_column :publications, :description, :string
  end
end
