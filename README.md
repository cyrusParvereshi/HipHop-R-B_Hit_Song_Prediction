# STA141C_Project

This project was done by Cyrus Parvereshi, Rohan Malhotra, and Jonathan Fernandez. The goal of our project is to come up with a predictive model which is can be used to predict a hit hip-hop/rnb song. We have defined a hit song by a song that has appeared on the top 50 hip-hop/rnb billboard. Below categorizes our files and provides a brief description of each one. 


## Getting the Data: 

To get the data we looked at every artist that had appeared in the top 50 hip-hop/rnb billboard. We then got a discography of all those artists. We did this as some of their songs would be hit while others would be a non-hit.

Files:

- artisits.txt: list of all artists from 2009-2019 on top 50 hip-hop/rnb playlist

- BillboardAPI_EDA: Looked at the bill board data and is where we got artists.txt from using the Billboard API

- get_artist_features.R: Used this get a df for each artist and all of their songs along with the spotify provided features using spotipyr

- combiningFunction.R: Used to combine all the dfs into one big df from get_artist_features.R. Final output was final_artist.pkl

- final_artist.pkl: Df with all songs from all the artists along with features from Spotify

- R&B10yrDF.pkl: A list of every song that has been on top 50 hip-hop/rnb playlist

- Final Data Cration.ipynb: Uses "R&B10yrDF.pkl" to identify which songs are hit songs in the final_artist.pkl data set. The df is cleaned our final data set is made which is "merged.pkl" which was unable to be uploaded to the github that is why it was attatched with our final reports in the canvss submission. 

## Machine Learning Algorithims:

- Logistic Regression all variables.ipynb: Logistic regression using all variables.

- Logistic Regression Recursive Feature Elimination.ipynb: Model using features found from Recursive Feature Elimination which was only loudness. 

- Logistic Regression using selectkbest feature selection.ipynb: Used ANOVA F-scores to find the top 3 features which were Valence, Liveness, and Loudness.

- Logistic Regression using variables from LDA.ipynb: Features that were found to be important from LDA.ipynb which were instrumentalism and energy. 

- LDA.ipynb: Used to determine important features. 

- RandomForrests.ipynb: implementation of  randomforrests algorithim

- SVM classification.ipynb: implementation of SVM classification method


# Sound Analysis 

- sound analysis folder: .wav files for hit and non-hit songs
- Audio data and rf.ipynb: performed random forretst on the audio features obtained from the .wav files









