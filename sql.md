DROP DATABASE IF EXISTS universe;
CREATE DATABASE universe;
\c universe

CREATE TABLE galaxy(
    galaxy_id SERIAL PRIMARY KEY,
    name VARCHAR(100) UNIQUE NOT NULL,
    description TEXT,
    age_in_millions_of_years INT,
    distance_from_earth_in_light_years NUMERIC
);

CREATE TABLE star(
    star_id SERIAL PRIMARY KEY,
    name VARCHAR(100) UNIQUE NOT NULL,
    description TEXT,
    age_in_millions_of_years INT,
    distance_from_earth_in_light_years NUMERIC
);

CREATE TABLE planet(
    planet_id SERIAL PRIMARY KEY,
    name VARCHAR(100) UNIQUE NOT NULL,
    description TEXT,
    age_in_millions_of_years INT,
    is_spherical BOOLEAN,
    distance_from_earth_in_light_years NUMERIC,
    has_life BOOLEAN
);

CREATE TABLE moon(
    moon_id SERIAL PRIMARY KEY,
    name VARCHAR(100) UNIQUE NOT NULL,
    description TEXT,
    age_in_millions_of_years INT,
    distance_from_earth_in_light_years NUMERIC
);

CREATE TABLE planet_types(
    planet_types_id SERIAL PRIMARY KEY,
    name VARCHAR(50) UNIQUE NOT NULL,
    description TEXT,
    age_in_millions_of_years INT
);

ALTER TABLE planet
ADD COLUMN planet_types_id INT,
ADD CONSTRAINT fk_planet_type
FOREIGN KEY (planet_types_id) REFERENCES planet_types(planet_types_id);

CREATE TABLE galaxy_types(
    galaxy_types_id SERIAL PRIMARY KEY,
    name VARCHAR(50) UNIQUE NOT NULL,
    description TEXT
);

ALTER TABLE galaxy
ADD COLUMN galaxy_types_id INT,
ADD CONSTRAINT fk_galaxy_type
FOREIGN KEY (galaxy_types_id) REFERENCES galaxy_types(galaxy_types_id);

ALTER TABLE star
ADD COLUMN galaxy_id INT,
ADD CONSTRAINT fk_galaxy 
FOREIGN KEY (galaxy_id)
REFERENCES galaxy(galaxy_id);

ALTER TABLE planet
ADD COLUMN star_id INT,
ADD CONSTRAINT fk_star 
FOREIGN KEY (star_id)
REFERENCES star(star_id);

ALTER TABLE moon
ADD COLUMN planet_id INT,
ADD CONSTRAINT fk_planet 
FOREIGN KEY (planet_id)
REFERENCES planet(planet_id);

INSERT INTO galaxy_types (name, description) VALUES 
('Spiral', 'Galaxy with curved arms pinwheel structure'),
('Elliptical', 'Galaxy with an ellipsoidal shape and smooth profile'),
('Irregular', 'Galaxy that does not have a distinct regular shape');

INSERT INTO planet_types (name, description, age_in_millions_of_years) VALUES 
('Terrestrial', 'Rocky planets composed primarily of silicate rocks or metals', 4500),
('Gas Giant', 'Large planets composed mostly of hydrogen and helium', 4500),
('Ice Giant', 'Planets composed mainly of heavier elements heavier than hydrogen and helium', 4500);

INSERT INTO galaxy (name, description, age_in_millions_of_years, distance_from_earth_in_light_years, galaxy_types_id) VALUES 
('Milky Way', 'Our home galaxy containing the solar system', 13600, 0, 1),
('Andromeda', 'Nearest major spiral galaxy to the Milky Way', 10000, 2537000, 1),
('Triangulum', 'Member of the Local Group of galaxies', 10000, 3000000, 1),
('Sombrero', 'Unbarred spiral galaxy in the constellation Virgo', 13000, 29350000, 2),
('Large Magellanic Cloud', 'Satellite galaxy of the Milky Way', 11000, 163000, 3),
('Whirlpool', 'Interacting grand-design spiral galaxy', 400000, 23000000, 1);

