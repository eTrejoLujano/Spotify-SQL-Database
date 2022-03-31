--
-- PostgreSQL database dump
--

-- Dumped from database version 13.2
-- Dumped by pg_dump version 13.2

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: accounts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.accounts (
    id integer NOT NULL,
    username text NOT NULL,
    email text NOT NULL,
    date_of_birth date NOT NULL,
    country_or_region text NOT NULL,
    profile_id integer NOT NULL,
    artist_id integer,
    podcast_id integer,
    library_id integer NOT NULL
);


ALTER TABLE public.accounts OWNER TO postgres;

--
-- Name: accounts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.accounts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.accounts_id_seq OWNER TO postgres;

--
-- Name: accounts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.accounts_id_seq OWNED BY public.accounts.id;


--
-- Name: albums; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.albums (
    id integer NOT NULL,
    name text NOT NULL
);


ALTER TABLE public.albums OWNER TO postgres;

--
-- Name: albums_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.albums_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.albums_id_seq OWNER TO postgres;

--
-- Name: albums_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.albums_id_seq OWNED BY public.albums.id;


--
-- Name: albums_in_libraries; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.albums_in_libraries (
    library_id integer NOT NULL,
    album_id integer NOT NULL
);


ALTER TABLE public.albums_in_libraries OWNER TO postgres;

--
-- Name: artists; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.artists (
    id integer NOT NULL,
    name text NOT NULL
);


ALTER TABLE public.artists OWNER TO postgres;

--
-- Name: artists_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.artists_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.artists_id_seq OWNER TO postgres;

--
-- Name: artists_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.artists_id_seq OWNED BY public.artists.id;


--
-- Name: artists_in_libraries; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.artists_in_libraries (
    library_id integer NOT NULL,
    artist_id integer NOT NULL,
    followed boolean NOT NULL
);


ALTER TABLE public.artists_in_libraries OWNER TO postgres;

--
-- Name: artists_with_albums; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.artists_with_albums (
    artist_id integer NOT NULL,
    album_id integer NOT NULL
);


ALTER TABLE public.artists_with_albums OWNER TO postgres;

--
-- Name: episodes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.episodes (
    id integer NOT NULL,
    name text NOT NULL,
    podcast_id integer NOT NULL,
    length time without time zone NOT NULL,
    date_posted date NOT NULL
);


ALTER TABLE public.episodes OWNER TO postgres;

--
-- Name: episodes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.episodes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.episodes_id_seq OWNER TO postgres;

--
-- Name: episodes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.episodes_id_seq OWNED BY public.episodes.id;


--
-- Name: episodes_in_libraries; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.episodes_in_libraries (
    library_id integer NOT NULL,
    episode_id integer NOT NULL,
    saved_episodes boolean NOT NULL
);


ALTER TABLE public.episodes_in_libraries OWNER TO postgres;

--
-- Name: episodes_in_playlists; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.episodes_in_playlists (
    playlist_id integer NOT NULL,
    episode_id integer NOT NULL
);


ALTER TABLE public.episodes_in_playlists OWNER TO postgres;

--
-- Name: libraries; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.libraries (
    id integer NOT NULL
);


ALTER TABLE public.libraries OWNER TO postgres;

--
-- Name: libraries_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.libraries_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.libraries_id_seq OWNER TO postgres;

--
-- Name: libraries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.libraries_id_seq OWNED BY public.libraries.id;


--
-- Name: playlists; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.playlists (
    id integer NOT NULL,
    name text NOT NULL,
    creators_profile_id integer NOT NULL
);


ALTER TABLE public.playlists OWNER TO postgres;

--
-- Name: playlists_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.playlists_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.playlists_id_seq OWNER TO postgres;

--
-- Name: playlists_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.playlists_id_seq OWNED BY public.playlists.id;


--
-- Name: playlists_in_libraries; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.playlists_in_libraries (
    library_id integer NOT NULL,
    playlist_id integer NOT NULL
);


