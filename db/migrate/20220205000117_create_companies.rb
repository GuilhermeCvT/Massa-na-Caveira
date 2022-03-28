class CreateCompanies < ActiveRecord::Migration[7.0]
  def change
    create_table :companies do |t|
      t.string :description, null: false
      t.boolean :enable, default: true

      t.timestamps
    end
  end
end
