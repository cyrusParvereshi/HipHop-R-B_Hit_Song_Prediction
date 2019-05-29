
################# GOALS
# create DF for each artists in unique pickle
# reticulate -> gives access to read and write pickle to get df
# use get_artisti_audio_features to create df for each artist
# combine all 
##################

# test for one
test = get_artist_audio_features("drake")
test

# read pickle file of unique artists
unique_artists = read.csv("artists.txt",header = FALSE)
colnames(unique_artists) = c("artist")
artists = as.character(unique_artists$artist)

# test on first 5
five = artists[1:5]
five

# get feature data for each artist
get_info <- function (name) {
  # applies API function if doesn't work then return nothing
  return(tryCatch(setDT(get_artist_audio_features(name)), error=function(e) NULL))
}

# final data frame for test of five artists
first_five_information = lapply(five,get_info)
five_result = rbindlist(first_five_information)
View(five_result)

# see what happens when you try binding NULL to
rbind(five_result,NULL) # its ignored

# final data frame for all artists
final_information = lapply(artists,get_info)
final_result = rbindlist(final_information)
View(final_result)

# save data
saveRDS(final_result,file = 'song_feature_data')

# prepare dataframe to save
copy = final_result
new_data = copy[,c(-5,-23)] # remove unneeded columns

# csv
df <- apply(new_data,2,as.character)
write.csv(df,'song_feature_data_csv')

# pickle
py_save_object(new_data, "final_artist.pkl")
