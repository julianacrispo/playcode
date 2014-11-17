class Product < ActiveRecord::Base
  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  validates_attachment :image, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }
  # validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  has_many :comments
  belongs_to :user
end
