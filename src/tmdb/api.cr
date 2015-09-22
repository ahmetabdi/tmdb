class Tmdb::Api
  INSTANCE = new
  getter api_key, base_url, version

  def initialize
    @base_url = "https://api.themoviedb.org/3/"
    @version  = 3
  end

  def self.instance
    INSTANCE
  end

  def connect(api_key : String)
    @api_key = api_key
  end

  def url_for(action, params)
    built_params = CGI.build_form do |form|
      form.add "api_key", "#{INSTANCE.api_key}"
    end

    uri = URI.parse(@base_url + action)
    uri.query = built_params
    uri.to_s
  end
end
