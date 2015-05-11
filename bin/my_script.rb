
require 'addressable/uri'
require 'rest-client'

def create_user
  url = Addressable::URI.new(
    scheme: 'http',
    host: 'localhost',
    port: 3000,
    path: '/users'
  ).to_s

  new_user_data = {
    user: {
      name: 'Kevin 3000',
      email: 'kevin3000@gmail.com'
    }
  }
  begin
    puts RestClient.post(url, new_user_data)
  rescue StandardError => e
    puts e.message
  end

end

create_user
