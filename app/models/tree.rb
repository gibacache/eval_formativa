class Tree < ActiveRecord::Base
  belongs_to :first_node, class_name: Node, foreign_key: :first_node_id
end
