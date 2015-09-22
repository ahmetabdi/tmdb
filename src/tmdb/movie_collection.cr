class Tmdb::MovieCollection
  json_mapping({
    results: Array(Tmdb::Movie),
    page: Int32,
    total_pages: Int32,
    total_results: Int32
  })
end
