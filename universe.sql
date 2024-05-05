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
    galaxy_id integer NOT NULL,
    name character varying(20) NOT NULL,
    type text,
    size numeric,
    is_active boolean,
    area integer,
    volume integer
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
    name character varying(10),
    orbit_period numeric,
    diameter numeric,
    habitable boolean,
    planet_id integer NOT NULL,
    area integer,
    volume integer
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
-- Name: observer; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.observer (
    observer_id integer NOT NULL,
    name character varying,
    celestial_body text NOT NULL,
    date date,
    location text
);


ALTER TABLE public.observer OWNER TO freecodecamp;

--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying NOT NULL,
    type text,
    mass numeric,
    is_habitable boolean,
    star_id integer NOT NULL,
    area integer,
    volume integer
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
    name character varying(15) NOT NULL,
    spectral_class text,
    age numeric,
    luminosity numeric,
    galaxy_id integer NOT NULL,
    area integer,
    volume integer
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

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Barred Spiral', 200000, true, NULL, NULL);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', 220000, true, NULL, NULL);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Spiral', 150000, true, NULL, NULL);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 'Spiral', 180000, false, NULL, NULL);
INSERT INTO public.galaxy VALUES (5, 'Black Eye', 'Spiral', 140000, false, NULL, NULL);
INSERT INTO public.galaxy VALUES (6, 'Pinwheel', 'Spiral', 160000, true, NULL, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 27.3, 3476, false, 1, NULL, NULL);
INSERT INTO public.moon VALUES (2, 'Phobos', 0.3, 22, false, 2, NULL, NULL);
INSERT INTO public.moon VALUES (3, 'Titan', 15.9, 5150, true, 3, NULL, NULL);
INSERT INTO public.moon VALUES (4, 'Europa', 3.6, 3122, true, 3, NULL, NULL);
INSERT INTO public.moon VALUES (5, 'Ganymede', 7.2, 5262, true, 6, NULL, NULL);
INSERT INTO public.moon VALUES (6, 'Io', 1.8, 3637, false, 6, NULL, NULL);
INSERT INTO public.moon VALUES (7, 'Enceladus', 1.4, 252, true, 3, NULL, NULL);
INSERT INTO public.moon VALUES (8, 'Triton', 5.9, 2706, false, 11, NULL, NULL);
INSERT INTO public.moon VALUES (9, 'Callisto', 16.7, 4800, true, 6, NULL, NULL);
INSERT INTO public.moon VALUES (10, 'Miranda', 1.4, 236, false, 10, NULL, NULL);
INSERT INTO public.moon VALUES (11, 'Charon', 6.4, 1212, false, 12, NULL, NULL);
INSERT INTO public.moon VALUES (12, 'Deimos', 1.3, 12, false, 2, NULL, NULL);
INSERT INTO public.moon VALUES (13, 'Rhea', 4.5, 1528, false, 3, NULL, NULL);
INSERT INTO public.moon VALUES (14, 'Iapetus', 79.3, 1436, false, 3, NULL, NULL);
INSERT INTO public.moon VALUES (15, 'Nereid', 360.1, 340, false, 11, NULL, NULL);
INSERT INTO public.moon VALUES (16, 'Styx', 20.2, 10, false, 12, NULL, NULL);
INSERT INTO public.moon VALUES (17, 'Nix', 24.9, 49, false, 12, NULL, NULL);
INSERT INTO public.moon VALUES (18, 'Hydra', 38.2, 55, false, 12, NULL, NULL);
INSERT INTO public.moon VALUES (19, 'Kerberos', 32.1, 12, false, 12, NULL, NULL);
INSERT INTO public.moon VALUES (20, 'Proteus', 1.1, 420, false, 11, NULL, NULL);


--
-- Data for Name: observer; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.observer VALUES (1, 'Edwin Hubble', 'Andromeda', '1924-09-30', 'California');
INSERT INTO public.observer VALUES (2, 'Clyde Tombaugh', 'Pluto', '1930-02-18', 'Arizona');
INSERT INTO public.observer VALUES (3, 'Annie Jump Cannon', 'Sirius', '1896-09-01', 'Massachusetts');
INSERT INTO public.observer VALUES (4, 'William Herschel', 'Uranus', '1781-03-13', 'United Kingdom');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Eart', 'Terrestrial', 1.0, true, 1, NULL, NULL);
INSERT INTO public.planet VALUES (2, 'Mars', 'Terrestrial', 0.1, false, 1, NULL, NULL);
INSERT INTO public.planet VALUES (3, 'Jupiter', 'Gas Giant', 318.0, false, 1, NULL, NULL);
INSERT INTO public.planet VALUES (4, 'Saturn', 'Gas Giant', 95.0, false, 1, NULL, NULL);
INSERT INTO public.planet VALUES (5, 'Neptune', 'Ice Giant', 17.0, false, 1, NULL, NULL);
INSERT INTO public.planet VALUES (6, 'Uranus', 'Ice Giant', 14.0, false, 1, NULL, NULL);
INSERT INTO public.planet VALUES (7, 'Venus', 'Terrestrial', 0.8, false, 1, NULL, NULL);
INSERT INTO public.planet VALUES (8, 'mercury', 'Terrestrial', 0.06, false, 1, NULL, NULL);
INSERT INTO public.planet VALUES (9, 'Kepler-22b', 'Super-Earth', 6.4, true, 2, NULL, NULL);
INSERT INTO public.planet VALUES (10, 'TRAPPIST-1e', 'Terrestrial', 0.8, true, 3, NULL, NULL);
INSERT INTO public.planet VALUES (11, 'Gliese 581c', 'Super-Earth', 5.6, true, 4, NULL, NULL);
INSERT INTO public.planet VALUES (12, 'HD 209458 b', 'Gas Giant', 0.7, false, 5, NULL, NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'G2V', 4.6, 1.0, 1, NULL, NULL);
INSERT INTO public.star VALUES (2, 'Alpha Centauri', 'G2V', 6.0, 1.1, 2, NULL, NULL);
INSERT INTO public.star VALUES (3, 'Sirius', 'A1V', 8.6, 2.0, 3, NULL, NULL);
INSERT INTO public.star VALUES (4, 'Vega', 'A0V', 8.2, 2.1, 4, NULL, NULL);
INSERT INTO public.star VALUES (5, 'Canopus', 'A9ll', 10.4, 3.0, 5, NULL, NULL);
INSERT INTO public.star VALUES (6, 'Arcturus', 'K1.5lll', 7.1, 0.8, 6, NULL, NULL);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


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
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: observer observer_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.observer
    ADD CONSTRAINT observer_pkey PRIMARY KEY (observer_id);


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
-- Name: observer unique_discoveries; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.observer
    ADD CONSTRAINT unique_discoveries UNIQUE (celestial_body);


--
-- Name: moon unique_moons; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT unique_moons UNIQUE (name);


--
-- Name: planet unique_planet_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT unique_planet_id UNIQUE (planet_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


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

