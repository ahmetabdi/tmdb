class Tmdb::Authentication < Tmdb::Resource

  class Token
    json_mapping({
      success: { type: Bool, nilable: true },
      expires_at: { type: String, nilable: true },
      request_token: { type: String, nilable: true },
      session_id: { type: String, nilable: true },
      guest_session_id: { type: String, nilable: true }
    })
  end

  # Generate Token, Login, Grab Session ID and Set it
  def self.login(username : String, password : String)
    token = Token.from_json(Tmdb::Requester.get("authentication/token/new"))
    if token.success
      login = Token.from_json(Tmdb::Requester.get("authentication/token/validate_with_login",
        { request_token: token.request_token, username: username, password: password })
      )
      if login.request_token
        puts "Logged in successfully!"
        session = Token.from_json( Tmdb::Requester.get("authentication/session/new",
          { request_token: login.request_token })
        )
        if session.success
          puts "Session authenticated!"
          api.session_id = session.session_id
          true
        else
          false # TODO: Handle fail better
        end
      else
        false # TODO: Handle fail better
      end
    else
      false # TODO: Handle fail better
    end
  end

  def self.guest_login
    token = Token.from_json(Tmdb::Requester.get("authentication/guest_session/new"))
    if token.success
      api.guest_session_id = token.guest_session_id
      true
    else
      false # TODO: Handle fail better
    end
  end

end
