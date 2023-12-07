class Entity < ApplicationRecord
  belongs_to :user
  belongs_to :group

  validates :name, presence: true
  validates :amount, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :group, presence: true
end
