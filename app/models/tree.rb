class Tree < ActiveRecord::Base
  belongs_to :first_node, class_name: Node, foreign_key: :first_node_id
  has_many :nodes, dependent: :destroy
  # has_many :nodes do
  #   def build(*args, &block)
  #     #TODO your code

  #     super(*args, &block)
  #   end
  # end
  accepts_nested_attributes_for :nodes, allow_destroy: true, reject_if: :all_blank

  def set_node(user)

  end

  def to_label
    self.label
  end


end
