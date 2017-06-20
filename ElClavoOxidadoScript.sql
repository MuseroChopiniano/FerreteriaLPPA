USE [master]
GO
/****** Object:  Database [ElClavoOxidado]    Script Date: 18/6/2017 4:17:13 p. m. ******/
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
/****** Object:  Table [dbo].[Bitacora]    Script Date: 18/6/2017 4:17:13 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bitacora](
	[Id] [int] NOT NULL,
	[Usuario] [nvarchar](50) NULL,
	[Fecha] [datetime] NULL,
	[Tipo] [nvarchar](50) NULL,
	[Actividad] [nvarchar](500) NULL,
 CONSTRAINT [PK_Bitacora] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Familia]    Script Date: 18/6/2017 4:17:13 p. m. ******/
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
/****** Object:  Table [dbo].[FamiliaPatente]    Script Date: 18/6/2017 4:17:13 p. m. ******/
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
/****** Object:  Table [dbo].[Patente]    Script Date: 18/6/2017 4:17:13 p. m. ******/
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
/****** Object:  Table [dbo].[Usuario]    Script Date: 18/6/2017 4:17:13 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[Id] [nvarchar](16) NOT NULL,
	[Email] [nvarchar](50) NULL,
	[Password] [nvarchar](16) NULL,
	[Familia] [int] NULL,
	[Bloqueado] [bit] NULL,
	[Cant_Bloqueos] [int] NULL,
	[Ultimo_intento] [datetime] NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[Familia] ([Id], [Nombre]) VALUES (1, N'Webmaster')
INSERT [dbo].[Familia] ([Id], [Nombre]) VALUES (2, N'Administrador')
INSERT [dbo].[Familia] ([Id], [Nombre]) VALUES (3, N'Usuario')
INSERT [dbo].[Usuario] ([Id], [Email], [Password], [Familia],[Bloqueado],[Cant_Bloqueos],[Ultimo_intento]) VALUES (N'FacuTripelhorn', N'facundo.tripelhorn@gmail.com', N'123456', 1,0,0,CONVERT(DATE,'2017-06-18 21:00:00.000'))
INSERT [dbo].[Usuario] ([Id], [Email], [Password], [Familia],[Bloqueado],[Cant_Bloqueos],[Ultimo_intento]) VALUES (N'Juanito', N'juanito@gmail.com', N'123456', 3,0,0,CONVERT(DATE,'2017-06-18 21:00:00.000'))

CREATE PROCEDURE sp_ObtenerUser 
@Usuario nvarchar(50),
@Pass nvarchar(50)
AS
DECLARE @IsValid int
SET @IsValid = 0

IF (Select Password FROM usuario where id = @Usuario) = @Pass
SET @IsValid = 1
ELSE
UPDATE usuario SET Cant_Bloqueos = Cant_Bloqueos + 1 where id = @Usuario


Select id as "Usuario", @IsValid as "IsValid", Bloqueado, Cant_Bloqueos, Ultimo_intento, Familia
FROM usuario 
where id = @Usuario


CREATE PROCEDURE sp_ActualizarMailUser
@Usuario nvarchar(16),
@Email nvarchar(50)
AS
UPDATE usuario SET Email = @Email
where id = @Usuario


CREATE PROCEDURE sp_BloquearUser
@Usuario nvarchar(16)
AS
UPDATE usuario SET Bloqueado = 1
where id = @Usuario


USE [master]
GO
ALTER DATABASE [ElClavoOxidado] SET  READ_WRITE 
GO
