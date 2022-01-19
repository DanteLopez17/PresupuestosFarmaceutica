USE [master]
GO
/****** Object:  Database [Farmaceutica]    Script Date: 26/11/2021 17:41:56 ******/
CREATE DATABASE [Farmaceutica]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Farmaceutica', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Farmaceutica.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Farmaceutica_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Farmaceutica_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Farmaceutica] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Farmaceutica].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Farmaceutica] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Farmaceutica] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Farmaceutica] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Farmaceutica] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Farmaceutica] SET ARITHABORT OFF 
GO
ALTER DATABASE [Farmaceutica] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Farmaceutica] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Farmaceutica] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Farmaceutica] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Farmaceutica] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Farmaceutica] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Farmaceutica] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Farmaceutica] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Farmaceutica] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Farmaceutica] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Farmaceutica] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Farmaceutica] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Farmaceutica] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Farmaceutica] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Farmaceutica] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Farmaceutica] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Farmaceutica] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Farmaceutica] SET RECOVERY FULL 
GO
ALTER DATABASE [Farmaceutica] SET  MULTI_USER 
GO
ALTER DATABASE [Farmaceutica] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Farmaceutica] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Farmaceutica] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Farmaceutica] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Farmaceutica] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Farmaceutica] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Farmaceutica', N'ON'
GO
ALTER DATABASE [Farmaceutica] SET QUERY_STORE = OFF
GO
USE [Farmaceutica]
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 26/11/2021 17:41:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cliente](
	[idCliente] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](30) NULL,
	[apellido] [varchar](30) NULL,
	[fechaNac] [date] NULL,
	[numDoc] [int] NULL,
	[idTipoDoc] [int] NULL,
 CONSTRAINT [pk_Cliente] PRIMARY KEY CLUSTERED 
(
	[idCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Profesional]    Script Date: 26/11/2021 17:41:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Profesional](
	[idProfesional] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](30) NULL,
	[apellido] [varchar](30) NULL,
	[nroMatricula] [int] NULL,
	[fechaNac] [date] NULL,
	[numDoc] [int] NULL,
	[idTipoDoc] [int] NULL,
	[idEspecialidad] [int] NULL,
 CONSTRAINT [pk_Profesional] PRIMARY KEY CLUSTERED 
(
	[idProfesional] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ObraSocial]    Script Date: 26/11/2021 17:41:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ObraSocial](
	[idObraSocial] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](50) NULL,
	[calle] [varchar](50) NULL,
	[altura] [int] NULL,
	[telefono] [int] NULL,
 CONSTRAINT [pk_ObraSocial] PRIMARY KEY CLUSTERED 
(
	[idObraSocial] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FormaPago]    Script Date: 26/11/2021 17:41:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FormaPago](
	[idFormaPago] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](20) NULL,
 CONSTRAINT [pk_FormaPago] PRIMARY KEY CLUSTERED 
