class Test < ApplicationRecord

  belongs_to :category
  belongs_to :author, class_name: 'User'

  has_many :questions, dependent: :destroy
  has_many :tests_users, dependent: :destroy
  has_many :users, through: :tests_users

  scope :easy_tests, -> { where(level: 0..1) }
  scope :mid_tests, -> { where(level: 2..4) }
  scope :hard_tests, -> { where(level: 5..Float::INFINITY) }

  def self.list_tests_by_category(title_category)
    joins(:category)
      .where(categories: { title: title_category })
      .order(title: :desc)
      .pluck(:title)
  end
end
