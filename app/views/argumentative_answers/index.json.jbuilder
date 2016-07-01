json.array!(@argumentative_answers) do |argumentative_answer|
  json.extract! argumentative_answer, :id
  json.url argumentative_answer_url(argumentative_answer, format: :json)
end
