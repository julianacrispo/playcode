class Vendor < ActiveRecord::Base
  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>"}
  validates_attachment :image, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }
  has_many :customers
  has_many :comments, as: :commentable, dependent: :destroy
  has_many :products, :through => :customers


   def self.search(query)
    if Rails.env.production?
      where("vendor_name ilike ?", "%#{query}%") #todo: autopop and return non exact searches
    else
      where("vendor_name like ?", "%#{query}%") #todo: autopop and return non exact searches
    end
  end 
  
end
