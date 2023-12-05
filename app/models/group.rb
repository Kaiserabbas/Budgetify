class Group < ApplicationRecord
  belongs_to :user
  has_many :entities, dependent: :destroy

  validates :name, presence: true
  validates :icon, presence: true


  def total_amount
    entities.sum(:amount)
  end
end
