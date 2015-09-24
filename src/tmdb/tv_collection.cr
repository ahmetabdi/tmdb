class Tmdb::TvCollection
  json_mapping({
    results: Array(Tmdb::Tv),
    page: Int32,
    total_pages: Int32,
    total_results: Int32,
  })
end
