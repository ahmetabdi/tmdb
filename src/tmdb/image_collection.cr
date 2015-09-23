class Tmdb::ImageCollection
  json_mapping({
    id: Int32,
    backdrops: Array(Tmdb::Image),
    posters: Array(Tmdb::Image)
  })
end
