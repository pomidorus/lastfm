
class LastFM

  def initialize(api)
    @api_key = api[:key]
    @api_secret = api[:secret]
  end

  def api_key
    @api_key
  end

  def artist(name)
    Artist.new(self, name)
  end

  def album(params = {})
    Album.new(self, params)
  end

  def request(params = {})
    request_args = [:get, '/', { :query => params }]
    response = HTTPRequest.send(*request_args)
    Response.new(response.body)
  end

end
