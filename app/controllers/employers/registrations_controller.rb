class Employers::RegistrationsController < Devise::RegistrationsController

	def after_sign_up_path_for(resource)
		employer_profile_path
  	end

	private

		def update_resource(resource, params)
			resource.update_without_password(params)
			# redirect_to new_post_path - need to fix
		end

	  	def registration_params
	  		params.require(:employer).permit(:email, :password, :password_confirmation)
		end
end
