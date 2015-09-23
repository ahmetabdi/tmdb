class Tmdb::ChangeItem
  json_mapping({
    id: String,
    action: String,
    value: String,
    time: String,
    iso_639_1: String,
    original_value: String
  })
end
