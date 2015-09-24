class Tmdb::Tv < Tmdb::Resource

  json_mapping({
    id: Int32,
    name: String,
    backdrop_path: { type: String, nilable: true },
    episode_run_time: { type: Array(Int32), nilable: true },
    created_by: { type: Array(Tmdb::Creator), nilable: true },
    first_air_date: { type: String, nilable: true },
    genres: { type: Array(Tmdb::Genre), nilable: true },
    homepage: { type: String, nilable: true },
    in_production: { type: Bool, nilable: true },
    languages: { type: Array(String), nilable: true },
    last_air_date: { type: String, nilable: true },
    networks: { type: Array(Tmdb::Network), nilable: true },
    number_of_episodes: { type: Int32, nilable: true },
    number_of_seasons: { type: Int32, nilable: true },
    origin_country: Array(String),
    original_language: { type: String, nilable: true },
    original_name: { type: String, nilable: true },
    overview: { type: String, nilable: true },
    popularity: Float32,
    poster_path: { type: String, nilable: true },
    production_companies: { type: Array(Tmdb::ProductionCompany), nilable: true },
    seasons: { type: Array(Tmdb::Season), nilable: true },
    status: { type: String, nilable: true },
    type: { type: String, nilable: true },
    vote_average: Float32,
    vote_count: Int32
  })

  def self.find(id, language = api.language, append_to_response = "")
    Tmdb::Tv.from_json(
      Tmdb::Requester.get("tv/#{id}",
        { language: language, append_to_response: append_to_response })
    )
  end

  def account_states(session_id)
    Tmdb::Requester.get("tv/#{id}/account_states")
  end

  def alternative_titles
    Tmdb::TitleCollection.from_json(
      Tmdb::Requester.get("tv/#{id}/alternative_titles")
    )
  end

  def changes(start_date = Time.now.at_beginning_of_year.to_s("%Y-%m-%d"), end_date = Time.now.at_end_of_year.to_s("%Y-%m-%d"))
    Tmdb::ChangeCollection.from_json(
      Tmdb::Requester.get("tv/#{id}/changes",
        { start_date: start_date, end_date: end_date })
    )
  end

  def content_ratings
    Tmdb::Requester.get("tv/#{id}/content_ratings")
  end

  def credits
  end

  def external_ids
  end

  def images
  end

  def keywords
  end

  def rating
  end

  def similar
  end

  def translations
  end

  def videos
  end

  def self.latest
    Tmdb::Tv.from_json(
      Tmdb::Requester.get("tv/latest")
    )
  end

  def self.on_the_air(page = 1, language = api.language)
    Tmdb::TvCollection.from_json(
      Tmdb::Requester.get("tv/on_the_air",
        { page: page.to_s, language: language })
    )
  end

  # Without a specified timezone, this query defaults to EST (Eastern Time UTC-05:00).
  def self.airing_today(page = 1, language = api.language, timezone = "")
    Tmdb::TvCollection.from_json(
      Tmdb::Requester.get("tv/airing_today",
        { page: page.to_s, language: language, timezone: timezone })
    )
  end

  def self.top_rated(page = 1, language = api.language)
    Tmdb::TvCollection.from_json(
      Tmdb::Requester.get("tv/top_rated",
        { page: page.to_s, language: language })
    )
  end

  def self.popular(page = 1, language = api.language)
    Tmdb::TvCollection.from_json(
      Tmdb::Requester.get("tv/popular",
        { page: page.to_s, language: language })
    )
  end

end
