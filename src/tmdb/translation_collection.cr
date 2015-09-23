class Tmdb::TranslationCollection
  json_mapping({
    id: Int32,
    translations: Array(Tmdb::Translation)
  })
end
