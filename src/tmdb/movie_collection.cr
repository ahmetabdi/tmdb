class Tmdb::MovieCollection
  json_mapping({
    page: Int32,
    results: Array(Tmdb::Movie),
    total_pages: Int32,
    total_results: Int32
  })
end
