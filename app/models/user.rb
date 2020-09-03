class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, presence: true, uniqueness: true, length: { minimum: 5 }
  validates :email, presence: true, uniqueness: true, length: { minimum: 5 }
  has_many :articles, class_name: 'Article', foreign_key: :author_id
  has_many :votes
  has_many :liked_posts, through: :votes
end
