class PublicationAttachment < ActiveRecord::Base
  mount_uploader :image, ImageUploader
  belongs_to :publication
end
