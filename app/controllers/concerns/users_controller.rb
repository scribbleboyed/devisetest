class UsersController < ApplicationController
  before_action :set_board

  def new
    @user = User.new(board: @board)
  end
end