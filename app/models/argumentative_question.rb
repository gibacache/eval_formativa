class ArgumentativeQuestion < Question

  def feedback_wrong_with_default
    self.feedback_wrong || 'Feedback mas completo para respuesta incorrecta'
  end

  def feedback_wrong_argument_with_default
    self.feedback_wrong_argument || 'Feedback reducido para respuesta mal argumentada'
  end

  def answers
    [
      {n: 1, text: self.answer1},
      {n: 2, text: self.answer2},
      {n: 3, text: self.answer3},
      {n: 4, text: self.answer4}
    ]
  end

  def arguments
    [
      {n: 1, text: self.argument1},
      {n: 2, text: self.argument2},
      {n: 3, text: self.argument3},
      {n: 4, text: self.argument4}
    ]
  end

  def to_label
    "#{self.id}.- #{self.question}"
  end

  def evaluate_answer(params)
    ans = params[:answer].to_i == self.correct_answer
    arg = params[:argument].to_i == self.correct_argument
    correct = ans && arg
    score = 1 if correct
    score = 0.5 if ans && !arg
    score = 0 if !correct
    feedback = ans ? self.feedback_wrong_argument_with_default : self.feedback_wrong_with_default if !correct
    return correct, score, feedback
  end
end
