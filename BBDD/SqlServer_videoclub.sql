USE [master]
GO
/****** Object:  Database [videoclub]    Script Date: 18/12/2019 14:29:53 ******/
CREATE DATABASE [videoclub]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'videoclub', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\videoclub.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'videoclub_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\videoclub_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [videoclub] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [videoclub].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [videoclub] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [videoclub] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [videoclub] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [videoclub] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [videoclub] SET ARITHABORT OFF 
GO
ALTER DATABASE [videoclub] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [videoclub] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [videoclub] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [videoclub] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [videoclub] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [videoclub] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [videoclub] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [videoclub] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [videoclub] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [videoclub] SET  DISABLE_BROKER 
GO
ALTER DATABASE [videoclub] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [videoclub] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [videoclub] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [videoclub] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [videoclub] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [videoclub] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [videoclub] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [videoclub] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [videoclub] SET  MULTI_USER 
GO
ALTER DATABASE [videoclub] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [videoclub] SET DB_CHAINING OFF 
GO
ALTER DATABASE [videoclub] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [videoclub] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [videoclub] SET DELAYED_DURABILITY = DISABLED 
GO
USE [videoclub]
GO
/****** Object:  Table [dbo].[Actores]    Script Date: 18/12/2019 14:29:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Actores](
	[idActores] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Actores] PRIMARY KEY CLUSTERED 
(
	[idActores] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cinta]    Script Date: 18/12/2019 14:29:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cinta](
	[idcinta] [int] NOT NULL,
	[idpelicula] [int] NOT NULL,
 CONSTRAINT [PK_Cinta_1] PRIMARY KEY CLUSTERED 
(
	[idcinta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[devueltas]    Script Date: 18/12/2019 14:29:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[devueltas](
	[idestado] [int] NOT NULL,
	[fdevolucion] [date] NULL,
 CONSTRAINT [PK_devueltas] PRIMARY KEY CLUSTERED 
(
	[idestado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Directores]    Script Date: 18/12/2019 14:29:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Directores](
	[iddirector] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Directores] PRIMARY KEY CLUSTERED 
(
	[iddirector] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Estado]    Script Date: 18/12/2019 14:29:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Estado](
	[idestado] [int] IDENTITY(1,1) NOT NULL,
	[idsocio] [int] NOT NULL,
	[idcinta] [int] NOT NULL,
 CONSTRAINT [PK_Estado] PRIMARY KEY CLUSTERED 
(
	[idestado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[generos]    Script Date: 18/12/2019 14:29:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[generos](
	[idgenero] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK_generos] PRIMARY KEY CLUSTERED 
(
	[idgenero] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[listaespera]    Script Date: 18/12/2019 14:29:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[listaespera](
	[idestado] [int] NOT NULL,
	[secuenciaespera] [int] NOT NULL,
	[fespera] [date] NOT NULL,
 CONSTRAINT [PK_listaespera] PRIMARY KEY CLUSTERED 
(
	[idestado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[peliculaactor]    Script Date: 18/12/2019 14:29:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[peliculaactor](
	[idpelicula] [int] NOT NULL,
	[idactor] [int] NOT NULL,
 CONSTRAINT [PK_peliculaactor] PRIMARY KEY CLUSTERED 
(
	[idpelicula] ASC,
	[idactor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[peliculadirectores]    Script Date: 18/12/2019 14:29:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[peliculadirectores](
	[idpelicula] [int] NOT NULL,
	[iddirector] [int] NOT NULL,
 CONSTRAINT [PK_peliculadirectores] PRIMARY KEY CLUSTERED 
(
	[idpelicula] ASC,
	[iddirector] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[peliculas]    Script Date: 18/12/2019 14:29:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[peliculas](
	[idpelicula] [int] IDENTITY(1,1) NOT NULL,
	[Titulo] [varchar](70) NOT NULL,
 CONSTRAINT [PK_peliculas] PRIMARY KEY CLUSTERED 
(
	[idpelicula] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[peliculasgenero]    Script Date: 18/12/2019 14:29:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[peliculasgenero](
	[idpelicula] [int] NOT NULL,
	[idgenero] [int] NOT NULL,
 CONSTRAINT [PK_peliculasgenero] PRIMARY KEY CLUSTERED 
(
	[idpelicula] ASC,
	[idgenero] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[prestamos]    Script Date: 18/12/2019 14:29:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[prestamos](
	[idestado] [int] NOT NULL,
	[fprestamo] [date] NULL,
 CONSTRAINT [PK_prestamos] PRIMARY KEY CLUSTERED 
(
	[idestado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[prestamosfechas]    Script Date: 18/12/2019 14:29:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[prestamosfechas](
	[idestado] [int] IDENTITY(1,1) NOT NULL,
	[fprestamo] [date] NULL,
 CONSTRAINT [PK_prestamosfechas] PRIMARY KEY CLUSTERED 
(
	[idestado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[socioactor]    Script Date: 18/12/2019 14:29:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[socioactor](
	[idsocio] [int] NOT NULL,
	[idactor] [int] NOT NULL,
 CONSTRAINT [PK_socioactor] PRIMARY KEY CLUSTERED 
(
	[idsocio] ASC,
	[idactor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sociodirector]    Script Date: 18/12/2019 14:29:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sociodirector](
	[idsocio] [int] NOT NULL,
	[iddirector] [int] NOT NULL,
 CONSTRAINT [PK_sociodirector] PRIMARY KEY CLUSTERED 
(
	[idsocio] ASC,
	[iddirector] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sociogeneros]    Script Date: 18/12/2019 14:29:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sociogeneros](
	[idsocio] [int] NOT NULL,
	[idgenero] [int] NOT NULL,
 CONSTRAINT [PK_sociogeneros] PRIMARY KEY CLUSTERED 
(
	[idsocio] ASC,
	[idgenero] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[socios]    Script Date: 18/12/2019 14:29:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[socios](
	[idSocio] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[telefono] [varchar](9) NOT NULL,
 CONSTRAINT [PK_socios] PRIMARY KEY CLUSTERED 
(
	[idSocio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[listaespera] ADD  CONSTRAINT [DF_listaespera_secuenciaespera]  DEFAULT ((1)) FOR [secuenciaespera]
GO
ALTER TABLE [dbo].[listaespera] ADD  CONSTRAINT [DF_listaespera_fespera]  DEFAULT (CONVERT([date],getdate())) FOR [fespera]
GO
ALTER TABLE [dbo].[Cinta]  WITH CHECK ADD  CONSTRAINT [FK_Cinta_peliculas] FOREIGN KEY([idpelicula])
REFERENCES [dbo].[peliculas] ([idpelicula])
GO
ALTER TABLE [dbo].[Cinta] CHECK CONSTRAINT [FK_Cinta_peliculas]
GO
ALTER TABLE [dbo].[devueltas]  WITH CHECK ADD  CONSTRAINT [FK_devueltas_Estado] FOREIGN KEY([idestado])
REFERENCES [dbo].[Estado] ([idestado])
GO
ALTER TABLE [dbo].[devueltas] CHECK CONSTRAINT [FK_devueltas_Estado]
GO
ALTER TABLE [dbo].[Estado]  WITH CHECK ADD  CONSTRAINT [FK_Estado_Cinta] FOREIGN KEY([idcinta])
REFERENCES [dbo].[Cinta] ([idcinta])
GO
ALTER TABLE [dbo].[Estado] CHECK CONSTRAINT [FK_Estado_Cinta]
GO
ALTER TABLE [dbo].[Estado]  WITH CHECK ADD  CONSTRAINT [FK_Estado_socios] FOREIGN KEY([idsocio])
REFERENCES [dbo].[socios] ([idSocio])
GO
ALTER TABLE [dbo].[Estado] CHECK CONSTRAINT [FK_Estado_socios]
GO
ALTER TABLE [dbo].[listaespera]  WITH CHECK ADD  CONSTRAINT [FK_listaespera_Estado] FOREIGN KEY([idestado])
REFERENCES [dbo].[Estado] ([idestado])
GO
ALTER TABLE [dbo].[listaespera] CHECK CONSTRAINT [FK_listaespera_Estado]
GO
ALTER TABLE [dbo].[peliculaactor]  WITH CHECK ADD  CONSTRAINT [FK_peliculaactor_Actores] FOREIGN KEY([idactor])
REFERENCES [dbo].[Actores] ([idActores])
GO
ALTER TABLE [dbo].[peliculaactor] CHECK CONSTRAINT [FK_peliculaactor_Actores]
GO
ALTER TABLE [dbo].[peliculaactor]  WITH CHECK ADD  CONSTRAINT [FK_peliculaactor_peliculas] FOREIGN KEY([idpelicula])
REFERENCES [dbo].[peliculas] ([idpelicula])
GO
ALTER TABLE [dbo].[peliculaactor] CHECK CONSTRAINT [FK_peliculaactor_peliculas]
GO
ALTER TABLE [dbo].[peliculadirectores]  WITH CHECK ADD  CONSTRAINT [FK_peliculadirectores_Directores] FOREIGN KEY([iddirector])
REFERENCES [dbo].[Directores] ([iddirector])
GO
ALTER TABLE [dbo].[peliculadirectores] CHECK CONSTRAINT [FK_peliculadirectores_Directores]
GO
ALTER TABLE [dbo].[peliculadirectores]  WITH CHECK ADD  CONSTRAINT [FK_peliculadirectores_peliculas] FOREIGN KEY([idpelicula])
REFERENCES [dbo].[peliculas] ([idpelicula])
GO
ALTER TABLE [dbo].[peliculadirectores] CHECK CONSTRAINT [FK_peliculadirectores_peliculas]
GO
ALTER TABLE [dbo].[peliculasgenero]  WITH CHECK ADD  CONSTRAINT [FK_peliculasgenero_generos] FOREIGN KEY([idgenero])
REFERENCES [dbo].[generos] ([idgenero])
GO
ALTER TABLE [dbo].[peliculasgenero] CHECK CONSTRAINT [FK_peliculasgenero_generos]
GO
ALTER TABLE [dbo].[peliculasgenero]  WITH CHECK ADD  CONSTRAINT [FK_peliculasgenero_peliculas] FOREIGN KEY([idpelicula])
REFERENCES [dbo].[peliculas] ([idpelicula])
GO
ALTER TABLE [dbo].[peliculasgenero] CHECK CONSTRAINT [FK_peliculasgenero_peliculas]
GO
ALTER TABLE [dbo].[prestamos]  WITH CHECK ADD  CONSTRAINT [FK_prestamos_Estado] FOREIGN KEY([idestado])
REFERENCES [dbo].[Estado] ([idestado])
GO
ALTER TABLE [dbo].[prestamos] CHECK CONSTRAINT [FK_prestamos_Estado]
GO
ALTER TABLE [dbo].[socioactor]  WITH CHECK ADD  CONSTRAINT [FK_socioactor_Actores] FOREIGN KEY([idactor])
REFERENCES [dbo].[Actores] ([idActores])
GO
ALTER TABLE [dbo].[socioactor] CHECK CONSTRAINT [FK_socioactor_Actores]
GO
ALTER TABLE [dbo].[socioactor]  WITH CHECK ADD  CONSTRAINT [FK_socioactor_socios] FOREIGN KEY([idsocio])
REFERENCES [dbo].[socios] ([idSocio])
GO
ALTER TABLE [dbo].[socioactor] CHECK CONSTRAINT [FK_socioactor_socios]
GO
ALTER TABLE [dbo].[sociodirector]  WITH CHECK ADD  CONSTRAINT [FK_sociodirector_Directores] FOREIGN KEY([iddirector])
REFERENCES [dbo].[Directores] ([iddirector])
GO
ALTER TABLE [dbo].[sociodirector] CHECK CONSTRAINT [FK_sociodirector_Directores]
GO
ALTER TABLE [dbo].[sociodirector]  WITH CHECK ADD  CONSTRAINT [FK_sociodirector_socios] FOREIGN KEY([idsocio])
REFERENCES [dbo].[socios] ([idSocio])
GO
ALTER TABLE [dbo].[sociodirector] CHECK CONSTRAINT [FK_sociodirector_socios]
GO
ALTER TABLE [dbo].[sociogeneros]  WITH CHECK ADD  CONSTRAINT [FK_sociogeneros_generos] FOREIGN KEY([idgenero])
REFERENCES [dbo].[generos] ([idgenero])
GO
ALTER TABLE [dbo].[sociogeneros] CHECK CONSTRAINT [FK_sociogeneros_generos]
GO
ALTER TABLE [dbo].[sociogeneros]  WITH CHECK ADD  CONSTRAINT [FK_sociogeneros_socios] FOREIGN KEY([idsocio])
REFERENCES [dbo].[socios] ([idSocio])
GO
ALTER TABLE [dbo].[sociogeneros] CHECK CONSTRAINT [FK_sociogeneros_socios]
GO
ALTER TABLE [dbo].[Actores]  WITH CHECK ADD  CONSTRAINT [CK_Actores] CHECK  ((len([nombre])>(5)))
GO
ALTER TABLE [dbo].[Actores] CHECK CONSTRAINT [CK_Actores]
GO
ALTER TABLE [dbo].[listaespera]  WITH CHECK ADD  CONSTRAINT [CK_listaespera] CHECK  (([secuenciaespera]>(0)))
GO
ALTER TABLE [dbo].[listaespera] CHECK CONSTRAINT [CK_listaespera]
GO
ALTER TABLE [dbo].[listaespera]  WITH CHECK ADD  CONSTRAINT [CK_listaespera_1] CHECK  ((datepart(year,[fespera])>=(2019)))
GO
ALTER TABLE [dbo].[listaespera] CHECK CONSTRAINT [CK_listaespera_1]
GO
ALTER TABLE [dbo].[prestamosfechas]  WITH CHECK ADD  CONSTRAINT [fprestamofechasAnioActual] CHECK  ((datepart(year,[fprestamo])=datepart(year,CONVERT([date],getdate()))))
GO
ALTER TABLE [dbo].[prestamosfechas] CHECK CONSTRAINT [fprestamofechasAnioActual]
GO
ALTER TABLE [dbo].[prestamosfechas]  WITH CHECK ADD  CONSTRAINT [fprestamofechasMenorHoy] CHECK  ((CONVERT([date],[fprestamo])<=CONVERT([date],getdate())))
GO
ALTER TABLE [dbo].[prestamosfechas] CHECK CONSTRAINT [fprestamofechasMenorHoy]
GO
USE [master]
GO
ALTER DATABASE [videoclub] SET  READ_WRITE 
GO
