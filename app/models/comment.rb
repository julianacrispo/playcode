class Comment < ActiveRecord::Base
  belongs_to :product
  belongs_to :vendor
  belongs_to :user

  # accepts_nested_attributes_for :products, :vendors
end
