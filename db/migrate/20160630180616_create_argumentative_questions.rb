class CreateArgumentativeQuestions < ActiveRecord::Migration
  def change
    create_table :argumentative_questions do |t|
      t.text :question
      t.string :answer1
      t.string :answer2
      t.string :answer3
      t.string :answer4
      t.string :argument1
      t.string :argument2
      t.string :argument3
      t.string :argument4
      t.integer :correct_answer
      t.integer :correct_argument
      t.text :feedback_wrong_argument
      t.text :feedback_wrong_all
      t.string :subject
      t.string :critical_thinking
      t.timestamps null: false
    end
  end
end
