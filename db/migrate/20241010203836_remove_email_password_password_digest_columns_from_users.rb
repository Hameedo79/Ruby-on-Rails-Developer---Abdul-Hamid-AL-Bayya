class RemoveEmailPasswordPasswordDigestColumnsFromUsers < ActiveRecord::Migration[7.2]
  def change
    remove_column :users, :email, :string
    remove_column :users, :password_digest, :string
    remove_column :users, :password, :string
  end
end
