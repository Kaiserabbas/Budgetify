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
      fa-user fa-envelope fa-flag fa-address-book fa-bell fa-camera fa-heart fa-envelope fa-star fa-user
      fa-thumbs-up fa-check-circle fa-cog fa-globe fa-music fa-plane fa-shopping-cart fa-truck fa-briefcase
      fa-coffee fa-gamepad fa-lightbulb fa-leaf fa-paw fa-umbrella fa-building fa-gavel fa-key fa-lock fa-map
      fa-anchor fa-bicycle fa-graduation-cap fa-medkit fa-shield fa-suitcase fa-trophy fa-truck fa-car fa-bus
      fa-train fa-battery-full fa-battery-half fa-battery-quarter fa-battery-empty fa-battery-three-quarters
    ]
  end
end