ALTER TABLE public.playlists_in_libraries OWNER TO postgres;

--
-- Name: playlists_in_profiles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.playlists_in_profiles (
    profile_id integer NOT NULL,
    playlist_id integer NOT NULL,
    public_playlist boolean NOT NULL
);


ALTER TABLE public.playlists_in_profiles OWNER TO postgres;

--
-- Name: podcasts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.podcasts (
    id integer NOT NULL,
    name text NOT NULL,
    account_id integer NOT NULL,
    genre text NOT NULL
);


ALTER TABLE public.podcasts OWNER TO postgres;

--
-- Name: podcasts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.podcasts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.podcasts_id_seq OWNER TO postgres;

--
-- Name: podcasts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.podcasts_id_seq OWNED BY public.podcasts.id;


--
-- Name: podcasts_in_libraries; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.podcasts_in_libraries (
    library_id integer NOT NULL,
    podcast_id integer NOT NULL
);


ALTER TABLE public.podcasts_in_libraries OWNER TO postgres;

--
-- Name: profiles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.profiles (
    id integer NOT NULL,
    name text NOT NULL
);


ALTER TABLE public.profiles OWNER TO postgres;

--
-- Name: profiles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.profiles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.profiles_id_seq OWNER TO postgres;

--
-- Name: profiles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.profiles_id_seq OWNED BY public.profiles.id;


--
-- Name: songs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.songs (
    id integer NOT NULL,
    name text NOT NULL,
    song_length time without time zone NOT NULL
);


ALTER TABLE public.songs OWNER TO postgres;

--
-- Name: songs_by_artists; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.songs_by_artists (
    song_id integer NOT NULL,
    artist_id integer NOT NULL
);


ALTER TABLE public.songs_by_artists OWNER TO postgres;

--
-- Name: songs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.songs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.songs_id_seq OWNER TO postgres;

--
-- Name: songs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.songs_id_seq OWNED BY public.songs.id;


--
-- Name: songs_in_albums; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.songs_in_albums (
    song_id integer NOT NULL,
    album_id integer NOT NULL
);


ALTER TABLE public.songs_in_albums OWNER TO postgres;

--
-- Name: songs_in_libraries; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.songs_in_libraries (
    library_id integer NOT NULL,
    song_id integer NOT NULL,
    song_liked boolean NOT NULL
);


ALTER TABLE public.songs_in_libraries OWNER TO postgres;

--
-- Name: songs_in_playlists; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.songs_in_playlists (
    playlist_id integer NOT NULL,
    song_id integer NOT NULL,
    date_song_added date NOT NULL
);


ALTER TABLE public.songs_in_playlists OWNER TO postgres;

--
-- Name: accounts id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts ALTER COLUMN id SET DEFAULT nextval('public.accounts_id_seq'::regclass);


--
-- Name: albums id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.albums ALTER COLUMN id SET DEFAULT nextval('public.albums_id_seq'::regclass);


--
-- Name: artists id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.artists ALTER COLUMN id SET DEFAULT nextval('public.artists_id_seq'::regclass);


--
-- Name: episodes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.episodes ALTER COLUMN id SET DEFAULT nextval('public.episodes_id_seq'::regclass);


--
-- Name: libraries id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.libraries ALTER COLUMN id SET DEFAULT nextval('public.libraries_id_seq'::regclass);


--
-- Name: playlists id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.playlists ALTER COLUMN id SET DEFAULT nextval('public.playlists_id_seq'::regclass);


--
-- Name: podcasts id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.podcasts ALTER COLUMN id SET DEFAULT nextval('public.podcasts_id_seq'::regclass);


--
-- Name: profiles id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.profiles ALTER COLUMN id SET DEFAULT nextval('public.profiles_id_seq'::regclass);


