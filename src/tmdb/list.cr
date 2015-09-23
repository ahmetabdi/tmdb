class Tmdb::List
  json_mapping({
    id: { type: String, nilable: true },
    name: { type: String, nilable: true }
    description: { type: String, nilable: true },
    poster_path: { type: String, nilable: true },
    iso_639_1: { type: String, nilable: true },
    item_count: Int32,
    favorite_count: Int32
  })
end
