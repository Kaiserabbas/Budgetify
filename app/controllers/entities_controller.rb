class EntitiesController < ApplicationController
    before_action :authenticate_user!

    def index
        @entities = @group.entities
        @group = Group.find(params[:group_id])
    end

    def new
        @entity = @group.entities.new
        @group = current_user.groups
    end

    def create
        @entity = current_user.entities.new(entity_params)
        @group = current_user.groups

        @entity.user = current_user
        if @entity.save
            redirect_to group_entity_path (@group), notice: 'Entity was successfully created.'
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
            redirect_to group_entity_path (@group), notice: 'Entity was successfully updated.'
        else
            render :edit, notice: 'Entity was not updated.'
        end
    end

    def destroy
        @entity = current_user.entities.find(params[:id])
        @entity.destroy
        redirect_to entity_path, notice: 'Entity was successfully destroyed.'
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
