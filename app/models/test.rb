# frozen_string_literal: true

class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User'

  has_many :questions, dependent: :destroy
  has_many :tests_users, dependent: :destroy
  has_many :users, through: :tests_users

  validates :title, presence: true
  validates :title, uniqueness: { scope: :level }
  validates :level, :timer, numericality: { only_integer: true, greater_than: 0 }

  scope :easy_tests, -> { where(level: 0..1) }
  scope :mid_tests, -> { where(level: 2..4) }
  scope :hard_tests, -> { where(level: 5..Float::INFINITY) }
  scope :by_level, ->(level) { where(level: level) }
  scope :tests_by_category, -> (title_category) {
                                   joins(:category)
                                     .where(category: { title: title_category })
                                     .order(title: :desc)
                                 }

  def self.list_tests_by_category(title_category)
    tests_by_category(title_category).pluck(:title)
  end
end
