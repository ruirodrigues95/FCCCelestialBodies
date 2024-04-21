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
-- Name: continent; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.continent (
    continent_id integer NOT NULL,
    planet_id integer,
    name character varying(40) NOT NULL,
    description text
);


ALTER TABLE public.continent OWNER TO freecodecamp;

--
-- Name: continents_continent_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.continents_continent_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.continents_continent_id_seq OWNER TO freecodecamp;

--
-- Name: continents_continent_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.continents_continent_id_seq OWNED BY public.continent.continent_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(40) NOT NULL,
    is_visible_from_earth boolean NOT NULL,
    distance_from_earth_in_lightyears integer,
    galaxy_type character varying(30)
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
    name character varying(40) NOT NULL,
    planet_id integer NOT NULL,
    orbital_period_in_months numeric(5,1),
    surface_temperature_in_celsius numeric(10,1)
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
    name character varying(40) NOT NULL,
    star_id integer NOT NULL,
    radius_in_km numeric(10,1),
    population integer,
    is_flat boolean,
    number_of_species integer
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
    name character varying(40) NOT NULL,
    galaxy_id integer NOT NULL,
    spectral_type character varying(30),
    age integer
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
-- Name: continent continent_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.continent ALTER COLUMN continent_id SET DEFAULT nextval('public.continents_continent_id_seq'::regclass);


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
-- Data for Name: continent; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.continent VALUES (1, 1, 'Aurelia', 'Aurelia is a vast continent characterized by diverse landscapes, ranging from dense rainforests and towering mountain ranges to expansive deserts and lush plains. It is home to a rich variety of flora and fauna, including mystical creatures and ancient civilizations. The continent''s history is filled with tales of magic, exploration, and epic battles between kingdoms vying for power.');
INSERT INTO public.continent VALUES (2, 5, 'Nova Terra', 'Nova Terra is a continent of innovation and advancement, known for its bustling metropolises, cutting-edge technology, and thriving industries. It is a melting pot of cultures and ideas, attracting people from all corners of the globe seeking opportunities and adventure. From towering skyscrapers to sprawling research facilities, Nova Terra is at the forefront of scientific discovery and progress.');
INSERT INTO public.continent VALUES (3, 8, 'Elysium', 'Elysium is a land of tranquility and natural beauty, where rolling hills, pristine lakes, and ancient forests create a sense of serenity and harmony with the natural world. The continent is steeped in mysticism and folklore, with tales of mythical beings and hidden wonders waiting to be discovered. Elysium is a place of spiritual awakening and connection to the elements, drawing seekers of enlightenment and inner peace.');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', true, 100000, 'Spiral');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', true, 2537000, 'Spiral');
INSERT INTO public.galaxy VALUES (3, 'Triangulum', true, 2730000, 'Spiral');
INSERT INTO public.galaxy VALUES (4, 'Messier 87', false, 53490000, 'Elliptical');
INSERT INTO public.galaxy VALUES (5, 'Large Magellanic Cloud', true, 163000, 'Irregular');
INSERT INTO public.galaxy VALUES (6, 'Small Magellanic Cloud', true, 200000, 'Irregular');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 2, 1.0, -20.0);
INSERT INTO public.moon VALUES (2, 'Triton', 6, 6.0, -235.0);
INSERT INTO public.moon VALUES (3, 'Titan', 4, 16.0, -180.0);
INSERT INTO public.moon VALUES (4, 'Ganymede', 9, 7.0, -163.0);
INSERT INTO public.moon VALUES (5, 'Europa', 7, 4.0, -160.0);
INSERT INTO public.moon VALUES (6, 'Io', 8, 2.0, -130.0);
INSERT INTO public.moon VALUES (7, 'Callisto', 5, 1.0, -100.0);
INSERT INTO public.moon VALUES (8, 'Enceladus', 2, 3.0, -198.0);
INSERT INTO public.moon VALUES (9, 'Mimas', 2, 1.0, -195.0);
INSERT INTO public.moon VALUES (10, 'Rhea', 1, 4.0, -174.0);
INSERT INTO public.moon VALUES (11, 'Tethys', 2, 5.0, -187.0);
INSERT INTO public.moon VALUES (12, 'Oberon', 3, 13.0, -220.0);
INSERT INTO public.moon VALUES (13, 'Miranda', 4, 9.0, -190.0);
INSERT INTO public.moon VALUES (14, 'Ariel', 1, 8.0, -213.0);
INSERT INTO public.moon VALUES (15, 'Umbriel', 1, 11.0, -222.0);
INSERT INTO public.moon VALUES (16, 'Charon', 5, 6.0, -220.0);
INSERT INTO public.moon VALUES (17, 'Dione', 9, 6.0, -186.0);
INSERT INTO public.moon VALUES (18, 'Triton II', 6, 1.0, -225.0);
INSERT INTO public.moon VALUES (19, 'Phoebe', 7, 10.0, -200.0);
INSERT INTO public.moon VALUES (20, 'Nereid', 8, 12.0, -236.0);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Terra Nova', 1, 6371.0, 1000000000, false, 500000);
INSERT INTO public.planet VALUES (2, 'Arcturus Prime', 2, 9000.0, 5000000, false, 10000);
INSERT INTO public.planet VALUES (3, 'Centauri Alpha', 3, 8000.0, 20000000, false, 50000);
INSERT INTO public.planet VALUES (4, 'Vega Prime', 4, 7500.0, 4000000, false, 300000);
INSERT INTO public.planet VALUES (5, 'Proxima Terra', 5, 6000.0, 400000, false, 300000);
INSERT INTO public.planet VALUES (6, 'Andromeda IV', 6, 7000.0, 400000, false, 40000);
INSERT INTO public.planet VALUES (7, 'Pandora', 1, 4000.0, 200000, false, 600000);
INSERT INTO public.planet VALUES (8, 'New Betelgeuse', 2, 8500.0, 300000, false, 300000);
INSERT INTO public.planet VALUES (9, 'Centauri Prime', 3, 75000.0, 300000, false, 500000);
INSERT INTO public.planet VALUES (10, 'Vega Minor', 4, 3000.0, 500000, false, 500000);
INSERT INTO public.planet VALUES (11, 'Proxima Major', 5, 5000.0, 700000, false, 3000000);
INSERT INTO public.planet VALUES (12, 'Andromeda V', 6, 7200.0, 304000, false, 600000);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sirius', 1, 'A1V', NULL);
INSERT INTO public.star VALUES (2, 'Betelgeuse', 1, 'M2lab', NULL);
INSERT INTO public.star VALUES (3, 'Alpha Centauri A', 1, 'G2V', NULL);
INSERT INTO public.star VALUES (4, 'Vega', 1, 'A0V', NULL);
INSERT INTO public.star VALUES (5, 'Proxima Centauri', 1, 'M5.5V', NULL);
INSERT INTO public.star VALUES (6, 'Andromeda', 2, 'G2V', NULL);


--
-- Name: continents_continent_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.continents_continent_id_seq', 3, true);


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
-- Name: continent continents_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.continent
    ADD CONSTRAINT continents_name_key UNIQUE (name);


--
-- Name: continent continents_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.continent
    ADD CONSTRAINT continents_pkey PRIMARY KEY (continent_id);


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
-- Name: continent continents_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.continent
    ADD CONSTRAINT continents_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


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

