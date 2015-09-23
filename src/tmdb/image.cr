class Tmdb::Image
  json_mapping({
    file_path: String,
    width: Int32,
    height: Int32,
    iso_639_1: { type: String, nilable: true },
    aspect_ratio: Float32,
    vote_average: Float32,
    vote_count: Int32
  })
end
