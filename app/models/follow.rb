class Follow < ActiveRecord::Base
  belongs_to :product
  belongs_to :user
  # has_many :vendors, dependent: :destroy
end
