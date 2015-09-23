class Tmdb::TitleCollection
  json_mapping({
    id: Int32,
    titles: Array(Tmdb::Title)
  })
end
