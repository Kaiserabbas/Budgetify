require 'rails_helper'

RSpec.describe Entity, type: :model do
  let(:user) { User.create!(name: 'John Doe', email: 'john@example.com', password: 'password') }
  let(:group) { Group.create!(name: 'Test Group', icon: 'test_icon', user:) }

  it 'is valid with valid attributes' do
    entity = Entity.new(name: 'Test Entity', amount: 10, user:, group:)
    expect(entity).to be_valid
  end

  it 'is not valid without a name' do
    entity = Entity.new(name: nil, amount: 10, user:, group:)
    expect(entity).to_not be_valid
  end

  it 'is not valid without an amount' do
    entity = Entity.new(name: 'Test Entity', amount: nil, user:, group:)
    expect(entity).to_not be_valid
  end

  it 'is not valid with a negative amount' do
    entity = Entity.new(name: 'Test Entity', amount: -10, user:, group:)
    expect(entity).to_not be_valid
  end

  it 'is not valid without a group' do
    entity = Entity.new(name: 'Test Entity', amount: 10, user:, group: nil)
    expect(entity).to_not be_valid
  end
end
