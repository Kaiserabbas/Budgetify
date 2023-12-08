require 'rails_helper'

RSpec.describe 'groups/index', type: :view do
  let(:user) { User.create!(name: 'John Doe', email: 'nHqFP@example.com', password: 'password') }
  let!(:group1) do
    Group.create!(name: 'Group 1', icon: 'fa-icon-1', user:).tap do |group|
      group.entities.create!(name: 'Entity 1', amount: 50, user:)
      group.entities.create!(name: 'Entity 2', amount: 50, user:)
    end
  end
  let!(:group2) do
    Group.create!(name: 'Group 2', icon: 'fa-icon-2', user:).tap do |group|
      group.entities.create!(name: 'Entity 3', amount: 100, user:)
      group.entities.create!(name: 'Entity 4', amount: 100, user:)
    end
  end

  before(:each) do
    assign(:groups, [group1, group2])
    render
  end

  it 'renders a list of groups' do
    assert_select 'div.group-list' do
      assert_select 'div.group-item', count: 2 do |group_items|
        group_items.each_with_index do |group_item, index|
          assert_select group_item, 'div.group-content' do
            assert_select 'i.fa', text: '', count: 1
            if assigns(:groups) && assigns(:groups)[index]
              assert_select 'a[href=?]', group_entities_path(assigns(:groups)[index]),
                            text: assigns(:groups)[index].name
            end
            if assigns(:groups) && assigns(:groups)[index]
              assert_select 'p',
                            text: "$ #{assigns(:groups)[index].total_amount}"
            end
            if assigns(:groups) && assigns(:groups)[index]
              assert_select 'a[href=?]', group_path(assigns(:groups)[index]),
                            text: 'show'
            end
          end
        end
      end
      assert_select 'div.new-group' do
        assert_select 'a[href=?]', new_group_path, text: 'ADD NEW GROUP'
      end
    end
  end
end
