class Tmdb::Certification

  # Get the list of supported certifications for movies.
  def self.movie_list
    Tmdb::Requester.get("certification/movie/list")
  end

  # Get the list of supported certifications for tv shows.
  def self.tv_list
    Tmdb::Requester.get("certification/tv/list")
  end

end
