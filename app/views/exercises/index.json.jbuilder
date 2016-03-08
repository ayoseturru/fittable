json.array!(@exercises) do |exercise|
  json.extract! exercise, :id, :day, :publication_id, :user_id, :series, :repeats
  json.url exercise_url(exercise, format: :json)
  json.publication do
    json.title exercise.publication.title
    json.description exercise.publication.description
    json.username exercise.publication.user.username
    json.like exercise.publication.like
    json.times exercise.publication.times
    json.images do
      json.first exercise.publication.publication_attachments.first.image_url() || "/assets/default-1efd5a484b1079693250ec45277ad3f43eea58486e5bd069645794fe98e3364f.jpg"
      json.second exercise.publication.publication_attachments.second.image_url() || "/assets/default-1efd5a484b1079693250ec45277ad3f43eea58486e5bd069645794fe98e3364f.jpg"
      json.third exercise.publication.publication_attachments.third.image_url() || "/assets/default-1efd5a484b1079693250ec45277ad3f43eea58486e5bd069645794fe98e3364f.jpg"
    end
  end
end
