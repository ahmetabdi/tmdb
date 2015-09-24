class Tmdb::Network
  json_mapping({
    id: Int32,
    name: String
  })

  def self.find(id)
    Tmdb::Network.from_json(
      Tmdb::Requester.get("network/#{id}")
    )
  end
end
