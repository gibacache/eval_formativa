class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :student_id, index: true, null: false
      t.string :username
      t.string :email

      t.timestamps null: false
    end
  end
end
