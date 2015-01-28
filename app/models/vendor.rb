require 'crunchbase'

class Vendor < ActiveRecord::Base
  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>"}
  validates_attachment :image, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }
  has_many :customers
  has_many :comments, as: :commentable, dependent: :destroy
  has_many :products, :through => :customers


#add button 
#rails runner scrapeall.rb in console
  def scrape_crunchbase
    crunchdoc = Crunchbase.new( crunchbase_url(:organization) ) rescue nil
    #crunchdoc ||= Crunchbase.new( crunchbase_url(:product) ) rescue nil

    if crunchdoc
      self.description = crunchdoc.scrape_description
      self.website = crunchdoc.scrape_website
    else
      logger.info "Could not open and scrape Crunchbase for #{vendor_name}"
    end
  end

  def self.search(query)
    if Rails.env.production?
      where("vendor_name ilike ?", "%#{query}%") #todo: autopop and return non exact searches
    else
      where("vendor_name like ?", "%#{query}%") #todo: autopop and return non exact searches
    end
  end 

  def crunchbase_url(what)
    whatname = vendor_name.downcase
    "https://www.crunchbase.com/#{what}/#{whatname}"
  end
  
end
