require 'rails_helper'

RSpec.describe "entities/index", type: :view do
  let(:user) { User.create!(name: "John Doe", email: "nHqFP@example.com", password: "password") }
  let(:group) do
    Group.create!(name: "Group 1", icon: "fa-icon-1", user: user).tap do |grp|
      grp.entities.create!(name: "Entity 1", amount: 50, user: user)
      grp.entities.create!(name: "Entity 2", amount: 50, user: user)
    end
  end
  let(:entities) { group.entities.order(created_at: :desc) }

  before(:each) do
    assign(:group, group)
    assign(:entities, entities)
    render
  end

  it "renders entities for a group" do
    assert_select "h4", text: "#{group.name} Payments Summary"
    assert_select ".group-name", text: "#{group.user.name}'s"
    assert_select ".total-amount", text: "Total amount $ #{entities.sum(:amount)}"

    entities.each do |entity|
      assert_select ".group-content" do
        assert_select "p", text: entity.name
        assert_select "p", text: "$#{entity.amount}"
        assert_select ".modify-buttons" do
          assert_select "a", text: "Edit"
          assert_select "form[action='#{group_entity_path(group, entity)}'][method='post']" do
            assert_select "button[type='submit']", text: 'Delete', count: 1
          end
        end
      end
    end

    assert_select ".new-group a", text: "ADD TRANSACTION"
  end
end
