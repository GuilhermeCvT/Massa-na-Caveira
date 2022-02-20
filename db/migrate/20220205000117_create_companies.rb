class CreateCompanies < ActiveRecord::Migration[7.0]
  def change
    create_table :companies do |t|
      t.string :description
      t.boolean :enable

      t.timestamps
    end
  end
end
