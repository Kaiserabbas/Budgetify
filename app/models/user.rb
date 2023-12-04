class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  has_many :entities
  has_many :groups
  attr_accessor :confirmation_sent_at

  after_create :skip_confirmation!

  validates :name, presence: true
  validates :email, presence: true

  def skip_confirmation!
    confirm
  end

  def admin?
    role == 'admin'
  end
end
