class EmployersController < ApplicationController
	layout 'board'
	before_action :authenticate_employer!, :set_company

    def dashboard
    	@listings = current_employer.listings
    end

    def listings
    	@listings = current_employer.listings
    end

    def profile
    	@employer = current_employer
        @company = @employer.company || Company.new(employer_id: @employer.id)
    end

    private

		def update_resource(resource, params)
			resource.update_without_password(params)
			# redirect_to new_post_path - need to fix
		end

	  	def registration_params
	  		params.require(:employer).permit(:email, :password, :password_confirmation)
		end

        def set_company
            @company = current_employer.company.find_by(id: params[:id], board: @board)
        end

        def company_params
            # params.require(:company).permit(:board_id, :employer_id, :name, :description, :url)
        end
end