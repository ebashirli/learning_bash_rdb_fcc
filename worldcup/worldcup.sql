--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE worldcup;
--
-- Name: worldcup; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE worldcup WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE worldcup OWNER TO freecodecamp;

\connect worldcup

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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    year integer NOT NULL,
    round character varying NOT NULL,
    winner_id integer NOT NULL,
    opponent_id integer NOT NULL,
    winner_goals integer NOT NULL,
    opponent_goals integer NOT NULL
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: teams; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.teams (
    team_id integer NOT NULL,
    name character varying NOT NULL
);


ALTER TABLE public.teams OWNER TO freecodecamp;

--
-- Name: teams_team_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.teams_team_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.teams_team_id_seq OWNER TO freecodecamp;

--
-- Name: teams_team_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.teams_team_id_seq OWNED BY public.teams.team_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: teams team_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams ALTER COLUMN team_id SET DEFAULT nextval('public.teams_team_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (74, 2018, 'Final', 795, 796, 4, 2);
INSERT INTO public.games VALUES (75, 2018, 'Third Place', 797, 798, 2, 0);
INSERT INTO public.games VALUES (76, 2018, 'Semi-Final', 796, 798, 2, 1);
INSERT INTO public.games VALUES (77, 2018, 'Semi-Final', 795, 797, 1, 0);
INSERT INTO public.games VALUES (78, 2018, 'Quarter-Final', 796, 804, 3, 2);
INSERT INTO public.games VALUES (79, 2018, 'Quarter-Final', 798, 806, 2, 0);
INSERT INTO public.games VALUES (80, 2018, 'Quarter-Final', 797, 808, 2, 1);
INSERT INTO public.games VALUES (81, 2018, 'Quarter-Final', 795, 810, 2, 0);
INSERT INTO public.games VALUES (82, 2018, 'Eighth-Final', 798, 812, 2, 1);
INSERT INTO public.games VALUES (83, 2018, 'Eighth-Final', 806, 814, 1, 0);
INSERT INTO public.games VALUES (84, 2018, 'Eighth-Final', 797, 816, 3, 2);
INSERT INTO public.games VALUES (85, 2018, 'Eighth-Final', 808, 818, 2, 0);
INSERT INTO public.games VALUES (86, 2018, 'Eighth-Final', 796, 820, 2, 1);
INSERT INTO public.games VALUES (87, 2018, 'Eighth-Final', 804, 822, 2, 1);
INSERT INTO public.games VALUES (88, 2018, 'Eighth-Final', 810, 824, 2, 1);
INSERT INTO public.games VALUES (89, 2018, 'Eighth-Final', 795, 826, 4, 3);
INSERT INTO public.games VALUES (90, 2014, 'Final', 827, 826, 1, 0);
INSERT INTO public.games VALUES (91, 2014, 'Third Place', 829, 808, 3, 0);
INSERT INTO public.games VALUES (92, 2014, 'Semi-Final', 826, 829, 1, 0);
INSERT INTO public.games VALUES (93, 2014, 'Semi-Final', 827, 808, 7, 1);
INSERT INTO public.games VALUES (94, 2014, 'Quarter-Final', 829, 836, 1, 0);
INSERT INTO public.games VALUES (95, 2014, 'Quarter-Final', 826, 797, 1, 0);
INSERT INTO public.games VALUES (96, 2014, 'Quarter-Final', 808, 812, 2, 1);
INSERT INTO public.games VALUES (97, 2014, 'Quarter-Final', 827, 795, 1, 0);
INSERT INTO public.games VALUES (98, 2014, 'Eighth-Final', 808, 844, 2, 1);
INSERT INTO public.games VALUES (99, 2014, 'Eighth-Final', 812, 810, 2, 0);
INSERT INTO public.games VALUES (100, 2014, 'Eighth-Final', 795, 848, 2, 0);
INSERT INTO public.games VALUES (101, 2014, 'Eighth-Final', 827, 850, 2, 1);
INSERT INTO public.games VALUES (102, 2014, 'Eighth-Final', 829, 818, 2, 1);
INSERT INTO public.games VALUES (103, 2014, 'Eighth-Final', 836, 854, 2, 1);
INSERT INTO public.games VALUES (104, 2014, 'Eighth-Final', 826, 814, 1, 0);
INSERT INTO public.games VALUES (105, 2014, 'Eighth-Final', 797, 858, 2, 1);


--
-- Data for Name: teams; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.teams VALUES (795, 'France');
INSERT INTO public.teams VALUES (796, 'Croatia');
INSERT INTO public.teams VALUES (797, 'Belgium');
INSERT INTO public.teams VALUES (798, 'England');
INSERT INTO public.teams VALUES (804, 'Russia');
INSERT INTO public.teams VALUES (806, 'Sweden');
INSERT INTO public.teams VALUES (808, 'Brazil');
INSERT INTO public.teams VALUES (810, 'Uruguay');
INSERT INTO public.teams VALUES (812, 'Colombia');
INSERT INTO public.teams VALUES (814, 'Switzerland');
INSERT INTO public.teams VALUES (816, 'Japan');
INSERT INTO public.teams VALUES (818, 'Mexico');
INSERT INTO public.teams VALUES (820, 'Denmark');
INSERT INTO public.teams VALUES (822, 'Spain');
INSERT INTO public.teams VALUES (824, 'Portugal');
INSERT INTO public.teams VALUES (826, 'Argentina');
INSERT INTO public.teams VALUES (827, 'Germany');
INSERT INTO public.teams VALUES (829, 'Netherlands');
INSERT INTO public.teams VALUES (836, 'Costa Rica');
INSERT INTO public.teams VALUES (844, 'Chile');
INSERT INTO public.teams VALUES (848, 'Nigeria');
INSERT INTO public.teams VALUES (850, 'Algeria');
INSERT INTO public.teams VALUES (854, 'Greece');
INSERT INTO public.teams VALUES (858, 'United States');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 105, true);


--
-- Name: teams_team_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.teams_team_id_seq', 858, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: teams teams_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_name_key UNIQUE (name);


--
-- Name: teams teams_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_pkey PRIMARY KEY (team_id);


--
-- Name: games games_opponent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_opponent_id_fkey FOREIGN KEY (opponent_id) REFERENCES public.teams(team_id);


--
-- Name: games games_winner_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_winner_id_fkey FOREIGN KEY (winner_id) REFERENCES public.teams(team_id);


--
-- PostgreSQL database dump complete
--

