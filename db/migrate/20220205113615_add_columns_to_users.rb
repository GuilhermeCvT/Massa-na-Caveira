class AddColumnsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :username, :string, null: false
    add_reference :users, :company, null: false, foreign_key: true
    add_reference :users, :entrance, null: false, foreign_key: true
    add_column :users, :enable, :boolean, default: true
  end
end
