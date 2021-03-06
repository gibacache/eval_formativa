class CreateTrees < ActiveRecord::Migration
  def change
    create_table :trees do |t|
      t.integer :course_id
      t.string :label
      t.integer :first_node_id
      t.integer :n_repeat
      t.timestamps null: false
    end
    # add_foreign_key :trees, :nodes, column: :first_node_id
    add_foreign_key :trees, :courses, column: :course_id
  end
end
