class Tmdb::Movie < Tmdb::Resource

  json_mapping({
    id: Int32,
    title: { type: String, nilable: true },
    adult: { type: Bool, nilable: true },
    backdrop_path: { type: String, nilable: true },
    poster_path: { type: String, nilable: true },
    budget: { type: Int32, nilable: true },
    imdb_id: { type: String, nilable: true },
    original_language: { type: String, nilable: true },
    original_title: { type: String, nilable: true },
    overview: { type: String, nilable: true },
    popularity: { type: Float32, nilable: true },
    release_date: { type: String, nilable: true },
    revenue: { type: Int32, nilable: true },
    runtime: { type: Int32, nilable: true },
    status: { type: String, nilable: true },
    tagline: { type: String, nilable: true },
    homepage: { type: String, nilable: true },
    video: { type: Bool, nilable: true },
    vote_average: { type: Float32, nilable: true },
    vote_count: { type: Int32, nilable: true }
    genres: { type: Array(Tmdb::Genre), nilable: true },
    production_companies: { type: Array(Tmdb::ProductionCompany), nilable: true },
    production_countries: { type: Array(Tmdb::ProductionCountry), nilable: true },
    spoken_languages: { type: Array(Tmdb::Language), nilable: true },
    keywords: { type: Tmdb::KeywordCollection, nilable: true }
  })

  # Get the basic movie information for a specific movie id.
  def self.find(id, language = api.language, append_to_response = "")
    Tmdb::Movie.from_json(
      Tmdb::Requester.get("movie/#{id}",
        { language: language, append_to_response: append_to_response })
    )
  end

  # Get the status of whether or not the movie has been rated or added to their favourite or movie watch list.
  def account_states(session_id = api.session_id)
    Tmdb::Requester.get("movie/#{id}/account_states",
    { session_id: session_id })
  end

  # Get the alternative titles for a specific movie id.
  def alternative_titles(country = "", append_to_response = "")
    Tmdb::TitleCollection.from_json(
      Tmdb::Requester.get("movie/#{id}/alternative_titles",
        { country: country, append_to_response: append_to_response })
    )
  end

  # Get the cast and crew information for a specific movie id.
  def credits(append_to_response = "")
    Tmdb::CastCollection.from_json(
      Tmdb::Requester.get("movie/#{id}/credits",
        { append_to_response: append_to_response })
    )
  end

  # Get the images (posters and backdrops) for a specific movie id.
  def images(language = api.language, append_to_response = "", include_image_language = "")
    Tmdb::ImageCollection.from_json(
      Tmdb::Requester.get("movie/#{id}/images",
        { language: language, append_to_response: append_to_response,
          include_image_language: include_image_language })
    )
  end

  # Get the plot keywords for a specific movie id.
  def keywords(append_to_response = "")
    Tmdb::KeywordCollection.from_json(
      Tmdb::Requester.get("movie/#{id}/keywords",
        { append_to_response: append_to_response })
    ).keywords
  end

  # Get the release date and certification information by country for a specific movie id.
  def releases(append_to_response = "")
    Tmdb::ReleaseCollection.from_json(
      Tmdb::Requester.get("movie/#{id}/releases",
        { append_to_response: append_to_response })
    ).countries
  end

  # Get the videos (trailers, teasers, clips) for a specific movie id.
  def videos(language = api.language, append_to_response = "")
    Tmdb::VideoCollection.from_json(
      Tmdb::Requester.get("movie/#{id}/videos",
        { language: language, append_to_response: append_to_response })
    ).results
  end

  # Get the translations for a specific movie id.
  def translations(append_to_response = "")
    Tmdb::TranslationCollection.from_json(
      Tmdb::Requester.get("movie/#{id}/translations",
        { append_to_response: append_to_response })
    ).translations
  end

  # Get the similar movies for a specific movie id.
  def similar(page = 1, language = api.language, append_to_response = "")
    Tmdb::MovieCollection.from_json(
      Tmdb::Requester.get("movie/#{id}/similar",
        { page: page.to_s, language: language, append_to_response: append_to_response })
    ).results
  end

  # Get the reviews for a particular movie id
  def reviews(page = 1, language = api.language, append_to_response = "")
    Tmdb::ReviewCollection.from_json(
      Tmdb::Requester.get("movie/#{id}/reviews",
        { page: page.to_s, language: language, append_to_response: append_to_response })
    )
  end

  # Get the lists that the movie belongs to.
  def lists(page = 1, language = api.language, append_to_response = "")
    Tmdb::ListCollection.from_json(
      Tmdb::Requester.get("movie/#{id}/lists",
        { page: page.to_s, language: language, append_to_response: append_to_response })
    )
  end

  # Get the changes for a specific movie id.
  def changes(start_date = Time.now.at_beginning_of_year.to_s("%Y-%m-%d"), end_date = Time.now.at_end_of_year.to_s("%Y-%m-%d"))
    Tmdb::ChangeCollection.from_json(
      Tmdb::Requester.get("movie/#{id}/changes",
        { start_date: start_date, end_date: end_date })
    )
  end

  # Create rating on a movie.
  def add_rating(value : Float32, options = { :session_id => api.session_id, :guest_session_id => api.guest_session_id } of Symbol => String?)
    Tmdb::Requester.post("movie/#{id}/rating",
      { session_id: options[:session_id], guest_session_id: options[:guest_session_id]},
      { value: value })
  end

  # Delete rating on a movie.
  def remove_rating(options = { :session_id => api.session_id, :guest_session_id => api.guest_session_id } of Symbol => String?)
    Tmdb::Requester.delete("movie/#{id}/rating",
      { session_id: options[:session_id], guest_session_id: options[:guest_session_id] })
  end

  # Get the latest movie id.
  def self.latest
    Tmdb::Movie.from_json(Tmdb::Requester.get("movie/latest"))
  end

  # Get the list of movies playing that have been, or are being released this week.
  def self.now_playing(page = 1, language = api.language)
    Tmdb::MovieCollection.from_json(Tmdb::Requester.get("movie/now_playing", { page: page.to_s, language: language }))
  end

  # Get the list of popular movies.
  def self.popular(page = 1, language = api.language)
    Tmdb::MovieCollection.from_json(Tmdb::Requester.get("movie/popular", { page: page.to_s, language: language }))
  end

  # Get the list of top rated movies.
  def self.top_rated(page = 1, language = api.language)
    Tmdb::MovieCollection.from_json(Tmdb::Requester.get("movie/top_rated", { page: page.to_s, language: language }))
  end

  # Get the list of upcoming movies by release date.
  def self.upcoming(page = 1, language = api.language)
    Tmdb::MovieCollection.from_json(Tmdb::Requester.get("movie/upcoming", { page: page.to_s, language: language }))
  end

end
