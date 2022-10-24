/*Queries that provide answers to the questions from all projects.*/

select * from animals where name like '%mon';
select name from animals where (date_of_birth >= '2016-01-01' AND date_of_birth <= '2019-01-01');
 select name from animals where (neutered = 't' AND escape_attempts < 3);
select date_of_birth from animals where (name like '%Agumon' OR name like '%Pikachu');
select name, escape_attempts from animals where (weight_kg > 10.5);
select * from animals where (neutered = 't');
select * from animals where (name not like '%Gabumon');
select * from animals where (weight_kg >= 10.4 AND weight_kg <= 17.3);

