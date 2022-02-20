/*
 * Base de Dados
 *
 * Diogo Miguel Carvalho Castro up201906406
 * Rui Francisco 
 *
 * BD para rede social simples.
 * Esquema e dados iniciais.
 */

CREATE DATABASE IF NOT EXISTS liga_dos_campeoes;

USE liga_dos_campeoes;

DROP TABLE IF EXISTS NATIONALITY, GAME, TEAM, PLAYER, REFEREE, COUNTRY, STADIUM, GROUP_STAGE;

CREATE TABLE COUNTRY
(
  Name VARCHAR(50) PRIMARY KEY NOT NULL,
  Continent ENUM('Europe', 'North America', 'South America', 'Asia', 'Africa', 'Oceania') NOT NULL,
  FifaRankingSpot INT UNIQUE NOT NULL
);

CREATE TABLE STADIUM
(
  Name VARCHAR(64) PRIMARY KEY NOT NULL,
  Location VARCHAR(50) NOT NULL,
  FOREIGN KEY(Location) REFERENCES COUNTRY(Name)
  ON UPDATE CASCADE,
  SeatingCap INT NOT NULL
);

CREATE TABLE TEAM
(
  Name VARCHAR(32) PRIMARY KEY NOT NULL,
  Manager VARCHAR(50) NOT NULL,
  Stadium VARCHAR(64) UNIQUE NOT NULL,
  FOREIGN KEY(Stadium) REFERENCES STADIUM(Name),
  Fundation DATE NOT NULL,
  President VARCHAR(50) DEFAULT 'Unknown',
  NumPlayers INT NOT NULL,
  Country varchar(50),
  FOREIGN KEY(Country) REFERENCES COUNTRY(Name),
  ChampionsLeagueWins INT DEFAULT NULL,
  FinancialState ENUM('Rich', 'Modest', 'Stable', 'Poor') NOT NULL,
  GroupId ENUM('A', 'B', 'C', 'D', 'E', 'F', 'G', 'H') NOT NULL
);

CREATE TABLE GROUP_STAGE
(
  GroupId ENUM ('A', 'B', 'C', 'D', 'E', 'F', 'G', 'H') PRIMARY KEY,
  FirstPlace VARCHAR(50) NOT NULL,
  /*FOREIGN KEY(FirstPlace) REFERENCES TEAM(Name),*/  /*Estes Foreign keys são adicionados mais tarde*/
  SecondPlace VARCHAR(50) NOT NULL,
  /*FOREIGN KEY(SecondPlace) REFERENCES TEAM(Name),*/
  ThirdPlace VARCHAR(50) NOT NULL,
  /*FOREIGN KEY(ThirdPlace) REFERENCES TEAM(Name),*/
  FourthPlace VARCHAR(50) NOT NULL
  /*FOREIGN KEY(FourthPlace) REFERENCES TEAM(Name)*/
);


CREATE TABLE PLAYER
(
  PlayerID INT PRIMARY KEY auto_increment,
  Player VARCHAR(50) NOT NULL,
  Team VARCHAR(32) NOT NULL,
  FOREIGN KEY(Team) REFERENCES TEAM(Name)
  ON UPDATE CASCADE
  ON DELETE CASCADE,
  Position ENUM('GK', 'CB', 'LB', 'RB', 'DM', 'CM', 'LW', 'RW', 'ST') NOT NULL, 
  BirthDate DATE NOT NULL,
  NationalTeam VARCHAR(50),
  FOREIGN KEY(NationalTeam) REFERENCES COUNTRY(Name)
  ON UPDATE CASCADE,
  Foot ENUM('Left', 'Right', 'Both') NOT NULL,
  Value INT,
  ContractExpirationDate DATE NOT NULL
);

CREATE TABLE REFEREE
(
  Id INT PRIMARY KEY auto_increment,
  Name VARCHAR(50) NOT NULL, 
  Country VARCHAR(50),
  FOREIGN KEY(Country) REFERENCES COUNTRY(Name)
  ON UPDATE CASCADE,
  BirthDate Date NOT NULL
);

CREATE TABLE GAME
(
  GameId INT PRIMARY KEY AUTO_INCREMENT,
  HomeTeam VARCHAR(50) NOT NULL,
  FOREIGN KEY(HomeTeam) REFERENCES TEAM(Name),
  AwayTeam VARCHAR(50) NOT NULL,
  FOREIGN KEY(AwayTeam) REFERENCES TEAM(Name),
  UNIQUE(HomeTeam, AwayTeam),
  RefereeId INT NOT NULL,
  FOREIGN KEY(RefereeId) REFERENCES REFEREE(Id) ON UPDATE CASCADE,
  Stadium VARCHAR(64) NOT NULL,
  FOREIGN KEY(Stadium) REFERENCES STADIUM(Name) ON UPDATE CASCADE,
  HomeTeamGoals INT DEFAULT NULL,
  AwayTeamGoals INT DEFAULT NULL,
  ScoreLine VARCHAR(5) NOT NULL
);

CREATE TABLE NATIONALITY
(
  PlayerId INT NOT NULL,
  Country VARCHAR(50) NOT NULL,
  FOREIGN KEY(PlayerId) REFERENCES PLAYER(PlayerId) ON DELETE CASCADE,
  FOREIGN KEY(Country) REFERENCES COUNTRY(Name) ON UPDATE CASCADE,
  PRIMARY KEY(PlayerId, Country) 
);


/*-------------Countries ADD--------------------*/

INSERT INTO COUNTRY(Name, Continent, FifaRankingSpot)
Values
('Portugal', 'Europe', 5),
('Belgium', 'Europe', 1),
('France', 'Europe', 2),
('Brazil', 'South America', 3),
('England', 'Europe', 4),
('Spain', 'Europe', 6),
('Argentina', 'South America', 7),
('Uruguay', 'South America', 8),
('Mexico', 'North America', 9),
('Italy', 'Europe', 10),
('Croatia', 'Europe', 11),
('Germany', 'Europe', 13),
('Denmark', 'Europe', 12),
('Netherlands', 'Europe', 14),
('Colombia', 'South America', 15),
('Switzerland', 'Europe', 16),
('Chile', 'South America', 17),
('Wales', 'Europe', 18),
('Poland', 'Europe', 19),
('Senegal', 'Africa', 20),
('Sweden', 'Europe', 21),
('USA', 'North America', 22),
('Austria', 'Europe', 23),
('Ukraine', 'Europe', 24),
('Peru', 'South America', 25),
('Tunisia', 'Africa', 26),
('Japan', 'Asia', 27),
('Venezuela', 'South America', 28),
('Iran', 'Africa', 29),
('Serbia', 'Europe', 30),
('Algeria', 'Africa', 31),
('Turkey', 'Europe', 32),
('Morocco', 'Africa', 33),
('Slovakia', 'Europe', 34),
('Paraguay', 'South America', 35),
('Nigeria', 'Africa', 36),
('Romania', 'Europe', 37),
('Korea Republic', 'Asia', 38),
('Russia', 'Europe', 39),
('Hungary', 'Europe', 40),
('Australia', 'Oceania', 41),
('Ireland', 'Europe', 42),
('Czech Republic', 'Europe', 43),
('Norway', 'Europe', 44),
('Northern Ireland', 'Europe', 45),
('Iceland', 'Europe', 46),
('Jamaica', 'North America', 47),
('Scotland', 'Europe', 48),
('Egypt', 'Africa', 49),
('Costa Rica', 'North America', 50),
('Greece', 'Europe', 53),
('Georgia', 'Asia', 89),
('Ecuador', 'South America', 57),
('Armenia', 'Asia', 99),
('Mali', 'Africa', 54),
('Ivory Coast', 'Africa', 61),
('Luxembourg', 'Europe', 98),
('Burundi', 'Africa', 138),
('Bosnia Herzergovina', 'Europe', 56),
('Israel', 'Asia', 87),
('Dominican Republic', 'North America', 159),
('Slovenia', 'Europe', 62),
('Belarus', 'Europe', 88),
('Guinea', 'Africa', 72),
('Cameroon', 'Africa', 51),
('Bulgaria', 'Europe', 68),
('Latvian', 'Europe', 136),
('Albania', 'Europe', 66),
('Canada', 'North America', 73),
('Benim', 'Africa', 82),
('Congo', 'Africa', 90),
('Ghana', 'Africa', 52),
('Suriname', 'South America', 141),
('Tanzania', 'Africa', 135),
('Cape Verde', 'Africa', 80),
('Sudan', 'Africa', 127),
('Togo', 'Africa', 128),
('Gabon', 'Africa', 86),
('San Marino', 'Europe', 210),
('China', 'Asia', 75);

