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
    name character varying(100) NOT NULL,
    description text,
    age_in_millions_of_years integer,
    distance_from_earth_in_light_years numeric,
    galaxy_types_id integer
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
-- Name: galaxy_types; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy_types (
    galaxy_types_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text
);


ALTER TABLE public.galaxy_types OWNER TO freecodecamp;

--
-- Name: galaxy_types_galaxy_types_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_types_galaxy_types_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_types_galaxy_types_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_types_galaxy_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_types_galaxy_types_id_seq OWNED BY public.galaxy_types.galaxy_types_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(100) NOT NULL,
    description text,
    age_in_millions_of_years integer,
    distance_from_earth_in_light_years numeric,
    planet_id integer
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
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(100) NOT NULL,
    description text,
    age_in_millions_of_years integer,
    is_spherical boolean,
    distance_from_earth_in_light_years numeric,
    has_life boolean,
    planet_types_id integer,
    star_id integer
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
-- Name: planet_types; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_types (
    planet_types_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text,
    age_in_millions_of_years integer
);


ALTER TABLE public.planet_types OWNER TO freecodecamp;

--
-- Name: planet_types_planet_types_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_types_planet_types_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_types_planet_types_id_seq OWNER TO freecodecamp;

--
-- Name: planet_types_planet_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_types_planet_types_id_seq OWNED BY public.planet_types.planet_types_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(100) NOT NULL,
    description text,
    age_in_millions_of_years integer,
    distance_from_earth_in_light_years numeric,
    galaxy_id integer
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
-- Name: galaxy_types galaxy_types_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_types ALTER COLUMN galaxy_types_id SET DEFAULT nextval('public.galaxy_types_galaxy_types_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: planet_types planet_types_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_types ALTER COLUMN planet_types_id SET DEFAULT nextval('public.planet_types_planet_types_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Our home galaxy containing the solar system', 13600, 0, 1);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Nearest major spiral galaxy to the Milky Way', 10000, 2537000, 1);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Member of the Local Group of galaxies', 10000, 3000000, 1);
INSERT INTO public.galaxy VALUES (4, 'Sombrero', 'Unbarred spiral galaxy in the constellation Virgo', 13000, 29350000, 2);
INSERT INTO public.galaxy VALUES (5, 'Large Magellanic Cloud', 'Satellite galaxy of the Milky Way', 11000, 163000, 3);
INSERT INTO public.galaxy VALUES (6, 'Whirlpool', 'Interacting grand-design spiral galaxy', 400000, 23000000, 1);


