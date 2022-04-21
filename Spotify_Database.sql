CREATE TABLE accounts (
	id SERIAL,
	username TEXT NOT NULL UNIQUE,
	password TEXT NOT NULL,
	email TEXT NOT NULL UNIQUE,
	date_of_birth DATE NOT NULL,
	country_or_region TEXT NOT NULL,
	PRIMARY KEY(id)
);

CREATE TABLE profiles (
	id SERIAL,
    name TEXT NOT NULL,
    account_id INT NOT NULL,
    PRIMARY KEY(id)
);

CREATE TABLE libraries (
    id SERIAL,
    account_id INT NOT NULL,
    PRIMARY KEY(id)
);

CREATE TABLE playlists (
    id SERIAL,
    name TEXT NOT NULL,
    creators_profile_id INT NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE songs (
    id SERIAL,
    name TEXT NOT NULL,
    song_length TIME NOT NULL,
    PRIMARY KEY(id)
);

CREATE TABLE artists (
    id SERIAL,
    name TEXT NOT NULL,
    account_id INT NOT NULL,
    PRIMARY KEY(id) 
);

CREATE TABLE albums (
    id SERIAL,
    name TEXT NOT NULL,
    PRIMARY KEY(id)
);

CREATE TABLE episodes (
    id SERIAL,
    name TEXT NOT NULL,
    podcast_id INT NOT NULL,
    length TIME NOT NULL,
    date_posted DATE NOT NULL,
    PRIMARY KEY(id)
);

CREATE TABLE podcasts (
    id SERIAL,
    name TEXT NOT NULL,
    genre TEXT NOT NULL,
	account_id INT NOT NULL,
    PRIMARY KEY(id)
);

CREATE TABLE artists_with_albums (
    artist_id INT NOT NULL,
    album_id INT NOT NULL,
    PRIMARY KEY (artist_id, album_id)
);

CREATE TABLE playlists_in_profiles (
    profile_id INT NOT NULL,
    playlist_id INT NOT NULL,
    public_playlist BOOLEAN NOT NULL,
    PRIMARY KEY (profile_id, playlist_id)
);

CREATE TABLE songs_in_libraries (
    library_id INT NOT NULL,
    song_id INT NOT NULL,
    song_liked BOOLEAN NOT NULL,
    PRIMARY KEY (library_id, song_id)
);

CREATE TABLE episodes_in_libraries (
    library_id INT NOT NULL,
    episode_id INT NOT NULL,
    saved_episodes BOOLEAN NOT NULL,
    PRIMARY KEY (library_id, episode_id)
);

CREATE TABLE podcasts_in_libraries (
    library_id INT NOT NULL,
    podcast_id INT NOT NULL,
    PRIMARY KEY (library_id, podcast_id)
);

CREATE TABLE artists_in_libraries (
    library_id INT NOT NULL,
    artist_id INT NOT NULL,
    followed BOOLEAN NOT NULL,
    PRIMARY KEY (library_id, artist_id)
);

CREATE TABLE playlists_in_libraries (
    library_id INT NOT NULL,
    playlist_id INT NOT NULL,
    PRIMARY KEY (library_id, playlist_id)
);

CREATE TABLE albums_in_libraries (
    library_id INT NOT NULL,
    album_id INT NOT NULL,
    PRIMARY KEY (library_id, album_id)
);

CREATE TABLE songs_in_playlists (
    playlist_id INT NOT NULL,
    song_id INT NOT NULL,
    date_song_added DATE NOT NULL, 
    PRIMARY KEY (playlist_id, song_id)
);

CREATE TABLE episodes_in_playlists (
    playlist_id INT NOT NULL,
    episode_id INT NOT NULL,
    PRIMARY KEY (playlist_id, episode_id)
);

CREATE TABLE songs_by_artists (
    song_id INT NOT NULL,
    artist_id INT NOT NULL,
    PRIMARY KEY (song_id, artist_id)
);

CREATE TABLE songs_in_albums (
    song_id INT NOT NULL,
    album_id INT NOT NULL,
    PRIMARY KEY (song_id, album_id)
);

ALTER TABLE profiles
ADD CONSTRAINT fk_profiles_accounts
FOREIGN KEY (account_id)
REFERENCES accounts;

ALTER TABLE artists
ADD CONSTRAINT fk_artists_accounts
FOREIGN KEY (account_id)
REFERENCES accounts;

ALTER TABLE podcasts
ADD CONSTRAINT fk_podcasts_accounts
FOREIGN KEY (account_id)
REFERENCES accounts;

ALTER TABLE libraries
ADD CONSTRAINT fk_libraries_accounts
FOREIGN KEY (account_id)
REFERENCES accounts;

ALTER TABLE episodes
ADD CONSTRAINT fk_episodes_podcasts
FOREIGN KEY (podcast_id)
REFERENCES podcasts;

ALTER TABLE playlists_in_profiles
ADD CONSTRAINT fk_playlists_in_profiles_playlists
FOREIGN KEY (playlist_id)
REFERENCES playlists;

ALTER TABLE playlists_in_profiles
ADD CONSTRAINT fk_playlists_in_profiles_profiles
FOREIGN KEY (profile_id)
REFERENCES profiles;

ALTER TABLE songs_in_libraries
ADD CONSTRAINT fk_songs_in_libraries_songs
FOREIGN KEY (song_id)
REFERENCES songs;

ALTER TABLE songs_in_libraries
ADD CONSTRAINT fk_songs_in_libraries_libraries
FOREIGN KEY (library_id)
REFERENCES libraries;

ALTER TABLE playlists_in_libraries
ADD CONSTRAINT fk_playlists_in_libraries_playlists
FOREIGN KEY (playlist_id)
REFERENCES playlists;

ALTER TABLE playlists_in_libraries
ADD CONSTRAINT fk_playlists_in_libraries_libraries
FOREIGN KEY (library_id)
REFERENCES libraries;

ALTER TABLE artists_in_libraries
ADD CONSTRAINT fk_artists_in_libraries_artists
FOREIGN KEY (artist_id)
REFERENCES artists;

ALTER TABLE artists_in_libraries
ADD CONSTRAINT fk_artists_in_libraries_libraries
FOREIGN KEY (library_id)
REFERENCES libraries;

ALTER TABLE episodes_in_libraries
ADD CONSTRAINT fk_episodes_in_libraries_episodes
FOREIGN KEY (episode_id)
REFERENCES episodes;

ALTER TABLE episodes_in_libraries
ADD CONSTRAINT fk_episodes_in_libraries_libraries
FOREIGN KEY (library_id)
REFERENCES libraries;

ALTER TABLE podcasts_in_libraries
ADD CONSTRAINT fk_podcasts_in_libraries_podcasts
FOREIGN KEY (podcast_id)
REFERENCES podcasts;

ALTER TABLE podcasts_in_libraries
ADD CONSTRAINT fk_podcasts_in_libraries_libraries
FOREIGN KEY (library_id)
REFERENCES libraries;

ALTER TABLE albums_in_libraries
ADD CONSTRAINT fk_albums_in_libraries_albums
FOREIGN KEY (album_id)
REFERENCES albums;

ALTER TABLE albums_in_libraries
ADD CONSTRAINT fk_albums_in_libraries_libraries
FOREIGN KEY (library_id)
REFERENCES libraries;

ALTER TABLE songs_in_playlists
ADD CONSTRAINT fk_songs_in_playlists_songs
FOREIGN KEY (song_id)
REFERENCES songs;

ALTER TABLE songs_in_playlists
ADD CONSTRAINT fk_songs_in_playlists_playlists
FOREIGN KEY (playlist_id)
REFERENCES playlists;

ALTER TABLE episodes_in_playlists
ADD CONSTRAINT fk_episodes_in_playlists_episodes
FOREIGN KEY (episode_id)
REFERENCES episodes;

ALTER TABLE episodes_in_playlists
ADD CONSTRAINT fk_episodes_in_playlists_playlists
FOREIGN KEY (playlist_id)
REFERENCES playlists;

ALTER TABLE songs_by_artists
ADD CONSTRAINT fk_songs_by_artists_songs
FOREIGN KEY (song_id)
REFERENCES songs;

ALTER TABLE songs_by_artists
ADD CONSTRAINT fk_songs_by_artists_artists
FOREIGN KEY (artist_id)
REFERENCES artists;

ALTER TABLE songs_in_albums
ADD CONSTRAINT fk_songs_in_albums_songs
FOREIGN KEY (song_id)
REFERENCES songs;

ALTER TABLE songs_in_albums
ADD CONSTRAINT fk_songs_in_albums_albums
FOREIGN KEY (album_id)
REFERENCES albums;

ALTER TABLE artists_with_albums
ADD CONSTRAINT fk_artists_with_albums_artists
FOREIGN KEY (artist_id)
REFERENCES artists;

ALTER TABLE artists_with_albums
ADD CONSTRAINT fk_artists_with_albums_albums
FOREIGN KEY (album_id)
REFERENCES albums;
