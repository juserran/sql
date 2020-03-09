USE [master]
GO
/****** Object:  Database [EstacionAutobuses]    Script Date: 12/12/2019 12:46:47 ******/
CREATE DATABASE [EstacionAutobuses]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'EstacionAutobuses', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\EstacionAutobuses.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'EstacionAutobuses_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\EstacionAutobuses_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [EstacionAutobuses] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [EstacionAutobuses].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [EstacionAutobuses] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [EstacionAutobuses] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [EstacionAutobuses] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [EstacionAutobuses] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [EstacionAutobuses] SET ARITHABORT OFF 
GO
ALTER DATABASE [EstacionAutobuses] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [EstacionAutobuses] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [EstacionAutobuses] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [EstacionAutobuses] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [EstacionAutobuses] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [EstacionAutobuses] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [EstacionAutobuses] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [EstacionAutobuses] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [EstacionAutobuses] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [EstacionAutobuses] SET  DISABLE_BROKER 
GO
ALTER DATABASE [EstacionAutobuses] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [EstacionAutobuses] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [EstacionAutobuses] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [EstacionAutobuses] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [EstacionAutobuses] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [EstacionAutobuses] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [EstacionAutobuses] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [EstacionAutobuses] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [EstacionAutobuses] SET  MULTI_USER 
GO
ALTER DATABASE [EstacionAutobuses] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [EstacionAutobuses] SET DB_CHAINING OFF 
GO
ALTER DATABASE [EstacionAutobuses] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [EstacionAutobuses] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [EstacionAutobuses] SET DELAYED_DURABILITY = DISABLED 
GO
USE [EstacionAutobuses]
GO
/****** Object:  Table [dbo].[autobuses]    Script Date: 12/12/2019 12:46:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[autobuses](
	[matricula] [char](7) NOT NULL,
	[marca] [varchar](50) NOT NULL,
	[tipomotor] [varchar](15) NOT NULL,
 CONSTRAINT [PK_autobuses] PRIMARY KEY CLUSTERED 
(
	[matricula] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Conductores]    Script Date: 12/12/2019 12:46:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Conductores](
	[dni] [char](9) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[direccion] [varchar](150) NOT NULL,
	[fnacimiento] [date] NOT NULL,
 CONSTRAINT [PK_Conductores] PRIMARY KEY CLUSTERED 
(
	[dni] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[lugares]    Script Date: 12/12/2019 12:46:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[lugares](
	[idlugar] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](25) NOT NULL,
	[provincia] [varchar](50) NOT NULL,
	[pais] [varchar](30) NOT NULL,
 CONSTRAINT [PK_lugares] PRIMARY KEY CLUSTERED 
(
	[idlugar] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[visitas]    Script Date: 12/12/2019 12:46:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[visitas](
	[idvisita] [int] IDENTITY(1,1) NOT NULL,
	[matricula] [char](7) NOT NULL,
	[dni] [char](9) NOT NULL,
	[idlugar] [int] NOT NULL,
	[km] [int] NULL,
	[fvisita] [date] NOT NULL,
	[hora] [time](7) NOT NULL,
 CONSTRAINT [PK_visitas] PRIMARY KEY CLUSTERED 
(
	[idvisita] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[visitas]  WITH CHECK ADD  CONSTRAINT [FK_visitas_autobuses] FOREIGN KEY([matricula])
REFERENCES [dbo].[autobuses] ([matricula])
GO
ALTER TABLE [dbo].[visitas] CHECK CONSTRAINT [FK_visitas_autobuses]
GO
ALTER TABLE [dbo].[visitas]  WITH CHECK ADD  CONSTRAINT [FK_visitas_Conductores] FOREIGN KEY([dni])
REFERENCES [dbo].[Conductores] ([dni])
GO
ALTER TABLE [dbo].[visitas] CHECK CONSTRAINT [FK_visitas_Conductores]
GO
ALTER TABLE [dbo].[visitas]  WITH CHECK ADD  CONSTRAINT [FK_visitas_lugares] FOREIGN KEY([idlugar])
REFERENCES [dbo].[lugares] ([idlugar])
GO
ALTER TABLE [dbo].[visitas] CHECK CONSTRAINT [FK_visitas_lugares]
GO
USE [master]
GO
ALTER DATABASE [EstacionAutobuses] SET  READ_WRITE 
GO
