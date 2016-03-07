class Like < ActiveRecord::Base
  has_one :user
  has_one :publication
  scope :user_like, -> (user_id, publication_id) { where(:user_id => user_id, :publication_id => publication_id) }
end
