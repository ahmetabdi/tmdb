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

  def self.find(id, language = api.language, append_to_response = "")
    Tmdb::Movie.from_json(
      Tmdb::Requester.get("movie/#{id}",
        { language: language, append_to_response: append_to_response })
    )
  end

  # TODO
  def account_states(session_id)
    Tmdb::Requester.get("movie/#{id}/account_states")
  end

  def alternative_titles(country = "", append_to_response = "")
    Tmdb::TitleCollection.from_json(
      Tmdb::Requester.get("movie/#{id}/alternative_titles",
        { country: country, append_to_response: append_to_response })
    )
  end

  def credits(append_to_response = "")
    Tmdb::CastCollection.from_json(
      Tmdb::Requester.get("movie/#{id}/credits",
        { append_to_response: append_to_response })
    )
  end

  def images(language = api.language, append_to_response = "", include_image_language = "")
    Tmdb::ImageCollection.from_json(
      Tmdb::Requester.get("movie/#{id}/images",
        { language: language, append_to_response: append_to_response,
          include_image_language: include_image_language })
    )
  end

  def keywords(append_to_response = "")
    Tmdb::KeywordCollection.from_json(
      Tmdb::Requester.get("movie/#{id}/keywords",
        { append_to_response: append_to_response })
    ).keywords
  end

  def releases(append_to_response = "")
    Tmdb::ReleaseCollection.from_json(
      Tmdb::Requester.get("movie/#{id}/releases",
        { append_to_response: append_to_response })
    ).countries
  end

  def videos(language = api.language, append_to_response = "")
    Tmdb::VideoCollection.from_json(
      Tmdb::Requester.get("movie/#{id}/videos",
        { language: language, append_to_response: append_to_response })
    ).results
  end

  def translations(append_to_response = "")
    Tmdb::TranslationCollection.from_json(
      Tmdb::Requester.get("movie/#{id}/translations",
        { append_to_response: append_to_response })
    ).translations
  end

  def similar(page = 1, language = api.language, append_to_response = "")
    Tmdb::MovieCollection.from_json(
      Tmdb::Requester.get("movie/#{id}/similar",
        { page: page.to_s, language: language, append_to_response: append_to_response })
    ).results
  end

  def reviews(page = 1, language = api.language, append_to_response = "")
    Tmdb::ReviewCollection.from_json(
      Tmdb::Requester.get("movie/#{id}/reviews",
        { page: page.to_s, language: language, append_to_response: append_to_response })
    )
  end

  def lists(page = 1, language = api.language, append_to_response = "")
    Tmdb::ListCollection.from_json(
      Tmdb::Requester.get("movie/#{id}/lists",
        { page: page.to_s, language: language, append_to_response: append_to_response })
    )
  end

  def changes(start_date = Time.now.at_beginning_of_year.to_s("%Y-%m-%d"), end_date = Time.now.at_end_of_year.to_s("%Y-%m-%d"))
    Tmdb::ChangeCollection.from_json(
      Tmdb::Requester.get("movie/#{id}/changes",
        { start_date: start_date, end_date: end_date })
    )
  end

  def rating(session_id = nil, guest_session_id = nil)
    Tmdb::Requester.get("movie/#{id}/rating")
  end

  def self.latest
    Tmdb::Movie.from_json(Tmdb::Requester.get("movie/latest"))
  end

  def self.now_playing(page = 1, language = api.language)
    Tmdb::MovieCollection.from_json(Tmdb::Requester.get("movie/now_playing", { page: page.to_s, language: language }))
  end

  def self.popular(page = 1, language = api.language)
    Tmdb::MovieCollection.from_json(Tmdb::Requester.get("movie/popular", { page: page.to_s, language: language }))
  end

  def self.top_rated(page = 1, language = api.language)
    Tmdb::MovieCollection.from_json(Tmdb::Requester.get("movie/top_rated", { page: page.to_s, language: language }))
  end

  def self.upcoming(page = 1, language = api.language)
    Tmdb::MovieCollection.from_json(Tmdb::Requester.get("movie/upcoming", { page: page.to_s, language: language }))
  end

end
