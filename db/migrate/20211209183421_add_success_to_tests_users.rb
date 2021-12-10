class AddSuccessToTestsUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :tests_users, :success, :boolean, default: false
  end
end
