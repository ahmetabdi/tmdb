class Tmdb::ReviewCollection
  json_mapping({
    results: Array(Tmdb::Review),
    page: Int32,
    total_pages: Int32,
    total_results: Int32
  })
end