--
-- Data for Name: galaxy_types; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy_types VALUES (1, 'Spiral', 'Galaxy with curved arms pinwheel structure');
INSERT INTO public.galaxy_types VALUES (2, 'Elliptical', 'Galaxy with an ellipsoidal shape and smooth profile');
INSERT INTO public.galaxy_types VALUES (3, 'Irregular', 'Galaxy that does not have a distinct regular shape');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 'Earth only natural satellite', 4500, 0.00000004, 3);
INSERT INTO public.moon VALUES (2, 'Phobos', 'Larger and innermost moon of Mars', 4500, 0.00006, 4);
INSERT INTO public.moon VALUES (3, 'Deimos', 'Smaller and outermost moon of Mars', 4500, 0.00006, 4);
INSERT INTO public.moon VALUES (4, 'Io', 'Volcanically active moon of Jupiter', 4500, 0.00008, 5);
INSERT INTO public.moon VALUES (5, 'Europa', 'Icy moon of Jupiter with a subsurface ocean', 4500, 0.00008, 5);
INSERT INTO public.moon VALUES (6, 'Ganymede', 'Largest moon in the Solar System', 4500, 0.00008, 5);
INSERT INTO public.moon VALUES (7, 'Callisto', 'Heavily cratered moon of Jupiter', 4500, 0.00008, 5);
INSERT INTO public.moon VALUES (8, 'Titan', 'Largest moon of Saturn with a dense atmosphere', 4500, 0.00014, 6);
INSERT INTO public.moon VALUES (9, 'Enceladus', 'Icy moon of Saturn with water geysers', 4500, 0.00014, 6);
INSERT INTO public.moon VALUES (10, 'Mimas', 'Moon of Saturn with a giant impact crater', 4500, 0.00014, 6);
INSERT INTO public.moon VALUES (11, 'Rhea', 'Second-largest moon of Saturn', 4500, 0.00014, 6);
INSERT INTO public.moon VALUES (12, 'Iapetus', 'Two-toned moon of Saturn', 4500, 0.00014, 6);
INSERT INTO public.moon VALUES (13, 'Hyperion', 'Sponge-like irregularly shaped moon of Saturn', 4500, 0.00014, 6);
INSERT INTO public.moon VALUES (14, 'Titania', 'Largest moon of Uranus', 4500, 0.00028, 7);
INSERT INTO public.moon VALUES (15, 'Oberon', 'Outermost major moon of Uranus', 4500, 0.00028, 7);
INSERT INTO public.moon VALUES (16, 'Umbriel', 'Darkest major moon of Uranus', 4500, 0.00028, 7);
INSERT INTO public.moon VALUES (17, 'Ariel', 'Brightest moon of Uranus', 4500, 0.00028, 7);
INSERT INTO public.moon VALUES (18, 'Triton', 'Largest moon of Neptune with retrograde orbit', 4500, 0.00043, 8);
INSERT INTO public.moon VALUES (19, 'Proteus', 'Dark, heavily cratered moon of Neptune', 4500, 0.00043, 8);
INSERT INTO public.moon VALUES (20, 'Nereid', 'Moon of Neptune with an eccentric orbit', 4500, 0.00043, 8);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 'Smallest and closest planet to the Sun', 4500, true, 0.000015, false, 1, 1);
INSERT INTO public.planet VALUES (2, 'Venus', 'Second planet from the Sun with a dense toxic atmosphere', 4500, true, 0.000044, false, 1, 1);
INSERT INTO public.planet VALUES (3, 'Earth', 'Our home planet and the only known harbor of life', 4500, true, 0, true, 1, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 'The dusty, cold, desert world with a very thin atmosphere', 4500, true, 0.00006, false, 1, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 'Largest planet in the Solar System', 4500, true, 0.00008, false, 2, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 'Planet known for its extensive ring system', 4500, true, 0.00014, false, 2, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 'Ice giant with a tilted rotation axis', 4500, true, 0.00028, false, 3, 1);
INSERT INTO public.planet VALUES (8, 'Neptune', 'Farthest known major planet from the Sun', 4500, true, 0.00043, false, 3, 1);
INSERT INTO public.planet VALUES (9, 'Proxima Centauri b', 'Exoplanet orbiting in the habitable zone of Proxima Centauri', 4850, true, 4.37, false, 1, 4);
INSERT INTO public.planet VALUES (10, 'Kepler-22b', 'Exoplanet orbiting within the habitable zone of a sun-like star', 6000, true, 620, false, 1, 2);
INSERT INTO public.planet VALUES (11, 'Gliese 581c', 'Super-Earth exoplanet candidate', 8000, true, 20.3, false, 1, 3);
INSERT INTO public.planet VALUES (12, 'HD 209458 b', 'Hot Jupiter exoplanet undergoing atmospheric evaporation', 4500, true, 159, false, 2, 5);


--
-- Data for Name: planet_types; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet_types VALUES (1, 'Terrestrial', 'Rocky planets composed primarily of silicate rocks or metals', 4500);
INSERT INTO public.planet_types VALUES (2, 'Gas Giant', 'Large planets composed mostly of hydrogen and helium', 4500);
INSERT INTO public.planet_types VALUES (3, 'Ice Giant', 'Planets composed mainly of heavier elements heavier than hydrogen and helium', 4500);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'The star at the center of the Solar System', 4600, 0, 1);
INSERT INTO public.star VALUES (2, 'Sirius', 'The brightest star in the night sky', 230, 8.6, 1);
INSERT INTO public.star VALUES (3, 'Betelgeuse', 'Red supergiant star in the constellation Orion', 10, 642.5, 1);
INSERT INTO public.star VALUES (4, 'Alpha Centauri A', 'Closest star system component to the Sun', 6000, 4.37, 1);
INSERT INTO public.star VALUES (5, 'Vega', 'Brightest star in the constellation Lyra', 455, 25.04, 1);
INSERT INTO public.star VALUES (6, 'Alpheratz', 'Brightest star in the constellation Andromeda', 60, 97, 2);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: galaxy_types_galaxy_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_types_galaxy_types_id_seq', 3, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: planet_types_planet_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_types_planet_types_id_seq', 3, true);


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
-- Name: galaxy_types galaxy_types_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_types
    ADD CONSTRAINT galaxy_types_name_key UNIQUE (name);


--
-- Name: galaxy_types galaxy_types_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_types
    ADD CONSTRAINT galaxy_types_pkey PRIMARY KEY (galaxy_types_id);


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
-- Name: planet_types planet_types_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_types
    ADD CONSTRAINT planet_types_name_key UNIQUE (name);


--
-- Name: planet_types planet_types_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_types
    ADD CONSTRAINT planet_types_pkey PRIMARY KEY (planet_types_id);


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
-- Name: star fk_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: galaxy fk_galaxy_type; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT fk_galaxy_type FOREIGN KEY (galaxy_types_id) REFERENCES public.galaxy_types(galaxy_types_id);


--
-- Name: moon fk_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet fk_planet_type; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_planet_type FOREIGN KEY (planet_types_id) REFERENCES public.planet_types(planet_types_id);


--
-- Name: planet fk_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_star FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

