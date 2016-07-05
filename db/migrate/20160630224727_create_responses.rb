class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.integer :user_id, index: true, null: false
      t.integer :questionable_id, index: true, null: false
      t.string  :questionable_type
      t.integer :answerable_id, index: true, null: false
      t.string  :answerable_type
      t.integer :node_id
      t.integer :score

      t.timestamps null: false
    end

    add_foreign_key :responses, :users, column: :user_id
    add_foreign_key :responses, :nodes, column: :node_id
  end
end
