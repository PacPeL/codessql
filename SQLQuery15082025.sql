CREATE TABLE Alunos(
	IdAluno INT PRIMARY KEY IDENTITY(1,1),
	Nome VARCHAR(100),
	DataNascimento DATE
)

CREATE TABLE Notas(
	IdNota INT PRIMARY KEY IDENTITY(1,1),
	IdAluno INT,
	Disciplina VARCHAR(100),
	Nota DECIMAL(2,1)
)

INSERT INTO Alunos(Nome, DataNascimento) VALUES
('Abraham', '2006-06-02'),
('Samuel', '2006-07-20'),
('Test', '2025-08-15');

INSERT INTO Notas(IdAluno, Disciplina, Nota) VALUES
(1, 'Matematica', 9.5),
(1, 'Geografia', 8.5),
(1, 'Fisica', 8),
(2, 'Matematica', 7.5),
(2, 'Geografia', 9),
(2, 'Fisica', 6);

SELECT * FROM Alunos
SELECT * FROM Notas

SELECT * FROM Alunos A
INNER JOIN Notas N ON A.IdAluno = N.IdAluno
ORDER BY Nota DESC


SELECT a.Nome, AVG(n.Nota) AS Media
FROM Alunos a
INNER JOIN Notas n ON a.IdAluno = n.IdAluno
GROUP BY a.Nome
HAVING AVG(n.Nota) > 7.5


SELECT Disciplina, AVG(Nota) AS Media
FROM Notas
GROUP BY Disciplina


SELECT *
FROM Alunos A
INNER JOIN Notas N ON A.IdAluno = N.IdAluno
GROUP BY A.Nome

SELECT A.Nome, AVG(N.Nota) AS Media
FROM Alunos A
INNER JOIN Notas N ON A.IdAluno = N.IdAluno
GROUP BY A.Nome
HAVING AVG(N.Nota) > 7


SELECT * FROM Alunos a
LEFT JOIN Notas n ON a.IdAluno = n.IdAluno
WHERE n.Disciplina IS NULL


SELECT * FROM Alunos a
LEFT JOIN Notas n ON a.IdAluno = n.IdAluno
WHERE n.IdNota IS NULL

---------------------------------------------------------------------------------------

CREATE TABLE Filmes2(
	IdFilme INT PRIMARY KEY IDENTITY(1,1),
	Titulo VARCHAR(100),
	Genero VARCHAR(100),
	Ano DATE
)


CREATE TABLE Sessoes(
	IdSessao INT PRIMARY KEY IDENTITY(1,1),
	IdFilme INT,
	Dia DATE,
	Hora TIME
	FOREIGN KEY (IdFilme) REFERENCES Filmes2(IdFilme)
)

INSERT INTO Filmes2(Titulo, Genero, Ano) VALUES
('Spider-Man', 'Ficcion', '2002-06-02'),
('Spider-Man 2', 'Accion', '2004-04-19'),
('Spider-Man 3', 'Terror', '2007-07-07'),
('The Amazing Spider-Man', 'Accion', '2014-12-24');

INSERT INTO Sessoes(IdFilme, Dia, Hora) VALUES
(1 , '2025-08-01', '21:00:00'),
(2 , '2025-08-01', '20:00:00'),
(1 , '2025-08-02', '21:00:00'),
(3 , '2025-08-03', '20:00:00'),
(4 , '2025-08-06', '22:00:00'),
(4 , '2025-08-01', '19:00:00'),
(1 , '2025-08-07', '20:00:00');


SELECT * FROM Filmes2 F
WHERE Genero = 'Accion'

SELECT * FROM Filmes2 f
INNER JOIN Sessoes s ON f.IdFilme = s.IdFilme
WHERE YEAR(f.Ano) > '2004'

SELECT * FROM Filmes2 f
INNER JOIN Sessoes s ON f.IdFilme = s.IdFilme
WHERE YEAR(Ano) > 2002

SELECT Titulo, COUNT(*) Total FROM Filmes2 f
INNER JOIN Sessoes s ON f.IdFilme = s.IdFilme
GROUP BY Titulo
ORDER BY Total DESC



SELECT Titulo, Dia FROM Filmes2 f
INNER JOIN Sessoes s ON f.IdFilme = s.IdFilme

--------------------------------------------------------------------------------------

CREATE TABLE Pacientes(
	IdPaciente INT PRIMARY KEY IDENTITY(1,1),
	Nome VARCHAR(100),
	DataNascimento DATE
)

