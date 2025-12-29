-- DIO - Trilha .NET - Banco de Dados (Desafio)
-- Consultas solicitadas no README.md
-- Banco: Filmes (SQL Server)

USE [Filmes];
GO

-- 1 - Buscar o nome e ano dos filmes
SELECT
    Nome,
    Ano
FROM dbo.Filmes;
GO

-- 2 - Buscar o nome e ano dos filmes, ordenados por ordem crescente pelo ano
SELECT
    Nome,
    Ano
FROM dbo.Filmes
ORDER BY Ano ASC;
GO

-- 3 - Buscar pelo filme De Volta para o Futuro, trazendo o nome, ano e a duração
SELECT
    Nome,
    Ano,
    Duracao
FROM dbo.Filmes
WHERE Nome = N'De Volta para o Futuro';
GO

-- 4 - Buscar os filmes lançados em 1997
SELECT
    Nome,
    Ano
FROM dbo.Filmes
WHERE Ano = 1997;
GO

-- 5 - Buscar os filmes lançados APÓS o ano 2000
SELECT
    Nome,
    Ano
FROM dbo.Filmes
WHERE Ano > 2000;
GO

-- 6 - Buscar os filmes com a duracao maior que 100 e menor que 150, ordenando pela duracao em ordem crescente
SELECT
    Nome,
    Ano,
    Duracao
FROM dbo.Filmes
WHERE Duracao > 100
  AND Duracao < 150
ORDER BY Duracao ASC;
GO

-- 7 - Buscar a quantidade de filmes lançadas no ano, agrupando por ano
SELECT
    Ano,
    COUNT(1) AS Quantidade
FROM dbo.Filmes
GROUP BY Ano
ORDER BY Quantidade DESC;
GO

-- 8 - Buscar os Atores do gênero masculino, retornando o PrimeiroNome, UltimoNome
SELECT
    PrimeiroNome,
    UltimoNome
FROM dbo.Atores
WHERE Genero = N'M';
GO

-- 9 - Buscar os Atores do gênero feminino, retornando o PrimeiroNome, UltimoNome, e ordenando pelo PrimeiroNome
SELECT
    PrimeiroNome,
    UltimoNome
FROM dbo.Atores
WHERE Genero = N'F'
ORDER BY PrimeiroNome ASC;
GO

-- 10 - Buscar o nome do filme e o gênero
SELECT
    f.Nome,
    g.Genero
FROM dbo.Filmes AS f
INNER JOIN dbo.FilmesGenero AS fg
    ON fg.IdFilme = f.Id
INNER JOIN dbo.Generos AS g
    ON g.Id = fg.IdGenero
ORDER BY f.Nome ASC, g.Genero ASC;
GO

-- 11 - Buscar o nome do filme e o gênero do tipo "Mistério"
SELECT
    f.Nome,
    g.Genero
FROM dbo.Filmes AS f
INNER JOIN dbo.FilmesGenero AS fg
    ON fg.IdFilme = f.Id
INNER JOIN dbo.Generos AS g
    ON g.Id = fg.IdGenero
WHERE g.Genero = N'Mistério'
ORDER BY f.Nome ASC;
GO

-- 12 - Buscar o nome do filme e os atores, trazendo o PrimeiroNome, UltimoNome e seu Papel
SELECT
    f.Nome,
    a.PrimeiroNome,
    a.UltimoNome,
    ef.Papel
FROM dbo.ElencoFilme AS ef
INNER JOIN dbo.Filmes AS f
    ON f.Id = ef.IdFilme
INNER JOIN dbo.Atores AS a
    ON a.Id = ef.IdAtor
ORDER BY f.Nome ASC, a.PrimeiroNome ASC, a.UltimoNome ASC;
GO
