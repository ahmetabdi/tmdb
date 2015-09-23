class Tmdb::ListCollection
  json_mapping({
    id: Int32,
    page: Int32,
    results: Array(Tmdb::List),
    total_pages: Int32,
    total_results: Int32
  })
end
