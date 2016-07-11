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
    ans_score = ans ? 1 : 0
    arg_score = ans ? (arg ? 1 : 0) : nil
    arg_value = arg_score.nil? ? 0 : arg_score
    score = (ans_score + arg_value) / 2.0
    feedback = ans ? self.feedback_wrong_argument_with_default : self.feedback_wrong_with_default if !correct
    return correct, score, feedback, ans_score, arg_score
  end

  def self.get_score(type)
    fail "Unkown option #{type}" unless type.in? [:critical_thinking, :subject]
    score_type = type == :subject ? 'answer_score' : 'argument_score'
    score = 0
    n = 0
    all.each do |q|
      q.responses.each do |r|
        score += r.answerable.send(score_type).nil? ? 0 : r.answerable.send(score_type)
        n += 1
      end
    end
    return n == 0 ? 'N/O' : (score / n.to_f).round(2)
  end

end
