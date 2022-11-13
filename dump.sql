--
-- PostgreSQL database dump
--

-- Dumped from database version 14.5 (Ubuntu 14.5-0ubuntu0.22.04.1)
-- Dumped by pg_dump version 14.5 (Ubuntu 14.5-0ubuntu0.22.04.1)

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
-- Name: guesses; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.guesses (
    id integer NOT NULL,
    name text NOT NULL,
    "matchId" integer NOT NULL,
    guess text NOT NULL
);


--
-- Name: guesses_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.guesses_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: guesses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.guesses_id_seq OWNED BY public.guesses.id;


--
-- Name: maps; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.maps (
    id integer NOT NULL,
    name text NOT NULL
);


--
-- Name: maps_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.maps_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: maps_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.maps_id_seq OWNED BY public.maps.id;


--
-- Name: matches; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.matches (
    id integer NOT NULL,
    "firstTeamId" integer NOT NULL,
    "secondTeamId" integer NOT NULL,
    "mapId" integer NOT NULL,
    status text DEFAULT 'On hold'::text NOT NULL,
    winner text DEFAULT 'To be decided'::text NOT NULL
);


--
-- Name: matches_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.matches_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: matches_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.matches_id_seq OWNED BY public.matches.id;


--
-- Name: teams; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.teams (
    id integer NOT NULL,
    name text NOT NULL
);


--
-- Name: teams_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.teams_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: teams_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.teams_id_seq OWNED BY public.teams.id;


--
-- Name: guesses id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.guesses ALTER COLUMN id SET DEFAULT nextval('public.guesses_id_seq'::regclass);


--
-- Name: maps id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.maps ALTER COLUMN id SET DEFAULT nextval('public.maps_id_seq'::regclass);


--
-- Name: matches id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.matches ALTER COLUMN id SET DEFAULT nextval('public.matches_id_seq'::regclass);


--
-- Name: teams id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.teams ALTER COLUMN id SET DEFAULT nextval('public.teams_id_seq'::regclass);


--
-- Data for Name: guesses; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.guesses VALUES (1, 'Claudio', 1, 'FNATIC');
INSERT INTO public.guesses VALUES (2, 'Claudio', 2, 'FURIA');
INSERT INTO public.guesses VALUES (3, 'Claudio', 3, 'C9');
INSERT INTO public.guesses VALUES (4, 'Claudio', 4, 'HEROIC');
INSERT INTO public.guesses VALUES (5, 'Roberto', 1, 'OUTSIDERS');
INSERT INTO public.guesses VALUES (6, 'Roberto', 2, 'FURIA');
INSERT INTO public.guesses VALUES (7, 'Roberto', 3, 'MOUZ');
INSERT INTO public.guesses VALUES (8, 'Roberto', 4, 'SPIRIT');
INSERT INTO public.guesses VALUES (9, 'Lucas', 1, 'FNATIC');
INSERT INTO public.guesses VALUES (10, 'Lucas', 2, 'NAVI');
INSERT INTO public.guesses VALUES (11, 'Lucas', 3, 'C9');
INSERT INTO public.guesses VALUES (12, 'Lucas', 4, 'HEROIC');
INSERT INTO public.guesses VALUES (13, 'Angela', 5, 'FURIA');
INSERT INTO public.guesses VALUES (14, 'Angela', 6, 'MOUZ');


--
-- Data for Name: maps; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.maps VALUES (1, 'MIRAGE');
INSERT INTO public.maps VALUES (2, 'DUST2');
INSERT INTO public.maps VALUES (3, 'VERTIGO');
INSERT INTO public.maps VALUES (4, 'NUKE');
INSERT INTO public.maps VALUES (5, 'OVERPASS');
INSERT INTO public.maps VALUES (6, 'INFERNO');
INSERT INTO public.maps VALUES (7, 'ANCIENT');


--
-- Data for Name: matches; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.matches VALUES (1, 3, 4, 2, 'Finished', 'OUTSIDERS');
INSERT INTO public.matches VALUES (2, 1, 2, 3, 'Finished', 'FURIA');
INSERT INTO public.matches VALUES (3, 5, 6, 1, 'Finished', 'MOUZ');
INSERT INTO public.matches VALUES (4, 7, 8, 5, 'Finished', 'HEROIC');
INSERT INTO public.matches VALUES (5, 1, 8, 3, 'Finished', 'FURIA');
INSERT INTO public.matches VALUES (6, 4, 5, 4, 'Finished', 'MOUZ');


--
-- Data for Name: teams; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.teams VALUES (1, 'FURIA');
INSERT INTO public.teams VALUES (2, 'NAVI');
INSERT INTO public.teams VALUES (3, 'FNATIC');
INSERT INTO public.teams VALUES (4, 'OUTSIDERS');
INSERT INTO public.teams VALUES (5, 'MOUZ');
INSERT INTO public.teams VALUES (6, 'C9');
INSERT INTO public.teams VALUES (7, 'SPIRIT');
INSERT INTO public.teams VALUES (8, 'HEROIC');


--
-- Name: guesses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.guesses_id_seq', 14, true);


--
-- Name: maps_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.maps_id_seq', 7, true);


--
-- Name: matches_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.matches_id_seq', 6, true);


--
-- Name: teams_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.teams_id_seq', 8, true);


--
-- Name: guesses guesses_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.guesses
    ADD CONSTRAINT guesses_pkey PRIMARY KEY (id);


--
-- Name: maps maps_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.maps
    ADD CONSTRAINT maps_name_key UNIQUE (name);


--
-- Name: maps maps_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.maps
    ADD CONSTRAINT maps_pkey PRIMARY KEY (id);


--
-- Name: matches matches_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.matches
    ADD CONSTRAINT matches_pkey PRIMARY KEY (id);


--
-- Name: teams teams_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_name_key UNIQUE (name);


--
-- Name: teams teams_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_pkey PRIMARY KEY (id);


--
-- Name: guesses guesses_matchId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.guesses
    ADD CONSTRAINT "guesses_matchId_fkey" FOREIGN KEY ("matchId") REFERENCES public.matches(id);


--
-- Name: matches matches_firstTeamId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.matches
    ADD CONSTRAINT "matches_firstTeamId_fkey" FOREIGN KEY ("firstTeamId") REFERENCES public.teams(id);


--
-- Name: matches matches_mapId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.matches
    ADD CONSTRAINT "matches_mapId_fkey" FOREIGN KEY ("mapId") REFERENCES public.maps(id);


--
-- Name: matches matches_secondTeamId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.matches
    ADD CONSTRAINT "matches_secondTeamId_fkey" FOREIGN KEY ("secondTeamId") REFERENCES public.teams(id);


--
-- PostgreSQL database dump complete
--

