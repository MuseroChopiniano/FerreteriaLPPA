USE [master]
GO
/****** Object:  Database [ElClavoOxidado]    Script Date: 18/6/2017 2:49:16 p. m. ******/
CREATE DATABASE [ElClavoOxidado]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ElClavoOxidado', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL12.SQLEXPRESS1\MSSQL\DATA\ElClavoOxidado.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ElClavoOxidado_log', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL12.SQLEXPRESS1\MSSQL\DATA\ElClavoOxidado_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ElClavoOxidado].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ElClavoOxidado] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ElClavoOxidado] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ElClavoOxidado] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ElClavoOxidado] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ElClavoOxidado] SET ARITHABORT OFF 
GO
ALTER DATABASE [ElClavoOxidado] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ElClavoOxidado] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ElClavoOxidado] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ElClavoOxidado] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ElClavoOxidado] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ElClavoOxidado] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ElClavoOxidado] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ElClavoOxidado] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ElClavoOxidado] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ElClavoOxidado] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ElClavoOxidado] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ElClavoOxidado] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ElClavoOxidado] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ElClavoOxidado] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ElClavoOxidado] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ElClavoOxidado] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ElClavoOxidado] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ElClavoOxidado] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ElClavoOxidado] SET  MULTI_USER 
GO
ALTER DATABASE [ElClavoOxidado] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ElClavoOxidado] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ElClavoOxidado] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ElClavoOxidado] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [ElClavoOxidado]
GO
/****** Object:  Table [dbo].[Familia]    Script Date: 18/6/2017 2:49:16 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Familia](
	[Id] [int] NOT NULL,
	[Nombre] [nvarchar](50) NULL,
 CONSTRAINT [PK_Familia] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[FamiliaPatente]    Script Date: 18/6/2017 2:49:16 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FamiliaPatente](
	[Familia] [int] NOT NULL,
	[Patente] [int] NOT NULL,
 CONSTRAINT [PK_FamiliaPatente] PRIMARY KEY CLUSTERED 
(
	[Familia] ASC,
	[Patente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Patente]    Script Date: 18/6/2017 2:49:16 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Patente](
	[Id] [int] NOT NULL,
	[Nombre] [nvarchar](50) NULL,
	[Pagina] [nvarchar](50) NULL,
 CONSTRAINT [PK_Patente] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 18/6/2017 2:49:16 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[Id] [nvarchar](16) NOT NULL,
	[Email] [nvarchar](50) NULL,
	[Password] [nvarchar](16) NULL,
	[Familia] [int] NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[Familia] ([Id], [Nombre]) VALUES (1, N'Webmaster')
INSERT [dbo].[Familia] ([Id], [Nombre]) VALUES (2, N'Administrador')
INSERT [dbo].[Familia] ([Id], [Nombre]) VALUES (3, N'Usuario')
INSERT [dbo].[Usuario] ([Id], [Email], [Password], [Familia]) VALUES (N'FacuTripelhorn', N'facundo.tripelhorn@gmail.com', N'123456', 1)
INSERT [dbo].[Usuario] ([Id], [Email], [Password], [Familia]) VALUES (N'Juanito', N'juanito@gmail.com', N'123456', 3)
USE [master]
GO
ALTER DATABASE [ElClavoOxidado] SET  READ_WRITE 
GO
