require_relative 'albums_lib'

API = {
  key: "ade161b485fb7d5b52f8c3d04aaffdda",
  secret: "1d82f4b20a59258b607aa6f41aadcc10"
}

puts "Please type artist name:"
$stdout.flush
artist_name = gets.chomp

lastfm = LastFM.new(API)
lastfm_top_albums = lastfm.artist(artist_name).get_top_albums

params = {}
params[:artist_name] = artist_name
print "searching for releases"
albums_array = []
lastfm_top_albums.each do |album|
  params[:album_name] = album['name']
  lastfm_album_release_date = lastfm.album(params).get_album_release_date
  album_hash = {name: album['name'], releasedata: lastfm_album_release_date}
  albums_array << album_hash
  print "."
end

puts ""

albums_result = {}
albums_result['albums'] = albums_array
puts albums_result.inspect