DROP TABLE IF EXISTS public.dimGeneracion;
DROP TABLE IF EXISTS public.dimPokemon;
DROP TABLE IF EXISTS public.factTipo;
DROP TABLE IF EXISTS public.factHabilidad;
DROP TABLE IF EXISTS public.factEstadistica;

--Dimension Generacion
CREATE TABLE IF NOT EXISTS public.dimGeneracion(
  id	INTEGER PRIMARY KEY,
  region	VARCHAR(50) NOT NULL,
  generacion	VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS public.dimPokemon(
  id INTEGER PRIMARY KEY,
  identifier VARCHAR(200) NOT NULL,
  height INTEGER,
  weight INTEGER,
  base_experience INTEGER
);

CREATE TABLE IF NOT EXISTS public.factTipo(
	id INTEGER PRIMARY KEY,
  	identifier  VARCHAR(200) NOT NULL,
  	generation_id INTEGER,
  	pokemon_id INTEGER,
  	tipo_id INTEGER,
  	slot INTEGER
);

CREATE TABLE IF NOT EXISTS public.factHabilidad(
	id	INTEGER PRIMARY KEY,
    identifier	VARCHAR(200) NOT NULL,
    generation_id	INTEGER,
    is_main_series	INTEGER,
    pokemon_id	INTEGER,
    habilidad_id	INTEGER,
    is_hidden	INTEGER,
    slot INTEGER
);
CREATE TABLE IF NOT EXISTS public.factEstadistica(
	id	INTEGER PRIMARY KEY,
    identifier	VARCHAR(200) NOT NULL,
    pokemon_id	INTEGER,
    estadistica_id	INTEGER,
    base_stat INTEGER
);