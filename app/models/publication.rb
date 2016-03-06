class Publication < ActiveRecord::Base
  belongs_to :user
  has_many :publication_attachments
  accepts_nested_attributes_for :publication_attachments
  scope :category, -> (category = "General") { where(:category => category) }
  before_save :title_capitalize, :set_category

  def owned_by?(owner)
    return false unless owner.is_a? User
    user == owner
  end

  private
  def set_category
    self.category = (self.category != "") ? self.category : "General"
  end

  private
  def title_capitalize
    self.title.capitalize!
  end
end
