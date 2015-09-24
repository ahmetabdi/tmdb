class Tmdb::Configuration

  class Image
    json_mapping({
      base_url: String,
      secure_base_url: String,
      backdrop_sizes: Array(String),
      logo_sizes: Array(String),
      poster_sizes: Array(String),
      profile_sizes: Array(String),
      still_sizes: Array(String)
    })
  end

  json_mapping({
    images: Image,
    change_keys: Array(String)
  })

  # Get the system wide configuration information
  def self.list
    Tmdb::Configuration.from_json(
      Tmdb::Requester.get("configuration")
    )
  end
end
