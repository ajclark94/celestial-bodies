--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    name character varying(30) NOT NULL,
    description text,
    num_stars integer NOT NULL,
    galaxy_id integer NOT NULL,
    size_in_ly numeric(10,2)
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    size numeric(10,2),
    planet_id integer NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: nebula; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.nebula (
    nebula_id integer NOT NULL,
    name character varying(30) NOT NULL,
    galaxy_id integer NOT NULL
);


ALTER TABLE public.nebula OWNER TO freecodecamp;

--
-- Name: nebula_nebula_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.nebula_nebula_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.nebula_nebula_id_seq OWNER TO freecodecamp;

--
-- Name: nebula_nebula_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.nebula_nebula_id_seq OWNED BY public.nebula.nebula_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    num_moons integer NOT NULL,
    has_moon boolean,
    star_id integer NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    num_planets integer NOT NULL,
    has_planet boolean,
    galaxy_id integer NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: nebula nebula_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.nebula ALTER COLUMN nebula_id SET DEFAULT nextval('public.nebula_nebula_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES ('Milky Way', 'Spiral galaxy home to humanity', 999999999, 1, 100000.00);
INSERT INTO public.galaxy VALUES ('Andromeda', 'Closest galaxy to the milky way', 999999999, 2, 100000.00);
INSERT INTO public.galaxy VALUES ('Antennae Galaxies', 'two colliding galaxies', 999999999, 3, 100000.00);
INSERT INTO public.galaxy VALUES ('Backward Galaxy', 'appears to rotate backwards', 999999999, 4, 100000.00);
INSERT INTO public.galaxy VALUES ('Bear Paw Galaxy', 'Also known as the Bear Claw Galaxy', 999999999, 5, 100000.00);
INSERT INTO public.galaxy VALUES ('Black Eye Galaxy', 'Also known as Sleeping Beauty Galaxy', 999999999, 6, 100000.00);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (7, 'luna1', 'barren', 500.00, 1);
INSERT INTO public.moon VALUES (8, 'luna2', 'barren', 500.00, 1);
INSERT INTO public.moon VALUES (9, 'luna3', 'barren', 500.00, 2);
INSERT INTO public.moon VALUES (10, 'luna4', 'barren', 500.00, 2);
INSERT INTO public.moon VALUES (11, 'luna5', 'barren', 500.00, 3);
INSERT INTO public.moon VALUES (12, 'luna6', 'barren', 500.00, 3);
INSERT INTO public.moon VALUES (13, 'luna7', 'barren', 500.00, 4);
INSERT INTO public.moon VALUES (14, 'luna8', 'barren', 500.00, 4);
INSERT INTO public.moon VALUES (15, 'luna9', 'barren', 500.00, 5);
INSERT INTO public.moon VALUES (16, 'luna10', 'barren', 500.00, 5);
INSERT INTO public.moon VALUES (17, 'luna11', 'barren', 500.00, 6);
INSERT INTO public.moon VALUES (18, 'luna12', 'barren', 500.00, 6);
INSERT INTO public.moon VALUES (19, 'luna13', 'barren', 500.00, 7);
INSERT INTO public.moon VALUES (20, 'luna14', 'barren', 500.00, 7);
INSERT INTO public.moon VALUES (21, 'luna15', 'barren', 500.00, 8);
INSERT INTO public.moon VALUES (22, 'luna16', 'barren', 500.00, 8);
INSERT INTO public.moon VALUES (23, 'luna17', 'barren', 500.00, 9);
INSERT INTO public.moon VALUES (24, 'luna18', 'barren', 500.00, 9);
INSERT INTO public.moon VALUES (25, 'luna19', 'barren', 500.00, 10);
INSERT INTO public.moon VALUES (26, 'luna20', 'barren', 500.00, 10);
INSERT INTO public.moon VALUES (27, 'luna21', 'barren', 500.00, 11);
INSERT INTO public.moon VALUES (28, 'luna22', 'barren', 500.00, 11);
INSERT INTO public.moon VALUES (29, 'luna23', 'barren', 500.00, 12);
INSERT INTO public.moon VALUES (30, 'luna24', 'barren', 500.00, 12);


--
-- Data for Name: nebula; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.nebula VALUES (1, 'nebula1', 1);
INSERT INTO public.nebula VALUES (2, 'nebula2', 2);
INSERT INTO public.nebula VALUES (3, 'nebula3', 3);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'planet1', 'barren', 2, true, 1);
INSERT INTO public.planet VALUES (2, 'planet2', 'barren', 2, true, 1);
INSERT INTO public.planet VALUES (3, 'planet3', 'barren', 2, true, 2);
INSERT INTO public.planet VALUES (4, 'planet4', 'barren', 2, true, 2);
INSERT INTO public.planet VALUES (5, 'planet5', 'barren', 2, true, 3);
INSERT INTO public.planet VALUES (6, 'planet6', 'barren', 2, true, 3);
INSERT INTO public.planet VALUES (7, 'planet7', 'barren', 2, true, 4);
INSERT INTO public.planet VALUES (8, 'planet8', 'barren', 2, true, 4);
INSERT INTO public.planet VALUES (9, 'planet9', 'barren', 2, true, 5);
INSERT INTO public.planet VALUES (10, 'planet10', 'barren', 2, true, 5);
INSERT INTO public.planet VALUES (11, 'planet11', 'barren', 2, true, 6);
INSERT INTO public.planet VALUES (12, 'planet12', 'barren', 2, true, 6);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'star1', 'yellow star', 2, true, 1);
INSERT INTO public.star VALUES (2, 'star2', 'red giant', 2, true, 2);
INSERT INTO public.star VALUES (3, 'star3', 'yellow star', 2, true, 3);
INSERT INTO public.star VALUES (4, 'star4', 'red giant', 2, true, 4);
INSERT INTO public.star VALUES (5, 'star5', 'yellow star', 2, true, 5);
INSERT INTO public.star VALUES (6, 'star6', 'red giant', 2, true, 6);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 30, true);


--
-- Name: nebula_nebula_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.nebula_nebula_id_seq', 3, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: nebula nebula_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.nebula
    ADD CONSTRAINT nebula_name_key UNIQUE (name);


--
-- Name: nebula nebula_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.nebula
    ADD CONSTRAINT nebula_pkey PRIMARY KEY (nebula_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: nebula nebula_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.nebula
    ADD CONSTRAINT nebula_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--


