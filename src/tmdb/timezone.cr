class Tmdb::Timezone

  def self.list
    Tmdb::Requester.get("timezones/list")
  end
end