/*-------------Stadiums ADD--------------------*/
INSERT INTO STADIUM(Name, Location, SeatingCap)
VALUES
('Allianz Arena', 'Germany', 75000),
('Wanda Metropolitano', 'Spain', 65829),
('Arena Salzburg', 'Austria', 31895),
('Santiago Bernabéu', 'Spain', 81044),
('Borussia-Park', 'Germany', 54057),
('Donbass Arena', 'Ukraine', 51504),
('Giuseppe Meazza', 'Italy', 81277),
('Etihad Stadium', 'England', 55097),
('Estádio do Dragão', 'Portugal', 50033),
('Karaiskakis Stadium', 'Greece', 33330),
('Vélodrome', 'France', 67394),
('Anfield Road', 'England',54074),
('Atleti Azzurri', 'Italy', 26393),
('Johan Cruijff Arena', 'Netherlands', 55500),
('MCH Arena', 'Denmark', 11432),
('Stamford Bridge', 'England',40853),
('Ramón Sánchez Pizjuán', 'Spain', 45500),
('Krasnodar Stadium', 'Russia', 35074),
('Roazhon Park', 'France',29778),
('Signal Iduna Park', 'Germany',81365),
('Stadio Olimpico', 'Italy',73261),
('Jan Breydel', 'Belgium',29062),
('Krestovsky', 'Russia', 69000),
('Juventus Stadium', 'Italy', 41507),
('Camp Nou', 'Spain',99789),
('Kyiv Olympic', 'Ukraine',70050),
('Groupama Arena', 'Hungary',22000),
('Parc des Princes', 'France', 48583),
('Red Bull Arena', 'Germany', 42949),
('Old Trafford', 'England', 76790),
('Fatih Terim Stadium', 'Turkey', 17319),
('RZD Arena', 'Russia', 27320);


/*-------------Teams ADD--------------------*/
INSERT INTO TEAM(Name, Manager, Stadium, Fundation, President, NumPlayers, Country, ChampionsLeagueWins, FinancialState, GroupId)
VALUES
/*----------GroupA-----------------*/
('Bayern Munchen', 'Hans-Dieter Flick', 'Allianz Arena', '1900-02-27', 'Herbert Hainer', 36, 'Germany', 5, 'Rich', 'A'),
('Atletico Madrid', 'Diego Simeone', 'Wanda Metropolitano', '1903-04-26', 'Enrique Cerezo', 30, 'Spain', 0, 'Rich', 'A'),
('RB Salzburg', 'Jesse Marsch', 'Arena Salzburg', '2005-04-6', 'Harald Lürzer', 29, 'Austria', 0, 'Stable', 'A'),
('Lokomotiv Moscow', 'Marko Nikolić', 'RZD Arena', '1992-07-23', 'Vladimir Leontchenko', 34, 'Russia', 0, 'Poor', 'A'),
/*----------GroupB-----------------*/
('Real Madrid', 'Zinedine Zidane', 'Santiago Bernabéu', '1902-03-06', 'Florentino Pérez', 33, 'Spain', 13, 'Rich','B'),
('Borussia Monchengladbach', 'Marco Rose', 'Borussia-Park', '1900-08-01', 'Rolf Königs', 26, 'Germany', 0, 'Stable', 'B'),
('Shaktar Donetsk', 'Luís Castro', 'Donbass Arena', '1936-05-24', 'Rinat Akhmetov', 36, 'Ukraine', 0, 'Modest', 'B'),
('Internazionale', 'Antonio Conte', 'Giuseppe Meazza', '1908-03-9', 'Steven Zhang', 33, 'Italy', 3, 'Rich', 'B'),
/*----------GroupC-----------------*/
('Manchester City', 'Pep Guardiola', 'Etihad Stadium', '1880-11-23', 'Khaldoon Al Mubarak', 31, 'England', 0, 'Rich', 'C'),
('F.C.Porto', 'Sérgio Conceição', 'Estádio do Dragão', '1893-09-28', 'Pinto da Costa', 27, 'Portugal', 2, 'Stable', 'C'),
('Olympiakos', 'Pedro Martins', 'Karaiskakis Stadium', '1925-03-10', 'Evangelos Marinakis', 33, 'Greece', 0, 'Poor', 'C'),
('Marseille', 'Jorge Sampaoli', 'Vélodrome', '1899-08-31', 'Jacques-Henri Eyraud', 28, 'France', 1, 'Stable', 'C'),
/*----------GroupD-----------------*/
('Liverpool', 'Jürgen Klopp', 'Anfield Road', '1892-06-03', 'Tom Werner', 35, 'England', 6, 'Rich', 'D'),
('Atalanta', 'Gian Gasperini', 'Atleti Azzurri', '1907-10-17', 'Antonio Percassi', 31, 'Italy', 0, 'Modest', 'D'),
('Ajax', 'Erik ten Hag', 'Johan Cruijff Arena', '1900-03-18', 'Hennie Henrichs', 31, 'Netherlands', 4, 'Modest', 'D'),
('Midtjylland', 'Kenneth Andersen', 'MCH Arena', '1999-04-6', 'Rasmus Ankersen', 34, 'Denmark', 0, 'Poor', 'D'),
/*----------GroupE-----------------*/
('Chelsea', 'Thomas Tuchel', 'Stamford Bridge', '1905-03-10', 'Roman Abramovich', 28, 'England', 1, 'Rich', 'E'),
('Sevilla', 'Julen Lopetegui', 'Ramón Sánchez Pizjuán', '1890-01-25', 'José Castro Carmona', 33, 'Spain', 0, 'Modest', 'E'),
('Krasnodar', 'Murad Musaev', 'Krasnodar Stadium', '2008-02-22', 'Sergey Galitsky', 43, 'Russia', 0, 'Modest', 'E'),
('Stade Rennes', 'Bruno Génésio', 'Roazhon Park', '1901-03-10', 'Nicolas Holvek', 27, 'France', 0, 'Stable', 'E'),
/*----------GroupF-----------------*/
('Borussia Dortmund', 'Edin Terzić', 'Signal Iduna Park', '1909-12-19', 'Reinhard Rauball', 29, 'Germany', 1, 'Rich', 'F'),
('Lazio', 'Simone Inzaghi', 'Stadio Olimpico', '1900-01-9', 'Claudio Lotito', 38, 'Italy', 0, 'Modest', 'F'),
('Club Brugge', 'Philippe Clement', 'Jan Breydel', '1891-11-13', 'Bart Verhaeghe', 31, 'Belgium', 0, 'Stable', 'F'),
('Zenit', 'Sergey Semak', 'Krestovsky', '1925-05-25', 'Sergey Fursenko', 31, 'Russia', 0, 'Rich', 'F'),
/*----------GroupG-----------------*/
('Juventus', 'Andrea Pirlo', 'Juventus Stadium', '1897-11-1', 'Andrea Agnelli', 40, 'Italy', 2, 'Rich', 'G'),
('F.C.Barcelona', 'Ronald Koeman', 'Camp Nou', '1899-11-29', 'Joan Laporta', 32, 'Spain', 5, 'Rich', 'G'),
('Dynamo Kyiv', 'Mircea Lucescu', 'Kyiv Olympic', '1927-05-13', 'Ihor Surkis', 33, 'Ukraine', 0, 'Stable', 'G'),
('Ferencvaros', 'Serhiy Rebrov', 'Groupama Arena', '1899-05-3', 'Gábor Kubatov', 30, 'Hungary', 0, 'Poor', 'G'),
/*----------GroupH-----------------*/
('Paris S.G.', 'Mauricio Pochettino', 'Parc des Princes', '1970-08-12', 'Nasser Al-Khelaïfi', 31, 'France', 0, 'Rich', 'H'),
('RB Leipzig', 'Julian Nagelsmann', 'Red Bull Arena', '2009-05-19', 'Oliver Mintzlaff', 27, 'Germany', 0, 'Rich', 'H'),
('Manchester United', 'Ole Solskjær', 'Old Trafford', '1878-05-05', 'Joel Glazer', 27, 'England', 3, 'Rich', 'H'),
('Basaksehir', 'Aykut Kocaman', 'Fatih Terim Stadium', '1990-06-15', 'Göksel Gümüsdag', 33, 'Turkey', 0, 'Stable', 'H');

