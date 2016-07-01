class CreateNodes < ActiveRecord::Migration
  def change
    create_table :nodes do |t|
      t.integer :tree_id, index: true, null: false
      t.integer :questionable_id, index: true, null: false
      t.string  :questionable_type
      t.integer :next_node_correct_id
      t.integer :next_node_wrong_id
      t.timestamps null: false
    end

    add_foreign_key :nodes, :trees, column: :tree_id
    add_foreign_key :nodes, :nodes, column: :next_node_correct_id
    add_foreign_key :nodes, :nodes, column: :next_node__wrong_id
  end
end
