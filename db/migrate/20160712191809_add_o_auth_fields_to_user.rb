class AddOAuthFieldsToUser < ActiveRecord::Migration
  def change
    create_table :users
    add_column :users, :nickname, :string
    add_column :users, :uid, :string
    add_column :users, :oauth_token, :string
    add_column :users, :oauth_token_secret, :string
    add_column :users, :name, :string
  end
end