INSERT INTO star (name, description, age_in_millions_of_years, distance_from_earth_in_light_years, galaxy_id) VALUES 
('Sun', 'The star at the center of the Solar System', 4600, 0, 1),
('Sirius', 'The brightest star in the night sky', 230, 8.6, 1),
('Betelgeuse', 'Red supergiant star in the constellation Orion', 10, 642.5, 1),
('Alpha Centauri A', 'Closest star system component to the Sun', 6000, 4.37, 1),
('Vega', 'Brightest star in the constellation Lyra', 455, 25.04, 1),
('Alpheratz', 'Brightest star in the constellation Andromeda', 60, 97, 2);

INSERT INTO planet (name, description, age_in_millions_of_years, is_spherical, distance_from_earth_in_light_years, has_life, star_id, planet_types_id) VALUES 
('Mercury', 'Smallest and closest planet to the Sun', 4500, TRUE, 0.000015, FALSE, 1, 1),
('Venus', 'Second planet from the Sun with a dense toxic atmosphere', 4500, TRUE, 0.000044, FALSE, 1, 1),
('Earth', 'Our home planet and the only known harbor of life', 4500, TRUE, 0, TRUE, 1, 1),
('Mars', 'The dusty, cold, desert world with a very thin atmosphere', 4500, TRUE, 0.00006, FALSE, 1, 1),
('Jupiter', 'Largest planet in the Solar System', 4500, TRUE, 0.00008, FALSE, 1, 2),
('Saturn', 'Planet known for its extensive ring system', 4500, TRUE, 0.00014, FALSE, 1, 2),
('Uranus', 'Ice giant with a tilted rotation axis', 4500, TRUE, 0.00028, FALSE, 1, 3),
('Neptune', 'Farthest known major planet from the Sun', 4500, TRUE, 0.00043, FALSE, 1, 3),
('Proxima Centauri b', 'Exoplanet orbiting in the habitable zone of Proxima Centauri', 4850, TRUE, 4.37, FALSE, 4, 1),
('Kepler-22b', 'Exoplanet orbiting within the habitable zone of a sun-like star', 6000, TRUE, 620, FALSE, 2, 1),
('Gliese 581c', 'Super-Earth exoplanet candidate', 8000, TRUE, 20.3, FALSE, 3, 1),
('HD 209458 b', 'Hot Jupiter exoplanet undergoing atmospheric evaporation', 4500, TRUE, 159, FALSE, 5, 2);

INSERT INTO moon (name, description, age_in_millions_of_years, distance_from_earth_in_light_years, planet_id) VALUES 
('Moon', 'Earth only natural satellite', 4500, 0.00000004, 3),
('Phobos', 'Larger and innermost moon of Mars', 4500, 0.00006, 4),
('Deimos', 'Smaller and outermost moon of Mars', 4500, 0.00006, 4),
('Io', 'Volcanically active moon of Jupiter', 4500, 0.00008, 5),
('Europa', 'Icy moon of Jupiter with a subsurface ocean', 4500, 0.00008, 5),
('Ganymede', 'Largest moon in the Solar System', 4500, 0.00008, 5),
('Callisto', 'Heavily cratered moon of Jupiter', 4500, 0.00008, 5),
('Titan', 'Largest moon of Saturn with a dense atmosphere', 4500, 0.00014, 6),
('Enceladus', 'Icy moon of Saturn with water geysers', 4500, 0.00014, 6),
('Mimas', 'Moon of Saturn with a giant impact crater', 4500, 0.00014, 6),
('Rhea', 'Second-largest moon of Saturn', 4500, 0.00014, 6),
('Iapetus', 'Two-toned moon of Saturn', 4500, 0.00014, 6),
('Hyperion', 'Sponge-like irregularly shaped moon of Saturn', 4500, 0.00014, 6),
('Titania', 'Largest moon of Uranus', 4500, 0.00028, 7),
('Oberon', 'Outermost major moon of Uranus', 4500, 0.00028, 7),
('Umbriel', 'Darkest major moon of Uranus', 4500, 0.00028, 7),
('Ariel', 'Brightest moon of Uranus', 4500, 0.00028, 7),
('Triton', 'Largest moon of Neptune with retrograde orbit', 4500, 0.00043, 8),
('Proteus', 'Dark, heavily cratered moon of Neptune', 4500, 0.00043, 8),
('Nereid', 'Moon of Neptune with an eccentric orbit', 4500, 0.00043, 8);
