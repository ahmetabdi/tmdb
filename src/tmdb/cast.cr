class Tmdb::Cast
  json_mapping({
    id: Int32,
    cast_id: { type: Int32, nilable: true },
    character: { type: String, nilable: true },
    credit_id: { type: String, nilable: true },
    name: { type: String, nilable: true },
    order: { type: Int32, nilable: true },
    profile_path: { type: String, nilable: true }
  })
end
