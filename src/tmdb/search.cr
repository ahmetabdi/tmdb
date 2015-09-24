class Tmdb::Search < Tmdb::Resource

  # Search for companies by name.
  def self.company(query : String, page = 1 : Int32)
  end

  # Search for collections by name.
  def self.collection(query : String, page = 1 : Int32, language = api.language)
  end

  # Search for keywords by name.
  def self.keyword(query : String, page = 1 : Int32)
  end

  # Search for lists by name and description.
  def self.list(query : String, page = 1 : Int32, include_adult = true : Bool)
  end

  # Search for movies by title.
  def self.movie(query : String, page = 1 : Int32, include_adult = true : Bool, year = "", primary_release_year = "", search_type = "")
  end

  # Search the movie, tv show and person collections with a single query
  def self.multi(query : String, page = 1 : Int32, include_adult = true : Bool, language = api.language)
  end

  # Search for people by name.
  def self.person(query : String, page = 1 : Int32, include_adult = true : Bool, search_type = "")
  end

  # Search for TV shows by title.
  def self.tv(query : String, page = 1 : Int32, language = api.language, first_air_date_year = "", search_type = "")
  end
end