--
-- Name: songs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.songs ALTER COLUMN id SET DEFAULT nextval('public.songs_id_seq'::regclass);


--
-- Data for Name: accounts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.accounts (id, username, email, date_of_birth, country_or_region, profile_id, artist_id, podcast_id, library_id) FROM stdin;
1	etrejol	etrejol@gmail.com	1995-06-09	USA	1	\N	\N	1
3	gbrown	gbrown@gmail.com	1989-10-31	USA	3	\N	\N	3
2	asmith	asmith@gmail.com	1991-02-09	USA	2	\N	\N	2
4	clee	clee@gmail.com	1998-04-08	USA	4	\N	\N	4
5	jrogan	jrogan@gmail.com	1967-08-11	USA	5	\N	1	5
6	bshapiro	bshapiro@gmail.com	1984-01-15	USA	6	\N	2	6
7	cobrien	cobrien@gmail.com	1963-04-18	USA	7	\N	3	7
8	clake	clake@gmail.com	1982-08-08	UK	8	1	\N	8
9	clorenzo	clorenzo@gmail.com	1988-07-04	UK	9	2	\N	9
10	tchami	tchami@gmail.com	1985-05-12	France	10	3	\N	10
11	ddolla	ddolla@gmail.com	1992-01-01	Australia	11	4	\N	11
12	dombresky	dombresky@gmail.com	1990-09-27	France	12	5	\N	12
13	jcole	jcole@gmail.com	1985-01-28	USA	13	6	\N	13
\.


--
-- Data for Name: albums; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.albums (id, name) FROM stdin;
1	Piano Head
2	Chest
3	Soul Sacrifice
4	Right Now
5	Relevations EP
6	Pizza
7	Define
8	Utopia
9	Hey Pablo EP
10	2014 Forest Hills Drive
11	Cole World: The Sideline Story
\.


--
-- Data for Name: albums_in_libraries; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.albums_in_libraries (library_id, album_id) FROM stdin;
1	10
1	11
2	1
2	2
2	3
3	2
3	4
3	5
4	4
4	6
4	7
5	6
5	8
5	9
\.


--
-- Data for Name: artists; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.artists (id, name) FROM stdin;
1	Chris Lake
2	Chris Lorenzo
3	Tchami
4	Dom Dolla
5	Dombresky
6	J.Cole
\.


--
-- Data for Name: artists_in_libraries; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.artists_in_libraries (library_id, artist_id, followed) FROM stdin;
1	6	t
1	1	t
1	3	t
1	4	t
2	2	t
2	5	t
2	4	t
3	6	t
4	1	t
4	3	t
5	6	t
5	4	t
\.


--
-- Data for Name: artists_with_albums; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.artists_with_albums (artist_id, album_id) FROM stdin;
1	1
2	1
1	2
5	3
1	4
2	4
3	5
1	6
2	6
4	7
5	8
1	9
2	9
\.


--
-- Data for Name: episodes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.episodes (id, name, podcast_id, length, date_posted) FROM stdin;
1	#1647 - Dave Chappelle	1	03:16:02	2021-05-07
2	#1169 - Elon Musk	1	02:37:03	2018-09-06
3	#1512 - Ben Shapiro	1	01:43:30	2020-07-21
4	Ep. 1398 - The Omicron Panic Tsunami Hits	2	00:48:27	2021-12-17
5	Ep. 1391 - Is Americas Future Dying?	2	00:49:41	2021-12-09
6	Ep. 1384 - The Omicron Crisis	2	00:50:52	2021-11-29
7	Social Morays	3	00:22:42	2022-03-23
8	Tracy Morgan	3	01:06:46	2022-03-20
9	The Mafia Puppy Doctor	3	00:22:12	2022-03-09
\.


--
-- Data for Name: episodes_in_libraries; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.episodes_in_libraries (library_id, episode_id, saved_episodes) FROM stdin;
1	2	t
2	1	t
3	1	t
3	5	t
4	6	t
4	3	t
5	8	t
5	9	t
\.


