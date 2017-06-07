class AdminController < ApplicationController
  layout 'admin'
  before_action :set_board
  before_action :authenticate_admin, only: :index

  def index

  end

  def dashboard

  end

  def listings
    @listings = @board.listings
  end

  def companies
    @companies = @board.companies
  end

  private

  def authenticate_admin
    if current_admin
      if current_admin == @board.admin
        redirect_to admin_dashboard_path
      end
    else
      redirect_to admin_session_path
    end
  end

  def set_board
    @board = Board.find_by_subdomain!(request.subdomain) unless request.subdomain.empty?
  end
end
