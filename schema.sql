/* Database schema to keep the structure of entire database. */

CREATE TABLE animals(id serial PRIMARY KEY NOT NULL,name VARCHAR(50) NOT NULL,
    date_of_birth DATE NOT NULL,escape_attempts INT NOT NULL,
    neutered BOOLEAN NOT NULL,weight_kg NUMERIC(5,2) NOT NULL
  );


  /*DAY-3 ALTER TABLES AND CREATE TABLE TASKS*/
CREATE TABLE owners(id serial PRIMARY KEY, full_name VARCHAR(50) NOT NULL, age INT NOT NULL);
CREATE TABLE species(id serial PRIMARY KEY, name VARCHAR(50) NOT NULL);
ALTER TABLE animals DROP COLUMN species;
ALTER TABLE animals ADD COLUMN species_id INT REFERENCES species(id);
ALTER TABLE animals ADD COLUMN owners_id INT REFERENCES owners(id);

/***day-4 add join table*/
CREATE TABLE vets (id serial PRIMARY KEY NOT NULL, name VARCHAR(50) NOT NULL, age INT NOT NULL, date_of_graduation DATE NOT NULL);
CREATE TABLE specializations (vet_id INT REFERENCES vets (id), species_id INT REFERENCES species (id));
CREATE TABLE visits (animal_id INT REFERENCES animals (id), vets_id INT REFERENCES vets (id), date_of_visit  DATE);

/**Add an email column to your owners table **/
ALTER TABLE owners ADD COLUMN email VARCHAR(120);

CREATE INDEX visits_animal_id_idx ON visits(animal_id);
CREATE INDEX visits_vet_id_idx ON visits(vet_id);
CREATE INDEX owners_email_idx ON owners(email);