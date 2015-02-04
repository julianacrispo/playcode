class TriedVendor < ActiveRecord::Base
  belongs_to :company

  attr_accessor :company_id #remove this

  validates :company, presence: true


  #belongs to company vendor and user.  needs all the ids
end
