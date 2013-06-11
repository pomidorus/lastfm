class Album
  def initialize(lastfm, params)
    @lastfm = lastfm
    @artist_name = params[:artist_name]
    @album_name = params[:album_name]
  end

  def get_album_info
    params = {
      method: "album.getinfo",
      api_key: @lastfm.api_key,
      artist: @artist_name,
      album: @album_name,
    }
    @lastfm.request(params).xml['album']
  end

  def get_album_release_date
    get_album_info['releasedate']
  end

end
