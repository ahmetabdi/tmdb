class Tmdb::Requester

  def self.get(action, params = {} of Symbol => String)
    url = api.url_for(action, params)
    HTTP::Client.get(url, headers: headers)
  end

  private def self.api
    Tmdb::Api.instance
  end

  private def self.headers
    HTTP::Headers.new.tap do |headers|
      headers["Accept"] = ["application/json"]
      headers["Content-Type"] = ["application/json"]
    end
  end

end