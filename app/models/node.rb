class Node < ActiveRecord::Base
  belongs_to :questionable, polymorphic: true
  belongs_to :tree
  belongs_to :next_node_correct, class_name: Node, foreign_key: :next_node_correct_id
  belongs_to :next_node_wrong, class_name: Node, foreign_key: :next_node_wrong_id

  has_one :tree, foreign_key: :first_node

end
