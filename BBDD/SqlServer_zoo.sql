USE [master]
GO
/****** Object:  Database [zoos]    Script Date: 16/12/2019 11:23:47 ******/
CREATE DATABASE [zoos]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'zoo', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\zoo.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'zoo_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\zoo_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [zoos] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [zoos].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [zoos] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [zoos] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [zoos] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [zoos] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [zoos] SET ARITHABORT OFF 
GO
ALTER DATABASE [zoos] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [zoos] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [zoos] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [zoos] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [zoos] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [zoos] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [zoos] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [zoos] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [zoos] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [zoos] SET  DISABLE_BROKER 
GO
ALTER DATABASE [zoos] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [zoos] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [zoos] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [zoos] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [zoos] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [zoos] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [zoos] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [zoos] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [zoos] SET  MULTI_USER 
GO
ALTER DATABASE [zoos] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [zoos] SET DB_CHAINING OFF 
GO
ALTER DATABASE [zoos] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [zoos] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [zoos] SET DELAYED_DURABILITY = DISABLED 
GO
USE [zoos]
GO
/****** Object:  Table [dbo].[Animales]    Script Date: 16/12/2019 11:23:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Animales](
	[idanimal] [int] IDENTITY(1,1) NOT NULL,
	[sexo] [char](1) NOT NULL,
	[fnacimiento] [date] NULL,
	[idpaisorigen] [int] NOT NULL,
	[idespecie] [int] NOT NULL,
	[idzoo] [int] NOT NULL,
 CONSTRAINT [PK_Animales] PRIMARY KEY CLUSTERED 
(
	[idanimal] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ciudades]    Script Date: 16/12/2019 11:23:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ciudades](
	[idciudad] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[idpais] [int] NOT NULL,
 CONSTRAINT [PK_Ciudades] PRIMARY KEY CLUSTERED 
(
	[idciudad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[continentes]    Script Date: 16/12/2019 11:23:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[continentes](
	[IdContinente] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Continentes] PRIMARY KEY CLUSTERED 
(
	[IdContinente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[especie]    Script Date: 16/12/2019 11:23:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[especie](
	[idespecie] [int] IDENTITY(1,1) NOT NULL,
	[nombrevulgar] [varchar](50) NULL,
	[nombrecientifico] [varchar](50) NULL,
	[peligroextincions] [bit] NOT NULL,
	[idfamilia] [int] NOT NULL,
 CONSTRAINT [PK_Especie] PRIMARY KEY CLUSTERED 
(
	[idespecie] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[familias]    Script Date: 16/12/2019 11:23:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[familias](
	[idfamilia] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Familias] PRIMARY KEY CLUSTERED 
(
	[idfamilia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[paises]    Script Date: 16/12/2019 11:23:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[paises](
	[idpais] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[idcontinente] [int] NOT NULL,
 CONSTRAINT [PK_paises] PRIMARY KEY CLUSTERED 
(
	[idpais] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[zoos]    Script Date: 16/12/2019 11:23:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[zoos](
	[idzoo] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[presupuetoanual] [money] NULL,
	[tamano] [decimal](18, 0) NULL,
	[ciudadid] [int] NOT NULL,
 CONSTRAINT [PK_zoos] PRIMARY KEY CLUSTERED 
(
	[idzoo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Animales] ON 

INSERT [dbo].[Animales] ([idanimal], [sexo], [fnacimiento], [idpaisorigen], [idespecie], [idzoo]) VALUES (1, N'M', NULL, 6, 1, 1)
INSERT [dbo].[Animales] ([idanimal], [sexo], [fnacimiento], [idpaisorigen], [idespecie], [idzoo]) VALUES (2, N'H', NULL, 1, 1, 1)
SET IDENTITY_INSERT [dbo].[Animales] OFF
SET IDENTITY_INSERT [dbo].[ciudades] ON 

INSERT [dbo].[ciudades] ([idciudad], [nombre], [idpais]) VALUES (1, N'Madrid', 1)
INSERT [dbo].[ciudades] ([idciudad], [nombre], [idpais]) VALUES (2, N'Barcelona', 1)
INSERT [dbo].[ciudades] ([idciudad], [nombre], [idpais]) VALUES (3, N'Paris', 2)
INSERT [dbo].[ciudades] ([idciudad], [nombre], [idpais]) VALUES (4, N'Londres', 3)
SET IDENTITY_INSERT [dbo].[ciudades] OFF
SET IDENTITY_INSERT [dbo].[continentes] ON 

INSERT [dbo].[continentes] ([IdContinente], [Nombre]) VALUES (1, N'Europa')
INSERT [dbo].[continentes] ([IdContinente], [Nombre]) VALUES (2, N'Asia')
INSERT [dbo].[continentes] ([IdContinente], [Nombre]) VALUES (3, N'Africa')
INSERT [dbo].[continentes] ([IdContinente], [Nombre]) VALUES (4, N'America')
INSERT [dbo].[continentes] ([IdContinente], [Nombre]) VALUES (5, N'Oceanía')
SET IDENTITY_INSERT [dbo].[continentes] OFF
SET IDENTITY_INSERT [dbo].[especie] ON 

INSERT [dbo].[especie] ([idespecie], [nombrevulgar], [nombrecientifico], [peligroextincions], [idfamilia]) VALUES (1, N'Tigre blanco', NULL, 0, 1)
INSERT [dbo].[especie] ([idespecie], [nombrevulgar], [nombrecientifico], [peligroextincions], [idfamilia]) VALUES (2, N'Lince Iberico', NULL, 1, 1)
SET IDENTITY_INSERT [dbo].[especie] OFF
SET IDENTITY_INSERT [dbo].[familias] ON 

INSERT [dbo].[familias] ([idfamilia], [Nombre]) VALUES (1, N'Felinos')
INSERT [dbo].[familias] ([idfamilia], [Nombre]) VALUES (2, N'Mamiferos')
SET IDENTITY_INSERT [dbo].[familias] OFF
SET IDENTITY_INSERT [dbo].[paises] ON 

INSERT [dbo].[paises] ([idpais], [nombre], [idcontinente]) VALUES (1, N'España', 1)
INSERT [dbo].[paises] ([idpais], [nombre], [idcontinente]) VALUES (2, N'Francia', 1)
INSERT [dbo].[paises] ([idpais], [nombre], [idcontinente]) VALUES (3, N'UK', 1)
INSERT [dbo].[paises] ([idpais], [nombre], [idcontinente]) VALUES (6, N'Angola', 3)
SET IDENTITY_INSERT [dbo].[paises] OFF
SET IDENTITY_INSERT [dbo].[zoos] ON 

INSERT [dbo].[zoos] ([idzoo], [nombre], [presupuetoanual], [tamano], [ciudadid]) VALUES (1, N'Madrid', 1000000.0000, CAST(1000 AS Decimal(18, 0)), 1)
INSERT [dbo].[zoos] ([idzoo], [nombre], [presupuetoanual], [tamano], [ciudadid]) VALUES (4, N'Zoo Londres', 150000.0000, CAST(750 AS Decimal(18, 0)), 4)
SET IDENTITY_INSERT [dbo].[zoos] OFF
ALTER TABLE [dbo].[Animales]  WITH CHECK ADD  CONSTRAINT [FK_Animales_especie] FOREIGN KEY([idespecie])
REFERENCES [dbo].[especie] ([idespecie])
GO
ALTER TABLE [dbo].[Animales] CHECK CONSTRAINT [FK_Animales_especie]
GO
ALTER TABLE [dbo].[Animales]  WITH CHECK ADD  CONSTRAINT [FK_Animales_paises] FOREIGN KEY([idpaisorigen])
REFERENCES [dbo].[paises] ([idpais])
GO
ALTER TABLE [dbo].[Animales] CHECK CONSTRAINT [FK_Animales_paises]
GO
ALTER TABLE [dbo].[Animales]  WITH CHECK ADD  CONSTRAINT [FK_Animales_zoos] FOREIGN KEY([idzoo])
REFERENCES [dbo].[zoos] ([idzoo])
GO
ALTER TABLE [dbo].[Animales] CHECK CONSTRAINT [FK_Animales_zoos]
GO
ALTER TABLE [dbo].[ciudades]  WITH CHECK ADD  CONSTRAINT [FK_ciudades_paises] FOREIGN KEY([idpais])
REFERENCES [dbo].[paises] ([idpais])
GO
ALTER TABLE [dbo].[ciudades] CHECK CONSTRAINT [FK_ciudades_paises]
GO
ALTER TABLE [dbo].[especie]  WITH CHECK ADD  CONSTRAINT [FK_especie_familias] FOREIGN KEY([idfamilia])
REFERENCES [dbo].[familias] ([idfamilia])
GO
ALTER TABLE [dbo].[especie] CHECK CONSTRAINT [FK_especie_familias]
GO
ALTER TABLE [dbo].[paises]  WITH CHECK ADD  CONSTRAINT [FK_paises_continentes] FOREIGN KEY([idcontinente])
REFERENCES [dbo].[continentes] ([IdContinente])
GO
ALTER TABLE [dbo].[paises] CHECK CONSTRAINT [FK_paises_continentes]
GO
ALTER TABLE [dbo].[zoos]  WITH CHECK ADD  CONSTRAINT [FK_zoos_ciudades] FOREIGN KEY([ciudadid])
REFERENCES [dbo].[ciudades] ([idciudad])
GO
ALTER TABLE [dbo].[zoos] CHECK CONSTRAINT [FK_zoos_ciudades]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1 - true 0-false' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'especie', @level2type=N'COLUMN',@level2name=N'peligroextincions'
GO
USE [master]
GO
ALTER DATABASE [zoos] SET  READ_WRITE 
GO
