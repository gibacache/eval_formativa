class Question < ActiveRecord::Base
  self.abstract_class = true
  has_many :nodes, as: :questionable
  has_many :responses, as: :questionable
  acts_as_taggable_on :critical_thinking, :subject

  def NOT_IMPLEMENTED_MSG(method_name, class_name)
    "You should implement the method '#{method_name}' in the class '#{class_name}'"
  end

  # Evaluates a student response
  # Receives the params from a student response and returns an array: [correct:boolean, feedback:string]
  def evaluate_answer(params)
    raise NOT_IMPLEMENTED_MSG(__callee__, self.class)
  end
end
