class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable

  has_many :activities
  has_many :posts
  scope :pending?, -> { where(approve: false) }
  scope :approved?, -> { where(approve: true) }
end
