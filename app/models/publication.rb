class Publication < ActiveRecord::Base
  belongs_to :user
  has_many :publication_attachments
  accepts_nested_attributes_for :publication_attachments

  private
  def publication_params
    params.require(:publication).permit(:user, :title, :description, {images: []})
  end
end
