class Artist
  def initialize(lastfm, artist_name)
    @lastfm = lastfm
    @name = artist_name
  end

  def get_top_albums
    params = {
      method: "artist.gettopalbums",
      api_key: @lastfm.api_key,
      artist: @name
    }
    @lastfm.request(params).xml['topalbums']['album']
  end
end
