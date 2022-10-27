/* Populate database with sample data. */

insert into animals(date_of_birth,escape_attempts,neutered,weight_kg,name) values('02/03/2020', 0, true, 10.23, 'Agumon');
insert into animals(date_of_birth,escape_attempts,neutered,weight_kg,name) values('11/15/2018', 2, true, 8, 'Gabumon');
insert into animals(date_of_birth,escape_attempts,neutered,weight_kg,name) values('01/07/2021', 1, false, 15.04, 'Pikachu');
insert into animals(date_of_birth,escape_attempts,neutered,weight_kg,name) values('05/12/2017', 5, true,11, 'Devimon');
insert into animals(date_of_birth,escape_attempts,neutered,weight_kg,name) values('02/08/2020', 0, false,-11, 'Charmander');
insert into animals(date_of_birth,escape_attempts,neutered,weight_kg,name) values('15/11/2020', 2, true,-5.7, 'Plantmon');
insert into animals(date_of_birth,escape_attempts,neutered,weight_kg,name) values('02/04/1993', 3, false,-12.13, 'Squirtle');
insert into animals(date_of_birth,escape_attempts,neutered,weight_kg,name) values('06/12/2005', 1, true,-45, 'Angemon');
insert into animals(date_of_birth,escape_attempts,neutered,weight_kg,name) values('06/07/2005', 7, true,20.4, 'Boarmon');
insert into animals(date_of_birth,escape_attempts,neutered,weight_kg,name) values('10/13/1998', 3, true,17, 'Blossom');
insert into animals(date_of_birth,escape_attempts,neutered,weight_kg,name) values('05/14/2022', 4, true, 22, 'Ditto');

/*Day-3 Data insert query script*/

INSERT INTO owners (full_name, age) VALUES ('Sam Smith', 43),('Jennifer Orwell', 19),('Bob', 45),('Melody Pond', 77),('Dean Winchester', 14),('Jodie Whittaker',38);
INSERT INTO species (name) VALUES ('Pokemon'),('Digimon');
UPDATE animals SET species_id = (SELECT id FROM species WHERE name = 'Digimon') WHERE name LIKE '%mon';
UPDATE animals SET species_id = (SELECT id FROM species WHERE name = 'Pokemon') WHERE species_id IS NULL;
UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Sam Smith') WHERE name = 'Agumon';
UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Jennifer Orwell') WHERE name IN ('Gabumon', 'Pikachu');
UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Bob') WHERE name IN ('Devimon', 'Plantmon');
UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Melody Pond') WHERE name IN ('Charmander', 'Squirtle',  'Blossom');
UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Dean Winchester') WHERE name IN ('Angemon',  'Boarmon');
