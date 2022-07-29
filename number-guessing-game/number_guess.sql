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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(25) NOT NULL,
    best_game integer,
    games_played integer
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (9176, 'Me', 9, 1);
INSERT INTO public.users VALUES (9178, 'user_1659070234284', 180, 2);
INSERT INTO public.users VALUES (9188, 'user_1659070360580', 168, 2);
INSERT INTO public.users VALUES (9177, 'user_1659070234285', 12, 5);
INSERT INTO public.users VALUES (9171, 'user_1659070051721', 468, 2);
INSERT INTO public.users VALUES (9187, 'user_1659070360581', 123, 5);
INSERT INTO public.users VALUES (9180, 'user_1659070242538', 891, 2);
INSERT INTO public.users VALUES (9170, 'user_1659070051722', 258, 5);
INSERT INTO public.users VALUES (9179, 'user_1659070242539', 212, 5);
INSERT INTO public.users VALUES (9190, 'user_1659070366106', 11, 2);
INSERT INTO public.users VALUES (9173, 'user_1659070066117', 2, 2);
INSERT INTO public.users VALUES (9182, 'user_1659070253508', 314, 2);
INSERT INTO public.users VALUES (9172, 'user_1659070066118', 54, 5);
INSERT INTO public.users VALUES (9181, 'user_1659070253509', 40, 5);
INSERT INTO public.users VALUES (9189, 'user_1659070366107', 121, 5);
INSERT INTO public.users VALUES (9184, 'user_1659070263623', 130, 2);
INSERT INTO public.users VALUES (9175, 'user_1659070087174', 256, 2);
INSERT INTO public.users VALUES (9183, 'user_1659070263624', 154, 5);
INSERT INTO public.users VALUES (9192, 'user_1659070370178', 30, 2);
INSERT INTO public.users VALUES (9174, 'user_1659070087175', 44, 5);
INSERT INTO public.users VALUES (9191, 'user_1659070370179', 163, 5);
INSERT INTO public.users VALUES (9186, 'user_1659070267770', 15, 2);
INSERT INTO public.users VALUES (9185, 'user_1659070267771', 279, 5);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 9192, true);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- PostgreSQL database dump complete
--