--
-- Data for Name: episodes_in_playlists; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.episodes_in_playlists (playlist_id, episode_id) FROM stdin;
4	2
4	3
4	1
5	4
5	5
5	6
6	7
6	8
6	9
\.


--
-- Data for Name: libraries; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.libraries (id) FROM stdin;
1
2
3
4
5
6
7
8
9
10
11
12
13
\.


--
-- Data for Name: playlists; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.playlists (id, name, creators_profile_id) FROM stdin;
1	House1	2
2	House2	3
3	House3	5
4	Podcasts1	1
5	Podcasts2	3
6	Podcasts3	5
\.


--
-- Data for Name: playlists_in_libraries; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.playlists_in_libraries (library_id, playlist_id) FROM stdin;
1	4
1	2
1	6
1	3
2	1
2	5
3	2
3	4
3	1
4	3
4	6
5	1
5	6
\.


--
-- Data for Name: playlists_in_profiles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.playlists_in_profiles (profile_id, playlist_id, public_playlist) FROM stdin;
1	4	t
1	6	t
2	1	t
2	5	t
3	4	t
4	3	t
4	6	t
5	1	t
\.


--
-- Data for Name: podcasts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.podcasts (id, name, account_id, genre) FROM stdin;
1	The Joe Rogan Experience	5	Society, Culture, Comedy
2	The Ben Shapiro Show	6	Political Commentary, News, Conservative talk radio
3	Conan OBrien Needs A Friend	7	TV, Celebrities, Comedy
\.


--
-- Data for Name: podcasts_in_libraries; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.podcasts_in_libraries (library_id, podcast_id) FROM stdin;
1	1
2	2
4	3
\.


--
-- Data for Name: profiles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.profiles (id, name) FROM stdin;
1	Erik Trejo
2	Alex Smith
3	Gary Brown
4	Chance Lee
5	Joe Rogan
6	Ben Shapiro
7	Conan OBrien
8	Christopher Lake
9	Chris Lawrence
10	Martin Joseph Leonard Bresso
11	Dominic Matheson
12	Quentin Dombres
13	Jermaine Lamarr Cole
\.


--
-- Data for Name: songs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.songs (id, name, song_length) FROM stdin;
1	Piano Head	00:04:27
2	Chest	00:04:42
3	Soul Sacrifice	00:03:52
4	Right Now	00:03:35
5	Relevations EP	00:04:31
6	Pizza	00:02:14
7	Define	00:03:52
8	Utopia	00:04:41
9	Hey Pablo EP	00:04:10
\.


--
-- Data for Name: songs_by_artists; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.songs_by_artists (song_id, artist_id) FROM stdin;
1	1
1	2
2	1
3	5
4	1
4	2
5	3
6	1
6	2
7	4
8	5
9	1
9	2
\.


--
-- Data for Name: songs_in_albums; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.songs_in_albums (song_id, album_id) FROM stdin;
1	1
2	2
3	3
4	4
5	5
6	6
7	7
8	8
9	9
\.


--
-- Data for Name: songs_in_libraries; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.songs_in_libraries (library_id, song_id, song_liked) FROM stdin;
1	2	t
1	3	t
2	4	t
2	5	t
3	2	t
3	6	t
3	7	t
4	9	t
5	3	t
5	8	t
\.


--
-- Data for Name: songs_in_playlists; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.songs_in_playlists (playlist_id, song_id, date_song_added) FROM stdin;
1	1	2020-01-07
1	2	2021-07-12
1	3	2022-02-14
2	1	2020-06-12
2	2	2020-08-09
2	3	2022-02-28
3	1	2019-09-28
3	2	2020-11-30
3	3	2020-04-30
\.


--
-- Name: accounts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.accounts_id_seq', 4, true);


--
-- Name: albums_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.albums_id_seq', 28, true);


