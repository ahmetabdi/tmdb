class Tmdb::Change
  json_mapping({
    key: String,
    items: Array(Tmdb::ChangeItem)
  })
end
