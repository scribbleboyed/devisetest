class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :set_board

  private

  def set_board
    @board = Board.find_by_subdomain!(request.subdomain) unless request.subdomain.empty?
  end
end
