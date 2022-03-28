class CreateDeterminedAnswers < ActiveRecord::Migration[7.0]
  def change
    create_table :determined_answers do |t|
      t.string :description, null: false
      t.references :question, null: false, foreign_key: true

      t.timestamps
    end
  end
end
