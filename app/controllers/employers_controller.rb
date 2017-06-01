class EmployersController < ApplicationController
	layout 'board'
	before_action :authenticate_employer!

    def dashboard
    	@listings = current_employer.listings
    end

    def listings
    	@listings = current_employer.listings
    end

    def profile
    	@employer = current_employer
        @company = @employer.company || @employer.company.build
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