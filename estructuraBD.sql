USE [master]
GO
/****** Object:  Database [PGMClipActas]    Script Date: 2/2/2021 21:49:51 ******/
CREATE DATABASE [PGMClipActas]
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
/****** Object:  Table [dbo].[Actas]    Script Date: 2/2/2021 21:49:52 ******/
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
/****** Object:  Table [dbo].[Articulos]    Script Date: 2/2/2021 21:49:52 ******/
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
/****** Object:  Table [dbo].[Automotores]    Script Date: 2/2/2021 21:49:52 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [IX_Automotores] UNIQUE NONCLUSTERED 
(
	[numero_dominio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AutomotoresxPersonas]    Script Date: 2/2/2021 21:49:52 ******/
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
/****** Object:  Table [dbo].[Grupos_Infracciones]    Script Date: 2/2/2021 21:49:52 ******/
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
/****** Object:  Table [dbo].[Infracciones]    Script Date: 2/2/2021 21:49:52 ******/
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
/****** Object:  Table [dbo].[InfraccionesxActas]    Script Date: 2/2/2021 21:49:52 ******/
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
/****** Object:  Table [dbo].[Inspectores]    Script Date: 2/2/2021 21:49:52 ******/
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
/****** Object:  Table [dbo].[Localidades]    Script Date: 2/2/2021 21:49:52 ******/
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
/****** Object:  Table [dbo].[Marcas]    Script Date: 2/2/2021 21:49:52 ******/
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
/****** Object:  Table [dbo].[MarcasxTipos_vehiculos]    Script Date: 2/2/2021 21:49:52 ******/
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
/****** Object:  Table [dbo].[Normativas]    Script Date: 2/2/2021 21:49:52 ******/
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
/****** Object:  Table [dbo].[Operadores]    Script Date: 2/2/2021 21:49:52 ******/
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
/****** Object:  Table [dbo].[Paises]    Script Date: 2/2/2021 21:49:52 ******/
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
/****** Object:  Table [dbo].[PersonaInfraccionxActa]    Script Date: 2/2/2021 21:49:52 ******/
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
	[numero_acta] ASC,
	[id_responsabilidad_legal] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Personas]    Script Date: 2/2/2021 21:49:52 ******/
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
/****** Object:  Table [dbo].[Provincias]    Script Date: 2/2/2021 21:49:52 ******/
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
/****** Object:  Table [dbo].[Responsabilidades_Legales]    Script Date: 2/2/2021 21:49:52 ******/
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
/****** Object:  Table [dbo].[Tipos_Documentos]    Script Date: 2/2/2021 21:49:52 ******/
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
/****** Object:  Table [dbo].[Tipos_vehiculos]    Script Date: 2/2/2021 21:49:52 ******/
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
