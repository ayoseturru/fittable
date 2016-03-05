class CreatePublicationAttachments < ActiveRecord::Migration
  def change
    create_table :publication_attachments do |t|
      t.integer :publication_id

      t.timestamps null: false
    end
  end
end
