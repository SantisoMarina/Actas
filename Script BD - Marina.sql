USE [master]
GO
/****** Object:  Database [PGMClipActas]    Script Date: 1/2/2021 11:04:42 ******/
CREATE DATABASE [PGMClipActas]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PGMClipActas', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\PGMClipActas.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PGMClipActas_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\PGMClipActas_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [PGMClipActas] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PGMClipActas].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PGMClipActas] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PGMClipActas] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PGMClipActas] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PGMClipActas] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PGMClipActas] SET ARITHABORT OFF 
GO
ALTER DATABASE [PGMClipActas] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PGMClipActas] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PGMClipActas] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PGMClipActas] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PGMClipActas] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PGMClipActas] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PGMClipActas] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PGMClipActas] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PGMClipActas] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PGMClipActas] SET  DISABLE_BROKER 
GO
ALTER DATABASE [PGMClipActas] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PGMClipActas] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PGMClipActas] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PGMClipActas] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PGMClipActas] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PGMClipActas] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PGMClipActas] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PGMClipActas] SET RECOVERY FULL 
GO
ALTER DATABASE [PGMClipActas] SET  MULTI_USER 
GO
ALTER DATABASE [PGMClipActas] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PGMClipActas] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PGMClipActas] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PGMClipActas] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PGMClipActas] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [PGMClipActas] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'PGMClipActas', N'ON'
GO
ALTER DATABASE [PGMClipActas] SET QUERY_STORE = OFF
GO
USE [PGMClipActas]
GO
/****** Object:  Table [dbo].[Actas]    Script Date: 1/2/2021 11:04:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Actas](
	[numero_acta] [int] NOT NULL,
	[id_inspector] [int] NOT NULL,
	[ip_carga] [varchar](20) NULL,
	[id_operador] [int] NOT NULL,
	[fecha_carga] [varchar](30) NULL,
	[hora_carga] [varchar](30) NULL,
	[fecha_acta] [varchar](30) NOT NULL,
	[hora_acta] [varchar](30) NOT NULL,
	[observaciones] [varchar](250) NULL,
	[retuvo_licencia] [bit] NULL,
	[retuvo_vehiculo] [bit] NULL,
	[id_automotor] [int] NOT NULL,
	[direccion_infraccion] [varchar](50) NULL,
	[codigo_postal_infraccion] [int] NULL,
	[id_localidad] [int] NULL,
 CONSTRAINT [PK_Actas] PRIMARY KEY CLUSTERED 
(
	[numero_acta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Articulos]    Script Date: 1/2/2021 11:04:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Articulos](
	[codigo_articulo] [int] IDENTITY(1,1) NOT NULL,
	[articulo] [int] NOT NULL,
	[inciso] [varchar](50) NULL,
 CONSTRAINT [PK_Articulos] PRIMARY KEY CLUSTERED 
(
	[codigo_articulo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Automotores]    Script Date: 1/2/2021 11:04:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Automotores](
	[id_automotor] [int] IDENTITY(1,1) NOT NULL,
	[numero_dominio] [varchar](20) NOT NULL,
	[id_marca_tipo_vehiculo] [int] NOT NULL,
	[modelo] [varchar](50) NULL,
	[color] [varchar](30) NULL,
 CONSTRAINT [PK_Automotores_1] PRIMARY KEY CLUSTERED 
(
	[id_automotor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AutomotoresxPersonas]    Script Date: 1/2/2021 11:04:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AutomotoresxPersonas](
	[id_automotor] [int] NOT NULL,
	[id_persona] [int] NOT NULL,
	[id_responsabilidad_legal] [int] NOT NULL,
 CONSTRAINT [PK_AutomotoresxPersonas_1] PRIMARY KEY CLUSTERED 
(
	[id_automotor] ASC,
	[id_persona] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Grupos_Infracciones]    Script Date: 1/2/2021 11:04:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Grupos_Infracciones](
	[codigo_grupo] [int] NOT NULL,
	[grupo] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Grupos_Infracciones] PRIMARY KEY CLUSTERED 
(
	[codigo_grupo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Infracciones]    Script Date: 1/2/2021 11:04:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Infracciones](
	[codigo_infraccion] [int] IDENTITY(1,1) NOT NULL,
	[codigo_normativa] [int] NOT NULL,
	[nomenclatura] [varchar](10) NOT NULL,
	[descripcion] [varchar](100) NOT NULL,
	[codigo_articulo] [int] NOT NULL,
	[codigo_grupo] [int] NOT NULL,
	[calificacion] [varchar](50) NOT NULL,
	[estado] [bit] NOT NULL,
	[habilitado_retuvo_licencia] [bit] NULL,
	[habilitado_retuvo_vehiculo] [bit] NULL,
 CONSTRAINT [PK_Ordenanzas] PRIMARY KEY CLUSTERED 
(
	[codigo_infraccion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InfraccionesxActas]    Script Date: 1/2/2021 11:04:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InfraccionesxActas](
	[numero_acta] [int] NOT NULL,
	[codigo_infraccion] [int] NOT NULL,
 CONSTRAINT [PK_InfraccionesxActas_1] PRIMARY KEY CLUSTERED 
(
	[numero_acta] ASC,
	[codigo_infraccion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Inspectores]    Script Date: 1/2/2021 11:04:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inspectores](
	[id_inspector] [int] IDENTITY(1,1) NOT NULL,
	[habilitado] [bit] NOT NULL,
	[id_persona] [int] NOT NULL,
	[matricula] [varchar](50) NULL,
	[rango_comienzo_acta] [int] NULL,
	[rango_fin_acta] [int] NULL,
 CONSTRAINT [PK_Inspectores] PRIMARY KEY CLUSTERED 
(
	[id_inspector] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Localidades]    Script Date: 1/2/2021 11:04:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Localidades](
	[id_localidad] [int] IDENTITY(1,1) NOT NULL,
	[localidad] [varchar](50) NOT NULL,
	[id_provincia] [int] NOT NULL,
 CONSTRAINT [PK_Localidades] PRIMARY KEY CLUSTERED 
(
	[id_localidad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Marcas]    Script Date: 1/2/2021 11:04:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Marcas](
	[id_marca] [int] IDENTITY(1,1) NOT NULL,
	[marca] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Marcas] PRIMARY KEY CLUSTERED 
(
	[id_marca] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MarcasxTipos_vehiculos]    Script Date: 1/2/2021 11:04:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MarcasxTipos_vehiculos](
	[id_marca_tipo_vehiculo] [int] IDENTITY(1,1) NOT NULL,
	[id_tipo_vehiculo] [int] NOT NULL,
	[id_marca] [int] NOT NULL,
 CONSTRAINT [PK_MarcasxTipos_vehiculos] PRIMARY KEY CLUSTERED 
(
	[id_marca_tipo_vehiculo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Normativas]    Script Date: 1/2/2021 11:04:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Normativas](
	[codigo_normativa] [int] NOT NULL,
	[normativa] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Normativas] PRIMARY KEY CLUSTERED 
(
	[codigo_normativa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Operadores]    Script Date: 1/2/2021 11:04:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Operadores](
	[id_operador] [int] NOT NULL,
	[habilitado] [int] NOT NULL,
	[id_persona] [int] NOT NULL,
	[usuario] [varchar](15) NULL,
	[contraseña] [varchar](30) NULL,
 CONSTRAINT [PK_Jueces_Faltas] PRIMARY KEY CLUSTERED 
(
	[id_operador] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Paises]    Script Date: 1/2/2021 11:04:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Paises](
	[id_pais] [int] IDENTITY(1,1) NOT NULL,
	[pais] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Paises] PRIMARY KEY CLUSTERED 
(
	[id_pais] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PersonaInfraccionxActa]    Script Date: 1/2/2021 11:04:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PersonaInfraccionxActa](
	[id_persona] [int] NOT NULL,
	[numero_acta] [int] NOT NULL,
	[id_responsabilidad_legal] [int] NOT NULL,
 CONSTRAINT [PK_PersonaInfraccionxActa] PRIMARY KEY CLUSTERED 
(
	[id_persona] ASC,
	[numero_acta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Personas]    Script Date: 1/2/2021 11:04:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Personas](
	[id_persona] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](70) NOT NULL,
	[apellido] [varchar](70) NOT NULL,
	[id_tipo_documento] [int] NOT NULL,
	[numero_documento] [varchar](50) NOT NULL,
	[id_localidad] [int] NULL,
	[direccion] [varchar](100) NULL,
	[codigo_postal] [int] NULL,
 CONSTRAINT [PK_Personas] PRIMARY KEY CLUSTERED 
(
	[id_persona] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Provincias]    Script Date: 1/2/2021 11:04:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Provincias](
	[id_provincia] [int] IDENTITY(1,1) NOT NULL,
	[provincia] [varchar](50) NOT NULL,
	[id_pais] [int] NOT NULL,
 CONSTRAINT [PK_Provincias] PRIMARY KEY CLUSTERED 
(
	[id_provincia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Responsabilidades_Legales]    Script Date: 1/2/2021 11:04:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Responsabilidades_Legales](
	[id_responsabilidad_legal] [int] IDENTITY(1,1) NOT NULL,
	[responsabilidad_legal] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Responsabilidades_Legales] PRIMARY KEY CLUSTERED 
(
	[id_responsabilidad_legal] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tipos_Documentos]    Script Date: 1/2/2021 11:04:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tipos_Documentos](
	[id_tipo_documento] [int] IDENTITY(1,1) NOT NULL,
	[tipo_documento] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Tipos_Documentos] PRIMARY KEY CLUSTERED 
(
	[id_tipo_documento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tipos_vehiculos]    Script Date: 1/2/2021 11:04:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tipos_vehiculos](
	[id_tipo_vehiculo] [int] IDENTITY(1,1) NOT NULL,
	[tipo_vehiculo] [varchar](30) NOT NULL,
 CONSTRAINT [PK_Tipos_vehiculos] PRIMARY KEY CLUSTERED 
(
	[id_tipo_vehiculo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Actas] ([numero_acta], [id_inspector], [ip_carga], [id_operador], [fecha_carga], [hora_carga], [fecha_acta], [hora_acta], [observaciones], [retuvo_licencia], [retuvo_vehiculo], [id_automotor], [direccion_infraccion], [codigo_postal_infraccion], [id_localidad]) VALUES (100, 1, N'192.168.789', 1, N'2021-01-28', N'14:9', N'2021-01-28', N'10:01', N'Alcoholizado.', 1, 1, 1, N'Av. Malvinas Argentinas 123', 5000, 1)
INSERT [dbo].[Actas] ([numero_acta], [id_inspector], [ip_carga], [id_operador], [fecha_carga], [hora_carga], [fecha_acta], [hora_acta], [observaciones], [retuvo_licencia], [retuvo_vehiculo], [id_automotor], [direccion_infraccion], [codigo_postal_infraccion], [id_localidad]) VALUES (103, 1, N'192.168.789', 1, N'2021-01-28', N'14:29', N'2021-01-28', N'09:09', N'Sin Casco.', 0, 0, 1, N'Av. Malvinas Argentinas 1234', 5000, 1)
INSERT [dbo].[Actas] ([numero_acta], [id_inspector], [ip_carga], [id_operador], [fecha_carga], [hora_carga], [fecha_acta], [hora_acta], [observaciones], [retuvo_licencia], [retuvo_vehiculo], [id_automotor], [direccion_infraccion], [codigo_postal_infraccion], [id_localidad]) VALUES (104, 1, N'192.168.789', 1, N'2021-01-28', N'14:34', N'2021-01-28', N'08:08', N'Sin casco.', 0, 0, 4, N'Los Alamos 485', 5007, 1)
INSERT [dbo].[Actas] ([numero_acta], [id_inspector], [ip_carga], [id_operador], [fecha_carga], [hora_carga], [fecha_acta], [hora_acta], [observaciones], [retuvo_licencia], [retuvo_vehiculo], [id_automotor], [direccion_infraccion], [codigo_postal_infraccion], [id_localidad]) VALUES (107, 1, N'192.168.789', 1, N'2021-01-28', N'14:39', N'2021-01-28', N'05:05', N'Semáforo en rojo.', 0, 0, 4, N'Los Alamos 545', 5008, 1)
INSERT [dbo].[Actas] ([numero_acta], [id_inspector], [ip_carga], [id_operador], [fecha_carga], [hora_carga], [fecha_acta], [hora_acta], [observaciones], [retuvo_licencia], [retuvo_vehiculo], [id_automotor], [direccion_infraccion], [codigo_postal_infraccion], [id_localidad]) VALUES (110, 1, N'192.168.789', 1, N'2021-01-28', N'16:4', N'2021-01-28', N'11:00', N'Alcoholizado.', 1, 0, 1, N'La posta 3334', 5009, 1)
INSERT [dbo].[Actas] ([numero_acta], [id_inspector], [ip_carga], [id_operador], [fecha_carga], [hora_carga], [fecha_acta], [hora_acta], [observaciones], [retuvo_licencia], [retuvo_vehiculo], [id_automotor], [direccion_infraccion], [codigo_postal_infraccion], [id_localidad]) VALUES (112, 1, N'192.168.789', 1, N'2021-01-29', N'11:45', N'2021-01-29', N'11:01', N'Semáforo en rojo.', 0, 1, 5, N'La posta 3334', 5412, 1)
INSERT [dbo].[Actas] ([numero_acta], [id_inspector], [ip_carga], [id_operador], [fecha_carga], [hora_carga], [fecha_acta], [hora_acta], [observaciones], [retuvo_licencia], [retuvo_vehiculo], [id_automotor], [direccion_infraccion], [codigo_postal_infraccion], [id_localidad]) VALUES (122, 1, N'192.168.789', 1, N'2021-01-29', N'16:56', N'2020-12-27', N'17:43', N'Persona con índices de alcoholemia elevados.', 0, 1, 4, N'Avenida Pueyrredon 789', 5600, 1)
INSERT [dbo].[Actas] ([numero_acta], [id_inspector], [ip_carga], [id_operador], [fecha_carga], [hora_carga], [fecha_acta], [hora_acta], [observaciones], [retuvo_licencia], [retuvo_vehiculo], [id_automotor], [direccion_infraccion], [codigo_postal_infraccion], [id_localidad]) VALUES (150, 1, N'192.168.789', 1, N'2021-01-28', N'15:1', N'2021-01-28', N'11:11', N'Sin casco.', 1, 0, 4, N'Manuel Oribe 123', 5008, 1)
INSERT [dbo].[Actas] ([numero_acta], [id_inspector], [ip_carga], [id_operador], [fecha_carga], [hora_carga], [fecha_acta], [hora_acta], [observaciones], [retuvo_licencia], [retuvo_vehiculo], [id_automotor], [direccion_infraccion], [codigo_postal_infraccion], [id_localidad]) VALUES (222, 2, N'192.168.789', 1, N'2021-01-28', N'16:21', N'2021-01-28', N'14:00', N'Semáforo en rojo.', 1, 1, 5, N'Av. Malvinas 123', 5008, 1)
GO
SET IDENTITY_INSERT [dbo].[Articulos] ON 

INSERT [dbo].[Articulos] ([codigo_articulo], [articulo], [inciso]) VALUES (1, 77, NULL)
INSERT [dbo].[Articulos] ([codigo_articulo], [articulo], [inciso]) VALUES (2, 58, NULL)
INSERT [dbo].[Articulos] ([codigo_articulo], [articulo], [inciso]) VALUES (3, 90, N'a')
INSERT [dbo].[Articulos] ([codigo_articulo], [articulo], [inciso]) VALUES (4, 41, NULL)
INSERT [dbo].[Articulos] ([codigo_articulo], [articulo], [inciso]) VALUES (5, 41, N'b')
INSERT [dbo].[Articulos] ([codigo_articulo], [articulo], [inciso]) VALUES (6, 111, NULL)
INSERT [dbo].[Articulos] ([codigo_articulo], [articulo], [inciso]) VALUES (7, 84, N'14')
INSERT [dbo].[Articulos] ([codigo_articulo], [articulo], [inciso]) VALUES (8, 43, N'1.f')
INSERT [dbo].[Articulos] ([codigo_articulo], [articulo], [inciso]) VALUES (9, 39, NULL)
INSERT [dbo].[Articulos] ([codigo_articulo], [articulo], [inciso]) VALUES (10, 31, NULL)
INSERT [dbo].[Articulos] ([codigo_articulo], [articulo], [inciso]) VALUES (11, 56, N'2')
INSERT [dbo].[Articulos] ([codigo_articulo], [articulo], [inciso]) VALUES (12, 54, N'a.8')
INSERT [dbo].[Articulos] ([codigo_articulo], [articulo], [inciso]) VALUES (13, 43, NULL)
INSERT [dbo].[Articulos] ([codigo_articulo], [articulo], [inciso]) VALUES (14, 47, NULL)
INSERT [dbo].[Articulos] ([codigo_articulo], [articulo], [inciso]) VALUES (15, 74, N'3')
INSERT [dbo].[Articulos] ([codigo_articulo], [articulo], [inciso]) VALUES (16, 74, N'1.b')
INSERT [dbo].[Articulos] ([codigo_articulo], [articulo], [inciso]) VALUES (17, 42, NULL)
INSERT [dbo].[Articulos] ([codigo_articulo], [articulo], [inciso]) VALUES (18, 48, N'5')
INSERT [dbo].[Articulos] ([codigo_articulo], [articulo], [inciso]) VALUES (19, 49, NULL)
INSERT [dbo].[Articulos] ([codigo_articulo], [articulo], [inciso]) VALUES (20, 90, N'c')
INSERT [dbo].[Articulos] ([codigo_articulo], [articulo], [inciso]) VALUES (21, 63, NULL)
INSERT [dbo].[Articulos] ([codigo_articulo], [articulo], [inciso]) VALUES (22, 70, NULL)
INSERT [dbo].[Articulos] ([codigo_articulo], [articulo], [inciso]) VALUES (23, 71, N'1.g')
INSERT [dbo].[Articulos] ([codigo_articulo], [articulo], [inciso]) VALUES (24, 72, NULL)
INSERT [dbo].[Articulos] ([codigo_articulo], [articulo], [inciso]) VALUES (25, 84, N'27')
INSERT [dbo].[Articulos] ([codigo_articulo], [articulo], [inciso]) VALUES (26, 84, N'6')
INSERT [dbo].[Articulos] ([codigo_articulo], [articulo], [inciso]) VALUES (27, 93, N'f')
INSERT [dbo].[Articulos] ([codigo_articulo], [articulo], [inciso]) VALUES (28, 84, N'8')
INSERT [dbo].[Articulos] ([codigo_articulo], [articulo], [inciso]) VALUES (29, 84, N'13')
INSERT [dbo].[Articulos] ([codigo_articulo], [articulo], [inciso]) VALUES (30, 98, NULL)
INSERT [dbo].[Articulos] ([codigo_articulo], [articulo], [inciso]) VALUES (31, 100, NULL)
INSERT [dbo].[Articulos] ([codigo_articulo], [articulo], [inciso]) VALUES (32, 102, N'b')
INSERT [dbo].[Articulos] ([codigo_articulo], [articulo], [inciso]) VALUES (33, 102, N'a')
INSERT [dbo].[Articulos] ([codigo_articulo], [articulo], [inciso]) VALUES (34, 102, N'c')
INSERT [dbo].[Articulos] ([codigo_articulo], [articulo], [inciso]) VALUES (35, 102, N'd')
INSERT [dbo].[Articulos] ([codigo_articulo], [articulo], [inciso]) VALUES (36, 107, N'e')
INSERT [dbo].[Articulos] ([codigo_articulo], [articulo], [inciso]) VALUES (37, 53, N'1')
INSERT [dbo].[Articulos] ([codigo_articulo], [articulo], [inciso]) VALUES (38, 53, N'2')
INSERT [dbo].[Articulos] ([codigo_articulo], [articulo], [inciso]) VALUES (39, 54, N'a.2')
INSERT [dbo].[Articulos] ([codigo_articulo], [articulo], [inciso]) VALUES (40, 54, N'a.4')
INSERT [dbo].[Articulos] ([codigo_articulo], [articulo], [inciso]) VALUES (41, 74, N'1.a')
INSERT [dbo].[Articulos] ([codigo_articulo], [articulo], [inciso]) VALUES (42, 38, NULL)
SET IDENTITY_INSERT [dbo].[Articulos] OFF
GO
SET IDENTITY_INSERT [dbo].[Automotores] ON 

INSERT [dbo].[Automotores] ([id_automotor], [numero_dominio], [id_marca_tipo_vehiculo], [modelo], [color]) VALUES (1, N'AB 123 CD', 1, N'C4', N'Rojo')
INSERT [dbo].[Automotores] ([id_automotor], [numero_dominio], [id_marca_tipo_vehiculo], [modelo], [color]) VALUES (2, N'MS 161 MF', 2, N'XTZ 250', N'Negro')
INSERT [dbo].[Automotores] ([id_automotor], [numero_dominio], [id_marca_tipo_vehiculo], [modelo], [color]) VALUES (3, N'AZX 502', 2, N' C4', N' Blanco')
INSERT [dbo].[Automotores] ([id_automotor], [numero_dominio], [id_marca_tipo_vehiculo], [modelo], [color]) VALUES (4, N' GP 788 PG', 1, N' C1', N' Rosa')
INSERT [dbo].[Automotores] ([id_automotor], [numero_dominio], [id_marca_tipo_vehiculo], [modelo], [color]) VALUES (5, N' OKE 680 GH', 1, N'206', N' Gris')
SET IDENTITY_INSERT [dbo].[Automotores] OFF
GO
INSERT [dbo].[AutomotoresxPersonas] ([id_automotor], [id_persona], [id_responsabilidad_legal]) VALUES (1, 5, 1)
INSERT [dbo].[AutomotoresxPersonas] ([id_automotor], [id_persona], [id_responsabilidad_legal]) VALUES (1, 7, 1)
INSERT [dbo].[AutomotoresxPersonas] ([id_automotor], [id_persona], [id_responsabilidad_legal]) VALUES (1, 1007, 1)
INSERT [dbo].[AutomotoresxPersonas] ([id_automotor], [id_persona], [id_responsabilidad_legal]) VALUES (4, 5, 1)
INSERT [dbo].[AutomotoresxPersonas] ([id_automotor], [id_persona], [id_responsabilidad_legal]) VALUES (4, 8, 1)
INSERT [dbo].[AutomotoresxPersonas] ([id_automotor], [id_persona], [id_responsabilidad_legal]) VALUES (4, 11, 1)
INSERT [dbo].[AutomotoresxPersonas] ([id_automotor], [id_persona], [id_responsabilidad_legal]) VALUES (4, 1008, 1)
INSERT [dbo].[AutomotoresxPersonas] ([id_automotor], [id_persona], [id_responsabilidad_legal]) VALUES (5, 5, 1)
INSERT [dbo].[AutomotoresxPersonas] ([id_automotor], [id_persona], [id_responsabilidad_legal]) VALUES (5, 20, 1)
GO
INSERT [dbo].[Grupos_Infracciones] ([codigo_grupo], [grupo]) VALUES (1, N'Documentacion')
INSERT [dbo].[Grupos_Infracciones] ([codigo_grupo], [grupo]) VALUES (2, N'Licencia de Conductor')
INSERT [dbo].[Grupos_Infracciones] ([codigo_grupo], [grupo]) VALUES (3, N'Vehiculos en General')
INSERT [dbo].[Grupos_Infracciones] ([codigo_grupo], [grupo]) VALUES (4, N'Semaforos')
INSERT [dbo].[Grupos_Infracciones] ([codigo_grupo], [grupo]) VALUES (10, N'Alcoholemia')
INSERT [dbo].[Grupos_Infracciones] ([codigo_grupo], [grupo]) VALUES (20, N'Circulación')
INSERT [dbo].[Grupos_Infracciones] ([codigo_grupo], [grupo]) VALUES (30, N'Transporte Escolar')
GO
SET IDENTITY_INSERT [dbo].[Infracciones] ON 

INSERT [dbo].[Infracciones] ([codigo_infraccion], [codigo_normativa], [nomenclatura], [descripcion], [codigo_articulo], [codigo_grupo], [calificacion], [estado], [habilitado_retuvo_licencia], [habilitado_retuvo_vehiculo]) VALUES (5, 8560, N'804', N'Conducir con tasas de alcoholemia superior a las admisibles.', 4, 1, N'Muy Grave', 1, 1, 1)
INSERT [dbo].[Infracciones] ([codigo_infraccion], [codigo_normativa], [nomenclatura], [descripcion], [codigo_articulo], [codigo_grupo], [calificacion], [estado], [habilitado_retuvo_licencia], [habilitado_retuvo_vehiculo]) VALUES (8, 8560, N'802', N'Conducir habiendo ingerido estupefacientes, psicotrópicos,estimulantes u otras sustancias análogas.', 5, 1, N'Muy Grave', 1, 1, 0)
INSERT [dbo].[Infracciones] ([codigo_infraccion], [codigo_normativa], [nomenclatura], [descripcion], [codigo_articulo], [codigo_grupo], [calificacion], [estado], [habilitado_retuvo_licencia], [habilitado_retuvo_vehiculo]) VALUES (12, 8560, N'1704', N'Negarse a realizar las pruebas expresamente autorizadas para determinar su grado de intoxicación al', 6, 1, N'Grave', 1, 0, 0)
INSERT [dbo].[Infracciones] ([codigo_infraccion], [codigo_normativa], [nomenclatura], [descripcion], [codigo_articulo], [codigo_grupo], [calificacion], [estado], [habilitado_retuvo_licencia], [habilitado_retuvo_vehiculo]) VALUES (13, 8560, N'304', N'Circular con vehículos que emitan gases, humos, ruidos,radiaciones u otras emanaciones contaminante', 7, 2, N'Grave', 1, 0, 0)
INSERT [dbo].[Infracciones] ([codigo_infraccion], [codigo_normativa], [nomenclatura], [descripcion], [codigo_articulo], [codigo_grupo], [calificacion], [estado], [habilitado_retuvo_licencia], [habilitado_retuvo_vehiculo]) VALUES (16, 8560, N'607', N'No respetar las vías o carriles exclusivos.', 8, 2, N'Grave', 1, 0, 0)
INSERT [dbo].[Infracciones] ([codigo_infraccion], [codigo_normativa], [nomenclatura], [descripcion], [codigo_articulo], [codigo_grupo], [calificacion], [estado], [habilitado_retuvo_licencia], [habilitado_retuvo_vehiculo]) VALUES (20, 8560, N'1301', N'Conducir sin ambas manos sobre el volante de dirección.', 9, 2, N'Grave', 1, 0, 0)
INSERT [dbo].[Infracciones] ([codigo_infraccion], [codigo_normativa], [nomenclatura], [descripcion], [codigo_articulo], [codigo_grupo], [calificacion], [estado], [habilitado_retuvo_licencia], [habilitado_retuvo_vehiculo]) VALUES (21, 8560, N'1302', N'Conducir llevando personas, bultos o animales entre los brazos o a la izquierda del conductor.', 9, 2, N'Grave', 1, 0, 0)
INSERT [dbo].[Infracciones] ([codigo_infraccion], [codigo_normativa], [nomenclatura], [descripcion], [codigo_articulo], [codigo_grupo], [calificacion], [estado], [habilitado_retuvo_licencia], [habilitado_retuvo_vehiculo]) VALUES (22, 8560, N'1303', N'Ceder el conductor a otro el control de la dirección.', 9, 2, N'Grave', 1, 0, 0)
INSERT [dbo].[Infracciones] ([codigo_infraccion], [codigo_normativa], [nomenclatura], [descripcion], [codigo_articulo], [codigo_grupo], [calificacion], [estado], [habilitado_retuvo_licencia], [habilitado_retuvo_vehiculo]) VALUES (23, 8560, N'1315', N'Circular el vehículo sin exigencias mínimas de seguridad.', 10, 2, N'Grave', 1, 0, 0)
INSERT [dbo].[Infracciones] ([codigo_infraccion], [codigo_normativa], [nomenclatura], [descripcion], [codigo_articulo], [codigo_grupo], [calificacion], [estado], [habilitado_retuvo_licencia], [habilitado_retuvo_vehiculo]) VALUES (24, 8560, N'919', N'Quedar detenido con su vehículo en una intersección constituyendo un obstáculo para la circulación.', 11, 2, N'Leve', 1, 0, 0)
INSERT [dbo].[Infracciones] ([codigo_infraccion], [codigo_normativa], [nomenclatura], [descripcion], [codigo_articulo], [codigo_grupo], [calificacion], [estado], [habilitado_retuvo_licencia], [habilitado_retuvo_vehiculo]) VALUES (25, 8560, N'410', N'Por girar a la izquierda en vías de doble mano reguladas por semáforo sin señal que lo permita.', 12, 2, N'Grave', 1, 0, 0)
INSERT [dbo].[Infracciones] ([codigo_infraccion], [codigo_normativa], [nomenclatura], [descripcion], [codigo_articulo], [codigo_grupo], [calificacion], [estado], [habilitado_retuvo_licencia], [habilitado_retuvo_vehiculo]) VALUES (26, 8560, N'611', N'Circular sin ajustarse a las normas que establecen el uso de los carriles.', 13, 2, N'Grave', 1, 0, 0)
INSERT [dbo].[Infracciones] ([codigo_infraccion], [codigo_normativa], [nomenclatura], [descripcion], [codigo_articulo], [codigo_grupo], [calificacion], [estado], [habilitado_retuvo_licencia], [habilitado_retuvo_vehiculo]) VALUES (27, 8560, N'610', N'Circular por autopistas sin ajustarse a las normas establecidas para las mismas.', 14, 2, N'Grave', 1, 0, 0)
INSERT [dbo].[Infracciones] ([codigo_infraccion], [codigo_normativa], [nomenclatura], [descripcion], [codigo_articulo], [codigo_grupo], [calificacion], [estado], [habilitado_retuvo_licencia], [habilitado_retuvo_vehiculo]) VALUES (28, 8560, N'332', N'Circular sin llevar encendidas las luces de uso nocturno más las luces de niebla, cuando existan co', 15, 2, N'Grave', 1, 0, 0)
INSERT [dbo].[Infracciones] ([codigo_infraccion], [codigo_normativa], [nomenclatura], [descripcion], [codigo_articulo], [codigo_grupo], [calificacion], [estado], [habilitado_retuvo_licencia], [habilitado_retuvo_vehiculo]) VALUES (29, 8560, N'335', N'Circular con luz alta en zonas urbanas.', 16, 2, N'Muy Grave', 1, 0, 0)
INSERT [dbo].[Infracciones] ([codigo_infraccion], [codigo_normativa], [nomenclatura], [descripcion], [codigo_articulo], [codigo_grupo], [calificacion], [estado], [habilitado_retuvo_licencia], [habilitado_retuvo_vehiculo]) VALUES (30, 8560, N'336', N'Circular con luz alta en zona rural cuando haya vehículos circulando en sentido contrario o cuando', 16, 2, N'Muy Grave', 1, 0, 0)
INSERT [dbo].[Infracciones] ([codigo_infraccion], [codigo_normativa], [nomenclatura], [descripcion], [codigo_articulo], [codigo_grupo], [calificacion], [estado], [habilitado_retuvo_licencia], [habilitado_retuvo_vehiculo]) VALUES (32, 8560, N'341', N'No llevar encendida la luz baja, las luces de posición, y la luz
de chapa de dominio, y en forma s', 41, 2, N'Grave', 1, 0, 0)
INSERT [dbo].[Infracciones] ([codigo_infraccion], [codigo_normativa], [nomenclatura], [descripcion], [codigo_articulo], [codigo_grupo], [calificacion], [estado], [habilitado_retuvo_licencia], [habilitado_retuvo_vehiculo]) VALUES (33, 8560, N'601', N'Por circular a contramano, sobre los separadores de tránsito o fuera de la calzada, salvo sobre la', 17, 2, N'Muy Grave', 1, 0, 0)
INSERT [dbo].[Infracciones] ([codigo_infraccion], [codigo_normativa], [nomenclatura], [descripcion], [codigo_articulo], [codigo_grupo], [calificacion], [estado], [habilitado_retuvo_licencia], [habilitado_retuvo_vehiculo]) VALUES (35, 8560, N'605', N'Realizar movimientos zigzagueantes, caprichosos o intempestivos y/o frenadas bruscas.', 18, 2, N'Grave', 1, 0, 0)
INSERT [dbo].[Infracciones] ([codigo_infraccion], [codigo_normativa], [nomenclatura], [descripcion], [codigo_articulo], [codigo_grupo], [calificacion], [estado], [habilitado_retuvo_licencia], [habilitado_retuvo_vehiculo]) VALUES (36, 8560, N'506', N'Reducir considerablemente la velocidad de su vehículo (salvo en caso de inminente peligro), poniend', 19, 2, N'Grave', 1, 0, 0)
INSERT [dbo].[Infracciones] ([codigo_infraccion], [codigo_normativa], [nomenclatura], [descripcion], [codigo_articulo], [codigo_grupo], [calificacion], [estado], [habilitado_retuvo_licencia], [habilitado_retuvo_vehiculo]) VALUES (39, 8560, N'921', N'Penetrar con su vehículo en una intersección o en un paso para peatones, aún cuando goce de priorid', 11, 2, N'Leve', 1, 0, 0)
INSERT [dbo].[Infracciones] ([codigo_infraccion], [codigo_normativa], [nomenclatura], [descripcion], [codigo_articulo], [codigo_grupo], [calificacion], [estado], [habilitado_retuvo_licencia], [habilitado_retuvo_vehiculo]) VALUES (41, 8560, N'502', N'No guardar distancia prudente del vehículo que lo precede.', 19, 2, N'Grave', 1, 0, 0)
INSERT [dbo].[Infracciones] ([codigo_infraccion], [codigo_normativa], [nomenclatura], [descripcion], [codigo_articulo], [codigo_grupo], [calificacion], [estado], [habilitado_retuvo_licencia], [habilitado_retuvo_vehiculo]) VALUES (42, 8560, N'602', N'Circular marcha atrás, salvo en los casos en que no sea posible marchar hacia adelante.', 21, 2, N'Grave', 1, 0, 0)
INSERT [dbo].[Infracciones] ([codigo_infraccion], [codigo_normativa], [nomenclatura], [descripcion], [codigo_articulo], [codigo_grupo], [calificacion], [estado], [habilitado_retuvo_licencia], [habilitado_retuvo_vehiculo]) VALUES (43, 8560, N'721', N'Efectuar la parada y/o el estacionamiento de manera que el vehículo obstaculice la circulación o co', 22, 2, N'Leve', 1, 0, 0)
INSERT [dbo].[Infracciones] ([codigo_infraccion], [codigo_normativa], [nomenclatura], [descripcion], [codigo_articulo], [codigo_grupo], [calificacion], [estado], [habilitado_retuvo_licencia], [habilitado_retuvo_vehiculo]) VALUES (45, 8560, N'725', N'Estacionar o detenerse en autopistas o autovías.', 23, 2, N'Leve', 1, 0, 0)
INSERT [dbo].[Infracciones] ([codigo_infraccion], [codigo_normativa], [nomenclatura], [descripcion], [codigo_articulo], [codigo_grupo], [calificacion], [estado], [habilitado_retuvo_licencia], [habilitado_retuvo_vehiculo]) VALUES (46, 8560, N'1402', N'Cruzar un paso a nivel ante la proximidad de un vehículo ferroviario y/o sin respetar las señales d', 24, 2, N'Grave', 1, 0, 0)
INSERT [dbo].[Infracciones] ([codigo_infraccion], [codigo_normativa], [nomenclatura], [descripcion], [codigo_articulo], [codigo_grupo], [calificacion], [estado], [habilitado_retuvo_licencia], [habilitado_retuvo_vehiculo]) VALUES (47, 8560, N'1403', N'Detenerse a menos de 5 mts. de los rieles del ferrocarril cuando no hubiere barrera.', 25, 2, N'Grave', 1, 0, 0)
INSERT [dbo].[Infracciones] ([codigo_infraccion], [codigo_normativa], [nomenclatura], [descripcion], [codigo_articulo], [codigo_grupo], [calificacion], [estado], [habilitado_retuvo_licencia], [habilitado_retuvo_vehiculo]) VALUES (49, 8560, N'1404', N'Detenerse obstaculizando el libre movimiento de las barreras y/o sobre los rieles del ferrocarril.', 24, 2, N'Grave', 1, 0, 0)
INSERT [dbo].[Infracciones] ([codigo_infraccion], [codigo_normativa], [nomenclatura], [descripcion], [codigo_articulo], [codigo_grupo], [calificacion], [estado], [habilitado_retuvo_licencia], [habilitado_retuvo_vehiculo]) VALUES (51, 8560, N'608', N'Circular en caminos, los ómnibus y camiones entre sí a una distancia menor a cincuenta metros.', 19, 2, N'Muy Grave', 1, 0, 0)
INSERT [dbo].[Infracciones] ([codigo_infraccion], [codigo_normativa], [nomenclatura], [descripcion], [codigo_articulo], [codigo_grupo], [calificacion], [estado], [habilitado_retuvo_licencia], [habilitado_retuvo_vehiculo]) VALUES (52, 8560, N'1810', N'Transportar animales o sustancias nauseabundas en infracción a las normas reglamentarias.', 27, 2, N'Grave', 1, 0, 0)
INSERT [dbo].[Infracciones] ([codigo_infraccion], [codigo_normativa], [nomenclatura], [descripcion], [codigo_articulo], [codigo_grupo], [calificacion], [estado], [habilitado_retuvo_licencia], [habilitado_retuvo_vehiculo]) VALUES (53, 8560, N'1811', N'Transportar arena y/o aserrín y/o escombros y/o grava y/o tierra y/o cualquier carga a granel o pol', 27, 2, N'Grave', 1, 0, 0)
INSERT [dbo].[Infracciones] ([codigo_infraccion], [codigo_normativa], [nomenclatura], [descripcion], [codigo_articulo], [codigo_grupo], [calificacion], [estado], [habilitado_retuvo_licencia], [habilitado_retuvo_vehiculo]) VALUES (54, 8560, N'1818', N'Transportar residuos que difundan olor desagradable, emanaciones nocivas o sea insalubre.', 26, 2, N'Grave', 1, 0, 0)
INSERT [dbo].[Infracciones] ([codigo_infraccion], [codigo_normativa], [nomenclatura], [descripcion], [codigo_articulo], [codigo_grupo], [calificacion], [estado], [habilitado_retuvo_licencia], [habilitado_retuvo_vehiculo]) VALUES (55, 8560, N'1813', N'Transportar carga o elemento que afecte las condiciones aerodinámicas del vehículo.', 20, 2, N'Grave', 1, 0, 0)
INSERT [dbo].[Infracciones] ([codigo_infraccion], [codigo_normativa], [nomenclatura], [descripcion], [codigo_articulo], [codigo_grupo], [calificacion], [estado], [habilitado_retuvo_licencia], [habilitado_retuvo_vehiculo]) VALUES (57, 8560, N'1814', N'Transportar carga o elemento que oculte indicadores, las luces y/o perturbe la visibilidad.', 28, 2, N'Muy Grave', 1, 0, 0)
INSERT [dbo].[Infracciones] ([codigo_infraccion], [codigo_normativa], [nomenclatura], [descripcion], [codigo_articulo], [codigo_grupo], [calificacion], [estado], [habilitado_retuvo_licencia], [habilitado_retuvo_vehiculo]) VALUES (59, 8560, N'1815', N'Transportar carga o elemento que sobresalga los límites permitidos.', 20, 2, N'Grave', 1, 0, 0)
INSERT [dbo].[Infracciones] ([codigo_infraccion], [codigo_normativa], [nomenclatura], [descripcion], [codigo_articulo], [codigo_grupo], [calificacion], [estado], [habilitado_retuvo_licencia], [habilitado_retuvo_vehiculo]) VALUES (60, 8560, N'330', N'Usar la bocina o señales acústicas; salvo en caso de peligro, y/o tener el vehículo sirena o bocina', 29, 2, N'Leve', 1, 0, 0)
INSERT [dbo].[Infracciones] ([codigo_infraccion], [codigo_normativa], [nomenclatura], [descripcion], [codigo_articulo], [codigo_grupo], [calificacion], [estado], [habilitado_retuvo_licencia], [habilitado_retuvo_vehiculo]) VALUES (62, 8560, N'803', N'Conducir utilizando auriculares y/o sistemas de comunicación de operación manual. Se permite el uso', 9, 2, N'Grave', 1, 0, 0)
INSERT [dbo].[Infracciones] ([codigo_infraccion], [codigo_normativa], [nomenclatura], [descripcion], [codigo_articulo], [codigo_grupo], [calificacion], [estado], [habilitado_retuvo_licencia], [habilitado_retuvo_vehiculo]) VALUES (63, 8560, N'1307', N'Se prohíbe el uso y el emplazamiento de pantallas de televisión en todo tipo de vehículos, que perm', 42, 2, N'Muy Grave', 1, 0, 0)
INSERT [dbo].[Infracciones] ([codigo_infraccion], [codigo_normativa], [nomenclatura], [descripcion], [codigo_articulo], [codigo_grupo], [calificacion], [estado], [habilitado_retuvo_licencia], [habilitado_retuvo_vehiculo]) VALUES (64, 8560, N'1305', N'No señalizar la colocación y/o existencia de obstáculos en la vía pública.', 42, 2, N'Grave', 1, 0, 0)
INSERT [dbo].[Infracciones] ([codigo_infraccion], [codigo_normativa], [nomenclatura], [descripcion], [codigo_articulo], [codigo_grupo], [calificacion], [estado], [habilitado_retuvo_licencia], [habilitado_retuvo_vehiculo]) VALUES (65, 8560, N'2302', N'Por circular con vehículo de emergencia en infracción a las normas establecidas para los mismos.', 30, 2, N'Grave', 1, 0, 0)
INSERT [dbo].[Infracciones] ([codigo_infraccion], [codigo_normativa], [nomenclatura], [descripcion], [codigo_articulo], [codigo_grupo], [calificacion], [estado], [habilitado_retuvo_licencia], [habilitado_retuvo_vehiculo]) VALUES (67, 8560, N'108', N'Por utilizar franquicia de tránsito no reglamentaria, o usarla indebidamente.', 31, 2, N'Grave', 1, 0, 0)
INSERT [dbo].[Infracciones] ([codigo_infraccion], [codigo_normativa], [nomenclatura], [descripcion], [codigo_articulo], [codigo_grupo], [calificacion], [estado], [habilitado_retuvo_licencia], [habilitado_retuvo_vehiculo]) VALUES (68, 8560, N'922', N'No respetar la prioridad de paso en tramos estrechos.', 37, 3, N'Grave', 1, 0, 0)
INSERT [dbo].[Infracciones] ([codigo_infraccion], [codigo_normativa], [nomenclatura], [descripcion], [codigo_articulo], [codigo_grupo], [calificacion], [estado], [habilitado_retuvo_licencia], [habilitado_retuvo_vehiculo]) VALUES (69, 8560, N'923', N'No respetar la prioridad de paso en tramos estrechos y de gran pendiente.', 38, 3, N'Grave', 1, 0, 0)
INSERT [dbo].[Infracciones] ([codigo_infraccion], [codigo_normativa], [nomenclatura], [descripcion], [codigo_articulo], [codigo_grupo], [calificacion], [estado], [habilitado_retuvo_licencia], [habilitado_retuvo_vehiculo]) VALUES (70, 8560, N'404', N'No detenerse con luz roja del semáforo.', 39, 3, N'Muy Grave', 1, 0, 0)
SET IDENTITY_INSERT [dbo].[Infracciones] OFF
GO
INSERT [dbo].[InfraccionesxActas] ([numero_acta], [codigo_infraccion]) VALUES (100, 5)
INSERT [dbo].[InfraccionesxActas] ([numero_acta], [codigo_infraccion]) VALUES (100, 12)
INSERT [dbo].[InfraccionesxActas] ([numero_acta], [codigo_infraccion]) VALUES (103, 12)
INSERT [dbo].[InfraccionesxActas] ([numero_acta], [codigo_infraccion]) VALUES (104, 20)
INSERT [dbo].[InfraccionesxActas] ([numero_acta], [codigo_infraccion]) VALUES (107, 23)
INSERT [dbo].[InfraccionesxActas] ([numero_acta], [codigo_infraccion]) VALUES (107, 26)
INSERT [dbo].[InfraccionesxActas] ([numero_acta], [codigo_infraccion]) VALUES (110, 8)
INSERT [dbo].[InfraccionesxActas] ([numero_acta], [codigo_infraccion]) VALUES (110, 12)
INSERT [dbo].[InfraccionesxActas] ([numero_acta], [codigo_infraccion]) VALUES (112, 5)
INSERT [dbo].[InfraccionesxActas] ([numero_acta], [codigo_infraccion]) VALUES (122, 5)
INSERT [dbo].[InfraccionesxActas] ([numero_acta], [codigo_infraccion]) VALUES (122, 28)
INSERT [dbo].[InfraccionesxActas] ([numero_acta], [codigo_infraccion]) VALUES (150, 8)
INSERT [dbo].[InfraccionesxActas] ([numero_acta], [codigo_infraccion]) VALUES (222, 5)
GO
SET IDENTITY_INSERT [dbo].[Inspectores] ON 

INSERT [dbo].[Inspectores] ([id_inspector], [habilitado], [id_persona], [matricula], [rango_comienzo_acta], [rango_fin_acta]) VALUES (1, 1, 5, N'4784123', 100, 200)
INSERT [dbo].[Inspectores] ([id_inspector], [habilitado], [id_persona], [matricula], [rango_comienzo_acta], [rango_fin_acta]) VALUES (2, 1, 6, N'5052131', 201, 300)
SET IDENTITY_INSERT [dbo].[Inspectores] OFF
GO
SET IDENTITY_INSERT [dbo].[Localidades] ON 

INSERT [dbo].[Localidades] ([id_localidad], [localidad], [id_provincia]) VALUES (1, N'Capital', 1)
INSERT [dbo].[Localidades] ([id_localidad], [localidad], [id_provincia]) VALUES (2, N'Río Ceballos', 1)
SET IDENTITY_INSERT [dbo].[Localidades] OFF
GO
SET IDENTITY_INSERT [dbo].[Marcas] ON 

INSERT [dbo].[Marcas] ([id_marca], [marca]) VALUES (1, N'Citroen')
INSERT [dbo].[Marcas] ([id_marca], [marca]) VALUES (2, N'Fiat')
INSERT [dbo].[Marcas] ([id_marca], [marca]) VALUES (3, N'Yamaha')
SET IDENTITY_INSERT [dbo].[Marcas] OFF
GO
SET IDENTITY_INSERT [dbo].[MarcasxTipos_vehiculos] ON 

INSERT [dbo].[MarcasxTipos_vehiculos] ([id_marca_tipo_vehiculo], [id_tipo_vehiculo], [id_marca]) VALUES (1, 1, 1)
INSERT [dbo].[MarcasxTipos_vehiculos] ([id_marca_tipo_vehiculo], [id_tipo_vehiculo], [id_marca]) VALUES (2, 2, 3)
SET IDENTITY_INSERT [dbo].[MarcasxTipos_vehiculos] OFF
GO
INSERT [dbo].[Normativas] ([codigo_normativa], [normativa]) VALUES (8560, N'Ley Provincial de Transito 8560')
GO
INSERT [dbo].[Operadores] ([id_operador], [habilitado], [id_persona], [usuario], [contraseña]) VALUES (1, 1, 6, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[Paises] ON 

INSERT [dbo].[Paises] ([id_pais], [pais]) VALUES (1, N'Argentina')
INSERT [dbo].[Paises] ([id_pais], [pais]) VALUES (2, N'Chile')
SET IDENTITY_INSERT [dbo].[Paises] OFF
GO
INSERT [dbo].[PersonaInfraccionxActa] ([id_persona], [numero_acta], [id_responsabilidad_legal]) VALUES (5, 0, 2)
INSERT [dbo].[PersonaInfraccionxActa] ([id_persona], [numero_acta], [id_responsabilidad_legal]) VALUES (5, 101, 2)
INSERT [dbo].[PersonaInfraccionxActa] ([id_persona], [numero_acta], [id_responsabilidad_legal]) VALUES (5, 150, 3)
INSERT [dbo].[PersonaInfraccionxActa] ([id_persona], [numero_acta], [id_responsabilidad_legal]) VALUES (5, 222, 2)
INSERT [dbo].[PersonaInfraccionxActa] ([id_persona], [numero_acta], [id_responsabilidad_legal]) VALUES (6, 150, 2)
INSERT [dbo].[PersonaInfraccionxActa] ([id_persona], [numero_acta], [id_responsabilidad_legal]) VALUES (9, 103, 2)
INSERT [dbo].[PersonaInfraccionxActa] ([id_persona], [numero_acta], [id_responsabilidad_legal]) VALUES (11, 104, 2)
INSERT [dbo].[PersonaInfraccionxActa] ([id_persona], [numero_acta], [id_responsabilidad_legal]) VALUES (11, 122, 2)
INSERT [dbo].[PersonaInfraccionxActa] ([id_persona], [numero_acta], [id_responsabilidad_legal]) VALUES (20, 107, 2)
INSERT [dbo].[PersonaInfraccionxActa] ([id_persona], [numero_acta], [id_responsabilidad_legal]) VALUES (20, 110, 2)
INSERT [dbo].[PersonaInfraccionxActa] ([id_persona], [numero_acta], [id_responsabilidad_legal]) VALUES (1007, 122, 4)
INSERT [dbo].[PersonaInfraccionxActa] ([id_persona], [numero_acta], [id_responsabilidad_legal]) VALUES (1009, 122, 4)
GO
SET IDENTITY_INSERT [dbo].[Personas] ON 

INSERT [dbo].[Personas] ([id_persona], [nombre], [apellido], [id_tipo_documento], [numero_documento], [id_localidad], [direccion], [codigo_postal]) VALUES (5, N'Juan', N'Lopez', 1, N'39800700', 1, N'Manuel Oribe 600', 5008)
INSERT [dbo].[Personas] ([id_persona], [nombre], [apellido], [id_tipo_documento], [numero_documento], [id_localidad], [direccion], [codigo_postal]) VALUES (6, N'Ana', N'Perez', 1, N'39400100', 1, N'Rodriguez del Busto 200', 5009)
INSERT [dbo].[Personas] ([id_persona], [nombre], [apellido], [id_tipo_documento], [numero_documento], [id_localidad], [direccion], [codigo_postal]) VALUES (7, N'Jorgelina', N'Perez', 1, N'25748963', 2, N'', 0)
INSERT [dbo].[Personas] ([id_persona], [nombre], [apellido], [id_tipo_documento], [numero_documento], [id_localidad], [direccion], [codigo_postal]) VALUES (8, N'Milagros', N'Perez', 1, N'9784231', 1, N'Rodriguez del Busto 200', 5009)
INSERT [dbo].[Personas] ([id_persona], [nombre], [apellido], [id_tipo_documento], [numero_documento], [id_localidad], [direccion], [codigo_postal]) VALUES (9, N'Melina', N'Sanchez', 2, N'38745621', 1, N'', 0)
INSERT [dbo].[Personas] ([id_persona], [nombre], [apellido], [id_tipo_documento], [numero_documento], [id_localidad], [direccion], [codigo_postal]) VALUES (11, N'Marcos', N'Lanuado', 1, N'395478423', 1, N'', 0)
INSERT [dbo].[Personas] ([id_persona], [nombre], [apellido], [id_tipo_documento], [numero_documento], [id_localidad], [direccion], [codigo_postal]) VALUES (20, N' Sofia', N'Lopez', 1, N'34789456', 1, N'', 0)
INSERT [dbo].[Personas] ([id_persona], [nombre], [apellido], [id_tipo_documento], [numero_documento], [id_localidad], [direccion], [codigo_postal]) VALUES (1007, N'Ludmila', N'Perez', 2, N'34111233', 1, N'', 0)
INSERT [dbo].[Personas] ([id_persona], [nombre], [apellido], [id_tipo_documento], [numero_documento], [id_localidad], [direccion], [codigo_postal]) VALUES (1008, N'Ivana', N'Rodriguez', 3, N'30-57894123-1', 1, N'', 0)
INSERT [dbo].[Personas] ([id_persona], [nombre], [apellido], [id_tipo_documento], [numero_documento], [id_localidad], [direccion], [codigo_postal]) VALUES (1009, N'Isabel', N'Palacios', 1, N'38456123', 1, N'Avenida 25 de Mayo 423', 4550)
SET IDENTITY_INSERT [dbo].[Personas] OFF
GO
SET IDENTITY_INSERT [dbo].[Provincias] ON 

INSERT [dbo].[Provincias] ([id_provincia], [provincia], [id_pais]) VALUES (1, N'Córdoba', 1)
INSERT [dbo].[Provincias] ([id_provincia], [provincia], [id_pais]) VALUES (2, N'Buenos Aires', 1)
SET IDENTITY_INSERT [dbo].[Provincias] OFF
GO
SET IDENTITY_INSERT [dbo].[Responsabilidades_Legales] ON 

INSERT [dbo].[Responsabilidades_Legales] ([id_responsabilidad_legal], [responsabilidad_legal]) VALUES (1, N'Titular')
INSERT [dbo].[Responsabilidades_Legales] ([id_responsabilidad_legal], [responsabilidad_legal]) VALUES (2, N'Infractor')
INSERT [dbo].[Responsabilidades_Legales] ([id_responsabilidad_legal], [responsabilidad_legal]) VALUES (3, N'Responsable Civil')
INSERT [dbo].[Responsabilidades_Legales] ([id_responsabilidad_legal], [responsabilidad_legal]) VALUES (4, N'Tutor')
SET IDENTITY_INSERT [dbo].[Responsabilidades_Legales] OFF
GO
SET IDENTITY_INSERT [dbo].[Tipos_Documentos] ON 

INSERT [dbo].[Tipos_Documentos] ([id_tipo_documento], [tipo_documento]) VALUES (1, N'DNI')
INSERT [dbo].[Tipos_Documentos] ([id_tipo_documento], [tipo_documento]) VALUES (2, N'LC')
INSERT [dbo].[Tipos_Documentos] ([id_tipo_documento], [tipo_documento]) VALUES (3, N'CUIT')
SET IDENTITY_INSERT [dbo].[Tipos_Documentos] OFF
GO
SET IDENTITY_INSERT [dbo].[Tipos_vehiculos] ON 

INSERT [dbo].[Tipos_vehiculos] ([id_tipo_vehiculo], [tipo_vehiculo]) VALUES (1, N'Auto')
INSERT [dbo].[Tipos_vehiculos] ([id_tipo_vehiculo], [tipo_vehiculo]) VALUES (2, N'Moto')
SET IDENTITY_INSERT [dbo].[Tipos_vehiculos] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Automotores]    Script Date: 1/2/2021 11:04:42 ******/
ALTER TABLE [dbo].[Automotores] ADD  CONSTRAINT [IX_Automotores] UNIQUE NONCLUSTERED 
(
	[numero_dominio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Actas]  WITH CHECK ADD  CONSTRAINT [FK_Actas_Automotores] FOREIGN KEY([id_automotor])
REFERENCES [dbo].[Automotores] ([id_automotor])
GO
ALTER TABLE [dbo].[Actas] CHECK CONSTRAINT [FK_Actas_Automotores]
GO
ALTER TABLE [dbo].[Actas]  WITH CHECK ADD  CONSTRAINT [FK_Actas_Inspectores] FOREIGN KEY([id_inspector])
REFERENCES [dbo].[Inspectores] ([id_inspector])
GO
ALTER TABLE [dbo].[Actas] CHECK CONSTRAINT [FK_Actas_Inspectores]
GO
ALTER TABLE [dbo].[Actas]  WITH CHECK ADD  CONSTRAINT [FK_Actas_Operadores] FOREIGN KEY([id_operador])
REFERENCES [dbo].[Operadores] ([id_operador])
GO
ALTER TABLE [dbo].[Actas] CHECK CONSTRAINT [FK_Actas_Operadores]
GO
ALTER TABLE [dbo].[Automotores]  WITH CHECK ADD  CONSTRAINT [FK_Automotores_MarcasxTipos_vehiculos] FOREIGN KEY([id_marca_tipo_vehiculo])
REFERENCES [dbo].[MarcasxTipos_vehiculos] ([id_marca_tipo_vehiculo])
GO
ALTER TABLE [dbo].[Automotores] CHECK CONSTRAINT [FK_Automotores_MarcasxTipos_vehiculos]
GO
ALTER TABLE [dbo].[AutomotoresxPersonas]  WITH CHECK ADD  CONSTRAINT [FK_AutomotoresxPersonas_Automotores] FOREIGN KEY([id_automotor])
REFERENCES [dbo].[Automotores] ([id_automotor])
GO
ALTER TABLE [dbo].[AutomotoresxPersonas] CHECK CONSTRAINT [FK_AutomotoresxPersonas_Automotores]
GO
ALTER TABLE [dbo].[AutomotoresxPersonas]  WITH CHECK ADD  CONSTRAINT [FK_AutomotoresxPersonas_Personas] FOREIGN KEY([id_persona])
REFERENCES [dbo].[Personas] ([id_persona])
GO
ALTER TABLE [dbo].[AutomotoresxPersonas] CHECK CONSTRAINT [FK_AutomotoresxPersonas_Personas]
GO
ALTER TABLE [dbo].[AutomotoresxPersonas]  WITH CHECK ADD  CONSTRAINT [FK_AutomotoresxPersonas_Responsabilidades_Legales] FOREIGN KEY([id_responsabilidad_legal])
REFERENCES [dbo].[Responsabilidades_Legales] ([id_responsabilidad_legal])
GO
ALTER TABLE [dbo].[AutomotoresxPersonas] CHECK CONSTRAINT [FK_AutomotoresxPersonas_Responsabilidades_Legales]
GO
ALTER TABLE [dbo].[Infracciones]  WITH CHECK ADD  CONSTRAINT [FK_Infracciones_Articulos] FOREIGN KEY([codigo_articulo])
REFERENCES [dbo].[Articulos] ([codigo_articulo])
GO
ALTER TABLE [dbo].[Infracciones] CHECK CONSTRAINT [FK_Infracciones_Articulos]
GO
ALTER TABLE [dbo].[Infracciones]  WITH CHECK ADD  CONSTRAINT [FK_Infracciones_Grupos_Infracciones] FOREIGN KEY([codigo_grupo])
REFERENCES [dbo].[Grupos_Infracciones] ([codigo_grupo])
GO
ALTER TABLE [dbo].[Infracciones] CHECK CONSTRAINT [FK_Infracciones_Grupos_Infracciones]
GO
ALTER TABLE [dbo].[Infracciones]  WITH CHECK ADD  CONSTRAINT [FK_Infracciones_Normativas] FOREIGN KEY([codigo_normativa])
REFERENCES [dbo].[Normativas] ([codigo_normativa])
GO
ALTER TABLE [dbo].[Infracciones] CHECK CONSTRAINT [FK_Infracciones_Normativas]
GO
ALTER TABLE [dbo].[InfraccionesxActas]  WITH CHECK ADD  CONSTRAINT [FK_InfraccionesxActas_Actas] FOREIGN KEY([numero_acta])
REFERENCES [dbo].[Actas] ([numero_acta])
GO
ALTER TABLE [dbo].[InfraccionesxActas] CHECK CONSTRAINT [FK_InfraccionesxActas_Actas]
GO
ALTER TABLE [dbo].[InfraccionesxActas]  WITH CHECK ADD  CONSTRAINT [FK_InfraccionesxActas_Infracciones] FOREIGN KEY([codigo_infraccion])
REFERENCES [dbo].[Infracciones] ([codigo_infraccion])
GO
ALTER TABLE [dbo].[InfraccionesxActas] CHECK CONSTRAINT [FK_InfraccionesxActas_Infracciones]
GO
ALTER TABLE [dbo].[Inspectores]  WITH CHECK ADD  CONSTRAINT [FK_Inspectores_Personas] FOREIGN KEY([id_persona])
REFERENCES [dbo].[Personas] ([id_persona])
GO
ALTER TABLE [dbo].[Inspectores] CHECK CONSTRAINT [FK_Inspectores_Personas]
GO
ALTER TABLE [dbo].[Localidades]  WITH CHECK ADD  CONSTRAINT [FK_Localidades_Provincias] FOREIGN KEY([id_provincia])
REFERENCES [dbo].[Provincias] ([id_provincia])
GO
ALTER TABLE [dbo].[Localidades] CHECK CONSTRAINT [FK_Localidades_Provincias]
GO
ALTER TABLE [dbo].[MarcasxTipos_vehiculos]  WITH CHECK ADD  CONSTRAINT [FK_MarcasxTipos_vehiculos_Marcas] FOREIGN KEY([id_marca])
REFERENCES [dbo].[Marcas] ([id_marca])
GO
ALTER TABLE [dbo].[MarcasxTipos_vehiculos] CHECK CONSTRAINT [FK_MarcasxTipos_vehiculos_Marcas]
GO
ALTER TABLE [dbo].[MarcasxTipos_vehiculos]  WITH CHECK ADD  CONSTRAINT [FK_MarcasxTipos_vehiculos_Tipos_vehiculos1] FOREIGN KEY([id_tipo_vehiculo])
REFERENCES [dbo].[Tipos_vehiculos] ([id_tipo_vehiculo])
GO
ALTER TABLE [dbo].[MarcasxTipos_vehiculos] CHECK CONSTRAINT [FK_MarcasxTipos_vehiculos_Tipos_vehiculos1]
GO
ALTER TABLE [dbo].[Operadores]  WITH CHECK ADD  CONSTRAINT [FK_Jueces_Faltas_Personas] FOREIGN KEY([id_persona])
REFERENCES [dbo].[Personas] ([id_persona])
GO
ALTER TABLE [dbo].[Operadores] CHECK CONSTRAINT [FK_Jueces_Faltas_Personas]
GO
ALTER TABLE [dbo].[PersonaInfraccionxActa]  WITH CHECK ADD  CONSTRAINT [FK_PersonaInfraccionxActa_Personas] FOREIGN KEY([id_persona])
REFERENCES [dbo].[Personas] ([id_persona])
GO
ALTER TABLE [dbo].[PersonaInfraccionxActa] CHECK CONSTRAINT [FK_PersonaInfraccionxActa_Personas]
GO
ALTER TABLE [dbo].[PersonaInfraccionxActa]  WITH CHECK ADD  CONSTRAINT [FK_PersonaInfraccionxActa_Responsabilidades_Legales] FOREIGN KEY([id_responsabilidad_legal])
REFERENCES [dbo].[Responsabilidades_Legales] ([id_responsabilidad_legal])
GO
ALTER TABLE [dbo].[PersonaInfraccionxActa] CHECK CONSTRAINT [FK_PersonaInfraccionxActa_Responsabilidades_Legales]
GO
ALTER TABLE [dbo].[Personas]  WITH CHECK ADD  CONSTRAINT [FK_Personas_Localidades] FOREIGN KEY([id_localidad])
REFERENCES [dbo].[Localidades] ([id_localidad])
GO
ALTER TABLE [dbo].[Personas] CHECK CONSTRAINT [FK_Personas_Localidades]
GO
ALTER TABLE [dbo].[Personas]  WITH CHECK ADD  CONSTRAINT [FK_Personas_Tipos_Documentos] FOREIGN KEY([id_tipo_documento])
REFERENCES [dbo].[Tipos_Documentos] ([id_tipo_documento])
GO
ALTER TABLE [dbo].[Personas] CHECK CONSTRAINT [FK_Personas_Tipos_Documentos]
GO
ALTER TABLE [dbo].[Provincias]  WITH CHECK ADD  CONSTRAINT [FK_Provincias_Paises] FOREIGN KEY([id_pais])
REFERENCES [dbo].[Paises] ([id_pais])
GO
ALTER TABLE [dbo].[Provincias] CHECK CONSTRAINT [FK_Provincias_Paises]
GO
USE [master]
GO
ALTER DATABASE [PGMClipActas] SET  READ_WRITE 
GO
