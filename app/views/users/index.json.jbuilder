json.array!(@users) do |user|
  json.extract! user, :id, :student_id, :username, :email
  json.url user_url(user, format: :json)
end
