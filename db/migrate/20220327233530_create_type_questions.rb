class CreateTypeQuestions < ActiveRecord::Migration[7.0]
  def change
    create_table :type_questions do |t|
      t.string :description

      t.timestamps
    end
  end
end
