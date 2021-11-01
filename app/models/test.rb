class Test < ApplicationRecord

  belongs_to :category
  belongs_to :author, class_name: 'User'

  has_many :questions, dependent: :destroy
  has_many :tests_users, dependent: :destroy
  has_many :users, through: :tests_users, dependent: :destroy

  def self.list_tests_by_category(title_category)
    joins(:category)
      .where(categories: { title: title_category })
      .order(title: :desc)
      .pluck(:title)
  end
end
