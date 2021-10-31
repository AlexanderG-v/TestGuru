class Test < ApplicationRecord

  has_many :questions
  belongs_to :category

  def self.list_tests_by_category(title_category)
    joins('JOIN categories ON tests.category_id = categories.id')
      .where(categories: { title: title_category })
      .order(title: :desc)
      .pluck(:title)
  end
end