CREATE TABLE Consultas(
	IdConsulta INT PRIMARY KEY IDENTITY(1,1),
	IdPaciente INT,
	DataConsulta DATE,
	Medico VARCHAR(100)
	FOREIGN KEY (IdPaciente) REFERENCES Pacientes(IdPaciente)
)

INSERT INTO Pacientes(Nome, DataNascimento) VALUES
('test', '2000-01-01'),
('Abraham', '2006-06-02'),
('Samuel', '2006-07-20'),
('Angello', '2006-08-21'),
('Mario', '1983-10-10');

INSERT INTO Consultas(IdPaciente, DataConsulta, Medico) VALUES
(1, '2025-07-01', 'Migdalia'),
(1, '2025-08-01', 'Migdalia'),
(2, '2025-08-01', 'Miranda'),
(2, '2025-08-01', 'Migdalia'),
(3, '2025-08-01', 'Migdalia'),
(2, '2025-08-01', 'Aaron'),
(4, '2025-08-01', 'Aaron'),
(4, '2025-08-01', 'Migdalia');

SELECT * FROM Consultas

SELECT * FROM Pacientes p
INNER JOIN Consultas c ON p.IdPaciente = c.IdPaciente
WHERE c.Medico = 'Migdalia'


SELECT c.Medico, COUNT(p.IdPaciente) AS Total FROM Pacientes p
INNER JOIN Consultas c ON p.IdPaciente = c.IdPaciente
GROUP BY c.Medico
ORDER BY Total DESC

SELECT c.DataConsulta, COUNT(c.DataConsulta) AS Total FROM Consultas c
GROUP BY c.DataConsulta
ORDER BY Total DESC

SELECT * FROM Pacientes p
LEFT JOIN Consultas c ON p.IdPaciente = c.IdPaciente
WHERE IdConsulta IS NULL


SELECT TOP 1 Nome, MIN(DataNascimento) AS Velho
FROM Pacientes p
INNER JOIN Consultas c ON p.IdPaciente = c.IdPaciente
GROUP BY Nome
ORDER BY Velho



---------------------------------------------------------------------


CREATE TABLE Albuns(
	IdAlbum INT PRIMARY KEY IDENTITY(1,1),
	Nome VARCHAR(100),
	Artista VARCHAR(100),
	AnoLancamento DATE
)

CREATE TABLE Musicas(
	IdMusica INT PRIMARY KEY IDENTITY(1,1),
	IdAlbum INT,
	Titulo VARCHAR(100),
	DuracaoSegundos INT
	FOREIGN KEY (IdAlbum) REFERENCES Albuns(IdAlbum)
)

-- Albuns
INSERT INTO Albuns (Nome, Artista, AnoLancamento) VALUES
('Eternal Hits', 'The Legends', '2020-05-10'),
('Summer Vibes', 'DJ Sunny', '2021-07-22'),
('Rock Classics', 'The Rockers', '2019-09-15');

-- Musicas
INSERT INTO Musicas (IdAlbum, Titulo, DuracaoSegundos) VALUES
(1, 'Sunrise', 210),
(1, 'Moonlight', 185),
(1, 'Starlight', 240),
(2, 'Beach Party', 200),
(2, 'Sunny Day', 195),
(3, 'Guitar Hero', 230),
(3, 'Drum Roll', 220),
(3, 'Rock Anthem', 250);


SELECT * FROM Albuns
SELECT * FROM Musicas


SELECT * FROM Albuns a
INNER JOIN Musicas m ON a.IdAlbum = m.IdAlbum
WHERE a.IdAlbum = 1

SELECT Nome, COUNT(a.IdAlbum) AS Total FROM Albuns a
INNER JOIN Musicas m ON a.IdAlbum = m.IdAlbum
GROUP BY Nome
ORDER BY Total DESC


SELECT Nome, SUM(DuracaoSegundos) AS TempoTotal FROM Albuns a
INNER JOIN Musicas m ON a.IdAlbum = m.IdAlbum
GROUP BY Nome
ORDER BY TempoTotal DESC

SELECT * FROM Albuns a
INNER JOIN Musicas m ON a.IdAlbum = m.IdAlbum
WHERE m.DuracaoSegundos > 200


CREATE TABLE Motoristas(
	IdMotorista INT PRIMARY KEY IDENTITY(1,1),
	Nome VARCHAR(100),
	CHN INT
)

CREATE TABLE Viagems(
	IdViagem INT PRIMARY KEY IDENTITY(1,1),
	IdMotorista INT,
	Origem VARCHAR(100),
	Destino VARCHAR(100),
	Dia DATE,
	DistanciaKm DECIMAL(9,2),
	FOREIGN KEY (IdMotorista) REFERENCES Motoristas(IdMotorista)
)

