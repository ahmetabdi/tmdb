class Tmdb::ReleaseCollection
  json_mapping({
    id: Int32,
    countries: Array(Tmdb::Release)
  })
end
