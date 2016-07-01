class CreateArgumentativeAnswers < ActiveRecord::Migration
  def change
    create_table :argumentative_answers do |t|
      t.string :answer
      t.string :argument
      t.timestamps null: false
    end
  end
end
