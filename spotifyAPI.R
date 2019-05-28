library(spotifyr)
Sys.setenv(SPOTIFY_CLIENT_ID = '0d904ea192fe46fa9c4044905fd97b9b')
Sys.setenv(SPOTIFY_CLIENT_SECRET = '6fe9d2ba7d4d4434ba9d986f64b09c0c')
access_token <- get_spotify_access_token()


beatles <- get_artist_audio_features('the beatles')
library(tidyverse)
library(knitr)

beatles %>% 
  #count(key_mode, sort = TRUE) %>% 
  head(5)# %>% 
  #kable()
library(lubridate)
get_my_recently_played(limit = 5) %>% 
  mutate(artist.name = map_chr(track.artists, function(x) x$name[1]),
         played_at = as_datetime(played_at)) %>% 
  select(track.name, artist.name, track.album.name, played_at) %>% 
  kable()
get_my_top_artists_or_tracks(type = 'artists', time_range = 'long_term', limit = 10) %>% 
  select(name, genres) %>% 
  rowwise %>% 
  mutate(genres = paste(genres, collapse = ', ')) %>% 
  ungroup %>% 
  kable()
get_my_top_artists_or_tracks(type = 'tracks', time_range = 'short_term', limit = 5) %>% 
  mutate(artist.name = map_chr(artists, function(x) x$name[1])) %>% 
  select(name, artist.name, album.name) %>% 
  kable()
joy <- get_artist_audio_features("Ariana Grande")
joy %>% 
  arrange(-valence) %>% 
  select(track_name, valence) %>% 
  head(5) %>% 
  kable()
library(ggjoy)
ggplot(joy, aes(x = valence, y = album_name)) + 
  geom_joy() + 
  theme_joy()

# my_id = '0d904ea192fe46fa9c4044905fd97b9b'
# my_plists <- get_user_playlists(my_id)
# my_plists2 <- my_plists %>%
#   filter(playlist_name %in% c('Taiwan Top 50', 'France Top 50', 'Bolivia Top 50', ))
# tracks <- get_playlist_tracks('U.S. Top 50')
# features <- get_track_audio_features(tracks)

aSong = get_track_audio_features("2oF7FZHIJbzjeEXZ3D0Ku4")
quavo_id = "0VRj0yCOv2FXJNP47XQnx5"
quavo = get_artist(quavo_id)
quavo_albums = get_artist_albums(quavo_id)
quavo_top = get_artist_top_tracks(quavo_id)$id #heres what we could use
quavo_track_features = get_track_audio_features(quavo_top)
#View(quavo_track_features)
