class CreateAnswerChoices < ActiveRecord::Migration
  def change
    create_table :answer_choices do |t|
      t.text :answer
      t.integer :question_id
      t.timestamps null: false
    end
  end
end
