class Vendor < ActiveRecord::Base
  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>"}
  validates_attachment :image, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }
  has_many :customers
  has_many :comments, as: :commentable
  has_many :products, :through => :customers


   def self.search(query)
    where("vendor_name like?", "%#{query}%") #todo: autopop and return non exact searches
  end 
  
end
