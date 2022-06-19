class ChangeTypeAttributesToUsers < ActiveRecord::Migration[6.1]
  def change
    change_column :users, :type, :string, null: false, default: 'Admin'
  end
end