(
	[idFormaPago] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Receta]    Script Date: 26/11/2021 17:41:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Receta](
	[idReceta] [int] IDENTITY(1,1) NOT NULL,
	[idCliente] [int] NULL,
	[idProfesional] [int] NULL,
	[fecha] [date] NULL,
	[idObraSocial] [int] NULL,
	[idFormaPago] [int] NULL,
	[nroSucursal] [int] NULL,
 CONSTRAINT [pk_Receta] PRIMARY KEY CLUSTERED 
(
	[idReceta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DetalleReceta]    Script Date: 26/11/2021 17:41:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetalleReceta](
	[idDetalleReceta] [int] IDENTITY(1,1) NOT NULL,
	[idReceta] [int] NULL,
	[cantidad] [int] NULL,
	[precio] [float] NULL,
	[idSuministro] [int] NULL,
	[descuento] [float] NULL,
 CONSTRAINT [pk_DetalleReceta] PRIMARY KEY CLUSTERED 
(
	[idDetalleReceta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[listadoRecetas]    Script Date: 26/11/2021 17:41:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[listadoRecetas]
as
   Select dr.idReceta, r.idCliente, c.apellido as 'apeCliente',  c.nombre as 'nomCliente', 
   r.idProfesional, p.apellido as 'apeProf', p.nombre as 'nomProf',  fecha, r.idObraSocial, 
   o.descripcion as 'ObraSocial' ,r.idFormaPago, f.descripcion as 'FormaPago', sum(dr.cantidad*dr.precio) as 'Total'
   from Receta r join Cliente c  on r.idCliente = c.idCliente
				join Profesional p on r.idProfesional = p.idProfesional
				join ObraSocial o on r.idObraSocial = o.idObraSocial
				join FormaPago f on r.idFormaPago = f.idFormaPago
				join DetalleReceta dr on dr.idReceta = r.idReceta
   group by dr.idReceta, r.idCliente, c.apellido, c.nombre, r.idProfesional, p.apellido, p.nombre,
   fecha, r.idObraSocial, o.descripcion, r.idFormaPago, f.descripcion
GO
/****** Object:  Table [dbo].[Clasificacion]    Script Date: 26/11/2021 17:41:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clasificacion](
	[idClasificacion] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](30) NULL,
 CONSTRAINT [pk_Clasificacion] PRIMARY KEY CLUSTERED 
(
	[idClasificacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cobertura]    Script Date: 26/11/2021 17:41:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cobertura](
	[idObraSocial] [int] NOT NULL,
	[idSuministro] [int] NOT NULL,
	[idLocalidad] [int] NOT NULL,
	[descuento] [bit] NULL,
	[idDescuento] [int] NULL,
 CONSTRAINT [pkCobertura] PRIMARY KEY CLUSTERED 
(
	[idObraSocial] ASC,
	[idSuministro] ASC,
	[idLocalidad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[descuento]    Script Date: 26/11/2021 17:41:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[descuento](
	[idDescuento] [int] IDENTITY(1,1) NOT NULL,
	[valor] [float] NULL,
	[porcentaje] [int] NULL,
 CONSTRAINT [pk_Descuento] PRIMARY KEY CLUSTERED 
(
	[idDescuento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Especialidad]    Script Date: 26/11/2021 17:41:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Especialidad](
	[idEspecialidad] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](30) NULL,
 CONSTRAINT [pk_Especialidad] PRIMARY KEY CLUSTERED 
(
	[idEspecialidad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Localidad]    Script Date: 26/11/2021 17:41:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Localidad](
	[idLocalidad] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](40) NULL,
 CONSTRAINT [pk_Localidad] PRIMARY KEY CLUSTERED 
(
	[idLocalidad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StockSumXSucur]    Script Date: 26/11/2021 17:41:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StockSumXSucur](
	[idSumxSuc] [int] IDENTITY(1,1) NOT NULL,
	[nroSucursal] [int] NULL,
	[idSuministro] [int] NULL,
	[Stock] [int] NULL,
 CONSTRAINT [pk_StockSumXSucur] PRIMARY KEY CLUSTERED 
(
	[idSumxSuc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sucursal]    Script Date: 26/11/2021 17:41:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sucursal](
	[nroSucursal] [int] IDENTITY(1,1) NOT NULL,
	[calle] [varchar](40) NULL,
	[altura] [int] NULL,
	[telefono] [int] NULL,
	[idLocalidad] [int] NULL,
 CONSTRAINT [pk_Sucursal] PRIMARY KEY CLUSTERED 
(
	[nroSucursal] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Suministro]    Script Date: 26/11/2021 17:41:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Suministro](
	[idSuministro] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](40) NULL,
	[precioUnitario] [float] NULL,
	[idClasificacion] [int] NULL,
	[idTipoSum] [int] NULL,
 CONSTRAINT [pk_Suministro] PRIMARY KEY CLUSTERED 
(
	[idSuministro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TiposDoc]    Script Date: 26/11/2021 17:41:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TiposDoc](
	[idTipoDoc] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](30) NULL,
 CONSTRAINT [pk_TiposDoc] PRIMARY KEY CLUSTERED 
(
	[idTipoDoc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoSum]    Script Date: 26/11/2021 17:41:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoSum](
	[idTipoSum] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](30) NULL,
 CONSTRAINT [pk_TipoSum] PRIMARY KEY CLUSTERED 
(
	[idTipoSum] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[usuarios]    Script Date: 26/11/2021 17:41:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[usuarios](
	[usuario] [varchar](20) NULL,
	[clave] [int] NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Clasificacion] ON 
GO
INSERT [dbo].[Clasificacion] ([idClasificacion], [descripcion]) VALUES (1, N'Venta libre')
GO
INSERT [dbo].[Clasificacion] ([idClasificacion], [descripcion]) VALUES (2, N'Bajo receta')
GO
SET IDENTITY_INSERT [dbo].[Clasificacion] OFF
GO
SET IDENTITY_INSERT [dbo].[Cliente] ON 
GO
INSERT [dbo].[Cliente] ([idCliente], [nombre], [apellido], [fechaNac], [numDoc], [idTipoDoc]) VALUES (2, N'Robertin', N'Cortes', CAST(N'1998-05-12' AS Date), 35698658, 2)
GO
INSERT [dbo].[Cliente] ([idCliente], [nombre], [apellido], [fechaNac], [numDoc], [idTipoDoc]) VALUES (5, N'Daniel', N'Romero', CAST(N'2010-12-10' AS Date), 32154741, 1)
GO
INSERT [dbo].[Cliente] ([idCliente], [nombre], [apellido], [fechaNac], [numDoc], [idTipoDoc]) VALUES (31, N'Claudia', N'Gomez', CAST(N'1982-11-12' AS Date), 35896541, 1)
GO
INSERT [dbo].[Cliente] ([idCliente], [nombre], [apellido], [fechaNac], [numDoc], [idTipoDoc]) VALUES (33, N'LUIS', N'ACEVEDO', CAST(N'1983-11-09' AS Date), 32165498, 1)
GO
INSERT [dbo].[Cliente] ([idCliente], [nombre], [apellido], [fechaNac], [numDoc], [idTipoDoc]) VALUES (35, N'Belen', N'Dias', CAST(N'2000-08-11' AS Date), 25987468, 1)
GO
INSERT [dbo].[Cliente] ([idCliente], [nombre], [apellido], [fechaNac], [numDoc], [idTipoDoc]) VALUES (36, N'Carmen', N'Cortes', CAST(N'1983-10-12' AS Date), 32165123, 1)
GO
INSERT [dbo].[Cliente] ([idCliente], [nombre], [apellido], [fechaNac], [numDoc], [idTipoDoc]) VALUES (37, N'Cristian', N'Vega', CAST(N'2001-07-11' AS Date), 25748963, 1)
GO
INSERT [dbo].[Cliente] ([idCliente], [nombre], [apellido], [fechaNac], [numDoc], [idTipoDoc]) VALUES (38, N'Carina', N'Ponce', CAST(N'1988-02-03' AS Date), 25703156, 1)
GO
INSERT [dbo].[Cliente] ([idCliente], [nombre], [apellido], [fechaNac], [numDoc], [idTipoDoc]) VALUES (40, N'Lucas', N'Caceres', CAST(N'2021-11-01' AS Date), 25874888, 3)
GO
INSERT [dbo].[Cliente] ([idCliente], [nombre], [apellido], [fechaNac], [numDoc], [idTipoDoc]) VALUES (41, N'Juliana', N'Alvarez', CAST(N'2021-11-02' AS Date), 32165422, 1)
GO
SET IDENTITY_INSERT [dbo].[Cliente] OFF
GO
INSERT [dbo].[Cobertura] ([idObraSocial], [idSuministro], [idLocalidad], [descuento], [idDescuento]) VALUES (1, 1, 1, 1, 4)
GO
INSERT [dbo].[Cobertura] ([idObraSocial], [idSuministro], [idLocalidad], [descuento], [idDescuento]) VALUES (1, 1, 4, 1, 4)
GO
INSERT [dbo].[Cobertura] ([idObraSocial], [idSuministro], [idLocalidad], [descuento], [idDescuento]) VALUES (1, 1, 5, 1, 5)
GO
INSERT [dbo].[Cobertura] ([idObraSocial], [idSuministro], [idLocalidad], [descuento], [idDescuento]) VALUES (1, 1, 7, 1, 7)
GO
INSERT [dbo].[Cobertura] ([idObraSocial], [idSuministro], [idLocalidad], [descuento], [idDescuento]) VALUES (1, 1, 8, 1, 3)
GO
INSERT [dbo].[Cobertura] ([idObraSocial], [idSuministro], [idLocalidad], [descuento], [idDescuento]) VALUES (1, 5, 1, 1, 3)
GO
INSERT [dbo].[Cobertura] ([idObraSocial], [idSuministro], [idLocalidad], [descuento], [idDescuento]) VALUES (1, 16, 1, 1, 8)
GO
INSERT [dbo].[Cobertura] ([idObraSocial], [idSuministro], [idLocalidad], [descuento], [idDescuento]) VALUES (1, 22, 1, 1, 5)
GO
INSERT [dbo].[Cobertura] ([idObraSocial], [idSuministro], [idLocalidad], [descuento], [idDescuento]) VALUES (1, 23, 13, 1, 12)
GO
INSERT [dbo].[Cobertura] ([idObraSocial], [idSuministro], [idLocalidad], [descuento], [idDescuento]) VALUES (1, 30, 1, 0, 2)
GO
INSERT [dbo].[Cobertura] ([idObraSocial], [idSuministro], [idLocalidad], [descuento], [idDescuento]) VALUES (2, 23, 2, 1, 6)
GO
INSERT [dbo].[Cobertura] ([idObraSocial], [idSuministro], [idLocalidad], [descuento], [idDescuento]) VALUES (3, 17, 7, 0, 2)
GO
INSERT [dbo].[Cobertura] ([idObraSocial], [idSuministro], [idLocalidad], [descuento], [idDescuento]) VALUES (3, 32, 1, 0, 2)
GO
INSERT [dbo].[Cobertura] ([idObraSocial], [idSuministro], [idLocalidad], [descuento], [idDescuento]) VALUES (3, 32, 2, 1, 6)
GO
INSERT [dbo].[Cobertura] ([idObraSocial], [idSuministro], [idLocalidad], [descuento], [idDescuento]) VALUES (4, 22, 10, 1, 6)
GO
INSERT [dbo].[Cobertura] ([idObraSocial], [idSuministro], [idLocalidad], [descuento], [idDescuento]) VALUES (5, 26, 3, 1, 4)
GO
INSERT [dbo].[Cobertura] ([idObraSocial], [idSuministro], [idLocalidad], [descuento], [idDescuento]) VALUES (6, 23, 11, 1, 4)
GO
SET IDENTITY_INSERT [dbo].[descuento] ON 
GO
INSERT [dbo].[descuento] ([idDescuento], [valor], [porcentaje]) VALUES (2, 0, 0)
GO
INSERT [dbo].[descuento] ([idDescuento], [valor], [porcentaje]) VALUES (3, 0.05, 5)
GO
INSERT [dbo].[descuento] ([idDescuento], [valor], [porcentaje]) VALUES (4, 0.1, 10)
GO
INSERT [dbo].[descuento] ([idDescuento], [valor], [porcentaje]) VALUES (5, 0.15, 15)
GO
INSERT [dbo].[descuento] ([idDescuento], [valor], [porcentaje]) VALUES (6, 0.2, 20)
GO
INSERT [dbo].[descuento] ([idDescuento], [valor], [porcentaje]) VALUES (7, 0.25, 25)
GO
INSERT [dbo].[descuento] ([idDescuento], [valor], [porcentaje]) VALUES (8, 0.3, 30)
GO
INSERT [dbo].[descuento] ([idDescuento], [valor], [porcentaje]) VALUES (9, 0.35, 35)
GO
INSERT [dbo].[descuento] ([idDescuento], [valor], [porcentaje]) VALUES (10, 0.4, 40)
GO
INSERT [dbo].[descuento] ([idDescuento], [valor], [porcentaje]) VALUES (11, 0.45, 45)
GO
INSERT [dbo].[descuento] ([idDescuento], [valor], [porcentaje]) VALUES (12, 0.5, 50)
GO
SET IDENTITY_INSERT [dbo].[descuento] OFF
GO
SET IDENTITY_INSERT [dbo].[DetalleReceta] ON 
GO
INSERT [dbo].[DetalleReceta] ([idDetalleReceta], [idReceta], [cantidad], [precio], [idSuministro], [descuento]) VALUES (3, 4, 10, 20, 1, NULL)
GO
INSERT [dbo].[DetalleReceta] ([idDetalleReceta], [idReceta], [cantidad], [precio], [idSuministro], [descuento]) VALUES (4, 5, 4, 20, 16, NULL)
GO
INSERT [dbo].[DetalleReceta] ([idDetalleReceta], [idReceta], [cantidad], [precio], [idSuministro], [descuento]) VALUES (5, 5, 20, 100, 1, NULL)
GO
INSERT [dbo].[DetalleReceta] ([idDetalleReceta], [idReceta], [cantidad], [precio], [idSuministro], [descuento]) VALUES (6, 5, 20, 100, 1, NULL)
GO
INSERT [dbo].[DetalleReceta] ([idDetalleReceta], [idReceta], [cantidad], [precio], [idSuministro], [descuento]) VALUES (7, 5, 20, 100, 5, NULL)
GO
INSERT [dbo].[DetalleReceta] ([idDetalleReceta], [idReceta], [cantidad], [precio], [idSuministro], [descuento]) VALUES (8, 5, 20, 100, 5, NULL)
GO
INSERT [dbo].[DetalleReceta] ([idDetalleReceta], [idReceta], [cantidad], [precio], [idSuministro], [descuento]) VALUES (9, 5, 20, 100, 16, NULL)
GO
INSERT [dbo].[DetalleReceta] ([idDetalleReceta], [idReceta], [cantidad], [precio], [idSuministro], [descuento]) VALUES (10, 5, 20, 100, 16, NULL)
GO
INSERT [dbo].[DetalleReceta] ([idDetalleReceta], [idReceta], [cantidad], [precio], [idSuministro], [descuento]) VALUES (11, 6, 20, 100, 1, NULL)
GO
INSERT [dbo].[DetalleReceta] ([idDetalleReceta], [idReceta], [cantidad], [precio], [idSuministro], [descuento]) VALUES (12, 6, 20, 100, 1, NULL)
GO
INSERT [dbo].[DetalleReceta] ([idDetalleReceta], [idReceta], [cantidad], [precio], [idSuministro], [descuento]) VALUES (13, 6, 20, 100, 5, NULL)
GO
INSERT [dbo].[DetalleReceta] ([idDetalleReceta], [idReceta], [cantidad], [precio], [idSuministro], [descuento]) VALUES (14, 6, 20, 100, 5, NULL)
GO
INSERT [dbo].[DetalleReceta] ([idDetalleReceta], [idReceta], [cantidad], [precio], [idSuministro], [descuento]) VALUES (15, 6, 20, 100, 16, NULL)
GO
INSERT [dbo].[DetalleReceta] ([idDetalleReceta], [idReceta], [cantidad], [precio], [idSuministro], [descuento]) VALUES (16, 6, 35, 180, 5, NULL)
GO
INSERT [dbo].[DetalleReceta] ([idDetalleReceta], [idReceta], [cantidad], [precio], [idSuministro], [descuento]) VALUES (17, 6, 20, 5000, 1, NULL)
GO
INSERT [dbo].[DetalleReceta] ([idDetalleReceta], [idReceta], [cantidad], [precio], [idSuministro], [descuento]) VALUES (18, 6, 20, 5000, 5, NULL)
GO
INSERT [dbo].[DetalleReceta] ([idDetalleReceta], [idReceta], [cantidad], [precio], [idSuministro], [descuento]) VALUES (19, 7, 20, 180, 1, NULL)
GO
INSERT [dbo].[DetalleReceta] ([idDetalleReceta], [idReceta], [cantidad], [precio], [idSuministro], [descuento]) VALUES (20, 7, 100, 180, 5, NULL)
GO
INSERT [dbo].[DetalleReceta] ([idDetalleReceta], [idReceta], [cantidad], [precio], [idSuministro], [descuento]) VALUES (21, 7, 1000, 1000, 16, NULL)
GO
INSERT [dbo].[DetalleReceta] ([idDetalleReceta], [idReceta], [cantidad], [precio], [idSuministro], [descuento]) VALUES (22, 7, 1000, 150, 5, NULL)
GO
INSERT [dbo].[DetalleReceta] ([idDetalleReceta], [idReceta], [cantidad], [precio], [idSuministro], [descuento]) VALUES (23, 8, 2, 120, 5, NULL)
GO
INSERT [dbo].[DetalleReceta] ([idDetalleReceta], [idReceta], [cantidad], [precio], [idSuministro], [descuento]) VALUES (24, 8, 3, 110.5, 1, NULL)
GO
INSERT [dbo].[DetalleReceta] ([idDetalleReceta], [idReceta], [cantidad], [precio], [idSuministro], [descuento]) VALUES (25, 8, 4, 456, 17, NULL)
GO
INSERT [dbo].[DetalleReceta] ([idDetalleReceta], [idReceta], [cantidad], [precio], [idSuministro], [descuento]) VALUES (26, 9, 3, 221.35000610351563, 1, NULL)
GO
INSERT [dbo].[DetalleReceta] ([idDetalleReceta], [idReceta], [cantidad], [precio], [idSuministro], [descuento]) VALUES (27, 9, 2, 120, 5, NULL)
GO
INSERT [dbo].[DetalleReceta] ([idDetalleReceta], [idReceta], [cantidad], [precio], [idSuministro], [descuento]) VALUES (28, 9, 2, 150, 16, NULL)
GO
INSERT [dbo].[DetalleReceta] ([idDetalleReceta], [idReceta], [cantidad], [precio], [idSuministro], [descuento]) VALUES (29, 9, 3, 438, 17, NULL)
GO
INSERT [dbo].[DetalleReceta] ([idDetalleReceta], [idReceta], [cantidad], [precio], [idSuministro], [descuento]) VALUES (30, 12, 20, 180, 5, NULL)
GO
INSERT [dbo].[DetalleReceta] ([idDetalleReceta], [idReceta], [cantidad], [precio], [idSuministro], [descuento]) VALUES (31, 17, 20, 180, 1, NULL)
GO
INSERT [dbo].[DetalleReceta] ([idDetalleReceta], [idReceta], [cantidad], [precio], [idSuministro], [descuento]) VALUES (32, 19, 20, 180, 1, NULL)
GO
INSERT [dbo].[DetalleReceta] ([idDetalleReceta], [idReceta], [cantidad], [precio], [idSuministro], [descuento]) VALUES (33, 19, 3, 185, 5, NULL)
GO
INSERT [dbo].[DetalleReceta] ([idDetalleReceta], [idReceta], [cantidad], [precio], [idSuministro], [descuento]) VALUES (34, 19, 2, 120, 16, NULL)
GO
INSERT [dbo].[DetalleReceta] ([idDetalleReceta], [idReceta], [cantidad], [precio], [idSuministro], [descuento]) VALUES (35, 19, 20, 185, 17, NULL)
GO
INSERT [dbo].[DetalleReceta] ([idDetalleReceta], [idReceta], [cantidad], [precio], [idSuministro], [descuento]) VALUES (36, 24, 4, 50, 5, NULL)
GO
INSERT [dbo].[DetalleReceta] ([idDetalleReceta], [idReceta], [cantidad], [precio], [idSuministro], [descuento]) VALUES (37, 25, 20, 180, 16, NULL)
GO
INSERT [dbo].[DetalleReceta] ([idDetalleReceta], [idReceta], [cantidad], [precio], [idSuministro], [descuento]) VALUES (38, 46, 20, 180, 1, NULL)
GO
INSERT [dbo].[DetalleReceta] ([idDetalleReceta], [idReceta], [cantidad], [precio], [idSuministro], [descuento]) VALUES (39, 46, 20, 150, 16, NULL)
GO
INSERT [dbo].[DetalleReceta] ([idDetalleReceta], [idReceta], [cantidad], [precio], [idSuministro], [descuento]) VALUES (40, 46, 20, 50, 5, NULL)
GO
INSERT [dbo].[DetalleReceta] ([idDetalleReceta], [idReceta], [cantidad], [precio], [idSuministro], [descuento]) VALUES (41, 48, 20, 180, 1, NULL)
GO
INSERT [dbo].[DetalleReceta] ([idDetalleReceta], [idReceta], [cantidad], [precio], [idSuministro], [descuento]) VALUES (42, 13, 20, 50, 5, NULL)
GO
INSERT [dbo].[DetalleReceta] ([idDetalleReceta], [idReceta], [cantidad], [precio], [idSuministro], [descuento]) VALUES (43, 50, 1000, 180, 5, NULL)
GO
INSERT [dbo].[DetalleReceta] ([idDetalleReceta], [idReceta], [cantidad], [precio], [idSuministro], [descuento]) VALUES (44, 50, 2, 180, 1, NULL)
GO
INSERT [dbo].[DetalleReceta] ([idDetalleReceta], [idReceta], [cantidad], [precio], [idSuministro], [descuento]) VALUES (45, 50, 0, 0, 1, NULL)
GO
INSERT [dbo].[DetalleReceta] ([idDetalleReceta], [idReceta], [cantidad], [precio], [idSuministro], [descuento]) VALUES (46, 52, 2, 100, 1, NULL)
GO
INSERT [dbo].[DetalleReceta] ([idDetalleReceta], [idReceta], [cantidad], [precio], [idSuministro], [descuento]) VALUES (47, 52, 2, 100, 5, NULL)
GO
INSERT [dbo].[DetalleReceta] ([idDetalleReceta], [idReceta], [cantidad], [precio], [idSuministro], [descuento]) VALUES (48, 52, 1, 100, 1, NULL)
GO
INSERT [dbo].[DetalleReceta] ([idDetalleReceta], [idReceta], [cantidad], [precio], [idSuministro], [descuento]) VALUES (49, 55, 2, 100, 1, NULL)
GO
INSERT [dbo].[DetalleReceta] ([idDetalleReceta], [idReceta], [cantidad], [precio], [idSuministro], [descuento]) VALUES (50, 56, 1, 100, 1, 25)
GO
INSERT [dbo].[DetalleReceta] ([idDetalleReceta], [idReceta], [cantidad], [precio], [idSuministro], [descuento]) VALUES (51, 56, 0, 0, 5, 0)
GO
INSERT [dbo].[DetalleReceta] ([idDetalleReceta], [idReceta], [cantidad], [precio], [idSuministro], [descuento]) VALUES (52, 56, 2, 100, 5, 50)
GO
INSERT [dbo].[DetalleReceta] ([idDetalleReceta], [idReceta], [cantidad], [precio], [idSuministro], [descuento]) VALUES (53, 56, 2, 100, 5, 50)
GO
INSERT [dbo].[DetalleReceta] ([idDetalleReceta], [idReceta], [cantidad], [precio], [idSuministro], [descuento]) VALUES (54, 57, 1, 100, 1, 25)
GO
INSERT [dbo].[DetalleReceta] ([idDetalleReceta], [idReceta], [cantidad], [precio], [idSuministro], [descuento]) VALUES (55, 57, 1, 100, 5, 0)
GO
INSERT [dbo].[DetalleReceta] ([idDetalleReceta], [idReceta], [cantidad], [precio], [idSuministro], [descuento]) VALUES (56, 58, 2, 110, 1, 0)
GO
INSERT [dbo].[DetalleReceta] ([idDetalleReceta], [idReceta], [cantidad], [precio], [idSuministro], [descuento]) VALUES (57, 58, 2, 110, 5, 0)
GO
INSERT [dbo].[DetalleReceta] ([idDetalleReceta], [idReceta], [cantidad], [precio], [idSuministro], [descuento]) VALUES (58, 59, 1, 45, 1, 0)
GO
INSERT [dbo].[DetalleReceta] ([idDetalleReceta], [idReceta], [cantidad], [precio], [idSuministro], [descuento]) VALUES (59, 59, 2, 25, 1, 0)
GO
INSERT [dbo].[DetalleReceta] ([idDetalleReceta], [idReceta], [cantidad], [precio], [idSuministro], [descuento]) VALUES (60, 60, 20, 110, 1, 0)
GO
INSERT [dbo].[DetalleReceta] ([idDetalleReceta], [idReceta], [cantidad], [precio], [idSuministro], [descuento]) VALUES (61, 60, 2, 165, 18, 0)
GO
INSERT [dbo].[DetalleReceta] ([idDetalleReceta], [idReceta], [cantidad], [precio], [idSuministro], [descuento]) VALUES (62, 62, 1, 110, 1, 25)
GO
INSERT [dbo].[DetalleReceta] ([idDetalleReceta], [idReceta], [cantidad], [precio], [idSuministro], [descuento]) VALUES (63, 62, 2, 198, 17, 0)
GO
INSERT [dbo].[DetalleReceta] ([idDetalleReceta], [idReceta], [cantidad], [precio], [idSuministro], [descuento]) VALUES (64, 64, 2, 45, 1, 0)
GO
INSERT [dbo].[DetalleReceta] ([idDetalleReceta], [idReceta], [cantidad], [precio], [idSuministro], [descuento]) VALUES (65, 64, 1, 37.5, 5, 0)
GO
INSERT [dbo].[DetalleReceta] ([idDetalleReceta], [idReceta], [cantidad], [precio], [idSuministro], [descuento]) VALUES (66, 64, 2, 25, 16, 0)
GO
INSERT [dbo].[DetalleReceta] ([idDetalleReceta], [idReceta], [cantidad], [precio], [idSuministro], [descuento]) VALUES (68, 66, 2, 110, 1, 50)
GO
INSERT [dbo].[DetalleReceta] ([idDetalleReceta], [idReceta], [cantidad], [precio], [idSuministro], [descuento]) VALUES (70, 68, 2, 110, 1, 50)
GO
INSERT [dbo].[DetalleReceta] ([idDetalleReceta], [idReceta], [cantidad], [precio], [idSuministro], [descuento]) VALUES (72, 69, 2, 110, 1, 50)
GO
INSERT [dbo].[DetalleReceta] ([idDetalleReceta], [idReceta], [cantidad], [precio], [idSuministro], [descuento]) VALUES (73, 70, 2, 25, 20, 0)
GO
INSERT [dbo].[DetalleReceta] ([idDetalleReceta], [idReceta], [cantidad], [precio], [idSuministro], [descuento]) VALUES (74, 70, 3, 30, 24, 0)
GO
INSERT [dbo].[DetalleReceta] ([idDetalleReceta], [idReceta], [cantidad], [precio], [idSuministro], [descuento]) VALUES (75, 70, 3, 25, 21, 0)
GO
INSERT [dbo].[DetalleReceta] ([idDetalleReceta], [idReceta], [cantidad], [precio], [idSuministro], [descuento]) VALUES (76, 71, 3, 110, 1, 75)
GO
INSERT [dbo].[DetalleReceta] ([idDetalleReceta], [idReceta], [cantidad], [precio], [idSuministro], [descuento]) VALUES (77, 72, 3, 110, 1, 75)
GO
INSERT [dbo].[DetalleReceta] ([idDetalleReceta], [idReceta], [cantidad], [precio], [idSuministro], [descuento]) VALUES (78, 72, 3, 110, 1, 75)
GO
INSERT [dbo].[DetalleReceta] ([idDetalleReceta], [idReceta], [cantidad], [precio], [idSuministro], [descuento]) VALUES (79, 73, 0, 0, 1, 0)
GO
INSERT [dbo].[DetalleReceta] ([idDetalleReceta], [idReceta], [cantidad], [precio], [idSuministro], [descuento]) VALUES (80, 73, 0, 0, 1, 0)
GO
INSERT [dbo].[DetalleReceta] ([idDetalleReceta], [idReceta], [cantidad], [precio], [idSuministro], [descuento]) VALUES (81, 74, 2, 77.550003051757812, 1, 35.25)
GO
INSERT [dbo].[DetalleReceta] ([idDetalleReceta], [idReceta], [cantidad], [precio], [idSuministro], [descuento]) VALUES (84, 75, 0, 52.875, 1, 0)
GO
INSERT [dbo].[DetalleReceta] ([idDetalleReceta], [idReceta], [cantidad], [precio], [idSuministro], [descuento]) VALUES (85, 76, 2, 77.550003051757812, 1, 35.25)
GO
INSERT [dbo].[DetalleReceta] ([idDetalleReceta], [idReceta], [cantidad], [precio], [idSuministro], [descuento]) VALUES (86, 77, 0, 52.875, 1, 0)
GO
INSERT [dbo].[DetalleReceta] ([idDetalleReceta], [idReceta], [cantidad], [precio], [idSuministro], [descuento]) VALUES (87, 78, 0, 52.875, 1, 0)
GO
INSERT [dbo].[DetalleReceta] ([idDetalleReceta], [idReceta], [cantidad], [precio], [idSuministro], [descuento]) VALUES (88, 78, 2, 77.550003051757812, 1, 35.25)
GO
INSERT [dbo].[DetalleReceta] ([idDetalleReceta], [idReceta], [cantidad], [precio], [idSuministro], [descuento]) VALUES (89, 79, 1, 77.550003051757812, 1, 17.63)
GO
INSERT [dbo].[DetalleReceta] ([idDetalleReceta], [idReceta], [cantidad], [precio], [idSuministro], [descuento]) VALUES (90, 79, 1, 165, 5, 37.5)
GO
INSERT [dbo].[DetalleReceta] ([idDetalleReceta], [idReceta], [cantidad], [precio], [idSuministro], [descuento]) VALUES (91, 79, 2, 456.5, 25, 0)
GO
INSERT [dbo].[DetalleReceta] ([idDetalleReceta], [idReceta], [cantidad], [precio], [idSuministro], [descuento]) VALUES (92, 79, 0, 52.875, 1, 0)
GO
INSERT [dbo].[DetalleReceta] ([idDetalleReceta], [idReceta], [cantidad], [precio], [idSuministro], [descuento]) VALUES (93, 80, 2, 77.550003051757812, 1, 35.25)
GO
INSERT [dbo].[DetalleReceta] ([idDetalleReceta], [idReceta], [cantidad], [precio], [idSuministro], [descuento]) VALUES (94, 80, 0, 311.25, 25, 0)
GO
INSERT [dbo].[DetalleReceta] ([idDetalleReceta], [idReceta], [cantidad], [precio], [idSuministro], [descuento]) VALUES (95, 80, 2, 521.4000244140625, 18, 0)
GO
INSERT [dbo].[DetalleReceta] ([idDetalleReceta], [idReceta], [cantidad], [precio], [idSuministro], [descuento]) VALUES (96, 80, 1, 456.5, 25, 0)
GO
INSERT [dbo].[DetalleReceta] ([idDetalleReceta], [idReceta], [cantidad], [precio], [idSuministro], [descuento]) VALUES (97, 81, 2, 52.875, 1, 35.25)
GO
INSERT [dbo].[DetalleReceta] ([idDetalleReceta], [idReceta], [cantidad], [precio], [idSuministro], [descuento]) VALUES (98, 84, -1, 148.05000305175781, 1, -17.63)
GO
INSERT [dbo].[DetalleReceta] ([idDetalleReceta], [idReceta], [cantidad], [precio], [idSuministro], [descuento]) VALUES (99, 84, 0, 148.05000305175781, 1, 0)
GO
INSERT [dbo].[DetalleReceta] ([idDetalleReceta], [idReceta], [cantidad], [precio], [idSuministro], [descuento]) VALUES (102, 85, 2, 176.25, 19, 0)
GO
INSERT [dbo].[DetalleReceta] ([idDetalleReceta], [idReceta], [cantidad], [precio], [idSuministro], [descuento]) VALUES (103, 85, 3, 472.61251831054688, 24, 0)
GO
INSERT [dbo].[DetalleReceta] ([idDetalleReceta], [idReceta], [cantidad], [precio], [idSuministro], [descuento]) VALUES (104, 85, 3, 52.875, 1, 0)
GO
INSERT [dbo].[DetalleReceta] ([idDetalleReceta], [idReceta], [cantidad], [precio], [idSuministro], [descuento]) VALUES (105, 85, 2, 176.25, 19, 0)
GO
INSERT [dbo].[DetalleReceta] ([idDetalleReceta], [idReceta], [cantidad], [precio], [idSuministro], [descuento]) VALUES (106, 85, 1, 238.95001220703125, 27, 0)
GO
INSERT [dbo].[DetalleReceta] ([idDetalleReceta], [idReceta], [cantidad], [precio], [idSuministro], [descuento]) VALUES (108, 85, 5, 112.5, 5, 0)
GO
INSERT [dbo].[DetalleReceta] ([idDetalleReceta], [idReceta], [cantidad], [precio], [idSuministro], [descuento]) VALUES (109, 85, 0, 226.5, 20, 0)
GO
INSERT [dbo].[DetalleReceta] ([idDetalleReceta], [idReceta], [cantidad], [precio], [idSuministro], [descuento]) VALUES (110, 85, 0, 142.5, 28, 0)
GO
INSERT [dbo].[DetalleReceta] ([idDetalleReceta], [idReceta], [cantidad], [precio], [idSuministro], [descuento]) VALUES (112, 86, 2, 52.875, 1, 0)
GO
INSERT [dbo].[DetalleReceta] ([idDetalleReceta], [idReceta], [cantidad], [precio], [idSuministro], [descuento]) VALUES (113, 86, 3, 112.5, 5, 0)
GO
INSERT [dbo].[DetalleReceta] ([idDetalleReceta], [idReceta], [cantidad], [precio], [idSuministro], [descuento]) VALUES (114, 87, 2, 315, 5, 0)
GO
INSERT [dbo].[DetalleReceta] ([idDetalleReceta], [idReceta], [cantidad], [precio], [idSuministro], [descuento]) VALUES (115, 88, 2, 52.875, 1, 35.25)
GO
INSERT [dbo].[DetalleReceta] ([idDetalleReceta], [idReceta], [cantidad], [precio], [idSuministro], [descuento]) VALUES (116, 88, 2, 112.5, 5, 75)
GO
INSERT [dbo].[DetalleReceta] ([idDetalleReceta], [idReceta], [cantidad], [precio], [idSuministro], [descuento]) VALUES (117, 88, 3, 112.5, 16, 112.5)
GO
INSERT [dbo].[DetalleReceta] ([idDetalleReceta], [idReceta], [cantidad], [precio], [idSuministro], [descuento]) VALUES (118, 88, 1, 374.625, 17, 0)
GO
INSERT [dbo].[DetalleReceta] ([idDetalleReceta], [idReceta], [cantidad], [precio], [idSuministro], [descuento]) VALUES (119, 88, 1, 355.5, 18, 0)
GO
INSERT [dbo].[DetalleReceta] ([idDetalleReceta], [idReceta], [cantidad], [precio], [idSuministro], [descuento]) VALUES (121, 89, 1, 258.5, 19, 0)
GO
INSERT [dbo].[DetalleReceta] ([idDetalleReceta], [idReceta], [cantidad], [precio], [idSuministro], [descuento]) VALUES (122, 89, 3, 96.800003051757812, 1, 0)
GO
INSERT [dbo].[DetalleReceta] ([idDetalleReceta], [idReceta], [cantidad], [precio], [idSuministro], [descuento]) VALUES (123, 89, 3, 275.22000122070312, 29, 0)
GO
INSERT [dbo].[DetalleReceta] ([idDetalleReceta], [idReceta], [cantidad], [precio], [idSuministro], [descuento]) VALUES (124, 89, 1, 165, 5, 0)
GO
INSERT [dbo].[DetalleReceta] ([idDetalleReceta], [idReceta], [cantidad], [precio], [idSuministro], [descuento]) VALUES (125, 89, 2, 173.80000305175781, 30, 0)
GO
INSERT [dbo].[DetalleReceta] ([idDetalleReceta], [idReceta], [cantidad], [precio], [idSuministro], [descuento]) VALUES (126, 90, 3, 165, 16, 112.5)
GO
INSERT [dbo].[DetalleReceta] ([idDetalleReceta], [idReceta], [cantidad], [precio], [idSuministro], [descuento]) VALUES (127, 90, 2, 165, 5, 75)
GO
INSERT [dbo].[DetalleReceta] ([idDetalleReceta], [idReceta], [cantidad], [precio], [idSuministro], [descuento]) VALUES (128, 90, 2, 440.82501220703125, 23, 0)
GO
INSERT [dbo].[DetalleReceta] ([idDetalleReceta], [idReceta], [cantidad], [precio], [idSuministro], [descuento]) VALUES (129, 91, 0, 0, 1, 0)
GO
INSERT [dbo].[DetalleReceta] ([idDetalleReceta], [idReceta], [cantidad], [precio], [idSuministro], [descuento]) VALUES (130, 91, 0, 0, 1, 0)
GO
INSERT [dbo].[DetalleReceta] ([idDetalleReceta], [idReceta], [cantidad], [precio], [idSuministro], [descuento]) VALUES (131, 91, 2, 110, 1, 0)
GO
INSERT [dbo].[DetalleReceta] ([idDetalleReceta], [idReceta], [cantidad], [precio], [idSuministro], [descuento]) VALUES (132, 92, 2, 25, 1, 0)
GO
INSERT [dbo].[DetalleReceta] ([idDetalleReceta], [idReceta], [cantidad], [precio], [idSuministro], [descuento]) VALUES (133, 92, 2, 25, 5, 50)
GO
INSERT [dbo].[DetalleReceta] ([idDetalleReceta], [idReceta], [cantidad], [precio], [idSuministro], [descuento]) VALUES (134, 93, 2, 96.800003051757812, 1, 0)
GO
INSERT [dbo].[DetalleReceta] ([idDetalleReceta], [idReceta], [cantidad], [precio], [idSuministro], [descuento]) VALUES (135, 93, 1, 275.55001831054688, 22, 62.63)
GO
INSERT [dbo].[DetalleReceta] ([idDetalleReceta], [idReceta], [cantidad], [precio], [idSuministro], [descuento]) VALUES (136, 95, 2, 96.800003051757812, 1, 0)
GO
INSERT [dbo].[DetalleReceta] ([idDetalleReceta], [idReceta], [cantidad], [precio], [idSuministro], [descuento]) VALUES (137, 95, 2, 150, 5, 75)
GO
INSERT [dbo].[DetalleReceta] ([idDetalleReceta], [idReceta], [cantidad], [precio], [idSuministro], [descuento]) VALUES (138, 96, 1, 88, 1, 0)
GO
INSERT [dbo].[DetalleReceta] ([idDetalleReceta], [idReceta], [cantidad], [precio], [idSuministro], [descuento]) VALUES (139, 96, 2, 150, 5, 0)
GO
INSERT [dbo].[DetalleReceta] ([idDetalleReceta], [idReceta], [cantidad], [precio], [idSuministro], [descuento]) VALUES (141, 97, 1, 88, 1, 0)
GO
INSERT [dbo].[DetalleReceta] ([idDetalleReceta], [idReceta], [cantidad], [precio], [idSuministro], [descuento]) VALUES (142, 98, 1, 88, 1, 22)
GO
INSERT [dbo].[DetalleReceta] ([idDetalleReceta], [idReceta], [cantidad], [precio], [idSuministro], [descuento]) VALUES (143, 100, 1, 88, 1, 8.8)
GO
INSERT [dbo].[DetalleReceta] ([idDetalleReceta], [idReceta], [cantidad], [precio], [idSuministro], [descuento]) VALUES (144, 100, 2, 150, 5, 30)
GO
INSERT [dbo].[DetalleReceta] ([idDetalleReceta], [idReceta], [cantidad], [precio], [idSuministro], [descuento]) VALUES (145, 101, 1, 88, 1, 9)
GO
INSERT [dbo].[DetalleReceta] ([idDetalleReceta], [idReceta], [cantidad], [precio], [idSuministro], [descuento]) VALUES (146, 102, 1, 88, 1, 9)
GO
INSERT [dbo].[DetalleReceta] ([idDetalleReceta], [idReceta], [cantidad], [precio], [idSuministro], [descuento]) VALUES (147, 105, 1, 88, 1, 8.8)
GO
INSERT [dbo].[DetalleReceta] ([idDetalleReceta], [idReceta], [cantidad], [precio], [idSuministro], [descuento]) VALUES (148, 105, 2, 150, 5, 15)
GO
INSERT [dbo].[DetalleReceta] ([idDetalleReceta], [idReceta], [cantidad], [precio], [idSuministro], [descuento]) VALUES (149, 105, 3, 150, 16, 135)
GO
INSERT [dbo].[DetalleReceta] ([idDetalleReceta], [idReceta], [cantidad], [precio], [idSuministro], [descuento]) VALUES (150, 106, 3, 158, 30, 0)
GO
INSERT [dbo].[DetalleReceta] ([idDetalleReceta], [idReceta], [cantidad], [precio], [idSuministro], [descuento]) VALUES (152, 107, 2, 158, 30, 0)
GO
INSERT [dbo].[DetalleReceta] ([idDetalleReceta], [idReceta], [cantidad], [precio], [idSuministro], [descuento]) VALUES (153, 107, 3, 415, 25, 0)
GO
INSERT [dbo].[DetalleReceta] ([idDetalleReceta], [idReceta], [cantidad], [precio], [idSuministro], [descuento]) VALUES (154, 107, 3, 150, 5, 22.5)
GO
INSERT [dbo].[DetalleReceta] ([idDetalleReceta], [idReceta], [cantidad], [precio], [idSuministro], [descuento]) VALUES (155, 108, 2, 88, 1, 18)
GO
INSERT [dbo].[DetalleReceta] ([idDetalleReceta], [idReceta], [cantidad], [precio], [idSuministro], [descuento]) VALUES (158, 109, 2, 88, 1, 17.600000381469727)
GO
INSERT [dbo].[DetalleReceta] ([idDetalleReceta], [idReceta], [cantidad], [precio], [idSuministro], [descuento]) VALUES (159, 110, 2, 290, 32, 116)
GO
SET IDENTITY_INSERT [dbo].[DetalleReceta] OFF
GO
SET IDENTITY_INSERT [dbo].[Especialidad] ON 
GO
INSERT [dbo].[Especialidad] ([idEspecialidad], [descripcion]) VALUES (1, N'Cardiologo')
GO
INSERT [dbo].[Especialidad] ([idEspecialidad], [descripcion]) VALUES (2, N'Traumatologo')
GO
INSERT [dbo].[Especialidad] ([idEspecialidad], [descripcion]) VALUES (3, N'Clinico')
GO
INSERT [dbo].[Especialidad] ([idEspecialidad], [descripcion]) VALUES (4, N'Oftalmologo')
GO
INSERT [dbo].[Especialidad] ([idEspecialidad], [descripcion]) VALUES (5, N'Dermatologo')
GO
INSERT [dbo].[Especialidad] ([idEspecialidad], [descripcion]) VALUES (6, N'Pediatra')
GO
SET IDENTITY_INSERT [dbo].[Especialidad] OFF
GO
SET IDENTITY_INSERT [dbo].[FormaPago] ON 
GO
INSERT [dbo].[FormaPago] ([idFormaPago], [descripcion]) VALUES (1, N'Tarjeta de credito')
GO
INSERT [dbo].[FormaPago] ([idFormaPago], [descripcion]) VALUES (2, N'Efectivo')
GO
SET IDENTITY_INSERT [dbo].[FormaPago] OFF
GO
SET IDENTITY_INSERT [dbo].[Localidad] ON 
GO
INSERT [dbo].[Localidad] ([idLocalidad], [nombre]) VALUES (1, N'Cordoba Capital')
GO
INSERT [dbo].[Localidad] ([idLocalidad], [nombre]) VALUES (2, N'Villa Carlos Paz')
GO
INSERT [dbo].[Localidad] ([idLocalidad], [nombre]) VALUES (3, N'Buenos Aires')
GO
INSERT [dbo].[Localidad] ([idLocalidad], [nombre]) VALUES (4, N'Rosario')
GO
INSERT [dbo].[Localidad] ([idLocalidad], [nombre]) VALUES (5, N'Mar del Plata')
GO
INSERT [dbo].[Localidad] ([idLocalidad], [nombre]) VALUES (6, N'San Miguel de Tucuman')
GO
INSERT [dbo].[Localidad] ([idLocalidad], [nombre]) VALUES (7, N'Posadas')
GO
INSERT [dbo].[Localidad] ([idLocalidad], [nombre]) VALUES (8, N'Parana')
GO
INSERT [dbo].[Localidad] ([idLocalidad], [nombre]) VALUES (9, N'Resistencia')
GO
INSERT [dbo].[Localidad] ([idLocalidad], [nombre]) VALUES (10, N'Mendoza')
GO
INSERT [dbo].[Localidad] ([idLocalidad], [nombre]) VALUES (11, N'Rawson')
GO
INSERT [dbo].[Localidad] ([idLocalidad], [nombre]) VALUES (12, N'Formosa')
GO
INSERT [dbo].[Localidad] ([idLocalidad], [nombre]) VALUES (13, N'Rio Gallegos')
GO
INSERT [dbo].[Localidad] ([idLocalidad], [nombre]) VALUES (14, N'Viedma')
GO
INSERT [dbo].[Localidad] ([idLocalidad], [nombre]) VALUES (15, N'Usuahia')
GO
SET IDENTITY_INSERT [dbo].[Localidad] OFF
GO
SET IDENTITY_INSERT [dbo].[ObraSocial] ON 
GO
INSERT [dbo].[ObraSocial] ([idObraSocial], [descripcion], [calle], [altura], [telefono]) VALUES (1, N'OSPA', N'Rondeau', 63, 35486157)
GO
INSERT [dbo].[ObraSocial] ([idObraSocial], [descripcion], [calle], [altura], [telefono]) VALUES (2, N'OSPOCE', N'Bartolome Mitre', 1523, 1158974)
GO
INSERT [dbo].[ObraSocial] ([idObraSocial], [descripcion], [calle], [altura], [telefono]) VALUES (3, N'OSYNC', N'24 de noviembre', 1126, 1135684)
GO
INSERT [dbo].[ObraSocial] ([idObraSocial], [descripcion], [calle], [altura], [telefono]) VALUES (4, N'MET', N'Av santa fe', 4000, 35189741)
GO
INSERT [dbo].[ObraSocial] ([idObraSocial], [descripcion], [calle], [altura], [telefono]) VALUES (5, N'MEFIDE', N'Bv Gusman', 2465, 3698547)
GO
INSERT [dbo].[ObraSocial] ([idObraSocial], [descripcion], [calle], [altura], [telefono]) VALUES (6, N'OSMEDICA', N'Andalucia', 5600, 36415891)
GO
SET IDENTITY_INSERT [dbo].[ObraSocial] OFF
GO
SET IDENTITY_INSERT [dbo].[Profesional] ON 
GO
INSERT [dbo].[Profesional] ([idProfesional], [nombre], [apellido], [nroMatricula], [fechaNac], [numDoc], [idTipoDoc], [idEspecialidad]) VALUES (1, N'Mauricio', N'Torres', 1150, CAST(N'1981-10-12' AS Date), 22159852, 1, 1)
GO
INSERT [dbo].[Profesional] ([idProfesional], [nombre], [apellido], [nroMatricula], [fechaNac], [numDoc], [idTipoDoc], [idEspecialidad]) VALUES (7, N'Leonardo', N'Poncio', 12345678, CAST(N'1985-05-08' AS Date), 3465815, 1, 2)
GO
INSERT [dbo].[Profesional] ([idProfesional], [nombre], [apellido], [nroMatricula], [fechaNac], [numDoc], [idTipoDoc], [idEspecialidad]) VALUES (9, N'Enzo', N'Perez', 456852, CAST(N'1986-02-22' AS Date), 14774110, 1, 2)
GO
INSERT [dbo].[Profesional] ([idProfesional], [nombre], [apellido], [nroMatricula], [fechaNac], [numDoc], [idTipoDoc], [idEspecialidad]) VALUES (11, N'LUIS', N'Cortes', 132546, CAST(N'2002-08-11' AS Date), 14978651, 1, 1)
GO
INSERT [dbo].[Profesional] ([idProfesional], [nombre], [apellido], [nroMatricula], [fechaNac], [numDoc], [idTipoDoc], [idEspecialidad]) VALUES (12, N'Cristian', N'Ponce', 13254622, CAST(N'1900-01-01' AS Date), 14978234, 1, 2)
GO
INSERT [dbo].[Profesional] ([idProfesional], [nombre], [apellido], [nroMatricula], [fechaNac], [numDoc], [idTipoDoc], [idEspecialidad]) VALUES (13, N'Cristian', N'Dias', 132369, CAST(N'2000-08-11' AS Date), 14978244, 1, 3)
GO
INSERT [dbo].[Profesional] ([idProfesional], [nombre], [apellido], [nroMatricula], [fechaNac], [numDoc], [idTipoDoc], [idEspecialidad]) VALUES (14, N'Carmen', N'Acevedo', 1301254622, CAST(N'2000-02-01' AS Date), 14944651, 1, 4)
GO
INSERT [dbo].[Profesional] ([idProfesional], [nombre], [apellido], [nroMatricula], [fechaNac], [numDoc], [idTipoDoc], [idEspecialidad]) VALUES (15, N'Belen', N'Cortes', 13252226, CAST(N'2000-03-02' AS Date), 22978234, 1, 5)
GO
INSERT [dbo].[Profesional] ([idProfesional], [nombre], [apellido], [nroMatricula], [fechaNac], [numDoc], [idTipoDoc], [idEspecialidad]) VALUES (16, N'Maximiliano', N'Vazques', 33254622, CAST(N'1996-08-01' AS Date), 22925234, 1, 6)
GO
INSERT [dbo].[Profesional] ([idProfesional], [nombre], [apellido], [nroMatricula], [fechaNac], [numDoc], [idTipoDoc], [idEspecialidad]) VALUES (17, N'Cristian', N'Caceres', 1325462222, CAST(N'2021-11-10' AS Date), 22925222, 1, 3)
GO
INSERT [dbo].[Profesional] ([idProfesional], [nombre], [apellido], [nroMatricula], [fechaNac], [numDoc], [idTipoDoc], [idEspecialidad]) VALUES (18, N'ADRIAN', N'Brizuela', 13236922, CAST(N'2021-11-03' AS Date), 22925333, 1, 1)
GO
INSERT [dbo].[Profesional] ([idProfesional], [nombre], [apellido], [nroMatricula], [fechaNac], [numDoc], [idTipoDoc], [idEspecialidad]) VALUES (19, N'Ernesto', N'Sanchez', 13254444, CAST(N'2021-11-02' AS Date), 22978211, 1, 5)
GO
INSERT [dbo].[Profesional] ([idProfesional], [nombre], [apellido], [nroMatricula], [fechaNac], [numDoc], [idTipoDoc], [idEspecialidad]) VALUES (20, N'Leonardo', N'Astrada', 132522222, CAST(N'2021-11-02' AS Date), 14978233, 1, 1)
GO
SET IDENTITY_INSERT [dbo].[Profesional] OFF
GO
SET IDENTITY_INSERT [dbo].[Receta] ON 
GO
INSERT [dbo].[Receta] ([idReceta], [idCliente], [idProfesional], [fecha], [idObraSocial], [idFormaPago], [nroSucursal]) VALUES (4, 2, 1, CAST(N'2012-11-20' AS Date), 1, 1, NULL)
GO
INSERT [dbo].[Receta] ([idReceta], [idCliente], [idProfesional], [fecha], [idObraSocial], [idFormaPago], [nroSucursal]) VALUES (5, 2, 1, CAST(N'2012-11-20' AS Date), 1, 1, NULL)
GO
INSERT [dbo].[Receta] ([idReceta], [idCliente], [idProfesional], [fecha], [idObraSocial], [idFormaPago], [nroSucursal]) VALUES (6, 2, 1, CAST(N'2021-11-09' AS Date), 1, 1, NULL)
GO
INSERT [dbo].[Receta] ([idReceta], [idCliente], [idProfesional], [fecha], [idObraSocial], [idFormaPago], [nroSucursal]) VALUES (7, 2, 1, CAST(N'2021-11-09' AS Date), 1, 1, NULL)
GO
INSERT [dbo].[Receta] ([idReceta], [idCliente], [idProfesional], [fecha], [idObraSocial], [idFormaPago], [nroSucursal]) VALUES (8, 2, 7, CAST(N'1900-01-01' AS Date), 5, 2, NULL)
GO
INSERT [dbo].[Receta] ([idReceta], [idCliente], [idProfesional], [fecha], [idObraSocial], [idFormaPago], [nroSucursal]) VALUES (9, 31, 7, CAST(N'2021-11-09' AS Date), 2, 2, NULL)
GO
INSERT [dbo].[Receta] ([idReceta], [idCliente], [idProfesional], [fecha], [idObraSocial], [idFormaPago], [nroSucursal]) VALUES (10, 31, 7, CAST(N'2021-11-09' AS Date), 2, 2, NULL)
GO
INSERT [dbo].[Receta] ([idReceta], [idCliente], [idProfesional], [fecha], [idObraSocial], [idFormaPago], [nroSucursal]) VALUES (11, 31, 7, CAST(N'2021-11-09' AS Date), 2, 2, NULL)
GO
INSERT [dbo].[Receta] ([idReceta], [idCliente], [idProfesional], [fecha], [idObraSocial], [idFormaPago], [nroSucursal]) VALUES (12, 2, 1, CAST(N'1900-01-01' AS Date), 1, 1, NULL)
GO
INSERT [dbo].[Receta] ([idReceta], [idCliente], [idProfesional], [fecha], [idObraSocial], [idFormaPago], [nroSucursal]) VALUES (13, 2, 1, CAST(N'1900-01-01' AS Date), 1, 1, NULL)
GO
INSERT [dbo].[Receta] ([idReceta], [idCliente], [idProfesional], [fecha], [idObraSocial], [idFormaPago], [nroSucursal]) VALUES (14, 2, 1, CAST(N'1900-01-01' AS Date), 1, 1, NULL)
GO
INSERT [dbo].[Receta] ([idReceta], [idCliente], [idProfesional], [fecha], [idObraSocial], [idFormaPago], [nroSucursal]) VALUES (15, 2, 1, CAST(N'1900-01-01' AS Date), 1, 1, NULL)
GO
INSERT [dbo].[Receta] ([idReceta], [idCliente], [idProfesional], [fecha], [idObraSocial], [idFormaPago], [nroSucursal]) VALUES (16, 2, 1, CAST(N'1900-01-01' AS Date), 1, 1, NULL)
GO
INSERT [dbo].[Receta] ([idReceta], [idCliente], [idProfesional], [fecha], [idObraSocial], [idFormaPago], [nroSucursal]) VALUES (17, 5, 7, CAST(N'2021-11-10' AS Date), 1, 2, NULL)
GO
INSERT [dbo].[Receta] ([idReceta], [idCliente], [idProfesional], [fecha], [idObraSocial], [idFormaPago], [nroSucursal]) VALUES (18, 5, 7, CAST(N'2021-11-10' AS Date), 1, 2, NULL)
GO
INSERT [dbo].[Receta] ([idReceta], [idCliente], [idProfesional], [fecha], [idObraSocial], [idFormaPago], [nroSucursal]) VALUES (19, 31, 7, CAST(N'2021-11-09' AS Date), 4, 2, NULL)
GO
INSERT [dbo].[Receta] ([idReceta], [idCliente], [idProfesional], [fecha], [idObraSocial], [idFormaPago], [nroSucursal]) VALUES (20, 31, 7, CAST(N'2021-11-09' AS Date), 4, 2, NULL)
GO
INSERT [dbo].[Receta] ([idReceta], [idCliente], [idProfesional], [fecha], [idObraSocial], [idFormaPago], [nroSucursal]) VALUES (21, 31, 7, CAST(N'2021-11-09' AS Date), 4, 2, NULL)
GO
INSERT [dbo].[Receta] ([idReceta], [idCliente], [idProfesional], [fecha], [idObraSocial], [idFormaPago], [nroSucursal]) VALUES (22, 31, 7, CAST(N'2021-11-09' AS Date), 4, 2, NULL)
GO
INSERT [dbo].[Receta] ([idReceta], [idCliente], [idProfesional], [fecha], [idObraSocial], [idFormaPago], [nroSucursal]) VALUES (23, 31, 7, CAST(N'2021-11-09' AS Date), 4, 2, NULL)
GO
INSERT [dbo].[Receta] ([idReceta], [idCliente], [idProfesional], [fecha], [idObraSocial], [idFormaPago], [nroSucursal]) VALUES (24, 2, 1, CAST(N'1900-01-01' AS Date), 1, 1, NULL)
GO
INSERT [dbo].[Receta] ([idReceta], [idCliente], [idProfesional], [fecha], [idObraSocial], [idFormaPago], [nroSucursal]) VALUES (25, 2, 1, CAST(N'2021-11-09' AS Date), 1, 1, NULL)
GO
INSERT [dbo].[Receta] ([idReceta], [idCliente], [idProfesional], [fecha], [idObraSocial], [idFormaPago], [nroSucursal]) VALUES (26, 2, 1, CAST(N'2021-11-09' AS Date), 1, 1, NULL)
GO
INSERT [dbo].[Receta] ([idReceta], [idCliente], [idProfesional], [fecha], [idObraSocial], [idFormaPago], [nroSucursal]) VALUES (27, 2, 1, CAST(N'2021-11-09' AS Date), 1, 1, NULL)
GO
INSERT [dbo].[Receta] ([idReceta], [idCliente], [idProfesional], [fecha], [idObraSocial], [idFormaPago], [nroSucursal]) VALUES (28, 2, 1, CAST(N'2021-11-09' AS Date), 1, 1, NULL)
GO
INSERT [dbo].[Receta] ([idReceta], [idCliente], [idProfesional], [fecha], [idObraSocial], [idFormaPago], [nroSucursal]) VALUES (29, 31, 9, CAST(N'2021-11-09' AS Date), 5, 2, NULL)
GO
INSERT [dbo].[Receta] ([idReceta], [idCliente], [idProfesional], [fecha], [idObraSocial], [idFormaPago], [nroSucursal]) VALUES (30, 2, 1, CAST(N'2021-11-09' AS Date), 1, 1, NULL)
GO
INSERT [dbo].[Receta] ([idReceta], [idCliente], [idProfesional], [fecha], [idObraSocial], [idFormaPago], [nroSucursal]) VALUES (31, 2, 1, CAST(N'2021-11-09' AS Date), 1, 1, NULL)
GO
INSERT [dbo].[Receta] ([idReceta], [idCliente], [idProfesional], [fecha], [idObraSocial], [idFormaPago], [nroSucursal]) VALUES (32, 2, 1, CAST(N'2021-11-09' AS Date), 1, 1, NULL)
GO
INSERT [dbo].[Receta] ([idReceta], [idCliente], [idProfesional], [fecha], [idObraSocial], [idFormaPago], [nroSucursal]) VALUES (33, 2, 1, CAST(N'2021-11-09' AS Date), 1, 1, NULL)
GO
INSERT [dbo].[Receta] ([idReceta], [idCliente], [idProfesional], [fecha], [idObraSocial], [idFormaPago], [nroSucursal]) VALUES (34, 2, 1, CAST(N'2021-11-09' AS Date), 1, 1, NULL)
GO
INSERT [dbo].[Receta] ([idReceta], [idCliente], [idProfesional], [fecha], [idObraSocial], [idFormaPago], [nroSucursal]) VALUES (35, 2, 1, CAST(N'2021-11-09' AS Date), 1, 1, NULL)
GO
INSERT [dbo].[Receta] ([idReceta], [idCliente], [idProfesional], [fecha], [idObraSocial], [idFormaPago], [nroSucursal]) VALUES (36, 2, 1, CAST(N'2021-11-09' AS Date), 1, 1, NULL)
GO
INSERT [dbo].[Receta] ([idReceta], [idCliente], [idProfesional], [fecha], [idObraSocial], [idFormaPago], [nroSucursal]) VALUES (37, 2, 1, CAST(N'2021-11-09' AS Date), 1, 1, NULL)
GO
INSERT [dbo].[Receta] ([idReceta], [idCliente], [idProfesional], [fecha], [idObraSocial], [idFormaPago], [nroSucursal]) VALUES (38, 2, 1, CAST(N'2021-11-09' AS Date), 1, 1, NULL)
GO
INSERT [dbo].[Receta] ([idReceta], [idCliente], [idProfesional], [fecha], [idObraSocial], [idFormaPago], [nroSucursal]) VALUES (39, 2, 1, CAST(N'2021-11-09' AS Date), 1, 1, NULL)
GO
INSERT [dbo].[Receta] ([idReceta], [idCliente], [idProfesional], [fecha], [idObraSocial], [idFormaPago], [nroSucursal]) VALUES (40, 2, 1, CAST(N'2021-11-09' AS Date), 1, 1, NULL)
GO
INSERT [dbo].[Receta] ([idReceta], [idCliente], [idProfesional], [fecha], [idObraSocial], [idFormaPago], [nroSucursal]) VALUES (41, 2, 1, CAST(N'2021-11-09' AS Date), 1, 1, NULL)
GO
INSERT [dbo].[Receta] ([idReceta], [idCliente], [idProfesional], [fecha], [idObraSocial], [idFormaPago], [nroSucursal]) VALUES (42, 2, 1, CAST(N'2021-11-09' AS Date), 1, 1, NULL)
GO
INSERT [dbo].[Receta] ([idReceta], [idCliente], [idProfesional], [fecha], [idObraSocial], [idFormaPago], [nroSucursal]) VALUES (43, 2, 1, CAST(N'2021-11-09' AS Date), 1, 1, NULL)
GO
INSERT [dbo].[Receta] ([idReceta], [idCliente], [idProfesional], [fecha], [idObraSocial], [idFormaPago], [nroSucursal]) VALUES (44, 2, 1, CAST(N'2021-11-09' AS Date), 1, 1, NULL)
GO
INSERT [dbo].[Receta] ([idReceta], [idCliente], [idProfesional], [fecha], [idObraSocial], [idFormaPago], [nroSucursal]) VALUES (45, 2, 1, CAST(N'2021-11-09' AS Date), 1, 1, NULL)
GO
INSERT [dbo].[Receta] ([idReceta], [idCliente], [idProfesional], [fecha], [idObraSocial], [idFormaPago], [nroSucursal]) VALUES (46, 2, 1, CAST(N'2021-11-09' AS Date), 1, 1, NULL)
GO
INSERT [dbo].[Receta] ([idReceta], [idCliente], [idProfesional], [fecha], [idObraSocial], [idFormaPago], [nroSucursal]) VALUES (47, 2, 1, CAST(N'2021-11-09' AS Date), 1, 1, NULL)
GO
INSERT [dbo].[Receta] ([idReceta], [idCliente], [idProfesional], [fecha], [idObraSocial], [idFormaPago], [nroSucursal]) VALUES (48, 2, 1, CAST(N'2021-11-09' AS Date), 1, 1, NULL)
GO
INSERT [dbo].[Receta] ([idReceta], [idCliente], [idProfesional], [fecha], [idObraSocial], [idFormaPago], [nroSucursal]) VALUES (49, 5, 7, CAST(N'2021-11-09' AS Date), 6, 2, NULL)
GO
INSERT [dbo].[Receta] ([idReceta], [idCliente], [idProfesional], [fecha], [idObraSocial], [idFormaPago], [nroSucursal]) VALUES (50, 2, 1, CAST(N'2021-11-09' AS Date), 1, 2, NULL)
GO
INSERT [dbo].[Receta] ([idReceta], [idCliente], [idProfesional], [fecha], [idObraSocial], [idFormaPago], [nroSucursal]) VALUES (51, 2, 1, CAST(N'2021-11-09' AS Date), 1, 1, NULL)
GO
INSERT [dbo].[Receta] ([idReceta], [idCliente], [idProfesional], [fecha], [idObraSocial], [idFormaPago], [nroSucursal]) VALUES (52, 2, 1, CAST(N'2021-11-09' AS Date), 1, 1, NULL)
GO
INSERT [dbo].[Receta] ([idReceta], [idCliente], [idProfesional], [fecha], [idObraSocial], [idFormaPago], [nroSucursal]) VALUES (53, 2, 1, CAST(N'2021-11-09' AS Date), 1, 1, NULL)
GO
INSERT [dbo].[Receta] ([idReceta], [idCliente], [idProfesional], [fecha], [idObraSocial], [idFormaPago], [nroSucursal]) VALUES (54, 2, 1, CAST(N'2021-11-09' AS Date), 1, 1, NULL)
GO
INSERT [dbo].[Receta] ([idReceta], [idCliente], [idProfesional], [fecha], [idObraSocial], [idFormaPago], [nroSucursal]) VALUES (55, 2, 1, CAST(N'2021-11-09' AS Date), 1, 1, NULL)
GO
INSERT [dbo].[Receta] ([idReceta], [idCliente], [idProfesional], [fecha], [idObraSocial], [idFormaPago], [nroSucursal]) VALUES (56, 2, 1, CAST(N'2021-11-09' AS Date), 1, 1, NULL)
GO
INSERT [dbo].[Receta] ([idReceta], [idCliente], [idProfesional], [fecha], [idObraSocial], [idFormaPago], [nroSucursal]) VALUES (57, 2, 1, CAST(N'2021-11-09' AS Date), 1, 1, NULL)
GO
INSERT [dbo].[Receta] ([idReceta], [idCliente], [idProfesional], [fecha], [idObraSocial], [idFormaPago], [nroSucursal]) VALUES (58, 2, 1, CAST(N'2021-11-09' AS Date), 2, 1, NULL)
GO
INSERT [dbo].[Receta] ([idReceta], [idCliente], [idProfesional], [fecha], [idObraSocial], [idFormaPago], [nroSucursal]) VALUES (59, 2, 1, CAST(N'2021-11-09' AS Date), 3, 2, 19)
GO
INSERT [dbo].[Receta] ([idReceta], [idCliente], [idProfesional], [fecha], [idObraSocial], [idFormaPago], [nroSucursal]) VALUES (60, 2, 1, CAST(N'2021-11-09' AS Date), 3, 1, 16)
GO
INSERT [dbo].[Receta] ([idReceta], [idCliente], [idProfesional], [fecha], [idObraSocial], [idFormaPago], [nroSucursal]) VALUES (61, 2, 1, CAST(N'2021-11-09' AS Date), 1, 2, 18)
GO
INSERT [dbo].[Receta] ([idReceta], [idCliente], [idProfesional], [fecha], [idObraSocial], [idFormaPago], [nroSucursal]) VALUES (62, 2, 1, CAST(N'2021-11-09' AS Date), 1, 1, 1)
GO
INSERT [dbo].[Receta] ([idReceta], [idCliente], [idProfesional], [fecha], [idObraSocial], [idFormaPago], [nroSucursal]) VALUES (63, 2, 1, CAST(N'2021-11-09' AS Date), 1, 1, 1)
GO
INSERT [dbo].[Receta] ([idReceta], [idCliente], [idProfesional], [fecha], [idObraSocial], [idFormaPago], [nroSucursal]) VALUES (64, 2, 1, CAST(N'2021-11-09' AS Date), 2, 2, 1)
GO
INSERT [dbo].[Receta] ([idReceta], [idCliente], [idProfesional], [fecha], [idObraSocial], [idFormaPago], [nroSucursal]) VALUES (65, 5, 1, CAST(N'2021-11-09' AS Date), 1, 1, 1)
GO
INSERT [dbo].[Receta] ([idReceta], [idCliente], [idProfesional], [fecha], [idObraSocial], [idFormaPago], [nroSucursal]) VALUES (66, 2, 1, CAST(N'2021-11-09' AS Date), 1, 1, 1)
GO
INSERT [dbo].[Receta] ([idReceta], [idCliente], [idProfesional], [fecha], [idObraSocial], [idFormaPago], [nroSucursal]) VALUES (67, 2, 1, CAST(N'2021-11-09' AS Date), 1, 1, 1)
GO
INSERT [dbo].[Receta] ([idReceta], [idCliente], [idProfesional], [fecha], [idObraSocial], [idFormaPago], [nroSucursal]) VALUES (68, 2, 1, CAST(N'2021-11-10' AS Date), 1, 1, 1)
GO
INSERT [dbo].[Receta] ([idReceta], [idCliente], [idProfesional], [fecha], [idObraSocial], [idFormaPago], [nroSucursal]) VALUES (69, 2, 1, CAST(N'2021-11-09' AS Date), 1, 1, 1)
GO
INSERT [dbo].[Receta] ([idReceta], [idCliente], [idProfesional], [fecha], [idObraSocial], [idFormaPago], [nroSucursal]) VALUES (70, 31, 11, CAST(N'2004-08-08' AS Date), 4, 2, 9)
GO
INSERT [dbo].[Receta] ([idReceta], [idCliente], [idProfesional], [fecha], [idObraSocial], [idFormaPago], [nroSucursal]) VALUES (71, 2, 1, CAST(N'1900-01-01' AS Date), 1, 1, 1)
GO
INSERT [dbo].[Receta] ([idReceta], [idCliente], [idProfesional], [fecha], [idObraSocial], [idFormaPago], [nroSucursal]) VALUES (72, 2, 1, CAST(N'1900-01-01' AS Date), 1, 1, 1)
GO
INSERT [dbo].[Receta] ([idReceta], [idCliente], [idProfesional], [fecha], [idObraSocial], [idFormaPago], [nroSucursal]) VALUES (73, 2, 1, CAST(N'1900-01-01' AS Date), 1, 1, 1)
GO
INSERT [dbo].[Receta] ([idReceta], [idCliente], [idProfesional], [fecha], [idObraSocial], [idFormaPago], [nroSucursal]) VALUES (74, 2, 1, CAST(N'1900-01-01' AS Date), 1, 1, 1)
GO
INSERT [dbo].[Receta] ([idReceta], [idCliente], [idProfesional], [fecha], [idObraSocial], [idFormaPago], [nroSucursal]) VALUES (75, 2, 1, CAST(N'1900-01-01' AS Date), 1, 1, 6)
GO
INSERT [dbo].[Receta] ([idReceta], [idCliente], [idProfesional], [fecha], [idObraSocial], [idFormaPago], [nroSucursal]) VALUES (76, 2, 1, CAST(N'1900-01-01' AS Date), 1, 1, 1)
GO
INSERT [dbo].[Receta] ([idReceta], [idCliente], [idProfesional], [fecha], [idObraSocial], [idFormaPago], [nroSucursal]) VALUES (77, 2, 1, CAST(N'1900-01-01' AS Date), 1, 1, 1)
GO
INSERT [dbo].[Receta] ([idReceta], [idCliente], [idProfesional], [fecha], [idObraSocial], [idFormaPago], [nroSucursal]) VALUES (78, 2, 1, CAST(N'1900-01-01' AS Date), 1, 1, 1)
GO
INSERT [dbo].[Receta] ([idReceta], [idCliente], [idProfesional], [fecha], [idObraSocial], [idFormaPago], [nroSucursal]) VALUES (79, 2, 1, CAST(N'1900-01-01' AS Date), 1, 1, 1)
GO
INSERT [dbo].[Receta] ([idReceta], [idCliente], [idProfesional], [fecha], [idObraSocial], [idFormaPago], [nroSucursal]) VALUES (80, 2, 1, CAST(N'1900-01-01' AS Date), 1, 1, 1)
GO
INSERT [dbo].[Receta] ([idReceta], [idCliente], [idProfesional], [fecha], [idObraSocial], [idFormaPago], [nroSucursal]) VALUES (81, 2, 1, CAST(N'1900-01-01' AS Date), 1, 2, 1)
GO
INSERT [dbo].[Receta] ([idReceta], [idCliente], [idProfesional], [fecha], [idObraSocial], [idFormaPago], [nroSucursal]) VALUES (82, 2, 1, CAST(N'1900-01-01' AS Date), 1, 1, 1)
GO
INSERT [dbo].[Receta] ([idReceta], [idCliente], [idProfesional], [fecha], [idObraSocial], [idFormaPago], [nroSucursal]) VALUES (83, 2, 1, CAST(N'2021-11-25' AS Date), 1, 1, 1)
GO
INSERT [dbo].[Receta] ([idReceta], [idCliente], [idProfesional], [fecha], [idObraSocial], [idFormaPago], [nroSucursal]) VALUES (84, 2, 1, CAST(N'2021-11-25' AS Date), 1, 1, 1)
GO
INSERT [dbo].[Receta] ([idReceta], [idCliente], [idProfesional], [fecha], [idObraSocial], [idFormaPago], [nroSucursal]) VALUES (85, 35, 14, CAST(N'2021-11-25' AS Date), 4, 2, 13)
GO
INSERT [dbo].[Receta] ([idReceta], [idCliente], [idProfesional], [fecha], [idObraSocial], [idFormaPago], [nroSucursal]) VALUES (86, 33, 9, CAST(N'2021-11-25' AS Date), 4, 2, 11)
GO
INSERT [dbo].[Receta] ([idReceta], [idCliente], [idProfesional], [fecha], [idObraSocial], [idFormaPago], [nroSucursal]) VALUES (87, 2, 1, CAST(N'2021-11-25' AS Date), 1, 1, 6)
GO
INSERT [dbo].[Receta] ([idReceta], [idCliente], [idProfesional], [fecha], [idObraSocial], [idFormaPago], [nroSucursal]) VALUES (88, 2, 1, CAST(N'2021-11-25' AS Date), 1, 2, 1)
GO
INSERT [dbo].[Receta] ([idReceta], [idCliente], [idProfesional], [fecha], [idObraSocial], [idFormaPago], [nroSucursal]) VALUES (89, 36, 13, CAST(N'2021-11-25' AS Date), 4, 1, 6)
GO
INSERT [dbo].[Receta] ([idReceta], [idCliente], [idProfesional], [fecha], [idObraSocial], [idFormaPago], [nroSucursal]) VALUES (90, 2, 1, CAST(N'2021-11-25' AS Date), 1, 1, 1)
GO
INSERT [dbo].[Receta] ([idReceta], [idCliente], [idProfesional], [fecha], [idObraSocial], [idFormaPago], [nroSucursal]) VALUES (91, 2, 1, CAST(N'2004-08-08' AS Date), 1, 1, 1)
GO
INSERT [dbo].[Receta] ([idReceta], [idCliente], [idProfesional], [fecha], [idObraSocial], [idFormaPago], [nroSucursal]) VALUES (92, 2, 1, CAST(N'2004-08-08' AS Date), 1, 2, 1)
GO
INSERT [dbo].[Receta] ([idReceta], [idCliente], [idProfesional], [fecha], [idObraSocial], [idFormaPago], [nroSucursal]) VALUES (93, 37, 18, CAST(N'2021-11-26' AS Date), 4, 1, 10)
GO
INSERT [dbo].[Receta] ([idReceta], [idCliente], [idProfesional], [fecha], [idObraSocial], [idFormaPago], [nroSucursal]) VALUES (94, 2, 1, CAST(N'2021-11-26' AS Date), 1, 1, 1)
GO
INSERT [dbo].[Receta] ([idReceta], [idCliente], [idProfesional], [fecha], [idObraSocial], [idFormaPago], [nroSucursal]) VALUES (95, 2, 1, CAST(N'2021-11-26' AS Date), 1, 1, 1)
GO
INSERT [dbo].[Receta] ([idReceta], [idCliente], [idProfesional], [fecha], [idObraSocial], [idFormaPago], [nroSucursal]) VALUES (96, 37, 14, CAST(N'2021-11-26' AS Date), 6, 1, 9)
GO
INSERT [dbo].[Receta] ([idReceta], [idCliente], [idProfesional], [fecha], [idObraSocial], [idFormaPago], [nroSucursal]) VALUES (97, 2, 1, CAST(N'2021-11-26' AS Date), 1, 1, 1)
GO
INSERT [dbo].[Receta] ([idReceta], [idCliente], [idProfesional], [fecha], [idObraSocial], [idFormaPago], [nroSucursal]) VALUES (98, 2, 1, CAST(N'2021-11-26' AS Date), 1, 1, 17)
GO
INSERT [dbo].[Receta] ([idReceta], [idCliente], [idProfesional], [fecha], [idObraSocial], [idFormaPago], [nroSucursal]) VALUES (99, 2, 1, CAST(N'2021-11-26' AS Date), 1, 1, 1)
GO
INSERT [dbo].[Receta] ([idReceta], [idCliente], [idProfesional], [fecha], [idObraSocial], [idFormaPago], [nroSucursal]) VALUES (100, 2, 1, CAST(N'2021-11-26' AS Date), 1, 1, 1)
GO
INSERT [dbo].[Receta] ([idReceta], [idCliente], [idProfesional], [fecha], [idObraSocial], [idFormaPago], [nroSucursal]) VALUES (101, 2, 1, CAST(N'2021-11-26' AS Date), 1, 1, 1)
GO
INSERT [dbo].[Receta] ([idReceta], [idCliente], [idProfesional], [fecha], [idObraSocial], [idFormaPago], [nroSucursal]) VALUES (102, 2, 1, CAST(N'2021-11-26' AS Date), 1, 1, 1)
GO
INSERT [dbo].[Receta] ([idReceta], [idCliente], [idProfesional], [fecha], [idObraSocial], [idFormaPago], [nroSucursal]) VALUES (103, 2, 1, CAST(N'2021-11-26' AS Date), 1, 1, 1)
GO
INSERT [dbo].[Receta] ([idReceta], [idCliente], [idProfesional], [fecha], [idObraSocial], [idFormaPago], [nroSucursal]) VALUES (104, 2, 1, CAST(N'2021-11-26' AS Date), 1, 1, 1)
GO
INSERT [dbo].[Receta] ([idReceta], [idCliente], [idProfesional], [fecha], [idObraSocial], [idFormaPago], [nroSucursal]) VALUES (105, 2, 1, CAST(N'2021-11-26' AS Date), 1, 1, 1)
GO
INSERT [dbo].[Receta] ([idReceta], [idCliente], [idProfesional], [fecha], [idObraSocial], [idFormaPago], [nroSucursal]) VALUES (106, 2, 1, CAST(N'2021-11-26' AS Date), 1, 1, 1)
GO
INSERT [dbo].[Receta] ([idReceta], [idCliente], [idProfesional], [fecha], [idObraSocial], [idFormaPago], [nroSucursal]) VALUES (107, 2, 1, CAST(N'2021-11-26' AS Date), 1, 1, 1)
GO
INSERT [dbo].[Receta] ([idReceta], [idCliente], [idProfesional], [fecha], [idObraSocial], [idFormaPago], [nroSucursal]) VALUES (108, 2, 1, CAST(N'2021-11-26' AS Date), 1, 1, 1)
GO
INSERT [dbo].[Receta] ([idReceta], [idCliente], [idProfesional], [fecha], [idObraSocial], [idFormaPago], [nroSucursal]) VALUES (109, 2, 1, CAST(N'2021-11-26' AS Date), 1, 1, 1)
GO
INSERT [dbo].[Receta] ([idReceta], [idCliente], [idProfesional], [fecha], [idObraSocial], [idFormaPago], [nroSucursal]) VALUES (110, 35, 20, CAST(N'2021-11-26' AS Date), 3, 1, 16)
GO
SET IDENTITY_INSERT [dbo].[Receta] OFF
GO
SET IDENTITY_INSERT [dbo].[StockSumXSucur] ON 
GO
INSERT [dbo].[StockSumXSucur] ([idSumxSuc], [nroSucursal], [idSuministro], [Stock]) VALUES (1, 1, 16, 16)
GO
INSERT [dbo].[StockSumXSucur] ([idSumxSuc], [nroSucursal], [idSuministro], [Stock]) VALUES (2, 1, 17, 1000)
GO
INSERT [dbo].[StockSumXSucur] ([idSumxSuc], [nroSucursal], [idSuministro], [Stock]) VALUES (3, 1, 1, 300)
GO
INSERT [dbo].[StockSumXSucur] ([idSumxSuc], [nroSucursal], [idSuministro], [Stock]) VALUES (4, 3, 5, 0)
GO
INSERT [dbo].[StockSumXSucur] ([idSumxSuc], [nroSucursal], [idSuministro], [Stock]) VALUES (5, 5, 18, 0)
GO
INSERT [dbo].[StockSumXSucur] ([idSumxSuc], [nroSucursal], [idSuministro], [Stock]) VALUES (6, 6, 19, 250)
GO
INSERT [dbo].[StockSumXSucur] ([idSumxSuc], [nroSucursal], [idSuministro], [Stock]) VALUES (7, 8, 20, 0)
GO
INSERT [dbo].[StockSumXSucur] ([idSumxSuc], [nroSucursal], [idSuministro], [Stock]) VALUES (8, 9, 21, 365)
GO
INSERT [dbo].[StockSumXSucur] ([idSumxSuc], [nroSucursal], [idSuministro], [Stock]) VALUES (9, 10, 22, 200)
GO
INSERT [dbo].[StockSumXSucur] ([idSumxSuc], [nroSucursal], [idSuministro], [Stock]) VALUES (10, 11, 23, 0)
GO
INSERT [dbo].[StockSumXSucur] ([idSumxSuc], [nroSucursal], [idSuministro], [Stock]) VALUES (11, 12, 24, 0)
GO
INSERT [dbo].[StockSumXSucur] ([idSumxSuc], [nroSucursal], [idSuministro], [Stock]) VALUES (12, 13, 25, 0)
GO
INSERT [dbo].[StockSumXSucur] ([idSumxSuc], [nroSucursal], [idSuministro], [Stock]) VALUES (13, 16, 26, 0)
GO
INSERT [dbo].[StockSumXSucur] ([idSumxSuc], [nroSucursal], [idSuministro], [Stock]) VALUES (14, 17, 27, 0)
GO
INSERT [dbo].[StockSumXSucur] ([idSumxSuc], [nroSucursal], [idSuministro], [Stock]) VALUES (15, 13, 28, 1000)
GO
INSERT [dbo].[StockSumXSucur] ([idSumxSuc], [nroSucursal], [idSuministro], [Stock]) VALUES (16, 18, 29, 1500)
GO
INSERT [dbo].[StockSumXSucur] ([idSumxSuc], [nroSucursal], [idSuministro], [Stock]) VALUES (17, 12, 30, 350)
GO
INSERT [dbo].[StockSumXSucur] ([idSumxSuc], [nroSucursal], [idSuministro], [Stock]) VALUES (18, 1, 31, 500)
GO
INSERT [dbo].[StockSumXSucur] ([idSumxSuc], [nroSucursal], [idSuministro], [Stock]) VALUES (19, 8, 32, 500)
GO
SET IDENTITY_INSERT [dbo].[StockSumXSucur] OFF
GO
SET IDENTITY_INSERT [dbo].[Sucursal] ON 
GO
INSERT [dbo].[Sucursal] ([nroSucursal], [calle], [altura], [telefono], [idLocalidad]) VALUES (1, N'Colon', 5320, 351456456, 1)
GO
INSERT [dbo].[Sucursal] ([nroSucursal], [calle], [altura], [telefono], [idLocalidad]) VALUES (3, N'Viamonte', 1668, 113548744, 3)
GO
INSERT [dbo].[Sucursal] ([nroSucursal], [calle], [altura], [telefono], [idLocalidad]) VALUES (5, N'Moreno', 4210, 113689574, 5)
GO
INSERT [dbo].[Sucursal] ([nroSucursal], [calle], [altura], [telefono], [idLocalidad]) VALUES (6, N'Salta', 1168, 381875316, 6)
GO
INSERT [dbo].[Sucursal] ([nroSucursal], [calle], [altura], [telefono], [idLocalidad]) VALUES (8, N'25 de mayo', 368, 343598657, 8)
GO
INSERT [dbo].[Sucursal] ([nroSucursal], [calle], [altura], [telefono], [idLocalidad]) VALUES (9, N'Ameghino', 987, 362589658, 9)
GO
INSERT [dbo].[Sucursal] ([nroSucursal], [calle], [altura], [telefono], [idLocalidad]) VALUES (10, N'Uruguay', 1687, 261358964, 10)
GO
INSERT [dbo].[Sucursal] ([nroSucursal], [calle], [altura], [telefono], [idLocalidad]) VALUES (11, N'Castelli', 3610, 280968578, 11)
GO
INSERT [dbo].[Sucursal] ([nroSucursal], [calle], [altura], [telefono], [idLocalidad]) VALUES (12, N'9 de julio', 2980, 370898748, 12)
GO
INSERT [dbo].[Sucursal] ([nroSucursal], [calle], [altura], [telefono], [idLocalidad]) VALUES (13, N'Zapiola', 1680, 296615896, 13)
GO
INSERT [dbo].[Sucursal] ([nroSucursal], [calle], [altura], [telefono], [idLocalidad]) VALUES (16, N'Tupungato', 245, 354135698, 2)
GO
INSERT [dbo].[Sucursal] ([nroSucursal], [calle], [altura], [telefono], [idLocalidad]) VALUES (17, N'Matienzo', 2414, 342123685, 4)
GO
INSERT [dbo].[Sucursal] ([nroSucursal], [calle], [altura], [telefono], [idLocalidad]) VALUES (18, N'Luis Pasteur', 110, 376168958, 7)
GO
INSERT [dbo].[Sucursal] ([nroSucursal], [calle], [altura], [telefono], [idLocalidad]) VALUES (19, N'Gallardo', 4860, 29204791, 14)
GO
INSERT [dbo].[Sucursal] ([nroSucursal], [calle], [altura], [telefono], [idLocalidad]) VALUES (20, N'Tekenika', 310, 29018789, 15)
GO
SET IDENTITY_INSERT [dbo].[Sucursal] OFF
GO
SET IDENTITY_INSERT [dbo].[Suministro] ON 
GO
INSERT [dbo].[Suministro] ([idSuministro], [descripcion], [precioUnitario], [idClasificacion], [idTipoSum]) VALUES (1, N'Desodorante en aerosol', 88, 1, 1)
GO
INSERT [dbo].[Suministro] ([idSuministro], [descripcion], [precioUnitario], [idClasificacion], [idTipoSum]) VALUES (5, N'Alcohol Liquido', 150, 1, 3)
GO
INSERT [dbo].[Suministro] ([idSuministro], [descripcion], [precioUnitario], [idClasificacion], [idTipoSum]) VALUES (16, N'Desodorante en bolilla', 150, 1, 1)
GO
INSERT [dbo].[Suministro] ([idSuministro], [descripcion], [precioUnitario], [idClasificacion], [idTipoSum]) VALUES (17, N'Barbijo Descartable', 499.5, 1, 1)
GO
INSERT [dbo].[Suministro] ([idSuministro], [descripcion], [precioUnitario], [idClasificacion], [idTipoSum]) VALUES (18, N'Colgate', 474, 1, 3)
GO
INSERT [dbo].[Suministro] ([idSuministro], [descripcion], [precioUnitario], [idClasificacion], [idTipoSum]) VALUES (19, N'Venda adhesiva', 235, 1, 1)
GO
INSERT [dbo].[Suministro] ([idSuministro], [descripcion], [precioUnitario], [idClasificacion], [idTipoSum]) VALUES (20, N'Curitas', 302, 1, 1)
GO
INSERT [dbo].[Suministro] ([idSuministro], [descripcion], [precioUnitario], [idClasificacion], [idTipoSum]) VALUES (21, N'Desodorante', 240.5, 1, 1)
GO
INSERT [dbo].[Suministro] ([idSuministro], [descripcion], [precioUnitario], [idClasificacion], [idTipoSum]) VALUES (22, N'Acebutolol', 250.5, 1, 2)
GO
INSERT [dbo].[Suministro] ([idSuministro], [descripcion], [precioUnitario], [idClasificacion], [idTipoSum]) VALUES (23, N'Amoxicilina', 400.75, 1, 2)
GO
INSERT [dbo].[Suministro] ([idSuministro], [descripcion], [precioUnitario], [idClasificacion], [idTipoSum]) VALUES (24, N'Bisoprolol', 630.15, 1, 2)
GO
INSERT [dbo].[Suministro] ([idSuministro], [descripcion], [precioUnitario], [idClasificacion], [idTipoSum]) VALUES (25, N'Cefotaxima', 415, 1, 2)
GO
INSERT [dbo].[Suministro] ([idSuministro], [descripcion], [precioUnitario], [idClasificacion], [idTipoSum]) VALUES (26, N'Ibuprofeno', 415, 1, 1)
GO
INSERT [dbo].[Suministro] ([idSuministro], [descripcion], [precioUnitario], [idClasificacion], [idTipoSum]) VALUES (27, N'Levorfanol', 318.6, 1, 2)
GO
INSERT [dbo].[Suministro] ([idSuministro], [descripcion], [precioUnitario], [idClasificacion], [idTipoSum]) VALUES (28, N'Perfume Rexona', 190, 1, 1)
GO
INSERT [dbo].[Suministro] ([idSuministro], [descripcion], [precioUnitario], [idClasificacion], [idTipoSum]) VALUES (29, N'Crema para peinar', 250.19999694824219, 1, 1)
GO
INSERT [dbo].[Suministro] ([idSuministro], [descripcion], [precioUnitario], [idClasificacion], [idTipoSum]) VALUES (30, N'Crema para afeitar', 158, 1, 3)
GO
INSERT [dbo].[Suministro] ([idSuministro], [descripcion], [precioUnitario], [idClasificacion], [idTipoSum]) VALUES (31, N'Algodon', 80, 1, 1)
GO
INSERT [dbo].[Suministro] ([idSuministro], [descripcion], [precioUnitario], [idClasificacion], [idTipoSum]) VALUES (32, N'Agua Oxigenada', 290, 1, 3)
GO
SET IDENTITY_INSERT [dbo].[Suministro] OFF
GO
SET IDENTITY_INSERT [dbo].[TiposDoc] ON 
GO
INSERT [dbo].[TiposDoc] ([idTipoDoc], [descripcion]) VALUES (1, N'DNI')
GO
INSERT [dbo].[TiposDoc] ([idTipoDoc], [descripcion]) VALUES (2, N'Pasaporte')
GO
INSERT [dbo].[TiposDoc] ([idTipoDoc], [descripcion]) VALUES (3, N'LC')
GO
INSERT [dbo].[TiposDoc] ([idTipoDoc], [descripcion]) VALUES (4, N'LE')
GO
SET IDENTITY_INSERT [dbo].[TiposDoc] OFF
GO
SET IDENTITY_INSERT [dbo].[TipoSum] ON 
GO
INSERT [dbo].[TipoSum] ([idTipoSum], [descripcion]) VALUES (1, N'Medicamento')
GO
INSERT [dbo].[TipoSum] ([idTipoSum], [descripcion]) VALUES (2, N'Articulo de limpieza')
GO
INSERT [dbo].[TipoSum] ([idTipoSum], [descripcion]) VALUES (3, N'Higiene personal')
GO
INSERT [dbo].[TipoSum] ([idTipoSum], [descripcion]) VALUES (4, N'Estetica')
GO
SET IDENTITY_INSERT [dbo].[TipoSum] OFF
GO
INSERT [dbo].[usuarios] ([usuario], [clave]) VALUES (N'admin', 123456)
GO
INSERT [dbo].[usuarios] ([usuario], [clave]) VALUES (N'usuario1', 101010)
GO
/****** Object:  Index [UQ__Cliente__F3BBE65C92509934]    Script Date: 26/11/2021 17:41:57 ******/
ALTER TABLE [dbo].[Cliente] ADD UNIQUE NONCLUSTERED 
(
	[numDoc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UQ__Profesio__301E9F297A1F0C44]    Script Date: 26/11/2021 17:41:57 ******/
ALTER TABLE [dbo].[Profesional] ADD UNIQUE NONCLUSTERED 
(
	[nroMatricula] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UQ__Profesio__F3BBE65CDA72FCF1]    Script Date: 26/11/2021 17:41:57 ******/
ALTER TABLE [dbo].[Profesional] ADD UNIQUE NONCLUSTERED 
(
	[numDoc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Cobertura] ADD  DEFAULT ((0)) FOR [descuento]
GO
ALTER TABLE [dbo].[Cliente]  WITH CHECK ADD  CONSTRAINT [fk_Cliente_TiposDoc] FOREIGN KEY([idTipoDoc])
REFERENCES [dbo].[TiposDoc] ([idTipoDoc])
GO
ALTER TABLE [dbo].[Cliente] CHECK CONSTRAINT [fk_Cliente_TiposDoc]
GO
ALTER TABLE [dbo].[Cobertura]  WITH CHECK ADD  CONSTRAINT [fk_Cobertura_Descuento] FOREIGN KEY([idDescuento])
REFERENCES [dbo].[descuento] ([idDescuento])
GO
ALTER TABLE [dbo].[Cobertura] CHECK CONSTRAINT [fk_Cobertura_Descuento]
GO
ALTER TABLE [dbo].[Cobertura]  WITH CHECK ADD  CONSTRAINT [fk_Cobertura_Localidad] FOREIGN KEY([idLocalidad])
REFERENCES [dbo].[Localidad] ([idLocalidad])
GO
ALTER TABLE [dbo].[Cobertura] CHECK CONSTRAINT [fk_Cobertura_Localidad]
GO
ALTER TABLE [dbo].[Cobertura]  WITH CHECK ADD  CONSTRAINT [fk_Cobertura_ObraSocial] FOREIGN KEY([idObraSocial])
REFERENCES [dbo].[ObraSocial] ([idObraSocial])
GO
ALTER TABLE [dbo].[Cobertura] CHECK CONSTRAINT [fk_Cobertura_ObraSocial]
GO
ALTER TABLE [dbo].[Cobertura]  WITH CHECK ADD  CONSTRAINT [fk_Cobertura_Suministro] FOREIGN KEY([idSuministro])
REFERENCES [dbo].[Suministro] ([idSuministro])
GO
ALTER TABLE [dbo].[Cobertura] CHECK CONSTRAINT [fk_Cobertura_Suministro]
GO
ALTER TABLE [dbo].[DetalleReceta]  WITH CHECK ADD  CONSTRAINT [fk_DetalleReceta_Receta] FOREIGN KEY([idReceta])
REFERENCES [dbo].[Receta] ([idReceta])
GO
ALTER TABLE [dbo].[DetalleReceta] CHECK CONSTRAINT [fk_DetalleReceta_Receta]
GO
ALTER TABLE [dbo].[DetalleReceta]  WITH CHECK ADD  CONSTRAINT [fk_DetalleReceta_Suministro] FOREIGN KEY([idSuministro])
REFERENCES [dbo].[Suministro] ([idSuministro])
GO
ALTER TABLE [dbo].[DetalleReceta] CHECK CONSTRAINT [fk_DetalleReceta_Suministro]
GO
ALTER TABLE [dbo].[Profesional]  WITH CHECK ADD  CONSTRAINT [fk_Profesional_Especialidad] FOREIGN KEY([idEspecialidad])
REFERENCES [dbo].[Especialidad] ([idEspecialidad])
GO
ALTER TABLE [dbo].[Profesional] CHECK CONSTRAINT [fk_Profesional_Especialidad]
GO
ALTER TABLE [dbo].[Profesional]  WITH CHECK ADD  CONSTRAINT [fk_Profesional_TiposDoc] FOREIGN KEY([idTipoDoc])
REFERENCES [dbo].[TiposDoc] ([idTipoDoc])
GO
ALTER TABLE [dbo].[Profesional] CHECK CONSTRAINT [fk_Profesional_TiposDoc]
GO
ALTER TABLE [dbo].[Receta]  WITH CHECK ADD  CONSTRAINT [fk_Receta_Cliente] FOREIGN KEY([idCliente])
REFERENCES [dbo].[Cliente] ([idCliente])
GO
ALTER TABLE [dbo].[Receta] CHECK CONSTRAINT [fk_Receta_Cliente]
GO
ALTER TABLE [dbo].[Receta]  WITH CHECK ADD  CONSTRAINT [fk_Receta_FormaPago] FOREIGN KEY([idFormaPago])
REFERENCES [dbo].[FormaPago] ([idFormaPago])
GO
ALTER TABLE [dbo].[Receta] CHECK CONSTRAINT [fk_Receta_FormaPago]
GO
ALTER TABLE [dbo].[Receta]  WITH CHECK ADD  CONSTRAINT [fk_Receta_ObraSocial] FOREIGN KEY([idObraSocial])
REFERENCES [dbo].[ObraSocial] ([idObraSocial])
GO
ALTER TABLE [dbo].[Receta] CHECK CONSTRAINT [fk_Receta_ObraSocial]
GO
ALTER TABLE [dbo].[Receta]  WITH CHECK ADD  CONSTRAINT [fk_Receta_Profesional] FOREIGN KEY([idProfesional])
REFERENCES [dbo].[Profesional] ([idProfesional])
GO
ALTER TABLE [dbo].[Receta] CHECK CONSTRAINT [fk_Receta_Profesional]
GO
ALTER TABLE [dbo].[Receta]  WITH CHECK ADD  CONSTRAINT [fkReceta_Sucursal] FOREIGN KEY([nroSucursal])
REFERENCES [dbo].[Sucursal] ([nroSucursal])
GO
ALTER TABLE [dbo].[Receta] CHECK CONSTRAINT [fkReceta_Sucursal]
GO
ALTER TABLE [dbo].[StockSumXSucur]  WITH CHECK ADD  CONSTRAINT [fk_StockSumXSucur_Sucursal] FOREIGN KEY([nroSucursal])
REFERENCES [dbo].[Sucursal] ([nroSucursal])
GO
ALTER TABLE [dbo].[StockSumXSucur] CHECK CONSTRAINT [fk_StockSumXSucur_Sucursal]
GO
ALTER TABLE [dbo].[StockSumXSucur]  WITH CHECK ADD  CONSTRAINT [fk_StockSumXSucur_Suministro] FOREIGN KEY([idSuministro])
REFERENCES [dbo].[Suministro] ([idSuministro])
GO
ALTER TABLE [dbo].[StockSumXSucur] CHECK CONSTRAINT [fk_StockSumXSucur_Suministro]
GO
ALTER TABLE [dbo].[Sucursal]  WITH CHECK ADD  CONSTRAINT [fk_Sucursal_Localidad] FOREIGN KEY([idLocalidad])
REFERENCES [dbo].[Localidad] ([idLocalidad])
GO
ALTER TABLE [dbo].[Sucursal] CHECK CONSTRAINT [fk_Sucursal_Localidad]
GO
ALTER TABLE [dbo].[Suministro]  WITH CHECK ADD  CONSTRAINT [fk_Suministro_Clasificacion] FOREIGN KEY([idClasificacion])
REFERENCES [dbo].[Clasificacion] ([idClasificacion])
GO
ALTER TABLE [dbo].[Suministro] CHECK CONSTRAINT [fk_Suministro_Clasificacion]
GO
ALTER TABLE [dbo].[Suministro]  WITH CHECK ADD  CONSTRAINT [fk_Suministro_TipoSum] FOREIGN KEY([idTipoSum])
REFERENCES [dbo].[TipoSum] ([idTipoSum])
GO
ALTER TABLE [dbo].[Suministro] CHECK CONSTRAINT [fk_Suministro_TipoSum]
GO
/****** Object:  StoredProcedure [dbo].[sp_transaccion_receta]    Script Date: 26/11/2021 17:41:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_transaccion_receta]
(@in_idCliente int, @in_idProfesional int, @in_fecha varchar(50), @in_idObraSocial int,@in_formaPago int,
@in_cantidad int, @in_precio float, @in_idSuministro int)
as
begin 
	begin tran
		declare @stockActual int
		set @stockActual = (Select s.Stock	from StockSumXSucur s where s.idSuministro = @in_idSuministro)
		if(@stockActual < @in_cantidad)
			begin
				rollback tran;
			end
		else
			begin
				insert into Receta (idCliente, idProfesional, fecha, idObraSocial, idFormaPago)
				values(@in_idCliente, @in_idProfesional,@in_fecha, @in_idObraSocial,@in_formaPago);

				-- Obtener el ultimo id de la receta
				declare @idRecInserado int;
				set @idRecInserado = (Select ident_current('Receta'));

				insert into DetalleReceta(idReceta, cantidad, precio, idSuministro)
				values(@idRecInserado, @in_cantidad, @in_precio, @in_idSuministro );

				update StockSumXSucur set Stock = Stock - @in_cantidad where idSuministro = @in_idSuministro;
			end
		commit
	end
GO
USE [master]
GO
ALTER DATABASE [Farmaceutica] SET  READ_WRITE 
GO
