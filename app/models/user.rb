class User < ActiveRecord::Base
  include Clearance::User
  has_many :listings
  has_many :reservations
  has_many :authentications, :dependent => :destroy
  mount_uploader :image, ImageUploader

  def self.create_with_auth_and_hash(authentication,auth_hash)
    create! do |user|
	    user.email = auth_hash["info"]["email"]
	    user.password = auth_hash["info"]["password"]
	    user.name = auth_hash["info"]["name"] 
	    user.remote_image_url = auth_hash["info"]["image"].gsub('http://','https://')
	    user.provider = auth_hash["provider"]
	    user.uid = auth_hash["uid"]
	    user.authentications << (authentication)
	  end
	end

	def fb_token
    x = self.authentications.where(:provider => :facebook).first
    return x.token unless x.nil?
  end
    
  def password_optional?
    true
  end

  def has_payment_info?
    braintree_customer_id
  end

end