/*-------------Referees ADD--------------------*/
INSERT INTO REFEREE(Name, Country, BirthDate)
VALUES
  ('Felix Brych', 'Germany', '1975-08-03'),
  ('Björn Kuipers', 'Netherlands', '1973-03-28'),
  ('Cüneyt Çakır', 'Turkey', '1976-11-23'),
  ('Anthony Taylor', 'England', '1978-10-20'),
  ('Davide Massa', 'Italy', '1981-07-15'),
  ('Ali Palabıyık', 'Turkey', '1981-08-14'),
  ('Sidiropoulos', 'Greece', '1979-09-09'),
  ('Felix Zwayer', 'Germany', '1981-05-19'),
  ('Marco Guida', 'Italy', '1981-06-07'),
  ('William Collum', 'England', '1979-01-18'),
  ('Artur Soares Dias', 'Portugal', '1979-07-14'),
  ('Pavel Královec', 'Czech Republic', '1977-08-16'),
  ('Bartosz Frankowski', 'Poland', '1986-09-26'),
  ('Benoît Bastien', 'France', '1983-04-17'),
  ('Clément Turpin', 'France', '1982-05-16'),
  ('Damir Skomina', 'Slovenia', '1976-08-05'),
  ('Michael Oliver', 'England', '1985-02-20'),
  ('Ivan Kružliak', 'Slovenia', '1984-03-24'),
  ('Antonio Lahoz', 'Spain', '1977-03-12'),
  ('Serdar Gözübüyük', 'Netherlands', '1985-10-29'),
  ('István Kovács', 'Romania', '1984-09-16'),
  ('Ovidiu Hațegan', 'Romania', '1980-07-14'),
  ('Sandro Schärer', 'Switzerland', '1988-07-06'),
  ('Danny Makkelie', 'Netherlands', '1983-01-28'),
  ('Orel Grinfeld', 'Israel', '1981-08-21'),
  ('Matej Jug', 'Slovenia', '1980-09-25'),
  ('Daniel Siebert', 'Germany', '1984-05-04'),
  ('Stéphanie Frappart', 'France', '1983-12-14'),
  ('Aleksei Kulbakov', 'Belarus', '1979-12-17'),
  ('Andreas Ekberg', 'Sweden', '1985-01-02'),
  ('Tobias Stieler', 'Germany', '1981-07-02'),
  ('Jesús Manzano', 'Spain', '1984-02-04'),
  ('Slavko Vinčić', 'Slovenia', '1979-11-25'),
  ('Szymon Marciniak', 'Poland', '1981-01-07'),
  ('Carlos del Cerro', 'Spain', '1976-03-13'),
  ('Daniele Orsato', 'Italy', '1975-11-23'),
  ('Srdjan Jovanović', 'Serbia', '1986-04-09'),
  ('Georgi Kabakov', 'Bulgaria', '1986-02-22'),
  ('Andris Treimanis', 'Latvian', '1985-03-16'),
  ('Halil Umut Meler', 'Turkey', '1986-08-01'),
  ('Paweł Raczkowski', 'Poland', '1983-05-10'),
  ('Bobby Madden', 'Scotland', '1978-10-25'),
  ('Sergei Karasev', 'Russia', '1979-06-12'),
  ('Anastasios Sidiropoulos', 'Greece', '1979-08-09'),
  ('François Letexier', 'France', '1989-04-23');
  

/*-------------Referees ADD--------------------*/
INSERT INTO GROUP_STAGE(GroupId, FirstPlace, SecondPlace, ThirdPlace, FourthPlace)
VALUES 
  ('A', 'Bayern Munchen', 'Atletico Madrid', 'RB Salzburg', 'Lokomotiv Moscow'),
  ('B', 'Real Madrid', 'Borussia Monchengladbach', 'Shaktar Donetsk', 'Internazionale'),
  ('C', 'Manchester City', 'F.C.Porto', 'Olympiakos', 'Marseille'),
  ('D', 'Liverpool', 'Atalanta', 'Ajax', 'Midtjylland'),
  ('E', 'Chelsea', 'Sevilla', 'Krasnodar', 'Stade Rennes'),
  ('F', 'Borussia Dortmund', 'Lazio', 'Club Brugge', 'Zenit'),
  ('G', 'Juventus', 'F.C.Barcelona', 'Dynamo Kyiv', 'Ferencvaros'),
  ('H', 'Paris S.G.', 'RB Leipzig', 'Manchester United', 'Basaksehir');
  
  /*-------------Foreign ADD's--------------------*/
ALTER TABLE TEAM ADD FOREIGN KEY(GroupId) REFERENCES GROUP_STAGE(GroupId);/*tem de ser alterado posteriormente devido á tabela GROUP_STAGE ser criada depois
																			e para apenas ligar os valores após ter valores em todos os campos, caso assim
																			não acontecesse, haveria sempre valores que não iriam haver(ou a tabela dos grupos
                                                                            não teria Equipas a quem associar ou a tabela das equipas não teria grupo para associar)*/
ALTER TABLE GROUP_STAGE ADD FOREIGN KEY(FirstPlace) REFERENCES TEAM(Name);
ALTER TABLE GROUP_STAGE ADD FOREIGN KEY(SecondPlace) REFERENCES TEAM(Name);
ALTER TABLE GROUP_STAGE ADD FOREIGN KEY(ThirdPlace) REFERENCES TEAM(Name);
ALTER TABLE GROUP_STAGE ADD FOREIGN KEY(FourthPlace) REFERENCES TEAM(Name);

