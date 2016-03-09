json.array!(@publications) do |publication|
  json.extract! publication, :id, :title, :times, :like
  json.url exercise_url(publication, format: :json)
  json.user do
    json.username publication.user.username
  end
  json.images do
    json.first publication.publication_attachments.first.image_url() || "/assets/default-1efd5a484b1079693250ec45277ad3f43eea58486e5bd069645794fe98e3364f.jpg"
    json.second publication.publication_attachments.second.image_url() || "/assets/default-1efd5a484b1079693250ec45277ad3f43eea58486e5bd069645794fe98e3364f.jpg"
    json.third publication.publication_attachments.third.image_url() || "/assets/default-1efd5a484b1079693250ec45277ad3f43eea58486e5bd069645794fe98e3364f.jpg"
  end
end
