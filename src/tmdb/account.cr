class Tmdb::Account < Tmdb::Resource

  json_mapping({
    id: Int32,
    name: String,
    include_adult: Bool,
    username: String,
    iso_639_1: String
    iso_3166_1: String
  })

  # Get the basic information for an account.
  def self.info(session_id)
    Tmdb::Account.from_json(
      Tmdb::Requester.get("account",
        { session_id: session_id })
    )
  end

  # Get the lists that you have created and marked as a favorite.
  def lists(page = 1 : Int32, language = api.language)
    Tmdb::Requester.get("account/#{id}/lists",
      { session_id: session_id })
  end

  # Get the list of favorite movies for an account.
  def favorite_movies(page = 1 : Int32, sort_by = 'created_at' : String, language = api.language)
    Tmdb::Requester.get("account/#{id}/favorite/movies",
      { page: page.to_s, sort_by: sort_by, language: language, session_id: session_id })
  end

  # Get the list of favorite TV series for an account.
  def favorite_tv(page = 1 : Int32, sort_by = 'created_at' : String, language = api.language)
    Tmdb::Requester.get("account/#{id}/favorite/tv",
      { page: page.to_s, sort_by: sort_by, language: language, session_id: session_id })
  end

  # Add or remove a movie to an accounts favorite list.
  def favorite(media_type : String, media_id : Int32, favorite : Bool)
    Tmdb::Requester.post("account/#{id}/favorite",
      { session_id: session_id },
      { media_type: media_type, media_id: media_id, favorite: favorite })
  end

  # Get the list of rated movies (and associated rating) for an account.
  def rated_movies(page = 1 : Int32, sort_by = 'created_at' : String, language = api.language)
    Tmdb::Requester.get("account/#{id}/rated/movies",
      { page: page.to_s, sort_by: sort_by, language: language, session_id: session_id })
  end

  # Get the list of rated TV shows (and associated rating) for an account.
  def rated_tv(page = 1 : Int32, sort_by = 'created_at' : String, language = api.language)
    Tmdb::Requester.get("account/#{id}/rated/tv",
      { page: page.to_s, sort_by: sort_by, language: language, session_id: session_id })
  end

  # Get the list of rated tv episodes (and associated rating) for an account.
  def rated_tv_episodes(page = 1 : Int32, sort_by = 'created_at' : String, language = api.language)
    Tmdb::Requester.get("account/#{id}/rated/tv/episodes",
      { page: page.to_s, sort_by: sort_by, language: language, session_id: session_id })
  end

  # Get the list of movies on an accounts watchlist.
  def watchlist_movies(page = 1 : Int32, sort_by = 'created_at' : String, language = api.language)
    Tmdb::Requester.get("account/#{id}/watchlist/movies",
      { page: page.to_s, sort_by: sort_by, language: language, session_id: session_id })
  end

  # Get the list of TV series on an accounts watchlist.
  def watchlist_tv(page = 1 : Int32, sort_by = 'created_at' : String, language = api.language)
    Tmdb::Requester.get("account/#{id}/watchlist/tv",
      { page: page.to_s, sort_by: sort_by, language: language, session_id: session_id })
  end

  # Add or remove a movie to an accounts watch list.
  def watchlist(media_type : String, media_id : Int32, watchlist : Bool)
    Tmdb::Requester.post("account/#{id}/watchlist",
      { session_id: session_id },
      { media_type: media_type, media_id: media_id, watchlist: watchlist })
  end

end
