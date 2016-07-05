class User < ActiveRecord::Base

  def can_answer?(node)
    # los nodos no ven al tree. ver si poner n a nodos?
    n_tries = Response.where(user: self, node: node).count
    n_tries <= node.tree.n_repeat
  end
end
