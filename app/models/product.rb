class Product < ActiveRecord::Base
  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  validates_attachment :image, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }
  has_many :comments, as: :commentable, dependent: :destroy
  has_many :customers
  has_many :vendors, :through => :customers
  has_many :follows, dependent: :destroy

#search test
  def self.search(query)
    where("name like?", "%#{query}%") #todo: autopop and return non exact searches
  end 

end
