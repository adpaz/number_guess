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
-- Name: guessers; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.guessers (
    username character varying(22),
    games_played integer,
    best_game integer,
    user_id integer NOT NULL
);


ALTER TABLE public.guessers OWNER TO freecodecamp;

--
-- Name: guessers_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.guessers_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.guessers_user_id_seq OWNER TO freecodecamp;

--
-- Name: guessers_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.guessers_user_id_seq OWNED BY public.guessers.user_id;


--
-- Name: guessers user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.guessers ALTER COLUMN user_id SET DEFAULT nextval('public.guessers_user_id_seq'::regclass);


--
-- Data for Name: guessers; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.guessers VALUES ('test', NULL, 2, 2);
INSERT INTO public.guessers VALUES ('testing', NULL, 2, 3);
INSERT INTO public.guessers VALUES ('hello world', NULL, 2, 4);
INSERT INTO public.guessers VALUES ('gasdlf', NULL, 2, 5);
INSERT INTO public.guessers VALUES ('ADRIAN', NULL, 2, 6);
INSERT INTO public.guessers VALUES ('123', NULL, 2, 7);
INSERT INTO public.guessers VALUES ('user_1688015293359', NULL, 2, 8);
INSERT INTO public.guessers VALUES ('user_1688015293358', NULL, 2, 9);
INSERT INTO public.guessers VALUES ('user_1688015544544', NULL, 2, 10);
INSERT INTO public.guessers VALUES ('user_1688015544543', NULL, 2, 11);
INSERT INTO public.guessers VALUES ('adrian', 5, 2, 1);
INSERT INTO public.guessers VALUES ('baby', 1, 0, 12);
INSERT INTO public.guessers VALUES ('baby1', 1, 2, 13);
INSERT INTO public.guessers VALUES ('user_1688016347233', 2, 49, 15);
INSERT INTO public.guessers VALUES ('user_1688016347234', 5, 49, 14);
INSERT INTO public.guessers VALUES ('user_1688016409735', 2, 49, 17);
INSERT INTO public.guessers VALUES ('user_1688016409736', 5, 49, 16);
INSERT INTO public.guessers VALUES ('user_1688016512569', 5, 62, 18);
INSERT INTO public.guessers VALUES ('user_1688016512568', 2, 82, 19);
INSERT INTO public.guessers VALUES ('user_1688016536670', 2, 274, 21);
INSERT INTO public.guessers VALUES ('user_1688016536671', 5, 82, 20);


--
-- Name: guessers_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.guessers_user_id_seq', 21, true);


--
-- Name: guessers guessers_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.guessers
    ADD CONSTRAINT guessers_pkey PRIMARY KEY (user_id);


--
-- PostgreSQL database dump complete
--