/*-------------Players--------------------*/
INSERT INTO Player(Player, Team, Position, BirthDate, NationalTeam, Foot, Value, ContractExpirationDate)
VALUES
/*----------Bayern Munchen-----------------*/
('Manuel Neuer', 'Bayern Munchen', 'GK', '1986-03-27', 'Germany', 'Right', 18000000, '2023-06-30'),
('Robert Lewandowski', 'Bayern Munchen', 'ST', '1988-08-21 ', 'Poland', 'Right', 60000000, '2023-06-30'),
('Leroy Sané', 'Bayern Munchen', 'RW', '1996-01-11', 'Germany', 'Left', 60000000, '2025-06-30'),
('Corentin Tolisso', 'Bayern Munchen', 'CM', '1994-08-03', 'France', 'Right', 25000000, '2022-06-30'),
('Niklas Süle', 'Bayern Munchen', 'CB', '1995-09-03', 'Germany', 'Right', 37000000, '2022-06-30'),
/*----------Atlético de Madrid-----------------*/
('Jan Oblak', 'Atlético Madrid', 'GK', '1993-01-07', 'Slovenia', 'Right', 90000000, '2023-06-30'),
('Felipe', 'Atlético Madrid', 'CB', '1989-05-16', 'Brazil', 'Right', 15000000, '2022-06-30'),
('Héctor Herrera', 'Atlético Madrid', 'CM', '1990-04-19', 'Mexico', 'Right', 8000000, '2022-06-30'),
('João Félix', 'Atlético Madrid', 'ST', '1999-11-10', 'Portugal', 'Both', 80000000, '2026-06-30'),
('Vitolo', 'Atlético Madrid', 'LW', '1989-11-02', 'Spain', 'Right', 8000000, '2022-06-30'),
/*----------RB Salzburg-----------------*/
('Cican Stankovic', 'RB Salzburg', 'GK', '1992-11-04', 'Austria', 'Right', 2000000, '2023-06-30'),
('André Ramalho', 'RB Salzburg', 'CB', '1992-02-16', 'Brazil', 'Both', 3000000, '2022-06-30'),
('Amar Dedic', 'RB Salzburg', 'RB', '2002-08-18', 'Bosnia Herzergovina', 'Right', 900000, '2024-06-30'),
('Mërgim Berisha', 'RB Salzburg', 'ST', '1998-05-11', 'Germany', 'Right', 10000000, '2022-06-30'),
('Karim Adeyemi', 'RB Salzburg', 'ST', '2002-01-18', 'Germany', 'Left', 9000000, '2024-06-30'),
/*----------Lokomotiv Moscow-----------------*/
('Anton Miranchuk', 'Lokomotiv Moscow', 'CM', '1995-10-17', 'Russia', 'Right', 14000000, '2024-06-30'),
('Grzegorz Krychowiak', 'Lokomotiv Moscow', 'CM', '1990-01-29', 'Poland', 'Right', 13000000, '2022-06-30'),
('Guilherme', 'Lokomotiv Moscow', 'GK', '1985-12-12', 'Russia', 'Right', 1000000, '2022-06-30'),
('Pablo', 'Lokomotiv Moscow', 'CB', '1991-06-21', 'Brazil', 'Right', 8000000, '2024-06-30'),
('Zé Luís', 'Lokomotiv Moscow', 'ST', '1991-01-24', 'Cape Verde', 'Left', 6000000, '2023-06-30'),
/*----------Real Madrid-----------------*/
('Thibaut Courtois', 'Real Madrid', 'GK', '1992-05-11', 'Belgium', 'Left', 75000000, '2024-06-30'),
('Eden Hazard', 'Real Madrid', 'LW', '1991-01-07', 'Belgium', 'Both', 40000000, '2024-06-30'),
('Mariano Díaz', 'Real Madrid', 'ST', '1993-08-01', 'Dominican Republic', 'Right', 10000000, '2023-06-30'),
('Luka Modric', 'Real Madrid', 'CM', '1985-09-09', 'Croatia', 'Both', 10000000, '2021-06-30'),
('Sergio Ramos', 'Real Madrid', 'CB', '1986-03-30', 'Spain', 'Right', 14000000, '2021-06-30'),
/*----------Borussia Monchengladbach-----------------*/ /*VER DAQUI PARA CIMA*/
('Yann Sommer', 'Borussia Monchengladbach', 'GK', '1988-12-17', 'Switzerland', 'Right', 7000000, '2023-06-30'),
('Valentino Lazaro', 'Borussia Monchengladbach', 'RW', '1996-03-24', 'Austria', 'Right', 15000000, '2021-06-30'),
('Julio Villalba', 'Borussia Monchengladbach', 'ST', '1998-09-17', 'Paraguay', 'Right', 400000, '2021-06-30'), /*Trocar paraguai por paraguay*/
('Joe Scally', 'Borussia Monchengladbach', 'RB', '2002-12-31', 'USA', 'Right', 2000000, '2021-06-30'),
('Ramy Bensebaini', 'Borussia Monchengladbach', 'LB', '1995-04-16', 'Algeria', 'Left', 22000000, '2023-06-30'),
/*----------Shaktar Donetsk-----------------*/
('Oleksiy Shevchenko', 'Shaktar Donetsk', 'GK', '1992-02-24', 'Ukraine', 'Right', 700000, '2023-06-17'),
('Davit Khocholava', 'Shaktar Donetsk', 'CB', '1993-02-08', 'Georgia', 'Right', 3500000, '2025-06-30'), /*Georgia mais de 1 continente*/
('Valeriy Bondar', 'Shaktar Donetsk', 'CB', '1999-02-27', 'Ukraine', 'Right', 3500000, '2024-10-31'),
('Manor Solomon', 'Shaktar Donetsk', 'LW', '1999-07-24', 'Israel', 'Both', 15000000, '2023-12-31'),
('Dentinho', 'Shaktar Donetsk', 'CM', '1989-01-19', 'Brazil', 'Right', 1000000, '2021-06-30'),
/*----------Internazionale-----------------*/
('Samir Handanovic', 'Internazionale', 'GK', '1984-07-14', 'Slovenia', 'Right', 2500000, '2022-06-30'),
('Stefan de Vrij', 'Internazionale', 'CB', '1992-02-05', 'Netherlands', 'Right', 55000000, '2023-06-30'),
('Romelu Lukaku', 'Internazionale', 'ST', '1993-05-13', 'Belgium', 'Left', 90000000, '2024-06-30'),
('Milan Skriniar', 'Internazionale', 'CB', '1995-02-11', 'Slovakia', 'Right', 50000000, '2023-06-30'),
('Nicolò Barella', 'Internazionale', 'CM', '1997-02-07', 'Italy', 'Right', 55000000, '2024-06-30'),
/*----------Manchester City-----------------*/
('Kevin De Bruyne', 'Manchester City', 'CM', '1991-06-28', 'Belgium', 'Right', 100000000, '2023-06-30'),
('Raheem Sterling', 'Manchester City', 'LW', '1994-12-08', 'England', 'Right', 100000000, '2023-06-30'),
('Bernardo Silva', 'Manchester City', 'RW', '1994-08-10', 'Portugal', 'Left', 70000000, '2025-06-30'),
('Gabriel Jesus', 'Manchester City', 'ST', '1997-04-03', 'Brazil', 'Right', 60000000, '2023-06-30'),
('Sergio Agüero', 'Manchester City', 'ST', '1988-06-02', 'Argentina', 'Right', 25000000, '2021-06-30'),
/*----------F.C.Porto-----------------*/
('Wilson Manafá', 'F.C.Porto', 'RB', '1994-07-23', 'Portugal', 'Right', 5500000, '2023-06-30'),
('Jesús Corona', 'F.C.Porto', 'RW', '1993-01-06', 'Mexico', 'Both', 30000000, '2022-06-30'),
('Moussa Marega', 'F.C.Porto', 'ST', '1991-04-14', 'Mali', 'Right', 20000000, '2021-06-30'),
('Marko Grujic', 'F.C.Porto', 'DM', '1996-04-13', 'Serbia', 'Right', 14000000, '2023-06-30'),
('Mehdi Taremi', 'F.C.Porto', 'ST', '1992-07-18', 'Iran', 'Right',12000000, '2024-06-30'),
/*----------Olympiakos-----------------*/
('Mady Camara', 'Olympiakos', 'CM', '1997-02-28', 'Guinea', 'Right', 15000000, '2024-06-30'), 
('Konstantinos Fortounis', 'Olympiakos', 'CM', '1992-10-16', 'Greece', 'Both', 8000000, '2023-06-30'), 
('Rúben Semedo', 'Olympiakos', 'CB', '1994-04-04', 'Portugal', 'Right', 8000000, '2023-06-30'), 
('Youssef El Arabi', 'Olympiakos', 'ST', '1987-02-03', 'Morocco', 'Right', 3000000, '2022-06-30'), 
('Mohamed Dräger', 'Olympiakos', 'RB', '1996-06-25', 'Tunisia', 'Right', 1000000, '2024-06-30'),
/*----------Marseille-----------------*/
('Luis Henrique', 'Marseille', 'LW', '2001-12-14', 'Brazil', 'Right', 8000000, '2025-06-30'), 
('Florian Thauvin', 'Marseille', 'RW', '1993-01-26', 'France', 'Left', 32000000, '2021-06-30'), 
('Arkadiusz Milik', 'Marseille', 'ST', '1994-02-28', 'Poland', 'Left', 22000000, '2022-06-30'), 
('Hiroki Sakai', 'Marseille', 'RB', '1990-04-12', 'Japan', 'Right', 5500000, '2022-06-30'), 
('Boubacar Kamara', 'Marseille', 'DM', '1999-11-23', 'France', 'Right', 32000000, '2022-06-30'),
/*----------Liverpool-----------------*/
('Mohamed Salah', 'Liverpool', 'RW', '1992-06-15', 'Egypt', 'Left', 110000000, '2023-06-30'), 
('Sadio Mané', 'Liverpool', 'LW', '1992-04-10', 'Senegal', 'Right', 100000000, '2023-06-30'), 
('Andrew Robertson', 'Liverpool', 'LW', '1994-03-11', 'Scotland', 'Left', 70000000, '2024-06-30'), 
('Neco Williams', 'Liverpool', 'RB', '2001-04-13', 'Wales', 'Right', 10000000, '2025-06-30'), 
('Virgil van Dijk', 'Liverpool', 'CB', '1991-07-08', 'Netherlands', 'Right', 70000000, '2023-06-30'),
/*----------Atalanta-----------------*/
('Duván Zapata', 'Atalanta', 'ST', '1991-04-01', 'Colombia', 'Right', 38000000, '2023-06-30'), 
('Robin Gosens', 'Atalanta', 'LB', '1994-07-05', 'Germany', 'Left', 28000000, '2022-06-30'), 
('Pierluigi Gollini', 'Atalanta', 'GK', '1995-03-18', 'Italy', 'Right', 17000000, '2023-06-30'), 
('Joakim Maehle', 'Atalanta', 'RB', '1997-05-20', 'Denmark', 'Right', 11000000, '2025-06-30'), 
('Mario Pasalic', 'Atalanta', 'CM', '1995-02-09', 'Croatia', 'Right', 25000000, '2024-06-30'),
/*----------Ajax-----------------*/
('André Onana', 'Ajax', 'GK', '1996-04-02', 'Cameroon', 'Right', 30000000, '2022-06-30'),
('Nicolás Tagliafico', 'Ajax', 'LB', '1992-08-31', 'Argentina', 'Left', 25000000, '2023-06-30'),
('David Neres', 'Ajax', 'RW', '1997-03-03', 'Brazil', 'Left', 30000000, '2023-06-30'),
('Dusan Tadic', 'Ajax', 'LW', '1988-11-20', 'Serbia', 'Left', 20000000, '2023-06-30'),
('Sébastien Haller', 'Ajax', 'ST', '1994-06-22', 'Ivory Coast', 'Right', 30000000, '2025-06-30'),
/*----------Midtjylland-----------------*/
('Evander', 'Midtjylland', 'CM', '1998-06-09', 'Brazil', 'Right', 6000000, '2024-06-30'),
('Anders Dreyer', 'Midtjylland', 'RW', '1998-05-02', 'Denmark', 'Left', 6000000, '2024-06-30'),
('Jesper Hansen', 'Midtjylland', 'GK', '1985-03-31', 'Denmark', 'Right', 350000, '2022-06-30'),
('Jens Cajuste', 'Midtjylland', 'DM', '1999-08-10', 'Sweden', 'Right', 3000000, '2023-06-30'),
('Awer Mabil', 'Midtjylland', 'RW', '1995-09-15', 'Australia', 'Right', 2500000, '2022-06-30'),
/*----------Chelsea-----------------*/
('Edouard Mendy', 'Chelsea', 'GK', '1992-03-01', 'France', 'Right', 25000000, '2025-06-30'),
('Thiago Silva', 'Chelsea', 'CB', '1984-09-22', 'Brazil','Right', 3500000, '2021-06-30'),
('Kai Havertz', 'Chelsea', 'CM', '1999-06-11', 'Germany', 'Left', 70000000, '2025-06-30'),
('Timo Werner', 'Chelsea', 'ST', '1996-03-06', 'Germany', 'Right', 65000000, '2025-06-30'),
('Billy Gilmour', 'Chelsea', 'CM', '2001-06-11', 'England', 'Right', 7000000, '2023-06-30'),
/*----------Sevilla-----------------*/
('Bono', 'Sevilla', 'GK', '1991-04-05', 'Morocco', 'Left', 18000000, '2024-06-30'),
('Jules Koundé', 'Sevilla', 'CB', '1998-11-12', 'France', 'Right', 60000000, '2024-06-30'),
('Jésus Navas', 'Sevilla', 'RB', '1985-11-21', 'Spain', 'Right', 3000000, '2021-06-30'),
('Lucas Ocampos', 'Sevilla', 'LW', '1994-07-11', 'Argentina', 'Both', 40000000, '2024-06-30'),
('Ivan Rakitic', 'Sevilla', 'CM', '1988-03-10', 'Croatia', 'Right', 10000000, '2024-06-30'),
/*----------Krasnodar-----------------*/
('Matvey Safonov','Krasnodar', 'GK', '1999-02-25', 'Russia', 'Right', 15000000, '2023-06-30'),
('Cristian Ramírez', 'Krasnodar', 'LB', '1995-08-12', 'Ecuador', 'Left', 6500000, '2022-06-30'),
('Eduard Spertsyan', 'Krasnodar', 'CM', '2000-06-07', 'Armenia', 'Right', 650000, '2021-06-30'),
('Wanderson', 'Krasnodar', 'RW', '1994-10-07', 'Brazil', 'Right', 11000000, '2024-06-30'),
('Ari', 'Krasnodar', 'ST', '1985-12-11', 'Russia', 'Both', 900000, '2021-06-30'),
/*----------Stade Rennes-----------------*/
('Alfred Gomis', 'Stade Rennes', 'GK', '1993-09-05', 'Senegal', 'Right', 9000000, '2025-06-30'),
('Hamari Traoré', 'Stade Rennes', 'RB', '1992-01-27', 'Mali', 'Right', 8000000, '2023-06-30'),
('Eduardo Camavinga', 'Stade Rennes', 'DM', '2002-11-10', 'France', 'Left', 60000000, '2022-06-30'),
('James Léa Siliki', 'Stade Rennes', 'CM', '1996-06-12', 'France', 'Left', 6500000, '2023-06-30'),
('Jérémy Doku', 'Stade Rennes', 'RW', '2002-05-27', 'Belgium', 'Right', 20000000, '2025-06-30'),
/*----------Borussia Dortmund-----------------*/
('Roman Bürki', 'Borussia Dortmund', 'GK', '1990-11-14', 'Switzerland', 'Right', 7000000, '2023-06-30'),
('Raphaël Guerreiro', 'Borussia Dortmund', 'LB', '1993-12-22', 'Portugal', 'Left', 35000000, '2023-06-30'),
('Giovanni Reyna', 'Borussia Dortmund', 'CM', '2002-11-13', 'USA', 'Right', 38000000, '2025-06-30'),
('Youssoufa Moukoko', 'Borussia Dortmund', 'ST', '2004-11-20', 'Germany', 'Left', 10000000, '2022-06-30'),
('Erling Haaland', 'Borussia Dortmund', 'ST', '2000-07-21', 'Norway', 'Left', 110000000, '2024-06-30'),
 /*----------Lazio-----------------*/
 ('Thomas Strakosha', 'Lazio', 'GK', '1995-03-19', 'Albania', 'Right', 20000000, '2022-06-30'),
 ('Luiz Felipe', 'Lazio', 'CB', '1997-03-22', 'Brazil', 'Right', 22000000, '2022-06-30'),
 ('Milinković-Savić', 'Lazio', 'CM', '1995-02-27', 'Serbia', 'Right', 70000000, '2024-06-30'),
 ('Luis Alberto', 'Lazio', 'CM', '1992-09-28', 'Spain', 'Right', 50000000, '2025-06-30'),
 ('Ciro Immobile', 'Lazio', 'ST', '1990-02-20', 'Italy', 'Right', 45000000, '2025-06-30'),
 /*----------Club Brugge-----------------*/
 ('Simon Mignolet', 'Club Brugge', 'GK', '1988-03-06', 'Belgium', 'Right', 9000000, '2025-06-30'),
 ('Odilon Kossounou', 'Club Brugge', 'CB', '2001-01-04', 'Ivory Coast', 'Right', 12000000, '2024-06-30'),
 ('Federico Ricca', 'Club Brugge', 'LB', '1994-12-01', 'Uruguay', 'Left', 3000000, '2023-06-30'),
 ('De Ketelaere', 'Club Brugge', 'CM', '2001-03-10', 'Belgium', 'Left', 16000000, '2023-06-30'),
 ('Noa Lang', 'Club Brugge', 'LW', '1999-06-17', 'Netherlands', 'Right', 20000000, '2021-06-30'),
 /*----------Zenit-----------------*/
 ('Andrey Lunev', 'Zenit', 'GK', '1991-11-13', 'Russia', 'Right', 5000000, '2021-06-30'),
 ('Dejan Lovren', 'Zenit', 'CB', '1989-07-05', 'Croatia', 'Right', 11000000, '2023-06-30'),
 ('Wilmar Barrios', 'Zenit', 'DM', '1993-10-16', 'Colombia', 'Right', 15000000, '2023-06-30'),
 ('Wendel', 'Zenit', 'CM', '1997-06-28', 'Brazil', 'Right', 14000000, '2025-06-30'),
 ('Malcolm', 'Zenit', 'RW', '1997-02-26', 'Brazil', 'Left', 24000000, '2024-06-30'),
 /*----------Juventus-----------------*/
 ('Gianluigi Buffon', 'Juventus', 'GK', '1978-01-28', 'Italy', 'Right', 1000000, '2021-06-30'),
 ('Juan Cuadrado', 'Juventus', 'RB', '1988-05-26', 'Colombia', 'Right', 18000000, '2022-06-30'),
 ('Arthur', 'Juventus', 'CM', '1991-08-12', 'Brazil', 'Right', 50000000, '2025-06-30'),
 ('Cristiano Ronaldo', 'Juventus', 'LW', '1985-02-05', 'Portugal', 'Both', 60000000, '2022-06-30'),
 ('Paulo Dybala', 'Juventus', 'ST', '1993-11-15', 'Argentina', 'Left', 70000000, '2022-06-30'),
 /*----------F.C. Barcelona-----------------*/
 ('Marc ter Stegen', 'F.C.Barcelona', 'GK', '1992-04-30', 'Germany', 'Right', 75000000, '2025-06-30'),
 ('Gerard Piqué', 'F.C.Barcelona', 'CB', '1987-02-02', 'Spain', 'Right', 12000000, '2024-06-30'),
 ('Jordi Alba', 'F.C.Barcelona', 'LB', '1989-03-21', 'Spain', 'Left', 25000000, '2024-06-30'),
 ('Lionel Messi', 'F.C.Barcelona', 'LW', '1987-06-24', 'Argentina', 'Left', 80000000, '2021-06-30'),
 ('Antoine Griezmann', 'F.C.Barcelona', 'ST', '1991-03-21', 'France', 'Left', 60000000, '2024-06-30'),
 /*----------Dynamo Kyiv-----------------*/
 ('Georgiy Bushchan', 'Dynamo Kyiv', 'GK', '1994-05-31', 'Ukraine', 'Right', 4000000, '2023-06-30'),
 ('Vitaliy Mykolenko', 'Dynamo Kyiv', 'CB', '1999-05-29', 'Ukraine', 'Left', 15000000, '2025-06-30'),
 ('Mykola Shaparenko', 'Dynamo Kyiv', 'CM', '1998-10-04', 'Ukraine', 'Right', 5000000, '2025-06-30'),
 ('Gerson Rodrigues', 'Dynamo Kyiv', 'LW', '1995-06-20', 'Luxembourg', 'Right', 2000000, '2024-06-30'),
 ('Viktor Tsygankov', 'Dynamo Kyiv', 'RW', '1997-11-15', 'Ukraine', 'Left', 24000000, '2023-06-30'),
 /*----------Ferencvaros-----------------*/
 ('Dénes Dibusz', 'Ferencvaros', 'GK', '1990-11-16', 'Hungary', 'Right', 2200000, '2023-06-30'),
 ('Samy Mmaee', 'Ferencvaros', 'CB', '1996-09-08', 'Morocco', 'Right', 850000, '2024-06-30'),
 ('Henry Wingo', 'Ferencvaros', 'RB', '1995-10-04', 'USA', 'Right', 400000, '2023-06-30'),
 ('Giorgi Kharaishvili', 'Ferencvaros', 'CM', '1996-07-29', 'Georgia', 'Right', 600000, '2023-06-30'),
 ('Tokmac Chol Nguen', 'Ferencvaros', 'LW', '1993-10-20', 'Norway', 'Right', 2800000, '2022-06-30'),
 /*----------Paris S.G.-----------------*/
 ('Keylor Navas', 'Paris S.G.','GK', '1986-12-15', 'Costa Rica', 'Right', 10000000, '2023-06-30'),
 ('Marquinhos', 'Paris S.G.','CB', '1994-05-14', 'Brazil', 'Right', 70000000, '2024-06-30'),
 ('Marco Verratti', 'Paris S.G.','CM', '1992-11-05', 'Italy', 'Right', 60000000, '2024-06-30'),
 ('Neymar', 'Paris S.G.','LW', '1992-02-05', 'Brazil', 'Right', 128000000, '2022-06-30'),
 ('Kylian Mbappé', 'Paris S.G.','ST', '1998-12-20', 'France', 'Right', 180000000, '2022-06-30'),
 /*----------Manchester United-----------------*/
 ('David de Gea', 'Manchester United', 'GK', '1990-11-07', 'Spain', 'Right', 22000000, '2023-06-30'),
 ('Alex Telles', 'Manchester United', 'LB', '1992-12-15', 'Brazil', 'Left', 28000000, '2024-06-30'),
 ('Paul Pogba', 'Manchester United', 'DM', '1993-03-15', 'France', 'Both', 60000000, '2022-06-30'),
 ('Bruno Fernandes', 'Manchester United', 'CM', '1994-09-08', 'Portugal', 'Right', 90000000, '2025-06-30'),
 ('Marcus Rashford', 'Manchester United', 'LW', '1997-10-31', 'England', 'Right', 85000000, '2023-06-30'),
 /*---------- Basaksehir-----------------*/
 ('Volkan Babacan', 'Basaksehir', 'GK', '1988-08-11', 'Turkey', 'Right', 600000, '2021-06-30'),
 ('Léo Duarte', 'Basaksehir', 'CB', '1996-07-17', 'Brazil', 'Right', 2200000, '2022-06-30'),
 ('Youssouf Ndayishimiye', 'Basaksehir', 'DM', '1998-10-27', 'Burundi', 'Right', 2000000, '2025-06-30'),
 ('Edin Visca', 'Basaksehir', 'RW', '1990-02-17', 'Bosnia Herzergovina', 'Right', 10000000, '2025-06-30'),
 ('Demba Ba', 'Basaksehir', 'ST', '1985-05-25', 'Senegal', 'Right', 700000, '2021-06-30'),
 /*---------- RB Leipzig-----------------*/
 ('Péter Gulácsi', 'RB Leipzig', 'GK', '1990-05-06', 'Hungary', 'Right', 12000000, '2023-06-30'),
 ('Dayot Upamecano', 'RB Leipzig', 'CB', '1988-10-27', 'France', 'Right', 60000000, '2023-06-30'),
 ('Angeliño', 'RB Leipzig', 'LB', '1997-01-04', 'Spain', 'Left', 35000000, '2021-06-30'),
 ('Dani Olmo', 'RB Leipzig', 'CM', '1998-05-07', 'Spain', 'Right', 38000000, '2024-06-30'),
 ('Yussuf Poulsen', 'RB Leipzig', 'ST', '1994-06-15', 'Denmark', 'Right', 25000000, '2024-06-30');
 
   /*----------Games ADD-----------------*/  
