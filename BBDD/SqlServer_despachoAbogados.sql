USE [master]
GO
/****** Object:  Database [DespachoAbogados]    Script Date: 13/12/2019 11:35:56 ******/
CREATE DATABASE [DespachoAbogados]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DespachoAbogados', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\DespachoAbogados.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'DespachoAbogados_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\DespachoAbogados_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [DespachoAbogados] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DespachoAbogados].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DespachoAbogados] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DespachoAbogados] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DespachoAbogados] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DespachoAbogados] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DespachoAbogados] SET ARITHABORT OFF 
GO
ALTER DATABASE [DespachoAbogados] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DespachoAbogados] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DespachoAbogados] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DespachoAbogados] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DespachoAbogados] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DespachoAbogados] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DespachoAbogados] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DespachoAbogados] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DespachoAbogados] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DespachoAbogados] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DespachoAbogados] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DespachoAbogados] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DespachoAbogados] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DespachoAbogados] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DespachoAbogados] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DespachoAbogados] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DespachoAbogados] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DespachoAbogados] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DespachoAbogados] SET  MULTI_USER 
GO
ALTER DATABASE [DespachoAbogados] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DespachoAbogados] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DespachoAbogados] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DespachoAbogados] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [DespachoAbogados] SET DELAYED_DURABILITY = DISABLED 
GO
USE [DespachoAbogados]
GO
/****** Object:  Table [dbo].[Asuntos]    Script Date: 13/12/2019 11:35:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Asuntos](
	[noexpediente] [int] IDENTITY(1,1) NOT NULL,
	[dnicliente] [char](9) NOT NULL,
	[finicio] [date] NOT NULL,
	[ffin] [date] NULL,
	[estado] [char](1) NOT NULL,
 CONSTRAINT [PK_Asuntos] PRIMARY KEY CLUSTERED 
(
	[noexpediente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AsuntosProcuradores]    Script Date: 13/12/2019 11:35:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AsuntosProcuradores](
	[noexpediente] [int] NOT NULL,
	[dniprocurador] [char](9) NOT NULL,
 CONSTRAINT [PK_AsuntosProcuradores] PRIMARY KEY CLUSTERED 
(
	[noexpediente] ASC,
	[dniprocurador] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Clientes]    Script Date: 13/12/2019 11:35:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clientes](
	[dni] [char](9) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[direccion] [varchar](150) NULL,
 CONSTRAINT [PK_Clientes] PRIMARY KEY CLUSTERED 
(
	[dni] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Procuradores]    Script Date: 13/12/2019 11:35:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Procuradores](
	[dni] [char](9) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[direccion] [varchar](150) NULL,
 CONSTRAINT [PK_Procuradores] PRIMARY KEY CLUSTERED 
(
	[dni] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Asuntos] ON 
GO
INSERT [dbo].[Asuntos] ([noexpediente], [dnicliente], [finicio], [ffin], [estado]) VALUES (1, N'12345678A', CAST(N'2019-12-13' AS Date), NULL, N'T')
GO
INSERT [dbo].[Asuntos] ([noexpediente], [dnicliente], [finicio], [ffin], [estado]) VALUES (2, N'12345678B', CAST(N'2019-12-12' AS Date), NULL, N'T')
GO
SET IDENTITY_INSERT [dbo].[Asuntos] OFF
GO
INSERT [dbo].[AsuntosProcuradores] ([noexpediente], [dniprocurador]) VALUES (1, N'12345678C')
GO
INSERT [dbo].[AsuntosProcuradores] ([noexpediente], [dniprocurador]) VALUES (1, N'12345678D')
GO
INSERT [dbo].[AsuntosProcuradores] ([noexpediente], [dniprocurador]) VALUES (2, N'12345678C')
GO
INSERT [dbo].[Clientes] ([dni], [nombre], [direccion]) VALUES (N'12345678A', N'Santiago Segura', N'C/Real 25')
GO
INSERT [dbo].[Clientes] ([dni], [nombre], [direccion]) VALUES (N'12345678B', N'Raul Ramirez', N'C/España 34')
GO
INSERT [dbo].[Procuradores] ([dni], [nombre], [direccion]) VALUES (N'12345678C', N'Emma Gomez', N'Calle Peña 3')
GO
INSERT [dbo].[Procuradores] ([dni], [nombre], [direccion]) VALUES (N'12345678D', N'Laura', N'C/ Valencia 5')
GO
ALTER TABLE [dbo].[Asuntos]  WITH CHECK ADD  CONSTRAINT [FK_Asuntos_Clientes] FOREIGN KEY([dnicliente])
REFERENCES [dbo].[Clientes] ([dni])
GO
ALTER TABLE [dbo].[Asuntos] CHECK CONSTRAINT [FK_Asuntos_Clientes]
GO
ALTER TABLE [dbo].[AsuntosProcuradores]  WITH CHECK ADD  CONSTRAINT [FK_AsuntosProcuradores_Asuntos] FOREIGN KEY([noexpediente])
REFERENCES [dbo].[Asuntos] ([noexpediente])
GO
ALTER TABLE [dbo].[AsuntosProcuradores] CHECK CONSTRAINT [FK_AsuntosProcuradores_Asuntos]
GO
ALTER TABLE [dbo].[AsuntosProcuradores]  WITH CHECK ADD  CONSTRAINT [FK_AsuntosProcuradores_Procuradores] FOREIGN KEY([dniprocurador])
REFERENCES [dbo].[Procuradores] ([dni])
GO
ALTER TABLE [dbo].[AsuntosProcuradores] CHECK CONSTRAINT [FK_AsuntosProcuradores_Procuradores]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'T - en tramite / A  archivado' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Asuntos', @level2type=N'COLUMN',@level2name=N'estado'
GO
USE [master]
GO
ALTER DATABASE [DespachoAbogados] SET  READ_WRITE 
GO
