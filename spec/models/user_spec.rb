require 'rails_helper'

RSpec.describe User, type: :model do
  it "is valid with valid attributes" do
    user = User.new(name: "John Doe", email: "john@example.com", password: "password")
    expect(user).to be_valid
  end

  it "is not valid without a name" do
    user = User.new(name: nil, email: "john@example.com", password: "password")
    expect(user).to_not be_valid
  end

  it "is not valid without an email" do
    user = User.new(name: "John Doe", email: nil, password: "password")
    expect(user).to_not be_valid
  end

  it "is not valid without a password" do
    user = User.new(name: "John Doe", email: "john@example.com", password: nil)
    expect(user).to_not be_valid
  end

  it "is confirmed after creation" do
    user = User.create(name: "John Doe", email: "john@example.com", password: "password")
    expect(user.confirmed?).to be true
  end

  it "is not confirmed after confirmation" do
    user = User.create(name: "John Doe", email: "john@example.com", password: "password")
    user.confirm
    expect(user.confirmed?).to be true
  end
end
