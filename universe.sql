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
-- Name: creature; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.creature (
    creature_id integer NOT NULL,
    name character varying(40) NOT NULL,
    sentient boolean,
    planet_id integer
);


ALTER TABLE public.creature OWNER TO freecodecamp;

--
-- Name: creature_creature_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.creature_creature_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.creature_creature_id_seq OWNER TO freecodecamp;

--
-- Name: creature_creature_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.creature_creature_id_seq OWNED BY public.creature.creature_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(50),
    description text NOT NULL,
    planet_count character varying(20),
    star_count integer,
    has_black_hole boolean,
    count_type character varying(10),
    CONSTRAINT galaxy_count_type CHECK (((count_type)::text = ANY ((ARRAY['trillions'::character varying, 'billions'::character varying, 'millions'::character varying])::text[])))
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
    name character varying(50),
    has_atmosphere boolean,
    irregular_shape boolean,
    planet_id integer,
    size numeric(9,2),
    size_type character varying(8) NOT NULL,
    distance_type character varying(8) NOT NULL,
    distance numeric(10,2),
    CONSTRAINT unit_type_distance CHECK (((distance_type)::text = ANY ((ARRAY['km'::character varying, 'mi'::character varying, 'chi'::character varying, 'shaku'::character varying, 'hasta'::character varying])::text[]))),
    CONSTRAINT unit_type_size CHECK (((size_type)::text = ANY ((ARRAY['km'::character varying, 'mi'::character varying, 'chi'::character varying, 'shaku'::character varying, 'hasta'::character varying])::text[])))
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
    name character varying(50) NOT NULL,
    has_atmosphere boolean,
    moon_count integer,
    atmosphere_height_in_km numeric(10,2),
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
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(50) NOT NULL,
    is_black_hole boolean,
    temperature numeric(8,2),
    temperature_type character varying(1),
    diameter_in_km numeric(3,2),
    diameter_type character varying(10),
    galaxy_id integer,
    CONSTRAINT scale_temperature CHECK (((temperature_type)::text = ANY (ARRAY[('K'::character varying)::text, ('C'::character varying)::text, ('F'::character varying)::text]))),
    CONSTRAINT unit_abbreviation CHECK (((diameter_type)::text = ANY (ARRAY[('billion'::character varying)::text, ('million'::character varying)::text, ('thousand'::character varying)::text])))
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
-- Name: creature creature_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.creature ALTER COLUMN creature_id SET DEFAULT nextval('public.creature_creature_id_seq'::regclass);


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
-- Data for Name: creature; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.creature VALUES (1, 'Homo Erectus', true, 1);
INSERT INTO public.creature VALUES (2, 'Pan troglodytes', false, 1);
INSERT INTO public.creature VALUES (3, 'Homo Sapiens', true, 1);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (2, 'Andromeda Galaxy', 'The nearest large spiral galaxy to the Milky Way.', 'several', 1, true, NULL);
INSERT INTO public.galaxy VALUES (5, 'Whirlpool Galaxy', 'A barred spiral galaxy with prominent spiral arms.', 'several', 1, true, NULL);
INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Our current galaxy', 'several', 1, true, NULL);
INSERT INTO public.galaxy VALUES (6, 'Sombrero Galaxy', 'A lenticular galaxy with a prominent central bulge and a dusty disk.', 'several', 1, true, NULL);
INSERT INTO public.galaxy VALUES (3, 'Large Magellanic Cloud', 'An irregular galaxy orbiting the Milky Way.', 'several', 1, false, NULL);
INSERT INTO public.galaxy VALUES (4, 'Small Magellanic Cloud', 'Another galaxy orbiting the Milky Way.', 'several', 1, false, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', false, false, 1, 3476.00, 'km', 'km', 384400.00);
INSERT INTO public.moon VALUES (2, 'Miranda', true, true, 8, 472.00, 'km', 'km', 129000.00);
INSERT INTO public.moon VALUES (3, 'Ariel', true, false, 8, 1158.00, 'km', 'km', 191000.00);
INSERT INTO public.moon VALUES (4, 'Umbriel', true, false, 8, 1169.00, 'km', 'km', 266000.00);
INSERT INTO public.moon VALUES (5, 'Titania', true, false, 8, 1578.00, 'km', 'km', 401000.00);
INSERT INTO public.moon VALUES (6, 'Oberon', true, false, 8, 1523.00, 'km', 'km', 582000.00);
INSERT INTO public.moon VALUES (7, 'Cordelia', false, false, 8, 42.00, 'km', 'km', 49800.00);
INSERT INTO public.moon VALUES (8, 'Ophelia', false, false, 8, 46.00, 'km', 'km', 53760.00);
INSERT INTO public.moon VALUES (9, 'Bianca', false, false, 8, 54.00, 'km', 'km', 59200.00);
INSERT INTO public.moon VALUES (10, 'Cressida', false, false, 8, 82.00, 'km', 'km', 61700.00);
INSERT INTO public.moon VALUES (11, 'Desdemona', false, false, 8, 68.00, 'km', 'km', 62300.00);
INSERT INTO public.moon VALUES (12, 'Juliet', false, false, 8, 106.00, 'km', 'km', 64400.00);
INSERT INTO public.moon VALUES (13, 'Portia', false, false, 8, 140.00, 'km', 'km', 66100.00);
INSERT INTO public.moon VALUES (14, 'Rosalind', false, false, 8, 72.00, 'km', 'km', 69900.00);
INSERT INTO public.moon VALUES (15, 'Cupid', false, false, 8, 18.00, 'km', 'km', 75200.00);
INSERT INTO public.moon VALUES (16, 'Belinda', false, false, 8, 90.00, 'km', 'km', 76400.00);
INSERT INTO public.moon VALUES (17, 'Perdita', false, false, 8, 30.00, 'km', 'km', 76700.00);
INSERT INTO public.moon VALUES (18, 'Mab', false, false, 8, 25.00, 'km', 'km', 80900.00);
INSERT INTO public.moon VALUES (19, 'Francisco', false, false, 8, 12.00, 'km', 'km', 86000.00);
INSERT INTO public.moon VALUES (20, 'Caliban', false, false, 8, 98.00, 'km', 'km', 8700000.00);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Terra', true, 1, 10000.00, 1);
INSERT INTO public.planet VALUES (2, 'Mercurio', false, 0, NULL, 1);
INSERT INTO public.planet VALUES (3, 'Venus', true, 0, 90.00, 1);
INSERT INTO public.planet VALUES (4, 'Mars', true, 2, 10.00, 1);
INSERT INTO public.planet VALUES (5, 'Iupiter', true, 92, 350.00, 1);
INSERT INTO public.planet VALUES (6, 'Saturnus', true, 83, 200.00, 1);
INSERT INTO public.planet VALUES (7, 'Caelus', true, 27, 50.00, 1);
INSERT INTO public.planet VALUES (8, 'Neptunus', true, 14, 40.00, 1);
INSERT INTO public.planet VALUES (9, 'Pluto', true, 5, 10.00, 1);
INSERT INTO public.planet VALUES (10, 'Demeter', false, 0, NULL, 1);
INSERT INTO public.planet VALUES (11, 'Eris', false, 1, NULL, 1);
INSERT INTO public.planet VALUES (12, 'Toi 286-c', false, 0, NULL, 2);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sol', false, 5772.00, 'K', 1.39, 'million', 1);
INSERT INTO public.star VALUES (2, 'M31', true, 105.00, 'K', NULL, NULL, 1);
INSERT INTO public.star VALUES (3, 'Alpha Centauri A', false, 5790.00, 'K', NULL, NULL, 1);
INSERT INTO public.star VALUES (4, 'Invented', true, 60.00, 'K', 2.12, 'billion', 3);
INSERT INTO public.star VALUES (5, 'InventedAnother', false, 110.00, 'K', 3.62, 'million', 4);
INSERT INTO public.star VALUES (7, 'InventedAnother3', false, 9110.00, 'K', 1.28, 'billion', 2);


--
-- Name: creature_creature_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.creature_creature_id_seq', 3, true);


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

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


--
-- Name: creature creature_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.creature
    ADD CONSTRAINT creature_pkey PRIMARY KEY (creature_id);


--
-- Name: creature creature_unique_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.creature
    ADD CONSTRAINT creature_unique_name UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: galaxy galaxy_unique_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_unique_name UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: moon moon_unique_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_unique_name UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_unique_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_unique_name UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_unique_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_unique_name UNIQUE (name);


--
-- Name: creature creature_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.creature
    ADD CONSTRAINT creature_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


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

