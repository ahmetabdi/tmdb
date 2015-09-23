class Tmdb::Video
  json_mapping({
    id: { type: String, nilable: true },
    iso_639_1: { type: String, nilable: true },
    key: { type: String, nilable: true },
    name: { type: String, nilable: true },
    site: { type: String, nilable: true },
    size: { type: Int32, nilable: true },
    type: { type: String, nilable: true }
  })
end
