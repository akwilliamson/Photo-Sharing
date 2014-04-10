class Photo < ActiveRecord::Base
  validates :post, presence: true
  has_attached_file :post, :styles => { small: "100x100>", medium: "250x250>" }
  has_many :tags
  has_many :users, through: :tags
  has_many :favorites

  validates_attachment_content_type :post, :content_type =>
  ["image/jpg", "image/jpeg", "image/png"]
end
