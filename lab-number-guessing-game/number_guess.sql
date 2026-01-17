--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    user_id integer,
    attempts integer DEFAULT 0 NOT NULL
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
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(22) NOT NULL
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
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (1, 3, 10);
INSERT INTO public.games VALUES (2, 3, 11);
INSERT INTO public.games VALUES (3, 3, 7);
INSERT INTO public.games VALUES (4, 3, 8);
INSERT INTO public.games VALUES (5, 3, 11);
INSERT INTO public.games VALUES (6, 3, 9);
INSERT INTO public.games VALUES (7, 8, 862);
INSERT INTO public.games VALUES (8, 8, 388);
INSERT INTO public.games VALUES (9, 9, 298);
INSERT INTO public.games VALUES (10, 9, 80);
INSERT INTO public.games VALUES (11, 8, 812);
INSERT INTO public.games VALUES (12, 8, 669);
INSERT INTO public.games VALUES (13, 8, 670);
INSERT INTO public.games VALUES (14, 8, 98);
INSERT INTO public.games VALUES (15, 10, 825);
INSERT INTO public.games VALUES (16, 10, 565);
INSERT INTO public.games VALUES (17, 11, 269);
INSERT INTO public.games VALUES (18, 11, 445);
INSERT INTO public.games VALUES (19, 10, 762);
INSERT INTO public.games VALUES (20, 10, 478);
INSERT INTO public.games VALUES (21, 10, 479);
INSERT INTO public.games VALUES (22, 10, 267);
INSERT INTO public.games VALUES (23, 3, 10);
INSERT INTO public.games VALUES (24, 3, 9);
INSERT INTO public.games VALUES (25, 3, 10);
INSERT INTO public.games VALUES (26, 3, 4);
INSERT INTO public.games VALUES (27, 3, 4);
INSERT INTO public.games VALUES (28, 3, 2);
INSERT INTO public.games VALUES (29, 3, 3);
INSERT INTO public.games VALUES (30, 3, 3);
INSERT INTO public.games VALUES (31, 3, 4);
INSERT INTO public.games VALUES (32, 3, 5);
INSERT INTO public.games VALUES (33, 3, 2);
INSERT INTO public.games VALUES (34, 3, 2);
INSERT INTO public.games VALUES (35, 3, 2);
INSERT INTO public.games VALUES (36, 3, 2);
INSERT INTO public.games VALUES (37, 3, 2);
INSERT INTO public.games VALUES (38, 3, 2);
INSERT INTO public.games VALUES (39, 3, 2);
INSERT INTO public.games VALUES (40, 3, 2);
INSERT INTO public.games VALUES (41, 3, 4);
INSERT INTO public.games VALUES (42, 3, 2);
INSERT INTO public.games VALUES (43, 3, 3);
INSERT INTO public.games VALUES (44, 3, 3);
INSERT INTO public.games VALUES (45, 3, 4);
INSERT INTO public.games VALUES (46, 3, 4);
INSERT INTO public.games VALUES (47, 12, 2);
INSERT INTO public.games VALUES (48, 12, 9);
INSERT INTO public.games VALUES (49, 13, 7);
INSERT INTO public.games VALUES (50, 13, 6);
INSERT INTO public.games VALUES (51, 12, 8);
INSERT INTO public.games VALUES (52, 12, 7);
INSERT INTO public.games VALUES (53, 12, 8);
INSERT INTO public.games VALUES (54, 14, 9);
INSERT INTO public.games VALUES (55, 14, 3);
INSERT INTO public.games VALUES (56, 15, 11);
INSERT INTO public.games VALUES (57, 15, 11);
INSERT INTO public.games VALUES (58, 14, 11);
INSERT INTO public.games VALUES (59, 14, 11);
INSERT INTO public.games VALUES (60, 14, 6);
INSERT INTO public.games VALUES (61, 16, 11);
INSERT INTO public.games VALUES (62, 16, 2);
INSERT INTO public.games VALUES (63, 17, 2);
INSERT INTO public.games VALUES (64, 17, 8);
INSERT INTO public.games VALUES (65, 16, 7);
INSERT INTO public.games VALUES (66, 16, 7);
INSERT INTO public.games VALUES (67, 16, 5);
INSERT INTO public.games VALUES (68, 18, 7);
INSERT INTO public.games VALUES (69, 18, 11);
INSERT INTO public.games VALUES (70, 19, 2);
INSERT INTO public.games VALUES (71, 19, 5);
INSERT INTO public.games VALUES (72, 18, 8);
INSERT INTO public.games VALUES (73, 18, 9);
INSERT INTO public.games VALUES (74, 18, 9);
INSERT INTO public.games VALUES (75, 20, 745);
INSERT INTO public.games VALUES (76, 20, 37);
INSERT INTO public.games VALUES (77, 21, 407);
INSERT INTO public.games VALUES (78, 21, 487);
INSERT INTO public.games VALUES (79, 20, 96);
INSERT INTO public.games VALUES (80, 20, 286);
INSERT INTO public.games VALUES (81, 20, 576);
INSERT INTO public.games VALUES (82, 22, 798);
INSERT INTO public.games VALUES (83, 22, 631);
INSERT INTO public.games VALUES (84, 23, 948);
INSERT INTO public.games VALUES (85, 23, 912);
INSERT INTO public.games VALUES (86, 22, 231);
INSERT INTO public.games VALUES (87, 22, 810);
INSERT INTO public.games VALUES (88, 22, 983);
INSERT INTO public.games VALUES (89, 24, 769);
INSERT INTO public.games VALUES (90, 24, 265);
INSERT INTO public.games VALUES (91, 25, 616);
INSERT INTO public.games VALUES (92, 25, 522);
INSERT INTO public.games VALUES (93, 24, 637);
INSERT INTO public.games VALUES (94, 24, 693);
INSERT INTO public.games VALUES (95, 24, 697);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (3, 'Patrick');
INSERT INTO public.users VALUES (4, '');
INSERT INTO public.users VALUES (5, 'Lala');
INSERT INTO public.users VALUES (6, 'Lolo');
INSERT INTO public.users VALUES (7, 'Lili');
INSERT INTO public.users VALUES (8, 'user_1768687401043');
INSERT INTO public.users VALUES (9, 'user_1768687401042');
INSERT INTO public.users VALUES (10, 'user_1768687679561');
INSERT INTO public.users VALUES (11, 'user_1768687679560');
INSERT INTO public.users VALUES (12, 'user_1768689954225');
INSERT INTO public.users VALUES (13, 'user_1768689954224');
INSERT INTO public.users VALUES (14, 'user_1768689978973');
INSERT INTO public.users VALUES (15, 'user_1768689978972');
INSERT INTO public.users VALUES (16, 'user_1768690123123');
INSERT INTO public.users VALUES (17, 'user_1768690123122');
INSERT INTO public.users VALUES (18, 'user_1768690196351');
INSERT INTO public.users VALUES (19, 'user_1768690196350');
INSERT INTO public.users VALUES (20, 'user_1768690211348');
INSERT INTO public.users VALUES (21, 'user_1768690211347');
INSERT INTO public.users VALUES (22, 'user_1768690372298');
INSERT INTO public.users VALUES (23, 'user_1768690372297');
INSERT INTO public.users VALUES (24, 'user_1768690438314');
INSERT INTO public.users VALUES (25, 'user_1768690438313');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 95, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 25, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: games games_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--

