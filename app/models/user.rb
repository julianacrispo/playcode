class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :follows, dependent: :destroy
  has_many :products
  has_many :comments
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable


  def admin?
    role == "admin"
  end
  
  def followed(product)
    follows.where(product_id: product.id).first
  end
  
end
