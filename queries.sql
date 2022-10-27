/*Queries that provide answers to the questions from all projects.*/

select * from animals where name like '%mon';
select name from animals where (date_of_birth >= '2016-01-01' AND date_of_birth <= '2019-01-01');
select name from animals where (neutered = 't' AND escape_attempts < 3);
select date_of_birth from animals where (name like '%Agumon' OR name like '%Pikachu');
select name, escape_attempts from animals where (weight_kg > 10.5);
select * from animals where (neutered = 't');
select * from animals where (name not like '%Gabumon');
select * from animals where (weight_kg >= 10.4 AND weight_kg <= 17.3);

/*Transactions queries*/
 BEGIN; UPDATE animals SET species='unspecified'; ROLLBACK TRANSACTION;
 BEGIN; UPDATE animals SET species = 'digimon' WHERE(name like '%mon'); COMMIT;
 BEGIN; UPDATE animals SET species = 'pokemon' WHERE(species=''); COMMIT;
 BEGIN; DELETE FROM animals;
 ROLLBACK TRANSACTION;
 BEGIN; DELETE FROM animals WHERE (date_of_birth > '01/01/2022'); COMMIT;
 BEGIN; SAVEPOINT SP1;
 BEGIN; UPDATE animals SET weight_kg = ('weight_kg' * -1); COMMIT;
 ROLLBACK TO SP1;
 BEGIN; UPDATE animals SET weight_kg = (weight_kg * -1) WHERE (weight_kg < 0); COMMIT;
 SELECT COUNT(*) FROM animals;
 SELECT COUNT(*) FROM animals WHERE (escape_attempts = 0);
 SELECT AVG(weight_kg) FROM animals;
 SELECT neutered, AVG(escape_attempts) AS "AVERAGE ESCAPE ATTEMPTS OF ANIMALS" FROM animals GROUP BY neutered ORDER BY AVG(escape_attempts) DESC LIMIT 1;
 SELECT species, MIN(weight_kg) AS "MINIMUM WEIGHT", MAX(weight_kg) AS "MAXIMUM WEIGHT" FROM animals GROUP BY species;
 SELECT species, AVG(escape_attempts) FROM animals WHERE(date_of_birth >= '01/01/1990' AND date_of_birth <= '01/01/2000') GROUP BY species;

 SELECT a.name AS "ANIMAL NAME", o.full_name AS "BELONG TO"  FROM animals AS a JOIN owners AS o ON a.owner_id = o.id WHERE o.full_name = 'Melody Pond';
 SELECT a.name AS "ANIMAL NAME", s.name AS "ANIMAL TYPE" FROM animals AS a JOIN species AS s ON a.species_id = s.id WHERE s.name = 'Pokemon';
 SELECT o.full_name AS "OWNER NAME", a.name AS "ANIMAL NAME" FROM owners AS o LEFT JOIN animals AS a ON o.id = a.owner_id;
 SELECT s.name AS "SPECIES", COUNT(a.species_id) "NUMBER OF ANIMALS PER SPECIES" FROM animals AS a  JOIN species AS s  ON a.species_id = s.id  GROUP BY s.id;
 SELECT o.full_name AS "OWNER NAME", a.name AS "ANIMAL NAME" FROM owners AS o  JOIN animals AS a  ON o.id = a.owner_id  WHERE o.full_name = 'Jennifer Orwell' AND a.species_id = 2;
 SELECT o.full_name AS "OWNER NAME", a.name AS "ANIMAL NAME", a.escape_attempts AS "ESCAPE ATTEMPTS" FROM owners AS o  JOIN animals AS a  ON o.id = a.owner_id  WHERE o.full_name = 'Dean Winchester' AND a.escape_attempts = 0;
 SELECT o.full_name AS "OWNER NAME", COUNT(a.name) as "NUMBER OF ANIMALS" FROM owners AS o  LEFT JOIN animals AS a  ON a.owner_id = o.id  GROUP BY o.full_name  ORDER BY COUNT(a.name) DESC  LIMIT 1;
