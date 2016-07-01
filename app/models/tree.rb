class Tree < ActiveRecord::Base
  belongs_to :first_node, class_name: Node, foreign_key: :first_node_id
  has_many :nodes
  accepts_nested_attributes_for :nodes, allow_destroy: true, reject_if: :all_blank

end
