class Tmdb::Creator
  json_mapping({
    id: Int32,
    name: String,
    profile_path: { type: String, nilable: true }
  })
end
