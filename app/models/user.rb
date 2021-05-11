class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :rememberable, :validatable,
         :omniauthable, omniauth_providers: %i[facebook] 


  #def self.from_omniauth(access_token)
  #    data = access_token.info
  #    user = User.where(email: data['email']).first
  
  #    # Uncomment the section below if you want users to be created if they don't exist
  #    unless user
  #        user = User.create(name: data['name'],
  #           email: data['email'],
  #           password: Devise.friendly_token[0,20]
  #        )
  #    end
  #    user
  #end

  def self.from_omniauth(auth)
    name_split = auth.info.name.split(" ")
    user = User.where(email: auth.info.email).first
    user ||= User.create!(provider: auth.provider, uid: auth.uid, name: auth.info.name, email: auth.info.email, encrypted_password: Devise.friendly_token[0, 20])
      user
  end

  has_many :posts, :dependent => :destroy
end
