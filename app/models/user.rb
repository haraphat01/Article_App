class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i.freeze
         validates :name, presence: true, length: { minimum: 3, maximum: 25 }, uniqueness: true
         validates :email, presence: true, length: { maximum: 255 },
                           format: { with: VALID_EMAIL_REGEX },
                           uniqueness: true
         has_many :created_articles, foreign_key: 'author_id', class_name: 'Article'
         has_many :votes, dependent: :destroy
         has_many :categories
end
