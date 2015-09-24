class Tmdb::Api
  INSTANCE = new
  getter api_key, base_url, version, language, session_id
  setter session_id, api_key, language

  def initialize
    @base_url = "https://api.themoviedb.org/3/"
    @version  = 3
    @language = "en"
  end

  def self.instance
    INSTANCE
  end

  def url_for(action, params)
    built_params = CGI.build_form do |form|
      form.add "api_key", INSTANCE.api_key
      params.each do |k,v|
        form.add "#{k}", "#{v}" unless v.nil?
      end
    end

    uri = URI.parse(@base_url + action)
    uri.query = built_params
    puts uri
    uri.to_s
  end
end
