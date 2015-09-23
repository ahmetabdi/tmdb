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
    spoken_languages: { type: Array(Tmdb::Language), nilable: true }
  })

  def self.find(id, language = api.language)
    Tmdb::Movie.from_json((Tmdb::Requester.get("movie/#{id}", { language: language })))
  end

  def account_states(session_id)
    Tmdb::Requester.get("movie/#{id}/account_states")
  end

  def alternative_titles(country, append_to_response = "")
    Tmdb::Requester.get("movie/#{id}/alternative_titles")
  end

  def credits(append_to_response = "")
    Tmdb::CastCollection.from_json(Tmdb::Requester.get("movie/#{id}/credits"))
  end

  def images(language = api.language, append_to_response = "", include_image_language = "")
    Tmdb::Requester.get("movie/#{id}/images")
  end

  def keywords(append_to_response = "")
    Tmdb::Requester.get("movie/#{id}/keywords")
  end

  def releases(append_to_response = "")
    Tmdb::Requester.get("movie/#{id}/releases")
  end

  def videos(language = api.language, append_to_response = "")
    Tmdb::Requester.get("movie/#{id}/videos")
  end

  def translations(append_to_response = "")
    Tmdb::Requester.get("movie/#{id}/translations")
  end

  def similar(page = 1, language = api.language, append_to_response = "")
    Tmdb::Requester.get("movie/#{id}/similar")
  end

  def reviews(page = 1, language = api.language, append_to_response = "")
    Tmdb::Requester.get("movie/#{id}/reviews")
  end

  def lists(page = 1, language = api.language, append_to_response = "")
    Tmdb::Requester.get("movie/#{id}/lists")
  end

  def changes(start_date = Date.today.year, end_date = Date.today)
    Tmdb::Requester.get("movie/#{id}/changes")
  end

  # def rating(session_id: nil, guest_session_id: nil)
    # Tmdb::Requester.get("movie/#{id}/rating")
  # end

  def self.latest
    Tmdb::Movie.from_json(Tmdb::Requester.get("movie/latest"))
  end

  def self.now_playing(language = api.language)
    Tmdb::MovieCollection.from_json(Tmdb::Requester.get("movie/now_playing", { language: language }))
  end

  def self.popular(language = api.language)
    Tmdb::MovieCollection.from_json(Tmdb::Requester.get("movie/popular", { language: language }))
  end

  def self.top_rated(language = api.language)
    Tmdb::MovieCollection.from_json(Tmdb::Requester.get("movie/top_rated", { language: language }))
  end

  def self.upcoming(language = api.language)
    Tmdb::MovieCollection.from_json(Tmdb::Requester.get("movie/upcoming", { language: language }))
  end

end
