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
        # @company = @employer.company
        @company = @employer.company || Company.find(current_employer.id)
        # Company.update_all(employer_id: @employer.id)
    end

    def update_profile
        respond_to do |format|
            if @company.update(company_params)
                format.html { redirect_to :employer_profile_path, notice: 'Company was successfully updated.' }
                format.json { redirect_to :employer_profile_path, status: :ok, location: @company }
            else
                format.html { render :edit }
                format.json { render json: @company.errors, status: :unprocessable_entity }
            end
        end
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
            @company = current_employer.company
        end

        def company_params
            # params.require(:company).permit(:board_id, :employer_id, :name, :description, :url)
        end
end