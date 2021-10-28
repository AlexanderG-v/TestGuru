class User < ApplicationRecord
  def list_tests_by_level(level)
    Test.joins('INNER JOIN tests_users ON tests_users.test_id = tests.id')
        .where(tests_users: { user_id: id }, tests: { level: level })
  end
end
