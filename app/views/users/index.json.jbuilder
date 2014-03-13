json.array!(@users) do |user|
  json.extract! user, :id, :email, :admin, :employee
  json.url user_url(user, format: :json)
end
