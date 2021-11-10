class AddColumnToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :twitter_access_token, :string, after: :password_digestr
  end
end
