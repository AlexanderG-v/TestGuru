class Test < ApplicationRecord
  def self.array_of_test_names(title_category)
    joins('INNER JOIN categories ON tests.category_id = categories.id')
      .where(categories: { title: title_category }).order(id: :desc).pluck(:title)
  end
end
