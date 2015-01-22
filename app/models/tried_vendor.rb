class TriedVendor < ActiveRecord::Base
  belongs_to :company

  attr_accessor :company_id

  validates :company, presence: true
end
