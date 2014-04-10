class User < ActiveRecord::Base
  has_secure_password
  validates_uniqueness_of :email
  validates_presence_of :name
  has_many :tags
  has_many :photos, through: :tags
  has_attached_file :avatar, :styles => { small: "100x100>", medium: "250x250>" }

  validates_attachment_content_type :avatar, :content_type =>
  ["image/jpg", "image/jpeg", "image/png"]
end
