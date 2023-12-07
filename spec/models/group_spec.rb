require 'rails_helper'
RSpec.describe Group, type: :model do
  let(:user) { User.create!(name: "John Doe", email: "john@example.com", password: "password") }
  
  it "is valid with valid attributes" do
    group = Group.new(name: "Test Group", icon: "test_icon", user: user)
    expect(group).to be_valid
  end

  it "is not valid without a name" do
    group = Group.new(name: nil, icon: "test_icon", user: user)
    expect(group).to_not be_valid
  end

  it "is not valid without an icon" do
    group = Group.new(name: "Test Group", icon: nil, user: user)
    expect(group).to_not be_valid
  end

it "calculates total amount correctly" do
    group = Group.create(name: "Test Group", icon: "test_icon", user: user)
    entity1 = group.entities.new(amount: 10, user: user, name: "Entity 1")
    entity2 = group.entities.new(amount: 20, user: user, name: "Entity 2")
    
    puts "Entity 1 errors: #{entity1.errors.full_messages}" unless entity1.save
    puts "Entity 2 errors: #{entity2.errors.full_messages}" unless entity2.save
    
    group.reload  # Reload the group object from the database

    expect(group.total_amount).to eq(30)
end

end
