class Test < ApplicationRecord

  has_many :questions
  has_many :tests_users
  has_many :users, through: :tests_users
  belongs_to :category

  def self.list_tests_by_category(title_category)
    joins('JOIN categories ON tests.category_id = categories.id')
      .where(categories: { title: title_category })
      .order(title: :desc)
      .pluck(:title)
  end
end
