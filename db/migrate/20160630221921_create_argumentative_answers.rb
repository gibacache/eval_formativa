class CreateArgumentativeAnswers < ActiveRecord::Migration
  def change
    create_table :argumentative_answers do |t|
      t.string :answer
      t.string :argument
      t.integer :answer_score
      t.integer :argument_score
      t.timestamps null: false
    end
  end
end
