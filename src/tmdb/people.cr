class Tmdb::People < Tmdb::Resource

  def self.find(id, append_to_response = "")
    Tmdb::Requester.get("person/#{id}")
  end

  def movie_credits(language = api.language, append_to_response = "")
    Tmdb::Requester.get("person/#{id}/movie_credits")
  end

  def tv_credits(language = api.language, append_to_response = "")
    Tmdb::Requester.get("person/#{id}/tv_credits")
  end

  def combined_credits(language = api.language, append_to_response = "")
    Tmdb::Requester.get("person/#{id}/combined_credits")
  end

  def external_ids
    Tmdb::Requester.get("person/#{id}/external_ids")
  end

  def images
    Tmdb::Requester.get("person/#{id}/images")
  end

  def tagged_images(page = 1, language = api.language)
    Tmdb::Requester.get("person/#{id}/tagged_images")
  end

  def changes(start_date = Time.now.at_beginning_of_year.to_s("%Y-%m-%d"), end_date = Time.now.at_end_of_year.to_s("%Y-%m-%d"))
    Tmdb::Requester.get("person/#{id}/changes")
  end

  def self.popular(page = 1)
    Tmdb::Requester.get("person/popular")
  end

  def self.latest
    Tmdb::Requester.get("person/latest")
  end

end
