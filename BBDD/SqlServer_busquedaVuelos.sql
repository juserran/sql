USE [master]
GO
/****** Object:  Database [busquedavuelos]    Script Date: 19/12/2019 12:31:16 ******/
CREATE DATABASE [busquedavuelos]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'busquedavuelos', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\busquedavuelos.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'busquedavuelos_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\busquedavuelos_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [busquedavuelos] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [busquedavuelos].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [busquedavuelos] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [busquedavuelos] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [busquedavuelos] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [busquedavuelos] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [busquedavuelos] SET ARITHABORT OFF 
GO
ALTER DATABASE [busquedavuelos] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [busquedavuelos] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [busquedavuelos] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [busquedavuelos] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [busquedavuelos] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [busquedavuelos] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [busquedavuelos] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [busquedavuelos] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [busquedavuelos] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [busquedavuelos] SET  DISABLE_BROKER 
GO
ALTER DATABASE [busquedavuelos] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [busquedavuelos] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [busquedavuelos] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [busquedavuelos] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [busquedavuelos] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [busquedavuelos] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [busquedavuelos] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [busquedavuelos] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [busquedavuelos] SET  MULTI_USER 
GO
ALTER DATABASE [busquedavuelos] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [busquedavuelos] SET DB_CHAINING OFF 
GO
ALTER DATABASE [busquedavuelos] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [busquedavuelos] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [busquedavuelos] SET DELAYED_DURABILITY = DISABLED 
GO
USE [busquedavuelos]
GO
/****** Object:  Table [dbo].[aeropuertos]    Script Date: 19/12/2019 12:31:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aeropuertos](
	[idaeropuerto] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[idciudad] [int] NOT NULL,
 CONSTRAINT [PK_aeropuertos] PRIMARY KEY CLUSTERED 
(
	[idaeropuerto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[aviones]    Script Date: 19/12/2019 12:31:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aviones](
	[idavion] [int] NOT NULL,
	[modelo] [varchar](50) NULL,
 CONSTRAINT [PK_aviones] PRIMARY KEY CLUSTERED 
(
	[idavion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ciudades]    Script Date: 19/12/2019 12:31:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ciudades](
	[idciudad] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[idpais] [int] NOT NULL,
 CONSTRAINT [PK_ciudades] PRIMARY KEY CLUSTERED 
(
	[idciudad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[clases]    Script Date: 19/12/2019 12:31:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[clases](
	[idclase] [char](1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Clases] PRIMARY KEY CLUSTERED 
(
	[idclase] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[clasescapacidades]    Script Date: 19/12/2019 12:31:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[clasescapacidades](
	[idclase] [char](1) NOT NULL,
	[idavion] [int] NOT NULL,
	[capacidad] [int] NOT NULL,
 CONSTRAINT [PK_clasescapacidades] PRIMARY KEY CLUSTERED 
(
	[idclase] ASC,
	[idavion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[claseslibres]    Script Date: 19/12/2019 12:31:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[claseslibres](
	[idclase] [char](1) NOT NULL,
	[idreserva] [int] NOT NULL,
	[plazaslibres] [int] NOT NULL,
 CONSTRAINT [PK_claseslibres] PRIMARY KEY CLUSTERED 
(
	[idclase] ASC,
	[idreserva] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[clasesprecios]    Script Date: 19/12/2019 12:31:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[clasesprecios](
	[idclase] [char](1) NOT NULL,
	[idvuelos] [char](6) NOT NULL,
	[precios] [money] NOT NULL,
 CONSTRAINT [PK_clasesprecios] PRIMARY KEY CLUSTERED 
(
	[idclase] ASC,
	[idvuelos] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[paises]    Script Date: 19/12/2019 12:31:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[paises](
	[idpais] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Paises] PRIMARY KEY CLUSTERED 
(
	[idpais] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[reservas]    Script Date: 19/12/2019 12:31:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[reservas](
	[idreserva] [int] IDENTITY(1,1) NOT NULL,
	[fsalida] [date] NOT NULL,
 CONSTRAINT [PK_reservas] PRIMARY KEY CLUSTERED 
(
	[idreserva] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[vuelos]    Script Date: 19/12/2019 12:31:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[vuelos](
	[idvuelo] [char](6) NOT NULL,
	[aeropuertoorigen] [int] NOT NULL,
	[aeropuertodestino] [int] NOT NULL,
	[duracion] [int] NOT NULL,
	[hora] [time](7) NOT NULL,
 CONSTRAINT [PK_vuelos] PRIMARY KEY CLUSTERED 
(
	[idvuelo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[aeropuertos]  WITH CHECK ADD  CONSTRAINT [FK_aeropuertos_ciudades] FOREIGN KEY([idciudad])
REFERENCES [dbo].[ciudades] ([idciudad])
GO
ALTER TABLE [dbo].[aeropuertos] CHECK CONSTRAINT [FK_aeropuertos_ciudades]
GO
ALTER TABLE [dbo].[ciudades]  WITH CHECK ADD  CONSTRAINT [FK_ciudades_paises] FOREIGN KEY([idpais])
REFERENCES [dbo].[paises] ([idpais])
GO
ALTER TABLE [dbo].[ciudades] CHECK CONSTRAINT [FK_ciudades_paises]
GO
ALTER TABLE [dbo].[clasescapacidades]  WITH CHECK ADD  CONSTRAINT [FK_clasescapacidades_aviones] FOREIGN KEY([idavion])
REFERENCES [dbo].[aviones] ([idavion])
GO
ALTER TABLE [dbo].[clasescapacidades] CHECK CONSTRAINT [FK_clasescapacidades_aviones]
GO
ALTER TABLE [dbo].[clasescapacidades]  WITH CHECK ADD  CONSTRAINT [FK_clasescapacidades_clases] FOREIGN KEY([idclase])
REFERENCES [dbo].[clases] ([idclase])
GO
ALTER TABLE [dbo].[clasescapacidades] CHECK CONSTRAINT [FK_clasescapacidades_clases]
GO
ALTER TABLE [dbo].[claseslibres]  WITH CHECK ADD  CONSTRAINT [FK_claseslibres_clases] FOREIGN KEY([idclase])
REFERENCES [dbo].[clases] ([idclase])
GO
ALTER TABLE [dbo].[claseslibres] CHECK CONSTRAINT [FK_claseslibres_clases]
GO
ALTER TABLE [dbo].[claseslibres]  WITH CHECK ADD  CONSTRAINT [FK_claseslibres_reservas] FOREIGN KEY([idreserva])
REFERENCES [dbo].[reservas] ([idreserva])
GO
ALTER TABLE [dbo].[claseslibres] CHECK CONSTRAINT [FK_claseslibres_reservas]
GO
ALTER TABLE [dbo].[clasesprecios]  WITH CHECK ADD  CONSTRAINT [FK_clasesprecios_clases] FOREIGN KEY([idclase])
REFERENCES [dbo].[clases] ([idclase])
GO
ALTER TABLE [dbo].[clasesprecios] CHECK CONSTRAINT [FK_clasesprecios_clases]
GO
ALTER TABLE [dbo].[clasesprecios]  WITH CHECK ADD  CONSTRAINT [FK_clasesprecios_vuelos] FOREIGN KEY([idvuelos])
REFERENCES [dbo].[vuelos] ([idvuelo])
GO
ALTER TABLE [dbo].[clasesprecios] CHECK CONSTRAINT [FK_clasesprecios_vuelos]
GO
ALTER TABLE [dbo].[vuelos]  WITH CHECK ADD  CONSTRAINT [FK_vuelos_aeropuertos] FOREIGN KEY([aeropuertoorigen])
REFERENCES [dbo].[aeropuertos] ([idaeropuerto])
GO
ALTER TABLE [dbo].[vuelos] CHECK CONSTRAINT [FK_vuelos_aeropuertos]
GO
ALTER TABLE [dbo].[vuelos]  WITH CHECK ADD  CONSTRAINT [FK_vuelos_aeropuertos1] FOREIGN KEY([aeropuertodestino])
REFERENCES [dbo].[aeropuertos] ([idaeropuerto])
GO
ALTER TABLE [dbo].[vuelos] CHECK CONSTRAINT [FK_vuelos_aeropuertos1]
GO
USE [master]
GO
ALTER DATABASE [busquedavuelos] SET  READ_WRITE 
GO
