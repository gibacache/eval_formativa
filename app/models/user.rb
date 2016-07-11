class User < ActiveRecord::Base

  def tries_remaining(node)
    node.tree.max_tries - Response.where(user: self, node: node).count
  end

  def can_answer?(node)
    # los nodos no ven al tree. ver si poner n a nodos?
    if node.is_repeat?
      return tries_remaining(node) > 0
    else
      return Response.where(user: self, node: node).count == 0
    end
  end
end
