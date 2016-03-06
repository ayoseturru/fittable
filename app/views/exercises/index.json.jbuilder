json.array!(@exercises) do |exercise|
  json.extract! exercise, :id, :day, :publication_id, :user_id
  json.url exercise_url(exercise, format: :json)
end
