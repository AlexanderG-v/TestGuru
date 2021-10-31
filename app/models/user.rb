class User < ApplicationRecord

  has_many :tests_users, dependent: :destroy
  has_many :tests, through: :tests_users, dependent: :destroy
  has_many :author_tests, class_name: 'Test', foreign_key: :author_id, dependent: :destroy

  def list_tests_by_level(level)
    Test.joins('JOIN tests_users ON tests_users.test_id = tests.id')
        .where(tests_users: { user_id: id }, tests: { level: level })
  end
end
