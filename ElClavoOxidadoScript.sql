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
/****** Object:  Table [dbo].[Usuario]    Script Date: 18/6/2017 4:17:13 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[Id] [nvarchar](16) NOT NULL,
	[Email] [nvarchar](50) NULL,
	[Password] [nvarchar](64) NULL,
	[Familia] [int] NULL,
	[Bloqueado] [bit] NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[Usuario] ([Id], [Email], [Password], [Familia],[Bloqueado]) VALUES (N'FacuTripelhorn', N'facundo.tripelhorn@gmail.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 1,0)
INSERT [dbo].[Usuario] ([Id], [Email], [Password], [Familia],[Bloqueado]) VALUES (N'Juanito', N'juanito@gmail.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 3,0)


CREATE PROCEDURE ObtenerUser 
@Usuario nvarchar(50),
@Pass nvarchar(64)
AS
DECLARE @IsValid int
SET @IsValid = 0

IF (SELECT Password FROM Usuario WHERE Id = @Usuario) = @Pass
	BEGIN
		SET @IsValid = 1
	END
SELECT Id AS "Usuario", @IsValid AS "IsValid", Bloqueado, Familia
FROM Usuario 
WHERE Id = @Usuario

GO

CREATE PROCEDURE ActualizarMailUser
@Usuario nvarchar(16),
@Email nvarchar(50)
AS
UPDATE usuario SET Email = @Email
where id = @Usuario

GO

CREATE PROCEDURE BloquearUser
@Usuario nvarchar(16)
AS
UPDATE usuario SET Bloqueado = 1
where id = @Usuario

GO

CREATE PROCEDURE GetBitacora
AS
SELECT * FROM Bitacora

GO

CREATE PROCEDURE AltaBitacora
@Id int,
@Usuario nvarchar(50),
@Tipo nvarchar(50),
@Actividad nvarchar(500)
AS
INSERT INTO Bitacora VALUES (@Id, @Usuario, GETDATE(), @Tipo, @Actividad)

GO

CREATE PROCEDURE AltaUsuario
@Usuario nvarchar(16),
@Email nvarchar(50),
@Password nvarchar(64),
@Familia int,
@Result bit OUTPUT
AS
IF (NOT EXISTS (SELECT Id FROM Usuario WHERE Id = @Usuario))
BEGIN
INSERT INTO Usuario VALUES (@Usuario, @Email, @Password, @Familia, 0)
SET @Result = 1
END
ELSE
BEGIN
SET @Result = 0
END

GO

CREATE PROCEDURE ChequearUsuario
@Usuario nvarchar(16)
AS
SELECT * FROM Usuario WHERE Id = @Usuario

GO
USE [master]
GO
ALTER DATABASE [ElClavoOxidado] SET  READ_WRITE 
GO
