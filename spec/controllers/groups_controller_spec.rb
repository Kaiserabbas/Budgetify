require 'rails_helper'

RSpec.describe GroupsController, type: :controller do
  include Devise::Test::ControllerHelpers
  let(:user) { User.create!(name: 'John', email: 'nHqFP@example.com', password: 'password') }
  let(:group) { Group.create!(name: 'Travel', icon: 'fa-plane', user:) }
  before do
    sign_in user
  end

  describe 'GET #index' do
    it 'assigns @groups' do
      get :index
      expect(assigns(:groups)).to eq([group])
    end

    it 'renders the index template' do
      get :index
      expect(response).to render_template('index')
    end
  end

  describe 'GET #new' do
    it 'assigns a new group to @group' do
      get :new
      expect(assigns(:group)).to be_a_new(Group)
    end

    it 'renders the new template' do
      get :new
      expect(response).to render_template('new')
    end
  end

  describe 'POST #create' do
    context 'with valid attributes' do
      let(:valid_attributes) { { name: 'Test Group', icon: 'fa-user' } } # replace with your valid attributes

      it 'creates a new group' do
        expect do
          post :create, params: { group: valid_attributes }
        end.to change(Group, :count).by(1)
      end

      it 'redirects to the groups#index' do
        post :create, params: { group: valid_attributes }
        expect(response).to redirect_to groups_path
      end
    end

    context 'with invalid attributes' do
      let(:invalid_attributes) { { name: nil, icon: 'fa-user' } } # replace with your invalid attributes

      it 'does not save the new group' do
        expect do
          post :create, params: { group: invalid_attributes }
        end.to_not change(Group, :count)
      end

      it 're-renders the new template' do
        post :create, params: { group: invalid_attributes }
        expect(response).to render_template :new
      end
    end
  end

  describe 'GET #show' do
    it 'assigns the requested group to @group' do
      get :show, params: { id: group.id }
      expect(assigns(:group)).to eq(group)
    end

    it 'renders the show template' do
      get :show, params: { id: group.id }
      expect(response).to render_template('show')
    end
  end
end
