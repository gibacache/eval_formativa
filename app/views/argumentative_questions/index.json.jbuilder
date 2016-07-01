json.array!(@argumentative_questions) do |argumentative_question|
  json.extract! argumentative_question, :id
  json.url argumentative_question_url(argumentative_question, format: :json)
end
