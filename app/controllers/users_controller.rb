class UsersController < Clearance::UsersController
 	
 	def new
 		@user = User.new
 	end

  def edit
    
  end
 	
	def user_from_params
  	name = user_params.delete(:name)
    email = user_params.delete(:email)
    password = user_params.delete(:password)
    image = user_params.delete(:image)

    Clearance.configuration.user_model.new(user_params).tap do |user|
    	user.name = name
      user.email = email
      user.password = password
      user.image = image
    end
  end

 	def user_params
    params.require(:user).permit(:name, :email, :password, :image)
  end
end
