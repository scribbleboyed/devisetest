class EmployersController < ApplicationController
	layout 'board'
	before_action :authenticate_employer!

    def dashboard
    	@listings = current_employer.listings
    end

    def profile
    	@posts = current_employer
    end
end