INSERT INTO GAME(HomeTeam, AwayTeam, RefereeId, Stadium, ScoreLine)
VALUES
/*----------Jogos Grupo A-----------------*/
('RB Salzburg', 'Lokomotiv Moscow', '20', 'Arena Salzburg', '2-2'),
('Bayern Munchen', 'Atletico Madrid', '17', 'Allianz Arena', '4-0'), 
('Lokomotiv Moscow', 'Bayern Munchen', '21', 'RZD Arena', '1-2'), 
('Atletico Madrid', 'RB Salzburg', '22', 'Wanda Metropolitano', '3-2'),
('Lokomotiv Moscow', 'Atletico Madrid', '14', 'RZD Arena', '1-1'), /*Acho que se enganou e adicionou o RJD e nao RZD*/
('RB Salzburg', 'Bayern Munchen', '24', 'Arena Salzburg', '2-6'),
('Bayern Munchen', 'RB Salzburg', '25', 'Allianz Arena', '3-1'),
('Atletico Madrid', 'Lokomotiv Moscow', '33', 'Wanda Metropolitano', '0-0'), 
('Lokomotiv Moscow', 'RB Salzburg', '6', 'RZD Arena', '1-3'), 
('Atletico Madrid', 'Bayern Munchen', '15', 'Wanda Metropolitano', '1-1'), 
('Bayern Munchen', 'Lokomotiv Moscow', '23', 'Allianz Arena', '2-0'), 
('RB Salzburg', 'Atletico Madrid', '4', 'Arena Salzburg', '0-2'),
/*----------Jogos Grupo B-----------------*/
('Real Madrid', 'Shaktar Donetsk', '37', 'Santiago Bernabéu', '2-3'), 
('Internazionale', 'Borussia Monchengladbach', '2', 'Giuseppe Meazza', '2-2'), 
('Shaktar Donetsk', 'Internazionale', '38', 'Donbass Arena', '0-0'), 
('Borussia Monchengladbach', 'Real Madrid', '25', 'Borussia-Park', '2-2'), 
('Shaktar Donetsk', 'Borussia Monchengladbach', '20', 'Donbass Arena', '0-6'), 
('Real Madrid', 'Internazionale', '15', 'Santiago Bernabéu', '3-2'), 
('Borussia Monchengladbach', 'Shaktar Donetsk', '3', 'Borussia-Park', '4-0'), 
('Internazionale', 'Real Madrid', '4', 'Giuseppe Meazza', '0-2'), 
('Shaktar Donetsk', 'Real Madrid', '22', 'Donbass Arena', '2-0'), 
('Borussia Monchengladbach', 'Internazionale', '24', 'Borussia-Park', '2-3'), 
('Internazionale', 'Shaktar Donetsk', '33', 'Giuseppe Meazza', '0-0'), 
('Real Madrid', 'Borussia Monchengladbach', '2', 'Santiago Bernabéu', '2-0'),
/*----------Jogos Grupo C-----------------*/
('Olympiakos', 'Marseille', '36', 'Karaiskakis Stadium', '1-0'), 
('Manchester City', 'F.C.Porto', '39', 'Etihad Stadium', '3-1'), 
('F.C.Porto', 'Olympiakos', '27', 'Estádio do Dragão', '2-0'), 
('Marseille', 'Manchester City', '31', 'Vélodrome', '0-3'), 
('Manchester City', 'Olympiakos', '35', 'Etihad Stadium', '3-0'), 
('F.C.Porto', 'Marseille', '19', 'Estádio do Dragão', '3-0'), 
('Olympiakos', 'Manchester City', '5', 'Karaiskakis Stadium', '0-1'), 
('Marseille', 'F.C.Porto', '30', 'Vélodrome', '0-2'), 
('Marseille', 'Olympiakos', '32', 'Vélodrome', '2-1'), 
('F.C.Porto', 'Manchester City', '2', 'Estádio do Dragão', '0-0'), 
('Olympiakos', 'F.C.Porto', '1', 'Karaiskakis Stadium', '0-2'), 
('Manchester City', 'Marseille', '40', 'Etihad Stadium', '3-0'),
/*----------Jogos Grupo D-----------------*/
('Ajax', 'Liverpool', '1', 'Johan Cruijff Arena', '0-1'), 
('Midtjylland', 'Atalanta', '11', 'MCH Arena', '0-4'), 
('Atalanta', 'Ajax', '16', 'Atleti Azzurri', '2-2'), 
('Liverpool', 'Midtjylland', '41', 'Anfield Road', '2-0'), 
('Midtjylland', 'Ajax', '42', 'MCH Arena', '1-2'), 
('Atalanta', 'Liverpool', '22', 'Atleti Azzurri', '0-5'), 
('Ajax', 'Midtjylland', '43', 'Johan Cruijff Arena', '3-1'), 
('Liverpool', 'Atalanta', '35', 'Anfield Road', '0-2'), 
('Liverpool', 'Ajax', '31', 'Anfield Road', '1-0'), 
('Atalanta', 'Midtjylland', '44', 'Atleti Azzurri', '1-1'), 
('Ajax', 'Atalanta', '35', 'Johan Cruijff Arena', '0-1'), 
('Midtjylland', 'Liverpool', '45', 'MCH Arena', '1-1'),
/*----------Jogos Grupo E-----------------*/
('Stade Rennes', 'Krasnodar', 7, 'Roazhon Park', '1:1'),
('Chelsea', 'Sevilla', 7, 'Stamford Bridge', '0:0'), 
('Krasnodar', 'Chelsea', 6, 'Krasnodar Stadium', '0:4'), 
('Sevilla', 'Stade Rennes', 3, 'Ramón Sánchez Pizjuán', '1:0'), 
('Chelsea', 'Stade Rennes', 8, 'Stamford Bridge', '3:0'), 
('Sevilla', 'Krasnodar', 1, 'Ramón Sánchez Pizjuán', '3:2'), 
('Krasnodar', 'Sevilla', 9, 'Krasnodar Stadium', '1:2'), 
('Stade Rennes', 'Chelsea', 2, 'Roazhon Park', '1:2'),
('Krasnodar', 'Stade Rennes', 10,'Krasnodar Stadium', '1:0'), 
('Sevilla', 'Chelsea', 11, 'Ramón Sánchez Pizjuán', '0:4'), 
('Chelsea', 'Krasnodar', 12,'Stamford Bridge', '1:1'), 
('Stade Rennes', 'Sevilla', 13, 'Roazhon Park', '1:3'),
/*----------Jogos Grupo F-----------------*/
('Zenit', 'Club Brugge', 14, 'Krestovsky', '1:2'), 
('Lazio', 'Borussia Dortmund', 15, 'Stadio Olimpico', '3:1'), 
('Borussia Dortmund', 'Zenit', 2,'Signal Iduna Park', '2:0'), 
('Club Brugge', 'Lazio', 4, 'Jan Breydel', '1:1'),
('Zenit', 'Lazio', 11, 'Krestovsky', '1:1'),
('Club Brugge', 'Borussia Dortmund', 16,'Jan Breydel', '0:3'), 
('Lazio', 'Zenit', 17, 'Stadio Olimpico', '3:1'), 
('Borussia Dortmund', 'Club Brugge', 18, 'Signal Iduna Park', '3:0'),
('Borussia Dortmund', 'Lazio', 19, 'Signal Iduna Park', '1:1'),
('Club Brugge', 'Zenit', 20, 'Jan Breydel', '3:0'), 
('Lazio', 'Club Brugge', 3, 'Stadio Olimpico', '2:2'),
('Zenit', 'Borussia Dortmund', 21, 'Krestovsky', '1:2'),
/*----------Jogos Grupo G-----------------*/
('Dynamo Kyiv', 'Juventus', 22, 'Kyiv Olympic', '0:2'), 
('F.C.Barcelona', 'Ferencvaros', 23, 'Camp Nou', '5:1'), 
('Juventus', 'F.C.Barcelona', 24, 'Juventus Stadium', '0:2'), 
('Ferencvaros', 'Dynamo Kyiv', 18, 'Groupama Arena', '2:2'),
('F.C.Barcelona', 'Dynamo Kyiv', 17, 'Camp Nou', '2:1'),
('Ferencvaros', 'Juventus', 25, 'Groupama Arena', '1:4'), 
('Dynamo Kyiv', 'F.C.Barcelona', 26, 'Kyiv Olympic', '0:4'), 
('Juventus', 'Ferencvaros', 27, 'Juventus Stadium', '2:1'),
('Juventus', 'Dynamo Kyiv', 28, 'Juventus Stadium', '3:0'), 
('Ferencvaros', 'F.C.Barcelona', 29, 'Groupama Arena', '0:3'),
('Dynamo Kyiv', 'Ferencvaros', 30, 'Kyiv Olympic', '1:0'),
('F.C.Barcelona', 'Juventus', 31, 'Camp Nou', '0:3'),
/*----------Jogos Grupo H-----------------*/
('RB Leipzig', 'Basaksehir', 32, 'Fatih Terim Stadium', '2:0'), 
('Paris S.G.', 'Manchester United', 19, 'Parc des Princes', '1:2'),
('Basaksehir', 'Paris S.G.', 30, 'Fatih Terim Stadium', '0:2'),
('Manchester United', 'RB Leipzig', 33,'Old Trafford', '5:0'), 
('RB Leipzig', 'Paris S.G.', 34, 'Red Bull Arena', '2:1'), 
('Basaksehir', 'Manchester United', 5, 'Fatih Terim Stadium', '2:1'),
('Paris S.G.', 'RB Leipzig', 24, 'Parc des Princes', '1:0'),
('Manchester United', 'Basaksehir', 22, 'Old Trafford', '4:1'),
('Basaksehir', 'RB Leipzig', 35, 'Fatih Terim Stadium', '3:4'), 
('Manchester United', 'Paris S.G.', 36, 'Old Trafford', '1:3'), 
('RB Leipzig', 'Manchester United', 19, 'Red Bull Arena', '3:2'),
('Paris S.G.', 'Basaksehir', 24, 'Parc des Princes', '5:1');

