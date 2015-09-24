class Tmdb::Season
  json_mapping({
    id: Int32,
    air_date: String,
    season_number: Int32
    poster_path: { type: String, nilable: true },
  })
end
