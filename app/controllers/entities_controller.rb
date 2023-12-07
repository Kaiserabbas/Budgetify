class EntitiesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_group, only: %i[index new create edit update destroy]
  def index
    @entities = @group.entities
    @group = Group.find(params[:group_id])
  end

  def show
    @group = Group.find(params[:group_id])
    @entity = @group.entities.find(params[:id])
  end

  def new
    @entity = @group.entities.new
    @groups = Group.all
  end

  def create
    @entity = current_user.entities.new(entity_params)

    if @entity.save
      redirect_to group_entities_path(@entity.group), notice: 'Entity was successfully created.'
    else
      render :new, notice: 'Entity was not created.'
    end
  end

  def edit
    @group = Group.find(params[:group_id])
    @entity = current_user.entities.find(params[:id])
  end

  def update
    @entity = @group.entities.find(params[:id])

    if @entity.update(entity_params)
      redirect_to group_entities_path(@group), notice: 'Entity was successfully updated.'
    else
      render :edit, notice: 'Entity was not updated.'
    end
  end

  def destroy
    @entity = @group.entities.find(params[:id])
    if @entity.destroy
      redirect_to group_entities_path(@group), notice: 'Entity was successfully destroyed.'
    else
      redirect_to group_entities_path(@group), alert: 'Entity could not be destroyed.'
    end
  end

  private

  def entity_params
    params.require(:entity).permit(:name, :amount, :group_id)
  end

  def set_group
    @group = Group.find_by(id: params[:group_id])
    redirect_to root_path unless @group
  end
end
