class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :follows, dependent: :destroy
  has_many :products
  has_many :comments
  has_many :companies, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable, 
         :omniauthable, :omniauth_providers => [:linkedin]

def self.from_omniauth(auth)
  where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
    user.email = auth.info.email
    user.password = Devise.friendly_token[0,20]
    user.name = auth.info.name   # assuming the user model has a name
    #user.image = auth.info.image # assuming the user model has an image
  end.tap do |u|
    u.companies.create(prepare_companies_attrs(auth['extra']['raw_info']['positions']))
  end
end

def self.prepare_companies_attrs(positions)
  positions['values'].map { |e| { name: e['company']['name'] } }
end

  # def self.from_omniauth(auth) #extracts info that is available after authentication
  #   where(provider: auth.provider, uid:auth.uid).first_or_create do |user|
  #     user.provider = auth.provider
  #     user.uid = auth.uid
  #     user.email = auth.info.email
  #     user.password = Devise.friendly_token[0.20]
  #   end
  # end


  def admin?
    role == "admin"
  end
  
  def followed(product)
    follows.where(product_id: product.id).first
  end
  
end