DROP TABLE Viagens

-- Motoristas
INSERT INTO Motoristas (Nome, CHN) VALUES
('test', 123456789),
('Carlos Silva', 123456789),
('Maria Oliveira', 987654321),
('João Pereira', 456123789),
('Ana Souza', 321654987),
('Rafael Costa', 159753486);

-- Viagens
INSERT INTO Viagems (IdMotorista, Origem, Destino, Dia, DistanciaKm) VALUES
(1, 'São Paulo', 'Rio de Janeiro', '2025-08-10', 430.50),
(1, 'São Paulo', 'Belo Horizonte', '2025-08-12', 586.20),
(2, 'Curitiba', 'Porto Alegre', '2025-08-11', 710.00),
(2, 'Curitiba', 'Florianópolis', '2025-08-13', 300.75),
(3, 'Brasília', 'Goiânia', '2025-08-10', 200.10),
(3, 'Brasília', 'São Paulo', '2025-08-12', 1010.40),
(4, 'Recife', 'Fortaleza', '2025-08-14', 820.30),
(5, 'Salvador', 'Maceió', '2025-08-15', 650.25),
(5, 'Salvador', 'Recife', '2025-08-16', 800.60);


SELECT * FROM Motoristas m
INNER JOIN Viagems v ON m.IdMotorista = v.IdMotorista
WHERE m.IdMotorista = 1

SELECT Nome, SUM(DistanciaKm) AS TotalDistancia FROM Motoristas m
INNER JOIN Viagems v ON m.IdMotorista = v.IdMotorista
GROUP BY Nome
ORDER BY TotalDistancia DESC

SELECT * FROM Motoristas m
INNER JOIN Viagems v ON m.IdMotorista = v.IdMotorista
WHERE v.DistanciaKm > 800.00

SELECT * FROM Motoristas m
LEFT JOIN Viagems v ON m.IdMotorista = v.IdMotorista
WHERE v.IdViagem IS NULL




CREATE TABLE Usuarios(
	IdUsuario INT PRIMARY KEY IDENTITY(1,1),
	Username VARCHAR(100),
	DataNascimento DATE
)

CREATE TABLE Posts(
	IdPost INT PRIMARY KEY IDENTITY(1,1),
	IdUsuario INT,
	Conteudo VARCHAR(100),
	DataPost DATE,
	FOREIGN KEY (IdUsuario) REFERENCES Usuarios(IdUsuario)
)

CREATE TABLE Curtidas(
	IdCurtida INT PRIMARY KEY IDENTITY(1,1),
	IdPost INT,
	IdUsuario INT,
	FOREIGN KEY (IdPost) REFERENCES Posts(IdPost),
	FOREIGN KEY (IdUsuario) REFERENCES Usuarios(IdUsuario)
)

-- Usuarios
INSERT INTO Usuarios (Username, DataNascimento) VALUES
('Carlos Silva', '1990-03-15'),
('Maria Oliveira', '1995-07-22'),
('João Pereira', '1988-11-05'),
('Ana Souza', '2000-01-30'),
('Rafael Costa', '1992-06-12'),
('Luiza Martins', '1998-09-17'),
('Pedro Lima', '1993-12-01');

-- Posts
INSERT INTO Posts (IdUsuario, Conteudo, DataPost) VALUES
(1, 'Mi primer post en la red social!', '2025-08-10'),
(2, 'Disfrutando del verano', '2025-08-11'),
(3, 'Hoy aprendí SQL Server', '2025-08-12'),
(1, 'Compartiendo un artículo interesante', '2025-08-13'),
(4, 'Fotos de mi viaje', '2025-08-14'),
(2, 'Reflexión del día', '2025-08-15');

-- Curtidas
INSERT INTO Curtidas (IdPost, IdUsuario) VALUES
(1, 2),
(1, 3),
(2, 1),
(2, 4),
(3, 1),
(3, 2),
(3, 4),
(4, 2),
(4, 3),
(5, 1),
(5, 3),
(5, 6),
(6, 1),
(6, 3),
(6, 4);




SELECT * FROM Usuarios u
LEFT JOIN Posts p ON u.IdUsuario = p.IdUsuario
WHERE IdPost IS NULL



--SELECT 
--    u.Username,
--    COUNT(p.IdPost) AS TotalPosts
--FROM Usuarios u
--LEFT JOIN Posts p ON u.IdUsuario = p.IdUsuario
--GROUP BY u.Username
--ORDER BY TotalPosts DESC;

