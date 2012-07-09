class AddAuthInfoToUsers < ActiveRecord::Migration
  def change
    add_column :users, :auth_info, :text
  end
end
