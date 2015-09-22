require "json"

class Tmdb::Genre
  json_mapping({
    id: Int32,
    name: String
  })
end

class Tmdb::ProductionCompany
  json_mapping({
    id: Int32,
    name: String
  })
end
class Tmdb::ProductionCountry
  json_mapping({
    iso_3166_1: String,
    name: String
  })
end
class Tmdb::Language
  json_mapping({
    iso_639_1: String,
    name: String
  })
end

class Tmdb::MovieCollection
  json_mapping({
    page: Int32,
    results: Array(Tmdb::Movie),
    total_pages: Int32,
    total_results: Int32
  })
end

class Tmdb::Movie

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

  def self.build_resource_collection(json)
    Tmdb::MovieCollection.from_json(json)
  end

  def self.build_single_resource(json)
    Tmdb::Movie.from_json(json)
  end

  def self.latest
    build_single_resource(Tmdb::Requester.get("movie/latest").body)
  end

  def self.upcoming
    Tmdb::Requester.get("movie/upcoming").body
  end

  def self.now_playing
    Tmdb::Requester.get("movie/now_playing").body
  end

  def self.popular
    build_resource_collection(Tmdb::Requester.get("movie/popular").body)
  end

  def self.top_rated
    Tmdb::Requester.get("movie/top_rated").body
  end

end
