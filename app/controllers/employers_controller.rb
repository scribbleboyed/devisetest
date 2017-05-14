class EmployersController < ApplicationController
	layout 'board'
	before_action :authenticate_employer!

    def dashboard
    	@posts = current_employer.listings
    end
end