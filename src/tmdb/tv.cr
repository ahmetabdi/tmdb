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

  # Get the primary information about a TV series by id.
  def self.find(id, language = api.language, append_to_response = "")
    Tmdb::Tv.from_json(
      Tmdb::Requester.get("tv/#{id}",
        { language: language, append_to_response: append_to_response })
    )
  end

  # This method lets users get the status of whether or not the TV show has been rated or added to their favourite or watch lists.
  def account_states(session_id = api.session_id)
    Tmdb::Requester.get("tv/#{id}/account_states",
    { session_id: session_id })
  end

  # Get the alternative titles for a specific show ID.
  def alternative_titles
    Tmdb::TitleCollection.from_json(
      Tmdb::Requester.get("tv/#{id}/alternative_titles")
    )
  end

  # Get the changes for a specific TV show id.
  def changes(start_date = Time.now.at_beginning_of_year.to_s("%Y-%m-%d"), end_date = Time.now.at_end_of_year.to_s("%Y-%m-%d"))
    Tmdb::ChangeCollection.from_json(
      Tmdb::Requester.get("tv/#{id}/changes",
        { start_date: start_date, end_date: end_date })
    )
  end

  # Get the content ratings for a specific TV show id.
  def content_ratings
    Tmdb::Requester.get("tv/#{id}/content_ratings")
  end

  # Get the cast & crew information about a TV series.
  def credits
    Tmdb::Requester.get("tv/#{id}/credits")
  end

  # Get the external ids that we have stored for a TV series.
  def external_ids
    Tmdb::Requester.get("tv/#{id}/external_ids")
  end

  # Get the images (posters and backdrops) for a TV series.
  def images
    Tmdb::Requester.get("tv/#{id}/images")
  end

  # Get the plot keywords for a specific TV show id.
  def keywords
    Tmdb::Requester.get("tv/#{id}/keywords")
  end

  # This method lets users create (or delete) a rating on a TV series.
  def rating
    Tmdb::Requester.get("tv/#{id}/rating")
  end

  # Get the similar TV shows for a specific tv id.
  def similar
    Tmdb::Requester.get("tv/#{id}/similar")
  end

  # Get the list of translations that exist for a TV series.
  def translations
    Tmdb::Requester.get("tv/#{id}/translations")
  end

  # Get the videos that have been added to a TV series
  def videos
    Tmdb::Requester.get("tv/#{id}/videos")
  end

  # Get the latest TV show id.
  def self.latest
    Tmdb::Tv.from_json(
      Tmdb::Requester.get("tv/latest")
    )
  end

  # Get the list of TV shows that are currently on the air.
  def self.on_the_air(page = 1, language = api.language)
    Tmdb::TvCollection.from_json(
      Tmdb::Requester.get("tv/on_the_air",
        { page: page.to_s, language: language })
    )
  end

  # Get the list of TV shows that air today.
  # Without a specified timezone, this query defaults to EST (Eastern Time UTC-05:00).
  def self.airing_today(page = 1, language = api.language, timezone = "")
    Tmdb::TvCollection.from_json(
      Tmdb::Requester.get("tv/airing_today",
        { page: page.to_s, language: language, timezone: timezone })
    )
  end

  # Get the list of top rated TV shows.
  def self.top_rated(page = 1, language = api.language)
    Tmdb::TvCollection.from_json(
      Tmdb::Requester.get("tv/top_rated",
        { page: page.to_s, language: language })
    )
  end

  # Get the list of popular TV shows.
  def self.popular(page = 1, language = api.language)
    Tmdb::TvCollection.from_json(
      Tmdb::Requester.get("tv/popular",
        { page: page.to_s, language: language })
    )
  end

end
