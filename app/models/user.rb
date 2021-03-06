# frozen_string_literal: true

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
  has_many :badges_users, dependent: :destroy
  has_many :badges, through: :badges_users
  has_many :gists, dependent: :destroy
  has_many :author_tests, class_name: 'Test', foreign_key: :author_id, dependent: :destroy
  has_many :feedbacks, dependent: :destroy

  validates :first_name, presence: true
  validates :last_name, presence: true

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
