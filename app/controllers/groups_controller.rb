class GroupsController < ApplicationController
  before_action :authenticate_user!
  before_action :load_font_awesome_icons, only: %i[new create]

  def index
    @groups = current_user.groups
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    @group.user = current_user

    if @group.save
      redirect_to groups_path
    else
      load_font_awesome_icons
      render :new
    end
  end

  def show
    @group = Group.find(params[:id])
    @entities = @group.entities
    @sum = @entities.sum(:amount)
  end

  private

  def group_params
    params.require(:group).permit(:name, :icon)
  end

  def load_font_awesome_icons
    @icons = %w[
      fa-user fa-envelope fa-flag fa-address-book fa-bell
      fa-heart fa-camera fa-globe fa-cloud fa-briefcase
      fa-star fa-rocket fa-music fa-book fa-coffee
      fa-lightbulb fa-umbrella fa-plane fa-smile fa-sun
      fa-leaf fa-star-o fa-star-half-o fa-star-half-empty
      fa-star-half-full
    ]
  end
end
