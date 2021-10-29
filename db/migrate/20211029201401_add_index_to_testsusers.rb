class AddIndexToTestsusers < ActiveRecord::Migration[6.1]
  def change
    add_index :tests_users, [:test_id, :user_id], name: 'composite_index'
  end
end