--
-- Name: artists_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.artists_id_seq', 1, false);


--
-- Name: episodes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.episodes_id_seq', 1, false);


--
-- Name: libraries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.libraries_id_seq', 7, true);


--
-- Name: playlists_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.playlists_id_seq', 6, true);


--
-- Name: podcasts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.podcasts_id_seq', 1, false);


--
-- Name: profiles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.profiles_id_seq', 4, true);


--
-- Name: songs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.songs_id_seq', 18, true);


--
-- Name: accounts accounts_artist_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts
    ADD CONSTRAINT accounts_artist_id_key UNIQUE (artist_id);


--
-- Name: accounts accounts_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts
    ADD CONSTRAINT accounts_email_key UNIQUE (email);


--
-- Name: accounts accounts_library_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts
    ADD CONSTRAINT accounts_library_id_key UNIQUE (library_id);


--
-- Name: accounts accounts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts
    ADD CONSTRAINT accounts_pkey PRIMARY KEY (id);


--
-- Name: accounts accounts_podcast_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts
    ADD CONSTRAINT accounts_podcast_id_key UNIQUE (podcast_id);


--
-- Name: accounts accounts_profile_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts
    ADD CONSTRAINT accounts_profile_id_key UNIQUE (profile_id);


--
-- Name: accounts accounts_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts
    ADD CONSTRAINT accounts_username_key UNIQUE (username);


--
-- Name: albums_in_libraries albums_in_libraries_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.albums_in_libraries
    ADD CONSTRAINT albums_in_libraries_pkey PRIMARY KEY (library_id, album_id);


--
-- Name: albums albums_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.albums
    ADD CONSTRAINT albums_pkey PRIMARY KEY (id);


--
-- Name: artists_in_libraries artists_in_libraries_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.artists_in_libraries
    ADD CONSTRAINT artists_in_libraries_pkey PRIMARY KEY (library_id, artist_id);


--
-- Name: artists artists_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.artists
    ADD CONSTRAINT artists_pkey PRIMARY KEY (id);


--
-- Name: artists_with_albums artists_with_albums_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.artists_with_albums
    ADD CONSTRAINT artists_with_albums_pkey PRIMARY KEY (artist_id, album_id);


--
-- Name: episodes_in_libraries episodes_in_libraries_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.episodes_in_libraries
    ADD CONSTRAINT episodes_in_libraries_pkey PRIMARY KEY (library_id, episode_id);


--
-- Name: episodes_in_playlists episodes_in_playlists_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.episodes_in_playlists
    ADD CONSTRAINT episodes_in_playlists_pkey PRIMARY KEY (playlist_id, episode_id);


--
-- Name: episodes episodes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.episodes
    ADD CONSTRAINT episodes_pkey PRIMARY KEY (id);


--
-- Name: libraries libraries_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.libraries
    ADD CONSTRAINT libraries_pkey PRIMARY KEY (id);


--
-- Name: playlists_in_libraries playlists_in_libraries_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.playlists_in_libraries
    ADD CONSTRAINT playlists_in_libraries_pkey PRIMARY KEY (library_id, playlist_id);


--
-- Name: playlists_in_profiles playlists_in_profiles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.playlists_in_profiles
    ADD CONSTRAINT playlists_in_profiles_pkey PRIMARY KEY (profile_id, playlist_id);


--
-- Name: playlists playlists_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.playlists
    ADD CONSTRAINT playlists_pkey PRIMARY KEY (id);


--
-- Name: podcasts_in_libraries podcasts_in_libraries_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.podcasts_in_libraries
    ADD CONSTRAINT podcasts_in_libraries_pkey PRIMARY KEY (library_id, podcast_id);


--
-- Name: podcasts podcasts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.podcasts
    ADD CONSTRAINT podcasts_pkey PRIMARY KEY (id);


