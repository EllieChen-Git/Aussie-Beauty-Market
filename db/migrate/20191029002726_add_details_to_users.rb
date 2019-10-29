class AddDetailsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :username, :string
    add_column :users, :bio, :text
    add_column :users, :skin_type, :integer
  end
end
