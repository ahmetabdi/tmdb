class Tmdb::Api
  INSTANCE = new
  getter api_key, base_url, version, language

  def initialize
    @base_url = "https://api.themoviedb.org/3/"
    @version  = 3
    @language = "en"
  end

  def self.instance
    INSTANCE
  end

  def language(iso_639_1 : String)
    @language = iso_639_1
  end

  def connect(api_key : String)
    @api_key = api_key
  end

  def url_for(action, params)
    built_params = CGI.build_form do |form|
      form.add "api_key", INSTANCE.api_key
      params.each do |k,v|
        form.add "#{k}", "#{v}" unless v
      end
    end

    uri = URI.parse(@base_url + action)
    uri.query = built_params
    puts uri
    uri.to_s
  end
end
