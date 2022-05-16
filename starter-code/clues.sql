-- Clue #1: We recently got word that someone fitting Carmen Sandiego's description has been
-- traveling through Southern Europe. She's most likely traveling someplace where she won't be noticed,
-- so find the least populated country in Southern Europe, and we'll start looking for her there.

SELECT * FROM countries WHERE region = 'Southern Europe' ORDER BY population ASC LIMIT 1;

-- -[ RECORD 1 ]--+--------------------------------
-- code           | VAT
-- name           | Holy See (Vatican Cities State)
-- continent      | Europe
-- region         | Southern Europe
-- surfacearea    | 0.4
-- indepyear      | 1929
-- population     | 1000
-- lifeexpectancy |
-- gnp            | 9.00
-- gnpold         |
-- localname      | Santa Sede/Citt� del Vaticano
-- governmentform | Independent Church State
-- headofstate    | Johannes Paavali II
-- capital        | 3538
-- code2          | VA

-- Clue #2: Now that we're here, we have insight that Carmen was seen attending language classes in
-- this country's officially recognized language. Check our databases and find out what language is
-- spoken in this country, so we can call in a translator to work with you.

SELECT * FROM countrylanguages WHERE countrycode = 'VAT';
--  countrycode | language | isofficial | percentage
-- -------------+----------+------------+------------
--  VAT         | Italian  | t          |          0

-- Clue #3: We have new news on the classes Carmen attended – our gumshoes tell us she's moved on
-- to a different country, a country where people speak only the language she was learning. Find out which
--  nearby country speaks nothing but that language.
SELECT * FROM countrylanguages WHERE language = 'Italian';

--  countrycode | language | isofficial | percentage
-- -------------+----------+------------+------------
--  ITA         | Italian  | t          |       94.1
--  SMR         | Italian  | t          |        100
--  VAT         | Italian  | t          |          0
--  ARG         | Italian  | f          |        1.7
--  AUS         | Italian  | f          |        2.2
--  LIE         | Italian  | f          |        2.5
--  BEL         | Italian  | f          |        2.4
--  BRA         | Italian  | f          |        0.4
--  LUX         | Italian  | f          |        4.6
--  MCO         | Italian  | f          |       16.1
--  CHE         | Italian  | t          |        7.7
--  CAN         | Italian  | f          |        1.7
--  FRA         | Italian  | f          |        0.4
--  DEU         | Italian  | f          |        0.7
--  USA         | Italian  | f          |        0.6
-- (15 rows)

-- Clue #4: We're booking the first flight out – maybe we've actually got a chance to catch her this time.
 -- There are only two cities she could be flying to in the country. One is named the same as the country – that
 -- would be too obvious. We're following our gut on this one; find out what other city in that country she might
 --  be flying to.

SELECT * FROM cities WHERE countrycode = 'SMR';

--   id  |    name    | countrycode |     district      | population
-- ------+------------+-------------+-------------------+------------
--  3170 | Serravalle | SMR         | Serravalle/Dogano |       4802
--  3171 | San Marino | SMR         | San Marino        |       2294

-- Clue #5: Oh no, she pulled a switch – there are two cities with very similar names, but in totally different
-- parts of the globe! She's headed to South America as we speak; go find a city whose name is like the one we were
-- headed to, but doesn't end the same. Find out the city, and do another search for what country it's in. Hurry!

SELECT * FROM cities WHERE name LIKE 'Serra%';
-- world=# SELECT * FROM cities WHERE name LIKE 'Serra%';
--   id  |    name    | countrycode |     district      | population
-- ------+------------+-------------+-------------------+------------
--   265 | Serra      | BRA         | Esp�rito Santo    |     302666
--  3170 | Serravalle | SMR         | Serravalle/Dogano |       4802

-- Clue #6: We're close! Our South American agent says she just got a taxi at the airport, and is headed towards
 -- the capital! Look up the country's capital, and get there pronto! Send us the name of where you're headed and we'll
 -- follow right behind you!
select * from countries where name = 'Brazil';
-- -[ RECORD 1 ]--+--------------------------
-- code           | BRA
-- name           | Brazil
-- continent      | South America
-- region         | South America
-- surfacearea    | 8.547403e+06
-- indepyear      | 1822
-- population     | 170115000
-- lifeexpectancy | 62.9
-- gnp            | 776739.00
-- gnpold         | 804108.00
-- localname      | Brasil
-- governmentform | Federal Republic
-- headofstate    | Fernando Henrique Cardoso
-- capital        | 211
-- code2          | BR

select * from citites where id = '211';

-- world=# select * from cities where id = '211';
--  id  |   name   | countrycode |     district     | population
-- -----+----------+-------------+------------------+------------
--  211 | Bras�lia | BRA         | Distrito Federal |    1969868
-- (1 row)

-- Clue #7: She knows we're on to her – her taxi dropped her off at the international airport, and she beat us to
 -- the boarding gates. We have one chance to catch her, we just have to know where she's heading and beat her to the
 -- landing dock.
-- Lucky for us, she's getting cocky. She left us a note, and I'm sure she thinks she's very clever, but
-- if we can crack it, we can finally put her where she belongs – behind bars.

-- Our play date of late has been unusually fun –
-- As an agent, I'll say, you've been a joy to outrun.
-- And while the food here is great, and the people – so nice!
-- I need a little more sunshine with my slice of life.
-- So I'm off to add one to the population I find
-- In a city of ninety-one thousand and now, eighty five.

SELECT * from cities where population = '91084';
--   id  |     name     | countrycode |  district  | population
-- ------+--------------+-------------+------------+------------
--  4060 | Santa Monica | USA         | California |      91084
-- (1 row)

-- We're counting on you, gumshoe. Find out where she's headed, send us the info, and we'll be sure to meet her at the gates with bells on.



-- She's in Santa Monica!
