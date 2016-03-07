class Publication < ActiveRecord::Base
  belongs_to :user
  has_many :publication_attachments, :dependent => :delete_all
  before_save :set_like, :set_times


  def add_time
    self.times = self.times + 1
    self.save
  end

  accepts_nested_attributes_for :publication_attachments
  scope :category, -> (category = "General") { where(:category => category) }
  before_save :title_capitalize, :set_category

  def owned_by?(owner)
    return false unless owner.is_a? User
    user == owner
  end

  private
  def set_times
    self.times ||= 0
  end

  private
  def set_like
    self.like ||= 0
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