INSERT INTO NATIONALITY(PlayerId, Country)
VALUES
(1, 'Germany'),
(2, 'Poland'),
(3, 'Germany'),
(3, 'France'),
(4, 'France'),
(4, 'Togo'),  
(5, 'Germany'),
(6, 'Slovenia'),
(7, 'Brazil'),
(8, 'Mexico'),
(8, 'Portugal'),
(9, 'Portugal'),
(10, 'Spain'),
(11, 'Austria'),
(12, 'Brazil'),
(12, 'Italy'),
(13, 'Bosnia Herzergovina'),
(14, 'Germany'),
(15, 'Germany'),
(15, 'Nigeria'),
(16, 'Russia'),
(17, 'Poland'),
(18, 'Russia'),
(18, 'Brazil'),
(19, 'Brazil'),
(20, 'Cape Verde'),
(20, 'Portugal'),
(21, 'Belgium'),
(22, 'Belgium'),
(23, 'Dominican Republic'),
(23, 'Spain'),
(24, 'Croatia'),
(25, 'Spain'),
(26, 'Switzerland'),
(27, 'Austria'),
(28, 'Paraguay'),
(29, 'USA'),
(30, 'Algeria'),
(31, 'Ukraine'),
(32, 'Georgia'),
(33, 'Ukraine'),
(34, 'Israel'),
(34, 'Portugal'),
(35, 'Brazil'),
(36, 'Slovenia'),
(37, 'Netherlands'), 
(38, 'Belgium'), 
(38, 'Congo'), 
(39, 'Slovakia'), 
(40, 'Italy'), 
(41, 'Belgium'), 
(42, 'England'), 
(42, 'Jamaica'),
(43, 'Portugal'), 
(44, 'Brazil'), 
(45, 'Argentina'), 
(45, 'Spain'), 
(46, 'Portugal'), 
(46, 'Guinea'), 
(47, 'Mexico'), 
(48, 'Mali'), 
(48, 'France'), 
(49, 'Serbia'), 
(50, 'Iran'), 
(51, 'Guinea'), 
(52, 'Greece'), 
(53, 'Portugal'), 
(53, 'Cape Verde'), 
(54, 'Morocco'), 
(54, 'France'), 
(55, 'Tunisia'), 
(55, 'Germany'), 
(56, 'Brazil'), 
(57, 'France'), 
(58, 'Poland'), 
(59, 'Japan'), 
(60, 'France'), 
(60, 'Senegal'),
(61, 'Egypt'),
(62, 'Senegal'),
(63, 'Scotland'),
(64, 'Wales'),
(65, 'Netherlands'),
(65, 'Suriname'), 
(66, 'Colombia'),
(67, 'Germany'),
(67, 'Netherlands'),
(68, 'Italy'),
(69, 'Denmark'),
(70, 'Croatia'),
(71, 'Cameroon'),
(72, 'Argentina'),
(72, 'Italy'),
(73, 'Brazil'),
(74, 'Serbia'),
(75, 'Ivory Coast'),
(75, 'France'),
(76, 'Brazil'),
(77, 'Denmark'),
(78, 'Denmark'),
(79, 'Sweden'),
(79, 'USA'),
(80, 'Australia'),
(80, 'Sudan'),
(81, 'Senegal'),
(81, 'Guinea'),
(82, 'Brazil'),
(82, 'France'),
(83, 'Germany'),
(84, 'Germany'),
(85, 'Scotland'),
(86, 'Morocco'),
(86, 'Canada'), 
(87, 'France'),
(87, 'Benim'), 
(88, 'Spain'),
(89, 'Argentina'),
(90, 'Croatia'),
(90, 'Switzerland'),
(91, 'Russia'),
(92, 'Ecuador'),
(93, 'Armenia'),
(93, 'Russia'),
(94, 'Brazil'),
(94, 'Belgium'),
(95, 'Russia'),
(95, 'Brazil'),
(96, 'Senegal'),
(96, 'Italy'),
(97, 'Mali'),
(98, 'France'),
(98, 'Congo'), 
(99, 'France'),
(99, 'Cameroon'),
(100, 'Belgium'),
(100, 'Ghana'), 
(101, 'Switzerland'),
(102, 'Portugal'),
(102, 'France'),
(103, 'USA'),
(103, 'Portugal'),
(104, 'Germany'),
(104, 'Cameroon'),
(105, 'Norway'),
(106, 'Albania'), 
(106, 'Greece'),
(107, 'Brazil'),
(107, 'Italy'),
(108, 'Serbia'),
(108, 'Spain'),
(109, 'Spain'),
(110, 'Italy'),
(111, 'Belgium'),
(112, 'Ivory Coast'),
(113, 'Uruguay'),
(113, 'Italy'),
(114, 'Belgium'),
(115, 'Netherlands'),
(115, 'Suriname'), 
(116, 'Russia'),
(117, 'Croatia'),
(118, 'Colombia'),
(119, 'Brazil'),
(120, 'Brazil'),
(121, 'Italy'),
(122, 'Colombia'),
(123, 'Brazil'),
(124, 'Portugal'),
(125, 'Argentina'),
(125, 'Italy'),
(126, 'Germany'),
(127, 'Spain'),
(128, 'Spain'),
(129, 'Argentina'),
(129, 'Spain'),
(130, 'France'),
(131, 'Ukraine'),
(132, 'Ukraine'),
(133, 'Ukraine'),
(134, 'Luxembourg'),
(134, 'Portugal'),
(135, 'Ukraine'),
(136, 'Hungary'),
(137, 'Morocco'),
(137, 'Belgium'),
(138, 'USA'),
(139, 'Georgia'),
(140, 'Norway'),
(141, 'Costa Rica'),
(141, 'Spain'),
(142, 'Brazil'),
(142, 'Portugal'),
(143, 'Italy'),
(144, 'Brazil'),
(145, 'France'),
(146, 'Spain'),
(147, 'Brazil'),
(147, 'Italy'),
(148, 'France'),
(149, 'Portugal'),
(150, 'England'),
(151, 'Turkey'),
(152, 'Brazil'),
(153, 'Burundi'),
(154, 'Bosnia Herzergovina'),
(155, 'Senegal'),
(155, 'France'),
(156, 'Hungary'),
(157, 'France'),
(157, 'Guinea'),
(158, 'Spain'),
(159, 'Spain'),
(160, 'Denmark'),
(160, 'Tanzania'); 



select * from game;
select * from group_stage;
select * from player;
select * from referee;
select * from stadium;
select * from team;
select * from nationality;
select * from country;

/*
select Country.name, count(*) as NºJogadores from nationality
left outer join country on (nationality.Country = Country.Name)
group by Country.name
order by NºJogadores desc;

NAO INPRIME OS PAISES COM 0
*/