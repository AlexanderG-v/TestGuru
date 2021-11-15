class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, 
         :registerable,
         :recoverable, 
         :rememberable, 
         :validatable,
         :confirmable

  has_many :tests_users, dependent: :destroy
  has_many :tests, through: :tests_users
  has_many :author_tests, class_name: 'Test', foreign_key: :author_id, dependent: :destroy

  validates :name, presence: true
  validates :email, presence: true
  validates :email, uniqueness: true, on: :create
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, on: :create

  def list_tests_by_level(level)
    tests.where(level: level)
  end

  def tests_user(test)
    tests_users.order(id: :desc).find_by(test_id: test.id)
  end
end
