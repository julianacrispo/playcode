class Company < ActiveRecord::Base
  belongs_to :user
  has_many :tried_vendors, dependent:  :destroy

  validates :name, uniqueness: true
end
