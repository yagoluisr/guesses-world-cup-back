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
    user_id integer NOT NULL,
    match_id integer NOT NULL,
    score_s1 integer NOT NULL,
    score_s2 integer NOT NULL
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
-- Name: matchs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.matchs (
    id integer NOT NULL,
    selection_1 integer NOT NULL,
    selection_2 integer NOT NULL,
    scoreboard_id integer NOT NULL,
    winner text,
    tied boolean DEFAULT false NOT NULL,
    guesses_status boolean DEFAULT true NOT NULL,
    date date NOT NULL
);


--
-- Name: matchs_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.matchs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: matchs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.matchs_id_seq OWNED BY public.matchs.id;


--
-- Name: scoreboard; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.scoreboard (
    id integer NOT NULL,
    score_s1 integer,
    score_s2 integer
);


--
-- Name: scoreboard_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.scoreboard_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: scoreboard_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.scoreboard_id_seq OWNED BY public.scoreboard.id;


--
-- Name: selection; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.selection (
    id integer NOT NULL,
    name text NOT NULL
);


--
-- Name: selection_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.selection_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: selection_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.selection_id_seq OWNED BY public.selection.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    id integer NOT NULL,
    name text NOT NULL,
    email text NOT NULL
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: guesses id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.guesses ALTER COLUMN id SET DEFAULT nextval('public.guesses_id_seq'::regclass);


--
-- Name: matchs id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.matchs ALTER COLUMN id SET DEFAULT nextval('public.matchs_id_seq'::regclass);


--
-- Name: scoreboard id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.scoreboard ALTER COLUMN id SET DEFAULT nextval('public.scoreboard_id_seq'::regclass);


