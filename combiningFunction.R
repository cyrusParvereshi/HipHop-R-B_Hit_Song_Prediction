smash_artists <- function(artistList){
  dfList = list()
  for(i in artistList){
    tracks = get_artist_audio_features(i)
    setDT(tracks) #so faster
    dfList[[i]] <- tracks
    return(do.call("rbind", dfList))
  }
}
