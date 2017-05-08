class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :set_board
  layout :layout_by_resource

  private

  def layout_by_resource
    if devise_controller?
      "board"
    else
      "application"
    end
  end

  def set_board
    @board = Board.find_by_subdomain!(request.subdomain) unless request.subdomain.empty?
  end
end
