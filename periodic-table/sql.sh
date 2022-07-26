PSQL="psql -X --username=freecodecamp --dbname=periodic_table --tuples-only -c"

echo "$($PSQL "ALTER TABLE properties RENAME COLUMN weight TO atomic_mass;")"
echo "$($PSQL "ALTER TABLE properties RENAME COLUMN melting_point TO melting_point_celsius;")"
echo "$($PSQL "ALTER TABLE properties RENAME COLUMN boiling_point TO boiling_point_celsius;")"
echo "$($PSQL "ALTER TABLE properties ALTER COLUMN melting_point_celsius SET NOT NULL;")"
echo "$($PSQL "ALTER TABLE properties ALTER COLUMN boiling_point_celsius SET NOT NULL;")"
echo "$($PSQL "ALTER TABLE elements ALTER COLUMN symbol SET NOT NULL;")"
echo "$($PSQL "ALTER TABLE elements ALTER COLUMN name SET NOT NULL;")"
echo "$($PSQL "ALTER TABLE elements ADD UNIQUE (symbol);")"
echo "$($PSQL "ALTER TABLE elements ADD UNIQUE (name);")"
echo "$($PSQL "ALTER TABLE properties ADD FOREIGN KEY (atomic_number) REFERENCES elements(atomic_number);")"
echo "$($PSQL "CREATE TABLE types(type_id SERIAL PRIMARY KEY, type VARCHAR NOT NULL);")"
echo "$($PSQL "INSERT INTO types (type) SELECT DISTINCT type FROM properties;")"
echo "$($PSQL "ALTER TABLE properties ADD COLUMN type_id INT;")"
echo "$($PSQL "UPDATE properties SET type_id = types.type_id FROM types WHERE properties.type = types.type;")"
echo "$($PSQL "ALTER TABLE properties ADD FOREIGN KEY (type_id) REFERENCES types(type_id);")"
echo "$($PSQL "ALTER TABLE properties ALTER COLUMN type_id SET NOT NULL;")"
echo "$($PSQL "DELETE type FROM properties;")"
echo "$($PSQL "ALTER TABLE properties DROP COLUMN type;")"
echo "$($PSQL "UPDATE elements SET symbol = UPPER(symbol);")"
echo "$($PSQL "ALTER TABLE properties ALTER COLUMN atomic_mass TYPE NUMERIC;UPDATE properties SET atomic_mass = atomic_mass::REAL;")"
echo "$($PSQL "INSERT INTO elements (atomic_number, name, symbol) VALUES (9, 'Fluorine', 'F');INSERT INTO properties (atomic_number, atomic_mass, melting_point_celsius, boiling_point_celsius, type_id) VALUES (9, 18.998, -220, -188.1, (SELECT type_id FROM types WHERE type = 'nonmetal'));")"
echo "$($PSQL "INSERT INTO elements (atomic_number, name, symbol) VALUES (10, 'Neon', 'Ne');INSERT INTO properties (atomic_number, atomic_mass, melting_point_celsius, boiling_point_celsius, type_id) VALUES (10, 20.18, -248.6, -246.1, (SELECT type_id FROM types WHERE type = 'nonmetal'));")"
echo "$($PSQL "DELETE FROM properties WHERE atomic_number = 1000;DELETE FROM elements WHERE atomic_number = 1000;")"