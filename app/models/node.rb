class Node < ActiveRecord::Base
  has_one :tree_first_node, class_name: Tree, foreign_key: :first_node_id
  belongs_to :tree
  belongs_to :questionable, polymorphic: true
  belongs_to :next_node_correct, class_name: Node, foreign_key: :next_node_correct_id
  belongs_to :next_node_wrong, class_name: Node, foreign_key: :next_node_wrong_id

  accepts_nested_attributes_for :questionable, allow_destroy: true, reject_if: :all_blank

  before_save :set_first_node

  def set_first_node
    self.tree_first_node = self.tree if self.first_node
  end

  def questionable_attributes=(attributes)
    some_questionable = self.questionable_type.constantize.find_or_initialize_by(id: self.questionable_id)
    some_questionable.attributes = attributes
    self.questionable = some_questionable
  end
end
