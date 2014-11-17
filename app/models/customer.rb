class Customer < ActiveRecord::Base
  belongs_to :brand
  belongs_to :vendor
end
