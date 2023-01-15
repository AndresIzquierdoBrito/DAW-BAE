/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [Id]
      ,[Titulo]
      ,[Director]
      ,[Agno]
      ,[FechaCompra]
      ,[precio]
  FROM [MoviesBasicas].[dbo].[Peliculas]