--
-- Name: selection id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.selection ALTER COLUMN id SET DEFAULT nextval('public.selection_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: guesses; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.guesses VALUES (5, 1, 13, 2, 1);
INSERT INTO public.guesses VALUES (6, 1, 14, 3, 4);
INSERT INTO public.guesses VALUES (7, 1, 15, 4, 1);
INSERT INTO public.guesses VALUES (8, 2, 13, 1, 3);
INSERT INTO public.guesses VALUES (9, 2, 14, 2, 3);
INSERT INTO public.guesses VALUES (10, 2, 15, 3, 2);
INSERT INTO public.guesses VALUES (11, 2, 16, 3, 2);
INSERT INTO public.guesses VALUES (12, 2, 17, 1, 0);
INSERT INTO public.guesses VALUES (13, 3, 18, 4, 0);
INSERT INTO public.guesses VALUES (14, 3, 13, 4, 0);
INSERT INTO public.guesses VALUES (15, 3, 15, 1, 4);
INSERT INTO public.guesses VALUES (16, 3, 17, 0, 2);
INSERT INTO public.guesses VALUES (17, 3, 14, 5, 3);
INSERT INTO public.guesses VALUES (18, 3, 20, 4, 5);


--
-- Data for Name: matchs; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.matchs VALUES (14, 5, 6, 3, NULL, false, true, '2022-11-21');
INSERT INTO public.matchs VALUES (15, 7, 8, 4, NULL, false, true, '2022-11-21');
INSERT INTO public.matchs VALUES (16, 9, 10, 5, NULL, false, true, '2022-11-22');
INSERT INTO public.matchs VALUES (17, 11, 12, 6, NULL, false, true, '2022-11-22');
INSERT INTO public.matchs VALUES (18, 13, 14, 7, NULL, false, true, '2022-11-24');
INSERT INTO public.matchs VALUES (20, 13, 16, 9, NULL, false, true, '2022-12-02');
INSERT INTO public.matchs VALUES (21, 13, 9, 10, NULL, false, true, '2022-12-20');
INSERT INTO public.matchs VALUES (19, 13, 15, 8, 'Brasil', false, false, '2022-11-28');
INSERT INTO public.matchs VALUES (12, 1, 2, 1, 'Catar', false, false, '2022-11-20');
INSERT INTO public.matchs VALUES (13, 3, 4, 2, 'Inglaterra', false, false, '2022-11-21');


--
-- Data for Name: scoreboard; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.scoreboard VALUES (3, NULL, NULL);
INSERT INTO public.scoreboard VALUES (4, NULL, NULL);
INSERT INTO public.scoreboard VALUES (5, NULL, NULL);
INSERT INTO public.scoreboard VALUES (6, NULL, NULL);
INSERT INTO public.scoreboard VALUES (7, NULL, NULL);
INSERT INTO public.scoreboard VALUES (9, NULL, NULL);
INSERT INTO public.scoreboard VALUES (10, NULL, NULL);
INSERT INTO public.scoreboard VALUES (8, 4, 1);
INSERT INTO public.scoreboard VALUES (1, 2, 0);
INSERT INTO public.scoreboard VALUES (2, 3, 1);


--
-- Data for Name: selection; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.selection VALUES (1, 'Catar');
INSERT INTO public.selection VALUES (2, 'Equador');
INSERT INTO public.selection VALUES (3, 'Inglaterra');
INSERT INTO public.selection VALUES (4, 'Irã');
INSERT INTO public.selection VALUES (5, 'Senegal');
INSERT INTO public.selection VALUES (6, 'Holanda');
INSERT INTO public.selection VALUES (7, 'Estados Unidos');
INSERT INTO public.selection VALUES (8, 'Gales');
INSERT INTO public.selection VALUES (9, 'Argentina');
INSERT INTO public.selection VALUES (10, 'Arábia Saudita');
INSERT INTO public.selection VALUES (11, 'Dinamarca');
INSERT INTO public.selection VALUES (12, 'Tunísia');
INSERT INTO public.selection VALUES (13, 'Brasil');
INSERT INTO public.selection VALUES (14, 'Sérvia');
INSERT INTO public.selection VALUES (15, 'Suíça');
INSERT INTO public.selection VALUES (16, 'Camarôes');


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.users VALUES (1, 'Joaquim', 'joaquim@email.com');
INSERT INTO public.users VALUES (2, 'Maria', 'maria@email.com');
INSERT INTO public.users VALUES (3, 'Roberto', 'roberto@email.com');
INSERT INTO public.users VALUES (4, 'Carlos', 'carlos@email.com');
INSERT INTO public.users VALUES (6, 'Alan', 'alan@email.com');
INSERT INTO public.users VALUES (7, 'Allan', 'allan@email.com');
INSERT INTO public.users VALUES (8, 'Lucas', 'lucas@email.com');
INSERT INTO public.users VALUES (9, 'Amanda', 'amanda@email.com');
INSERT INTO public.users VALUES (10, 'Jose', 'jose@email.com');


--
-- Name: guesses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.guesses_id_seq', 19, true);


--
-- Name: matchs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.matchs_id_seq', 21, true);


--
-- Name: scoreboard_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.scoreboard_id_seq', 10, true);


--
-- Name: selection_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.selection_id_seq', 16, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.users_id_seq', 10, true);


--
-- Name: guesses guesses_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.guesses
    ADD CONSTRAINT guesses_pkey PRIMARY KEY (id);


--
-- Name: matchs matchs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.matchs
    ADD CONSTRAINT matchs_pkey PRIMARY KEY (id);


--
-- Name: scoreboard scoreboard_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.scoreboard
    ADD CONSTRAINT scoreboard_pkey PRIMARY KEY (id);


--
-- Name: selection selection_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.selection
    ADD CONSTRAINT selection_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: guesses guesses_match_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.guesses
    ADD CONSTRAINT guesses_match_id_fkey FOREIGN KEY (match_id) REFERENCES public.matchs(id);


--
-- Name: guesses guesses_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.guesses
    ADD CONSTRAINT guesses_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: matchs matchs_selection_1_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.matchs
    ADD CONSTRAINT matchs_selection_1_fkey FOREIGN KEY (selection_1) REFERENCES public.selection(id);


--
-- Name: matchs matchs_selection_2_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.matchs
    ADD CONSTRAINT matchs_selection_2_fkey FOREIGN KEY (selection_2) REFERENCES public.selection(id);


--
-- PostgreSQL database dump complete
--

