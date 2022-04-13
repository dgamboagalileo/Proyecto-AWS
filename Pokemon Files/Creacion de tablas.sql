CREATE SCHEMA IF NOT EXISTS pokeapidb;

CREATE TABLE pokemon(
    id INT PRIMARY KEY,
    identifier VARCHAR(250) NOT NULL,
    species_id INT(11) NOT NULL,
    height INT(11) NULL,
    weight INT(11) NULL,
    base_experience INT(11) NULL,
    `order` INT(11) NULL,
    is_default INT(11) NULL
);

CREATE TABLE region(
    id INT PRIMARY KEY,
    identifier VARCHAR(250) NOT NULL
);

CREATE TABLE generacion(
    id INT PRIMARY KEY,
    main_region_id INT(11),
    identifier VARCHAR(250) NOT NULL,
    FOREIGN KEY (main_region_id) REFERENCES region(id)
);

CREATE TABLE tipo(
    id INT PRIMARY KEY,
    identifier VARCHAR(250) NOT NULL,
    generation_id INT(11) NOT NULL,
    FOREIGN KEY (generation_id) REFERENCES generacion(id)
);

CREATE TABLE pokemon_tipo(
    pokemon_id INT NOT NULL,
    tipo_id INT NOT NULL,
    slot INT NULL,
    FOREIGN KEY (pokemon_id) REFERENCES pokemon(id),
    FOREIGN KEY (tipo_id) REFERENCES tipo(id)
);

CREATE TABLE habilidad(
    id INT PRIMARY KEY,
    identifier VARCHAR(250) NOT NULL,
    generation_id INT(11) NOT NULL,
    is_main_series INT(11),
    FOREIGN KEY (generation_id) REFERENCES generacion(id)
);

CREATE TABLE pokemon_habilidad(
    pokemon_id INT(11) NOT NULL,
    habilidad_id INT(11) NOT NULL,
    is_hidden INT(11),
    slot INT(11),
    FOREIGN KEY (pokemon_id) REFERENCES pokemon(id),
    FOREIGN KEY (habilidad_id) REFERENCES habilidad(id)
);

CREATE TABLE estadistica(
    id INT PRIMARY KEY,
    identifier VARCHAR(250) NOT NULL
);

CREATE TABLE pokemon_estadistica(
    pokemon_id INT(11) NOT NULL,
    estadistica_id INT(11) NOT NULL,
    base_stat INT(11),
    FOREIGN KEY (pokemon_id) REFERENCES pokemon(id),
    FOREIGN KEY (estadistica_id) REFERENCES estadistica(id)
);

SELECT * FROM estadistica
