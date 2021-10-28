class Test < ApplicationRecord
  def self.list_tests_by_category(title_category)
    joins('INNER JOIN categories ON tests.category_id = categories.id')
      .where(categories: { title: title_category }).order(id: :desc).pluck(:title)
  end
end
