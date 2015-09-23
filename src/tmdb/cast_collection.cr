class Tmdb::CastCollection
  json_mapping({
    id: Int32,
    cast: Array(Tmdb::Cast)
  })
end
