class AddImageToPublicationAttachments < ActiveRecord::Migration
  def change
    add_column :publication_attachments, :image, :string
  end
end
