class CreateQuestions < ActiveRecord::Migration[7.0]
  def change
    create_table :questions do |t|
      t.boolean :enable, default: true
      t.integer :priority, default: 0
      t.text :description, null: false
      t.references :type_question, null: false, foreign_key: true

      t.timestamps
    end
  end
end
