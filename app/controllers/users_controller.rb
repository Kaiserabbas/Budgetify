class UsersController < ApplicationController
  before_action :authenticate_user! 
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
  end
end
