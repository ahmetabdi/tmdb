class Tmdb::VideoCollection
  json_mapping({
    id: Int32,
    results: Array(Tmdb::Video)
  })
end