--
-- Name: profiles profiles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.profiles
    ADD CONSTRAINT profiles_pkey PRIMARY KEY (id);


--
-- Name: songs_by_artists songs_by_artists_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.songs_by_artists
    ADD CONSTRAINT songs_by_artists_pkey PRIMARY KEY (song_id, artist_id);


--
-- Name: songs_in_albums songs_in_albums_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.songs_in_albums
    ADD CONSTRAINT songs_in_albums_pkey PRIMARY KEY (song_id, album_id);


--
-- Name: songs_in_libraries songs_in_libraries_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.songs_in_libraries
    ADD CONSTRAINT songs_in_libraries_pkey PRIMARY KEY (library_id, song_id);


--
-- Name: songs_in_playlists songs_in_playlists_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.songs_in_playlists
    ADD CONSTRAINT songs_in_playlists_pkey PRIMARY KEY (playlist_id, song_id);


--
-- Name: songs songs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.songs
    ADD CONSTRAINT songs_pkey PRIMARY KEY (id);


--
-- Name: accounts fk_accounts_artists; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts
    ADD CONSTRAINT fk_accounts_artists FOREIGN KEY (artist_id) REFERENCES public.artists(id);


--
-- Name: accounts fk_accounts_libraries; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts
    ADD CONSTRAINT fk_accounts_libraries FOREIGN KEY (library_id) REFERENCES public.libraries(id);


--
-- Name: accounts fk_accounts_podcasts; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts
    ADD CONSTRAINT fk_accounts_podcasts FOREIGN KEY (podcast_id) REFERENCES public.podcasts(id);


--
-- Name: accounts fk_accounts_profiles; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts
    ADD CONSTRAINT fk_accounts_profiles FOREIGN KEY (profile_id) REFERENCES public.profiles(id);


--
-- Name: albums_in_libraries fk_albums_in_libraries_albums; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.albums_in_libraries
    ADD CONSTRAINT fk_albums_in_libraries_albums FOREIGN KEY (album_id) REFERENCES public.albums(id);


--
-- Name: albums_in_libraries fk_albums_in_libraries_libraries; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.albums_in_libraries
    ADD CONSTRAINT fk_albums_in_libraries_libraries FOREIGN KEY (library_id) REFERENCES public.libraries(id);


--
-- Name: artists_in_libraries fk_artists_in_libraries_artists; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.artists_in_libraries
    ADD CONSTRAINT fk_artists_in_libraries_artists FOREIGN KEY (artist_id) REFERENCES public.artists(id);


--
-- Name: artists_in_libraries fk_artists_in_libraries_libraries; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.artists_in_libraries
    ADD CONSTRAINT fk_artists_in_libraries_libraries FOREIGN KEY (library_id) REFERENCES public.libraries(id);


--
-- Name: artists_with_albums fk_artists_with_albums_albums; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.artists_with_albums
    ADD CONSTRAINT fk_artists_with_albums_albums FOREIGN KEY (album_id) REFERENCES public.albums(id);


--
-- Name: artists_with_albums fk_artists_with_albums_artists; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.artists_with_albums
    ADD CONSTRAINT fk_artists_with_albums_artists FOREIGN KEY (artist_id) REFERENCES public.artists(id);


--
-- Name: episodes_in_libraries fk_episodes_in_libraries_episodes; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.episodes_in_libraries
    ADD CONSTRAINT fk_episodes_in_libraries_episodes FOREIGN KEY (episode_id) REFERENCES public.episodes(id);


--
-- Name: episodes_in_libraries fk_episodes_in_libraries_libraries; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.episodes_in_libraries
    ADD CONSTRAINT fk_episodes_in_libraries_libraries FOREIGN KEY (library_id) REFERENCES public.libraries(id);


--
-- Name: episodes_in_playlists fk_episodes_in_playlists_episodes; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.episodes_in_playlists
    ADD CONSTRAINT fk_episodes_in_playlists_episodes FOREIGN KEY (episode_id) REFERENCES public.episodes(id);


