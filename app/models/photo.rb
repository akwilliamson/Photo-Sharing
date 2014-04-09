class Photo < ActiveRecord::Base
  validates :post, presence: true
  has_attached_file :post
  has_many :tags
  has_many :users, through: :tags

  validates_attachment_content_type :post, :content_type =>
  ["image/jpg", "image/jpeg", "image/png"]
end