--
-- Name: episodes_in_playlists fk_episodes_in_playlists_playlists; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.episodes_in_playlists
    ADD CONSTRAINT fk_episodes_in_playlists_playlists FOREIGN KEY (playlist_id) REFERENCES public.playlists(id);


--
-- Name: playlists_in_libraries fk_playlists_in_libraries_libraries; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.playlists_in_libraries
    ADD CONSTRAINT fk_playlists_in_libraries_libraries FOREIGN KEY (library_id) REFERENCES public.libraries(id);


--
-- Name: playlists_in_libraries fk_playlists_in_libraries_playlists; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.playlists_in_libraries
    ADD CONSTRAINT fk_playlists_in_libraries_playlists FOREIGN KEY (playlist_id) REFERENCES public.playlists(id);


--
-- Name: playlists_in_profiles fk_playlists_in_profiles_playlists; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.playlists_in_profiles
    ADD CONSTRAINT fk_playlists_in_profiles_playlists FOREIGN KEY (playlist_id) REFERENCES public.playlists(id);


--
-- Name: playlists_in_profiles fk_playlists_in_profiles_profiles; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.playlists_in_profiles
    ADD CONSTRAINT fk_playlists_in_profiles_profiles FOREIGN KEY (profile_id) REFERENCES public.profiles(id);


--
-- Name: podcasts_in_libraries fk_podcasts_in_libraries_libraries; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.podcasts_in_libraries
    ADD CONSTRAINT fk_podcasts_in_libraries_libraries FOREIGN KEY (library_id) REFERENCES public.libraries(id);


--
-- Name: podcasts_in_libraries fk_podcasts_in_libraries_podcasts; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.podcasts_in_libraries
    ADD CONSTRAINT fk_podcasts_in_libraries_podcasts FOREIGN KEY (podcast_id) REFERENCES public.podcasts(id);


--
-- Name: songs_by_artists fk_songs_by_artists_artists; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.songs_by_artists
    ADD CONSTRAINT fk_songs_by_artists_artists FOREIGN KEY (artist_id) REFERENCES public.artists(id);


--
-- Name: songs_by_artists fk_songs_by_artists_songs; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.songs_by_artists
    ADD CONSTRAINT fk_songs_by_artists_songs FOREIGN KEY (song_id) REFERENCES public.songs(id);


--
-- Name: songs_in_albums fk_songs_in_albums_albums; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.songs_in_albums
    ADD CONSTRAINT fk_songs_in_albums_albums FOREIGN KEY (album_id) REFERENCES public.albums(id);


--
-- Name: songs_in_albums fk_songs_in_albums_songs; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.songs_in_albums
    ADD CONSTRAINT fk_songs_in_albums_songs FOREIGN KEY (song_id) REFERENCES public.songs(id);


--
-- Name: songs_in_libraries fk_songs_in_libraries_libraries; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.songs_in_libraries
    ADD CONSTRAINT fk_songs_in_libraries_libraries FOREIGN KEY (library_id) REFERENCES public.libraries(id);


--
-- Name: songs_in_libraries fk_songs_in_libraries_songs; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.songs_in_libraries
    ADD CONSTRAINT fk_songs_in_libraries_songs FOREIGN KEY (song_id) REFERENCES public.songs(id);


--
-- Name: songs_in_playlists fk_songs_in_playlists_playlists; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.songs_in_playlists
    ADD CONSTRAINT fk_songs_in_playlists_playlists FOREIGN KEY (playlist_id) REFERENCES public.playlists(id);


--
-- Name: songs_in_playlists fk_songs_in_playlists_songs; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.songs_in_playlists
    ADD CONSTRAINT fk_songs_in_playlists_songs FOREIGN KEY (song_id) REFERENCES public.songs(id);


--
-- PostgreSQL database dump complete
--

