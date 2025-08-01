USE [master]
GO
/****** Object:  Database [ExpresoJF]    Script Date: 04/07/2025 16:36:23 ******/
CREATE DATABASE [ExpresoJF]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ExpresoJF', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\ExpresoJF.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ExpresoJF_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\ExpresoJF_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [ExpresoJF] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ExpresoJF].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ExpresoJF] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ExpresoJF] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ExpresoJF] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ExpresoJF] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ExpresoJF] SET ARITHABORT OFF 
GO
ALTER DATABASE [ExpresoJF] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ExpresoJF] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ExpresoJF] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ExpresoJF] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ExpresoJF] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ExpresoJF] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ExpresoJF] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ExpresoJF] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ExpresoJF] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ExpresoJF] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ExpresoJF] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ExpresoJF] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ExpresoJF] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ExpresoJF] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ExpresoJF] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ExpresoJF] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ExpresoJF] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ExpresoJF] SET RECOVERY FULL 
GO
ALTER DATABASE [ExpresoJF] SET  MULTI_USER 
GO
ALTER DATABASE [ExpresoJF] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ExpresoJF] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ExpresoJF] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ExpresoJF] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ExpresoJF] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ExpresoJF] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'ExpresoJF', N'ON'
GO
ALTER DATABASE [ExpresoJF] SET QUERY_STORE = OFF
GO
ALTER AUTHORIZATION ON DATABASE::[ExpresoJF] TO [DESKTOP-6LAFUEI\Yunibasu]
GO
USE [ExpresoJF]
GO
/****** Object:  Table [dbo].[AlertaMantenimiento]    Script Date: 04/07/2025 16:36:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AlertaMantenimiento](
	[id_alerta] [int] IDENTITY(1,1) NOT NULL,
	[id_bus] [int] NULL,
	[tipo_alerta] [varchar](30) NULL,
	[descripcion] [varchar](500) NULL,
	[fecha_generacion] [datetime] NULL,
	[fecha_resolucion] [datetime] NULL,
	[criticidad] [varchar](10) NULL,
	[estado] [varchar](20) NULL,
	[id_mantenimiento_relacionado] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_alerta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER AUTHORIZATION ON [dbo].[AlertaMantenimiento] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[Asignacion]    Script Date: 04/07/2025 16:36:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Asignacion](
	[id_asignacion] [int] IDENTITY(1,1) NOT NULL,
	[id_bus] [int] NULL,
	[id_conductor] [int] NULL,
	[id_ruta] [int] NULL,
	[fecha_asignacion] [datetime] NULL,
	[fecha_finalizacion] [datetime] NULL,
	[kilometraje_inicial] [int] NULL,
	[kilometraje_final] [int] NULL,
	[horas_conduccion] [decimal](6, 2) NULL,
	[consumo_combustible] [decimal](6, 2) NULL,
	[incidencias_reportadas] [varchar](1) NULL,
	[descripcion_incidencias] [varchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_asignacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER AUTHORIZATION ON [dbo].[Asignacion] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[Bus]    Script Date: 04/07/2025 16:36:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bus](
	[id_bus] [int] IDENTITY(1,1) NOT NULL,
	[placa] [varchar](10) NULL,
	[marca] [varchar](50) NULL,
	[modelo] [varchar](50) NULL,
	[anio_fabricacion] [int] NULL,
	[capacidad_pasajeros] [int] NULL,
	[numero_motor] [varchar](50) NULL,
	[numero_chasis] [varchar](50) NULL,
	[fecha_incorporacion] [date] NULL,
	[fecha_ultimo_mantenimiento] [date] NULL,
	[kilometraje_actual] [int] NULL,
	[estado_operativo] [varchar](20) NULL,
	[ciclo_mantenimiento_km] [int] NULL,
	[ciclo_mantenimiento_dias] [int] NULL,
	[imagen_vehiculo] [varchar](255) NULL,
	[observaciones] [varchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_bus] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER AUTHORIZATION ON [dbo].[Bus] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[Conductor]    Script Date: 04/07/2025 16:36:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Conductor](
	[id_conductor] [int] IDENTITY(1,1) NOT NULL,
	[dni] [varchar](15) NULL,
	[nombre_completo] [varchar](100) NULL,
	[licencia_conducir] [varchar](20) NULL,
	[categoria_licencia] [varchar](10) NULL,
	[fecha_contratacion] [date] NULL,
	[fecha_vencimiento_licencia] [date] NULL,
	[horas_conduccion_mes] [int] NULL,
	[evaluacion_conduccion] [decimal](3, 2) NULL,
	[estado] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_conductor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER AUTHORIZATION ON [dbo].[Conductor] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[DetalleMantenimiento]    Script Date: 04/07/2025 16:36:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetalleMantenimiento](
	[id_detalle] [int] IDENTITY(1,1) NOT NULL,
	[id_mantenimiento] [int] NULL,
	[id_item] [int] NULL,
	[realizado] [varchar](1) NULL,
	[valor_encontrado] [varchar](100) NULL,
	[cumplimiento] [varchar](1) NULL,
	[observaciones] [varchar](500) NULL,
	[fecha_hora_ejecucion] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_detalle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER AUTHORIZATION ON [dbo].[DetalleMantenimiento] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[DetalleOrdenCompra]    Script Date: 04/07/2025 16:36:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetalleOrdenCompra](
	[id_detalle] [int] IDENTITY(1,1) NOT NULL,
	[id_orden] [int] NULL,
	[codigo_item] [varchar](50) NULL,
	[descripcion] [varchar](100) NULL,
	[cantidad] [decimal](10, 2) NULL,
	[unidad_medida] [varchar](10) NULL,
	[precio_unitario] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_detalle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER AUTHORIZATION ON [dbo].[DetalleOrdenCompra] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[HistoricoFallo]    Script Date: 04/07/2025 16:36:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HistoricoFallo](
	[id_fallo] [int] IDENTITY(1,1) NOT NULL,
	[id_bus] [int] NULL,
	[id_conductor] [int] NULL,
	[id_asignacion] [int] NULL,
	[fecha_reporte] [datetime] NULL,
	[fecha_solucion] [datetime] NULL,
	[descripcion_fallo] [varchar](500) NULL,
	[sintomas] [varchar](500) NULL,
	[diagnostico] [varchar](500) NULL,
	[accion_correctiva] [varchar](500) NULL,
	[kilometraje_ocurrencia] [int] NULL,
	[gravedad] [varchar](10) NULL,
	[causa_raiz] [varchar](100) NULL,
	[costo_reparacion] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_fallo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER AUTHORIZATION ON [dbo].[HistoricoFallo] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[InspeccionDiaria]    Script Date: 04/07/2025 16:36:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InspeccionDiaria](
	[id_inspeccion] [int] IDENTITY(1,1) NOT NULL,
	[id_bus] [int] NULL,
	[id_conductor] [int] NULL,
	[fecha_inspeccion] [date] NULL,
	[hora_inspeccion] [time](7) NULL,
	[kilometraje] [int] NULL,
	[nivel_combustible] [varchar](10) NULL,
	[estado_neumaticos] [varchar](20) NULL,
	[nivel_aceite] [varchar](10) NULL,
	[nivel_refrigerante] [varchar](10) NULL,
	[nivel_fluido_frenos] [varchar](10) NULL,
	[luces_funcionando] [varchar](1) NULL,
	[frenos_operativos] [varchar](1) NULL,
	[sistema_electrico_ok] [varchar](1) NULL,
	[observaciones] [varchar](500) NULL,
	[aprobado] [varchar](1) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_inspeccion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER AUTHORIZATION ON [dbo].[InspeccionDiaria] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[ItemChecklist]    Script Date: 04/07/2025 16:36:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ItemChecklist](
	[id_item] [int] IDENTITY(1,1) NOT NULL,
	[id_tipo] [int] NULL,
	[codigo_item] [varchar](20) NULL,
	[descripcion] [varchar](500) NULL,
	[es_critico] [varchar](1) NULL,
	[orden_ejecucion] [int] NULL,
	[parametro_aceptacion] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_item] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER AUTHORIZATION ON [dbo].[ItemChecklist] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[Mantenimiento]    Script Date: 04/07/2025 16:36:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Mantenimiento](
	[id_mantenimiento] [int] IDENTITY(1,1) NOT NULL,
	[id_bus] [int] NULL,
	[id_tipo] [int] NULL,
	[id_programacion] [int] NULL,
	[fecha_inicio] [datetime] NULL,
	[fecha_fin] [datetime] NULL,
	[kilometraje_ejecucion] [int] NULL,
	[horas_invertidas] [decimal](5, 2) NULL,
	[costo_total] [decimal](10, 2) NULL,
	[estado] [varchar](20) NULL,
	[observaciones] [varchar](500) NULL,
	[tecnico_responsable] [varchar](100) NULL,
	[firma_responsable] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_mantenimiento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER AUTHORIZATION ON [dbo].[Mantenimiento] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[OrdenCompra]    Script Date: 04/07/2025 16:36:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrdenCompra](
	[id_orden] [int] IDENTITY(1,1) NOT NULL,
	[id_proveedor] [int] NULL,
	[id_mantenimiento] [int] NULL,
	[numero_orden] [varchar](20) NULL,
	[fecha_emision] [date] NULL,
	[fecha_entrega_esperada] [date] NULL,
	[estado] [varchar](20) NULL,
	[subtotal] [decimal](10, 2) NULL,
	[igv] [decimal](10, 2) NULL,
	[total] [decimal](10, 2) NULL,
	[observaciones] [varchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_orden] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER AUTHORIZATION ON [dbo].[OrdenCompra] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[ProgramacionMantenimiento]    Script Date: 04/07/2025 16:36:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProgramacionMantenimiento](
	[id_programacion] [int] IDENTITY(1,1) NOT NULL,
	[id_bus] [int] NULL,
	[id_tipo] [int] NULL,
	[fecha_programada] [date] NULL,
	[kilometraje_estimado] [int] NULL,
	[prioridad] [varchar](10) NULL,
	[estado] [varchar](20) NULL,
	[fecha_recordatorio] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_programacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER AUTHORIZATION ON [dbo].[ProgramacionMantenimiento] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[Proveedor]    Script Date: 04/07/2025 16:36:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Proveedor](
	[id_proveedor] [int] IDENTITY(1,1) NOT NULL,
	[ruc] [varchar](20) NULL,
	[razon_social] [varchar](100) NULL,
	[contacto_principal] [varchar](100) NULL,
	[telefono] [varchar](15) NULL,
	[email] [varchar](100) NULL,
	[direccion] [varchar](255) NULL,
	[especialidad] [varchar](100) NULL,
	[evaluacion_proveedor] [decimal](3, 2) NULL,
	[activo] [varchar](1) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_proveedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER AUTHORIZATION ON [dbo].[Proveedor] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[RepuestoUtilizado]    Script Date: 04/07/2025 16:36:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RepuestoUtilizado](
	[id_repuesto] [int] IDENTITY(1,1) NOT NULL,
	[id_mantenimiento] [int] NULL,
	[codigo_repuesto] [varchar](50) NULL,
	[descripcion] [varchar](100) NULL,
	[cantidad] [decimal](10, 2) NULL,
	[unidad_medida] [varchar](10) NULL,
	[costo_unitario] [decimal](10, 2) NULL,
	[numero_serie] [varchar](50) NULL,
	[proveedor] [varchar](100) NULL,
	[garantia_meses] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_repuesto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER AUTHORIZATION ON [dbo].[RepuestoUtilizado] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[Ruta]    Script Date: 04/07/2025 16:36:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ruta](
	[id_ruta] [int] IDENTITY(1,1) NOT NULL,
	[codigo_ruta] [varchar](20) NULL,
	[nombre_ruta] [varchar](100) NULL,
	[origen] [varchar](100) NULL,
	[destino] [varchar](100) NULL,
	[distancia_km] [decimal](10, 2) NULL,
	[tipo_terreno] [varchar](50) NULL,
	[tiempo_estimado_horas] [decimal](5, 2) NULL,
	[nivel_dificultad] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_ruta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER AUTHORIZATION ON [dbo].[Ruta] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[TipoMantenimiento]    Script Date: 04/07/2025 16:36:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoMantenimiento](
	[id_tipo] [int] IDENTITY(1,1) NOT NULL,
	[codigo_tipo] [varchar](20) NULL,
	[nombre] [varchar](100) NULL,
	[descripcion] [varchar](500) NULL,
	[categoria] [varchar](50) NULL,
	[prioridad] [varchar](10) NULL,
	[intervalo_km] [int] NULL,
	[intervalo_dias] [int] NULL,
	[duracion_estimada_horas] [decimal](5, 2) NULL,
	[costo_estimado] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_tipo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER AUTHORIZATION ON [dbo].[TipoMantenimiento] TO  SCHEMA OWNER 
GO
SET IDENTITY_INSERT [dbo].[AlertaMantenimiento] ON 

INSERT [dbo].[AlertaMantenimiento] ([id_alerta], [id_bus], [tipo_alerta], [descripcion], [fecha_generacion], [fecha_resolucion], [criticidad], [estado], [id_mantenimiento_relacionado]) VALUES (12, 1, N'Kilometraje', N'Se superó el límite de mantenimiento por kilometraje.', CAST(N'2024-07-01T00:00:00.000' AS DateTime), CAST(N'2024-07-03T00:00:00.000' AS DateTime), N'Alta', N'Atendida', 2)
INSERT [dbo].[AlertaMantenimiento] ([id_alerta], [id_bus], [tipo_alerta], [descripcion], [fecha_generacion], [fecha_resolucion], [criticidad], [estado], [id_mantenimiento_relacionado]) VALUES (13, 2, N'Tiempo', N'Ya pasaron más de 90 días desde el último mantenimiento.', CAST(N'2024-07-02T00:00:00.000' AS DateTime), NULL, N'Media', N'Pendiente', 3)
INSERT [dbo].[AlertaMantenimiento] ([id_alerta], [id_bus], [tipo_alerta], [descripcion], [fecha_generacion], [fecha_resolucion], [criticidad], [estado], [id_mantenimiento_relacionado]) VALUES (14, 3, N'Fallo', N'Historial indica problemas repetitivos en el motor.', CAST(N'2024-07-03T00:00:00.000' AS DateTime), CAST(N'2024-07-04T00:00:00.000' AS DateTime), N'Alta', N'Atendida', 4)
INSERT [dbo].[AlertaMantenimiento] ([id_alerta], [id_bus], [tipo_alerta], [descripcion], [fecha_generacion], [fecha_resolucion], [criticidad], [estado], [id_mantenimiento_relacionado]) VALUES (15, 4, N'Inspección', N'No se realizó la inspección programada.', CAST(N'2024-07-05T00:00:00.000' AS DateTime), CAST(N'2024-07-06T00:00:00.000' AS DateTime), N'Urgente', N'Atendida', 5)
INSERT [dbo].[AlertaMantenimiento] ([id_alerta], [id_bus], [tipo_alerta], [descripcion], [fecha_generacion], [fecha_resolucion], [criticidad], [estado], [id_mantenimiento_relacionado]) VALUES (16, 5, N'Kilometraje', N'Se excedió el rango recomendado de mantenimiento.', CAST(N'2024-07-06T00:00:00.000' AS DateTime), NULL, N'Alta', N'Pendiente', 6)
INSERT [dbo].[AlertaMantenimiento] ([id_alerta], [id_bus], [tipo_alerta], [descripcion], [fecha_generacion], [fecha_resolucion], [criticidad], [estado], [id_mantenimiento_relacionado]) VALUES (17, 6, N'Tiempo', N'Intervalo de tiempo para mantenimiento superado.', CAST(N'2024-07-07T00:00:00.000' AS DateTime), CAST(N'2024-07-09T00:00:00.000' AS DateTime), N'Media', N'Atendida', 7)
INSERT [dbo].[AlertaMantenimiento] ([id_alerta], [id_bus], [tipo_alerta], [descripcion], [fecha_generacion], [fecha_resolucion], [criticidad], [estado], [id_mantenimiento_relacionado]) VALUES (18, 7, N'Fallo', N'Reporte de fallos eléctricos recientes.', CAST(N'2024-07-08T00:00:00.000' AS DateTime), NULL, N'Alta', N'Pendiente', 8)
INSERT [dbo].[AlertaMantenimiento] ([id_alerta], [id_bus], [tipo_alerta], [descripcion], [fecha_generacion], [fecha_resolucion], [criticidad], [estado], [id_mantenimiento_relacionado]) VALUES (19, 8, N'Inspección', N'Se omitió revisión diaria de luces.', CAST(N'2024-07-09T00:00:00.000' AS DateTime), NULL, N'Baja', N'Pendiente', 9)
INSERT [dbo].[AlertaMantenimiento] ([id_alerta], [id_bus], [tipo_alerta], [descripcion], [fecha_generacion], [fecha_resolucion], [criticidad], [estado], [id_mantenimiento_relacionado]) VALUES (20, 9, N'Kilometraje', N'Mantenimiento preventivo requerido.', CAST(N'2024-07-10T00:00:00.000' AS DateTime), CAST(N'2024-07-12T00:00:00.000' AS DateTime), N'Media', N'Atendida', 10)
INSERT [dbo].[AlertaMantenimiento] ([id_alerta], [id_bus], [tipo_alerta], [descripcion], [fecha_generacion], [fecha_resolucion], [criticidad], [estado], [id_mantenimiento_relacionado]) VALUES (21, 10, N'Tiempo', N'Límite de días superado.', CAST(N'2024-07-11T00:00:00.000' AS DateTime), CAST(N'2024-07-13T00:00:00.000' AS DateTime), N'Alta', N'Atendida', 11)
INSERT [dbo].[AlertaMantenimiento] ([id_alerta], [id_bus], [tipo_alerta], [descripcion], [fecha_generacion], [fecha_resolucion], [criticidad], [estado], [id_mantenimiento_relacionado]) VALUES (22, 11, N'Fallo', N'Se detectó pérdida de potencia.', CAST(N'2024-07-12T00:00:00.000' AS DateTime), NULL, N'Urgente', N'Pendiente', 12)
INSERT [dbo].[AlertaMantenimiento] ([id_alerta], [id_bus], [tipo_alerta], [descripcion], [fecha_generacion], [fecha_resolucion], [criticidad], [estado], [id_mantenimiento_relacionado]) VALUES (23, 12, N'Inspección', N'Neumáticos desgastados en revisión visual.', CAST(N'2024-07-13T00:00:00.000' AS DateTime), CAST(N'2024-07-14T00:00:00.000' AS DateTime), N'Media', N'Atendida', 13)
INSERT [dbo].[AlertaMantenimiento] ([id_alerta], [id_bus], [tipo_alerta], [descripcion], [fecha_generacion], [fecha_resolucion], [criticidad], [estado], [id_mantenimiento_relacionado]) VALUES (24, 13, N'Kilometraje', N'Mantenimiento programado superado en 1000 km.', CAST(N'2024-07-14T00:00:00.000' AS DateTime), NULL, N'Alta', N'Pendiente', 14)
INSERT [dbo].[AlertaMantenimiento] ([id_alerta], [id_bus], [tipo_alerta], [descripcion], [fecha_generacion], [fecha_resolucion], [criticidad], [estado], [id_mantenimiento_relacionado]) VALUES (25, 14, N'Tiempo', N'Atraso en mantenimiento.', CAST(N'2024-07-15T00:00:00.000' AS DateTime), CAST(N'2024-07-16T00:00:00.000' AS DateTime), N'Media', N'Atendida', 15)
INSERT [dbo].[AlertaMantenimiento] ([id_alerta], [id_bus], [tipo_alerta], [descripcion], [fecha_generacion], [fecha_resolucion], [criticidad], [estado], [id_mantenimiento_relacionado]) VALUES (26, 15, N'Fallo', N'Sistema de frenos requiere inspección urgente.', CAST(N'2024-07-16T00:00:00.000' AS DateTime), NULL, N'Urgente', N'Pendiente', 16)
INSERT [dbo].[AlertaMantenimiento] ([id_alerta], [id_bus], [tipo_alerta], [descripcion], [fecha_generacion], [fecha_resolucion], [criticidad], [estado], [id_mantenimiento_relacionado]) VALUES (27, 16, N'Inspección', N'Falta de aprobación en control diario.', CAST(N'2024-07-17T00:00:00.000' AS DateTime), CAST(N'2024-07-18T00:00:00.000' AS DateTime), N'Alta', N'Atendida', 17)
INSERT [dbo].[AlertaMantenimiento] ([id_alerta], [id_bus], [tipo_alerta], [descripcion], [fecha_generacion], [fecha_resolucion], [criticidad], [estado], [id_mantenimiento_relacionado]) VALUES (28, 17, N'Kilometraje', N'Revisión de motor por kilometraje excesivo.', CAST(N'2024-07-18T00:00:00.000' AS DateTime), NULL, N'Media', N'Pendiente', 18)
INSERT [dbo].[AlertaMantenimiento] ([id_alerta], [id_bus], [tipo_alerta], [descripcion], [fecha_generacion], [fecha_resolucion], [criticidad], [estado], [id_mantenimiento_relacionado]) VALUES (29, 18, N'Tiempo', N'Ya pasaron 120 días desde el último servicio.', CAST(N'2024-07-19T00:00:00.000' AS DateTime), CAST(N'2024-07-20T00:00:00.000' AS DateTime), N'Alta', N'Atendida', 19)
INSERT [dbo].[AlertaMantenimiento] ([id_alerta], [id_bus], [tipo_alerta], [descripcion], [fecha_generacion], [fecha_resolucion], [criticidad], [estado], [id_mantenimiento_relacionado]) VALUES (30, 19, N'Fallo', N'Ruido inusual reportado.', CAST(N'2024-07-20T00:00:00.000' AS DateTime), NULL, N'Media', N'Pendiente', 20)
INSERT [dbo].[AlertaMantenimiento] ([id_alerta], [id_bus], [tipo_alerta], [descripcion], [fecha_generacion], [fecha_resolucion], [criticidad], [estado], [id_mantenimiento_relacionado]) VALUES (31, 20, N'Inspección', N'Nivel bajo de aceite detectado.', CAST(N'2024-07-21T00:00:00.000' AS DateTime), CAST(N'2024-07-22T00:00:00.000' AS DateTime), N'Alta', N'Atendida', 21)
INSERT [dbo].[AlertaMantenimiento] ([id_alerta], [id_bus], [tipo_alerta], [descripcion], [fecha_generacion], [fecha_resolucion], [criticidad], [estado], [id_mantenimiento_relacionado]) VALUES (32, 21, N'Kilometraje', N'Acumulación de más de 6000 km sin mantenimiento.', CAST(N'2024-07-22T00:00:00.000' AS DateTime), NULL, N'Urgente', N'Pendiente', 22)
INSERT [dbo].[AlertaMantenimiento] ([id_alerta], [id_bus], [tipo_alerta], [descripcion], [fecha_generacion], [fecha_resolucion], [criticidad], [estado], [id_mantenimiento_relacionado]) VALUES (33, 22, N'Tiempo', N'Control general pendiente.', CAST(N'2024-07-23T00:00:00.000' AS DateTime), CAST(N'2024-07-24T00:00:00.000' AS DateTime), N'Media', N'Atendida', 23)
INSERT [dbo].[AlertaMantenimiento] ([id_alerta], [id_bus], [tipo_alerta], [descripcion], [fecha_generacion], [fecha_resolucion], [criticidad], [estado], [id_mantenimiento_relacionado]) VALUES (34, 23, N'Fallo', N'Sistema eléctrico inestable.', CAST(N'2024-07-24T00:00:00.000' AS DateTime), NULL, N'Alta', N'Pendiente', 24)
INSERT [dbo].[AlertaMantenimiento] ([id_alerta], [id_bus], [tipo_alerta], [descripcion], [fecha_generacion], [fecha_resolucion], [criticidad], [estado], [id_mantenimiento_relacionado]) VALUES (35, 24, N'Inspección', N'Frenos con desgaste evidente.', CAST(N'2024-07-25T00:00:00.000' AS DateTime), CAST(N'2024-07-26T00:00:00.000' AS DateTime), N'Alta', N'Atendida', 25)
INSERT [dbo].[AlertaMantenimiento] ([id_alerta], [id_bus], [tipo_alerta], [descripcion], [fecha_generacion], [fecha_resolucion], [criticidad], [estado], [id_mantenimiento_relacionado]) VALUES (36, 25, N'Kilometraje', N'Exceso de kilometraje sin chequeo.', CAST(N'2024-07-26T00:00:00.000' AS DateTime), NULL, N'Media', N'Pendiente', 26)
INSERT [dbo].[AlertaMantenimiento] ([id_alerta], [id_bus], [tipo_alerta], [descripcion], [fecha_generacion], [fecha_resolucion], [criticidad], [estado], [id_mantenimiento_relacionado]) VALUES (37, 26, N'Tiempo', N'Más de 90 días sin intervención.', CAST(N'2024-07-27T00:00:00.000' AS DateTime), CAST(N'2024-07-28T00:00:00.000' AS DateTime), N'Alta', N'Atendida', 27)
INSERT [dbo].[AlertaMantenimiento] ([id_alerta], [id_bus], [tipo_alerta], [descripcion], [fecha_generacion], [fecha_resolucion], [criticidad], [estado], [id_mantenimiento_relacionado]) VALUES (38, 27, N'Fallo', N'Fallos en el alternador detectados.', CAST(N'2024-07-28T00:00:00.000' AS DateTime), NULL, N'Urgente', N'Pendiente', 28)
INSERT [dbo].[AlertaMantenimiento] ([id_alerta], [id_bus], [tipo_alerta], [descripcion], [fecha_generacion], [fecha_resolucion], [criticidad], [estado], [id_mantenimiento_relacionado]) VALUES (39, 28, N'Inspección', N'Sistema de frenos no aprobado.', CAST(N'2024-07-29T00:00:00.000' AS DateTime), CAST(N'2024-07-30T00:00:00.000' AS DateTime), N'Alta', N'Atendida', 29)
INSERT [dbo].[AlertaMantenimiento] ([id_alerta], [id_bus], [tipo_alerta], [descripcion], [fecha_generacion], [fecha_resolucion], [criticidad], [estado], [id_mantenimiento_relacionado]) VALUES (40, 29, N'Kilometraje', N'Se requiere mantenimiento por kilometraje.', CAST(N'2024-07-30T00:00:00.000' AS DateTime), NULL, N'Media', N'Pendiente', 30)
INSERT [dbo].[AlertaMantenimiento] ([id_alerta], [id_bus], [tipo_alerta], [descripcion], [fecha_generacion], [fecha_resolucion], [criticidad], [estado], [id_mantenimiento_relacionado]) VALUES (41, 30, N'Tiempo', N'Servicio regular retrasado.', CAST(N'2024-07-31T00:00:00.000' AS DateTime), CAST(N'2024-08-01T00:00:00.000' AS DateTime), N'Alta', N'Atendida', 31)
INSERT [dbo].[AlertaMantenimiento] ([id_alerta], [id_bus], [tipo_alerta], [descripcion], [fecha_generacion], [fecha_resolucion], [criticidad], [estado], [id_mantenimiento_relacionado]) VALUES (42, 31, N'Fallo', N'Detección de fuga de refrigerante.', CAST(N'2024-08-01T00:00:00.000' AS DateTime), NULL, N'Urgente', N'Pendiente', 32)
INSERT [dbo].[AlertaMantenimiento] ([id_alerta], [id_bus], [tipo_alerta], [descripcion], [fecha_generacion], [fecha_resolucion], [criticidad], [estado], [id_mantenimiento_relacionado]) VALUES (43, 32, N'Inspección', N'Luces no funcionales detectadas.', CAST(N'2024-08-02T00:00:00.000' AS DateTime), CAST(N'2024-08-03T00:00:00.000' AS DateTime), N'Media', N'Atendida', 33)
INSERT [dbo].[AlertaMantenimiento] ([id_alerta], [id_bus], [tipo_alerta], [descripcion], [fecha_generacion], [fecha_resolucion], [criticidad], [estado], [id_mantenimiento_relacionado]) VALUES (44, 33, N'Kilometraje', N'Vehículo llegó a los 50,000 km.', CAST(N'2024-08-03T00:00:00.000' AS DateTime), NULL, N'Alta', N'Pendiente', 34)
INSERT [dbo].[AlertaMantenimiento] ([id_alerta], [id_bus], [tipo_alerta], [descripcion], [fecha_generacion], [fecha_resolucion], [criticidad], [estado], [id_mantenimiento_relacionado]) VALUES (45, 34, N'Tiempo', N'Planificación vencida.', CAST(N'2024-08-04T00:00:00.000' AS DateTime), CAST(N'2024-08-05T00:00:00.000' AS DateTime), N'Media', N'Atendida', 35)
INSERT [dbo].[AlertaMantenimiento] ([id_alerta], [id_bus], [tipo_alerta], [descripcion], [fecha_generacion], [fecha_resolucion], [criticidad], [estado], [id_mantenimiento_relacionado]) VALUES (46, 35, N'Fallo', N'Falla de motor en arranque.', CAST(N'2024-08-05T00:00:00.000' AS DateTime), NULL, N'Urgente', N'Pendiente', 36)
INSERT [dbo].[AlertaMantenimiento] ([id_alerta], [id_bus], [tipo_alerta], [descripcion], [fecha_generacion], [fecha_resolucion], [criticidad], [estado], [id_mantenimiento_relacionado]) VALUES (47, 36, N'Inspección', N'Sistema eléctrico no verificado.', CAST(N'2024-08-06T00:00:00.000' AS DateTime), CAST(N'2024-08-07T00:00:00.000' AS DateTime), N'Alta', N'Atendida', 37)
INSERT [dbo].[AlertaMantenimiento] ([id_alerta], [id_bus], [tipo_alerta], [descripcion], [fecha_generacion], [fecha_resolucion], [criticidad], [estado], [id_mantenimiento_relacionado]) VALUES (48, 37, N'Kilometraje', N'Revisión cada 5000 km no realizada.', CAST(N'2024-08-07T00:00:00.000' AS DateTime), NULL, N'Media', N'Pendiente', 38)
INSERT [dbo].[AlertaMantenimiento] ([id_alerta], [id_bus], [tipo_alerta], [descripcion], [fecha_generacion], [fecha_resolucion], [criticidad], [estado], [id_mantenimiento_relacionado]) VALUES (49, 38, N'Tiempo', N'Tiempo de mantenimiento excedido.', CAST(N'2024-08-08T00:00:00.000' AS DateTime), CAST(N'2024-08-09T00:00:00.000' AS DateTime), N'Alta', N'Atendida', 39)
INSERT [dbo].[AlertaMantenimiento] ([id_alerta], [id_bus], [tipo_alerta], [descripcion], [fecha_generacion], [fecha_resolucion], [criticidad], [estado], [id_mantenimiento_relacionado]) VALUES (50, 39, N'Fallo', N'Sensor de oxígeno defectuoso.', CAST(N'2024-08-09T00:00:00.000' AS DateTime), NULL, N'Urgente', N'Pendiente', 40)
INSERT [dbo].[AlertaMantenimiento] ([id_alerta], [id_bus], [tipo_alerta], [descripcion], [fecha_generacion], [fecha_resolucion], [criticidad], [estado], [id_mantenimiento_relacionado]) VALUES (51, 40, N'Inspección', N'Batería baja reportada.', CAST(N'2024-08-10T00:00:00.000' AS DateTime), CAST(N'2024-08-11T00:00:00.000' AS DateTime), N'Media', N'Atendida', 41)
SET IDENTITY_INSERT [dbo].[AlertaMantenimiento] OFF
GO
SET IDENTITY_INSERT [dbo].[Asignacion] ON 

INSERT [dbo].[Asignacion] ([id_asignacion], [id_bus], [id_conductor], [id_ruta], [fecha_asignacion], [fecha_finalizacion], [kilometraje_inicial], [kilometraje_final], [horas_conduccion], [consumo_combustible], [incidencias_reportadas], [descripcion_incidencias]) VALUES (1, 1, 1, 1, CAST(N'2024-01-10T08:00:00.000' AS DateTime), CAST(N'2024-01-10T12:00:00.000' AS DateTime), 10000, 10090, CAST(4.00 AS Decimal(6, 2)), CAST(18.50 AS Decimal(6, 2)), N'0', NULL)
INSERT [dbo].[Asignacion] ([id_asignacion], [id_bus], [id_conductor], [id_ruta], [fecha_asignacion], [fecha_finalizacion], [kilometraje_inicial], [kilometraje_final], [horas_conduccion], [consumo_combustible], [incidencias_reportadas], [descripcion_incidencias]) VALUES (2, 2, 2, 2, CAST(N'2024-01-11T07:30:00.000' AS DateTime), CAST(N'2024-01-11T11:00:00.000' AS DateTime), 20300, 20380, CAST(3.50 AS Decimal(6, 2)), CAST(15.00 AS Decimal(6, 2)), N'1', N'Revisión de frenos')
INSERT [dbo].[Asignacion] ([id_asignacion], [id_bus], [id_conductor], [id_ruta], [fecha_asignacion], [fecha_finalizacion], [kilometraje_inicial], [kilometraje_final], [horas_conduccion], [consumo_combustible], [incidencias_reportadas], [descripcion_incidencias]) VALUES (3, 3, 3, 3, CAST(N'2024-01-12T09:00:00.000' AS DateTime), CAST(N'2024-01-12T13:00:00.000' AS DateTime), 5000, 5090, CAST(4.00 AS Decimal(6, 2)), CAST(20.00 AS Decimal(6, 2)), N'0', NULL)
INSERT [dbo].[Asignacion] ([id_asignacion], [id_bus], [id_conductor], [id_ruta], [fecha_asignacion], [fecha_finalizacion], [kilometraje_inicial], [kilometraje_final], [horas_conduccion], [consumo_combustible], [incidencias_reportadas], [descripcion_incidencias]) VALUES (4, 4, 4, 4, CAST(N'2024-01-13T06:30:00.000' AS DateTime), CAST(N'2024-01-13T10:00:00.000' AS DateTime), 7500, 7600, CAST(3.50 AS Decimal(6, 2)), CAST(17.50 AS Decimal(6, 2)), N'0', NULL)
INSERT [dbo].[Asignacion] ([id_asignacion], [id_bus], [id_conductor], [id_ruta], [fecha_asignacion], [fecha_finalizacion], [kilometraje_inicial], [kilometraje_final], [horas_conduccion], [consumo_combustible], [incidencias_reportadas], [descripcion_incidencias]) VALUES (5, 5, 5, 5, CAST(N'2024-01-14T10:00:00.000' AS DateTime), CAST(N'2024-01-14T13:30:00.000' AS DateTime), 18000, 18090, CAST(3.50 AS Decimal(6, 2)), CAST(19.50 AS Decimal(6, 2)), N'1', N'Luces traseras apagadas')
INSERT [dbo].[Asignacion] ([id_asignacion], [id_bus], [id_conductor], [id_ruta], [fecha_asignacion], [fecha_finalizacion], [kilometraje_inicial], [kilometraje_final], [horas_conduccion], [consumo_combustible], [incidencias_reportadas], [descripcion_incidencias]) VALUES (6, 6, 6, 6, CAST(N'2024-01-15T08:30:00.000' AS DateTime), CAST(N'2024-01-15T11:45:00.000' AS DateTime), 9200, 9290, CAST(3.25 AS Decimal(6, 2)), CAST(18.00 AS Decimal(6, 2)), N'0', NULL)
INSERT [dbo].[Asignacion] ([id_asignacion], [id_bus], [id_conductor], [id_ruta], [fecha_asignacion], [fecha_finalizacion], [kilometraje_inicial], [kilometraje_final], [horas_conduccion], [consumo_combustible], [incidencias_reportadas], [descripcion_incidencias]) VALUES (7, 7, 7, 7, CAST(N'2024-01-16T07:00:00.000' AS DateTime), CAST(N'2024-01-16T10:00:00.000' AS DateTime), 13000, 13090, CAST(3.00 AS Decimal(6, 2)), CAST(16.00 AS Decimal(6, 2)), N'0', NULL)
INSERT [dbo].[Asignacion] ([id_asignacion], [id_bus], [id_conductor], [id_ruta], [fecha_asignacion], [fecha_finalizacion], [kilometraje_inicial], [kilometraje_final], [horas_conduccion], [consumo_combustible], [incidencias_reportadas], [descripcion_incidencias]) VALUES (8, 8, 8, 8, CAST(N'2024-01-17T09:15:00.000' AS DateTime), CAST(N'2024-01-17T12:30:00.000' AS DateTime), 14000, 14090, CAST(3.25 AS Decimal(6, 2)), CAST(15.50 AS Decimal(6, 2)), N'1', N'Revisión de suspensión')
INSERT [dbo].[Asignacion] ([id_asignacion], [id_bus], [id_conductor], [id_ruta], [fecha_asignacion], [fecha_finalizacion], [kilometraje_inicial], [kilometraje_final], [horas_conduccion], [consumo_combustible], [incidencias_reportadas], [descripcion_incidencias]) VALUES (9, 9, 9, 9, CAST(N'2024-01-18T06:00:00.000' AS DateTime), CAST(N'2024-01-18T09:30:00.000' AS DateTime), 6000, 6090, CAST(3.00 AS Decimal(6, 2)), CAST(16.50 AS Decimal(6, 2)), N'0', NULL)
INSERT [dbo].[Asignacion] ([id_asignacion], [id_bus], [id_conductor], [id_ruta], [fecha_asignacion], [fecha_finalizacion], [kilometraje_inicial], [kilometraje_final], [horas_conduccion], [consumo_combustible], [incidencias_reportadas], [descripcion_incidencias]) VALUES (10, 10, 10, 10, CAST(N'2024-01-19T08:00:00.000' AS DateTime), CAST(N'2024-01-19T11:15:00.000' AS DateTime), 10000, 10090, CAST(3.50 AS Decimal(6, 2)), CAST(17.50 AS Decimal(6, 2)), N'0', NULL)
INSERT [dbo].[Asignacion] ([id_asignacion], [id_bus], [id_conductor], [id_ruta], [fecha_asignacion], [fecha_finalizacion], [kilometraje_inicial], [kilometraje_final], [horas_conduccion], [consumo_combustible], [incidencias_reportadas], [descripcion_incidencias]) VALUES (11, 11, 11, 11, CAST(N'2024-01-20T09:30:00.000' AS DateTime), CAST(N'2024-01-20T13:00:00.000' AS DateTime), 20000, 20090, CAST(3.75 AS Decimal(6, 2)), CAST(20.00 AS Decimal(6, 2)), N'0', NULL)
INSERT [dbo].[Asignacion] ([id_asignacion], [id_bus], [id_conductor], [id_ruta], [fecha_asignacion], [fecha_finalizacion], [kilometraje_inicial], [kilometraje_final], [horas_conduccion], [consumo_combustible], [incidencias_reportadas], [descripcion_incidencias]) VALUES (12, 12, 12, 12, CAST(N'2024-01-21T07:00:00.000' AS DateTime), CAST(N'2024-01-21T10:15:00.000' AS DateTime), 8500, 8590, CAST(3.25 AS Decimal(6, 2)), CAST(16.00 AS Decimal(6, 2)), N'0', NULL)
INSERT [dbo].[Asignacion] ([id_asignacion], [id_bus], [id_conductor], [id_ruta], [fecha_asignacion], [fecha_finalizacion], [kilometraje_inicial], [kilometraje_final], [horas_conduccion], [consumo_combustible], [incidencias_reportadas], [descripcion_incidencias]) VALUES (13, 13, 13, 13, CAST(N'2024-01-22T06:30:00.000' AS DateTime), CAST(N'2024-01-22T09:30:00.000' AS DateTime), 7500, 7590, CAST(3.00 AS Decimal(6, 2)), CAST(14.50 AS Decimal(6, 2)), N'1', N'Falla en aire acondicionado')
INSERT [dbo].[Asignacion] ([id_asignacion], [id_bus], [id_conductor], [id_ruta], [fecha_asignacion], [fecha_finalizacion], [kilometraje_inicial], [kilometraje_final], [horas_conduccion], [consumo_combustible], [incidencias_reportadas], [descripcion_incidencias]) VALUES (14, 14, 14, 14, CAST(N'2024-01-23T08:15:00.000' AS DateTime), CAST(N'2024-01-23T11:30:00.000' AS DateTime), 1000, 1090, CAST(3.25 AS Decimal(6, 2)), CAST(15.50 AS Decimal(6, 2)), N'0', NULL)
INSERT [dbo].[Asignacion] ([id_asignacion], [id_bus], [id_conductor], [id_ruta], [fecha_asignacion], [fecha_finalizacion], [kilometraje_inicial], [kilometraje_final], [horas_conduccion], [consumo_combustible], [incidencias_reportadas], [descripcion_incidencias]) VALUES (15, 15, 15, 15, CAST(N'2024-01-24T10:00:00.000' AS DateTime), CAST(N'2024-01-24T13:30:00.000' AS DateTime), 25000, 25090, CAST(3.50 AS Decimal(6, 2)), CAST(17.00 AS Decimal(6, 2)), N'0', NULL)
INSERT [dbo].[Asignacion] ([id_asignacion], [id_bus], [id_conductor], [id_ruta], [fecha_asignacion], [fecha_finalizacion], [kilometraje_inicial], [kilometraje_final], [horas_conduccion], [consumo_combustible], [incidencias_reportadas], [descripcion_incidencias]) VALUES (16, 16, 16, 16, CAST(N'2024-01-25T07:30:00.000' AS DateTime), CAST(N'2024-01-25T11:00:00.000' AS DateTime), 16000, 16090, CAST(3.75 AS Decimal(6, 2)), CAST(18.50 AS Decimal(6, 2)), N'0', NULL)
INSERT [dbo].[Asignacion] ([id_asignacion], [id_bus], [id_conductor], [id_ruta], [fecha_asignacion], [fecha_finalizacion], [kilometraje_inicial], [kilometraje_final], [horas_conduccion], [consumo_combustible], [incidencias_reportadas], [descripcion_incidencias]) VALUES (17, 17, 17, 17, CAST(N'2024-01-26T06:00:00.000' AS DateTime), CAST(N'2024-01-26T09:15:00.000' AS DateTime), 19000, 19090, CAST(3.00 AS Decimal(6, 2)), CAST(16.00 AS Decimal(6, 2)), N'0', NULL)
INSERT [dbo].[Asignacion] ([id_asignacion], [id_bus], [id_conductor], [id_ruta], [fecha_asignacion], [fecha_finalizacion], [kilometraje_inicial], [kilometraje_final], [horas_conduccion], [consumo_combustible], [incidencias_reportadas], [descripcion_incidencias]) VALUES (18, 18, 18, 18, CAST(N'2024-01-27T09:00:00.000' AS DateTime), CAST(N'2024-01-27T12:15:00.000' AS DateTime), 17000, 17090, CAST(3.25 AS Decimal(6, 2)), CAST(15.50 AS Decimal(6, 2)), N'0', NULL)
INSERT [dbo].[Asignacion] ([id_asignacion], [id_bus], [id_conductor], [id_ruta], [fecha_asignacion], [fecha_finalizacion], [kilometraje_inicial], [kilometraje_final], [horas_conduccion], [consumo_combustible], [incidencias_reportadas], [descripcion_incidencias]) VALUES (19, 19, 19, 19, CAST(N'2024-01-28T08:30:00.000' AS DateTime), CAST(N'2024-01-28T11:45:00.000' AS DateTime), 9000, 9090, CAST(3.25 AS Decimal(6, 2)), CAST(17.50 AS Decimal(6, 2)), N'1', N'Motor con ruido extraño')
INSERT [dbo].[Asignacion] ([id_asignacion], [id_bus], [id_conductor], [id_ruta], [fecha_asignacion], [fecha_finalizacion], [kilometraje_inicial], [kilometraje_final], [horas_conduccion], [consumo_combustible], [incidencias_reportadas], [descripcion_incidencias]) VALUES (20, 20, 20, 20, CAST(N'2024-01-29T07:15:00.000' AS DateTime), CAST(N'2024-01-29T10:45:00.000' AS DateTime), 21000, 21090, CAST(3.75 AS Decimal(6, 2)), CAST(18.00 AS Decimal(6, 2)), N'0', NULL)
INSERT [dbo].[Asignacion] ([id_asignacion], [id_bus], [id_conductor], [id_ruta], [fecha_asignacion], [fecha_finalizacion], [kilometraje_inicial], [kilometraje_final], [horas_conduccion], [consumo_combustible], [incidencias_reportadas], [descripcion_incidencias]) VALUES (21, 21, 21, 21, CAST(N'2024-01-30T07:30:00.000' AS DateTime), CAST(N'2024-01-30T11:00:00.000' AS DateTime), 10000, 10090, CAST(3.50 AS Decimal(6, 2)), CAST(16.00 AS Decimal(6, 2)), N'0', NULL)
INSERT [dbo].[Asignacion] ([id_asignacion], [id_bus], [id_conductor], [id_ruta], [fecha_asignacion], [fecha_finalizacion], [kilometraje_inicial], [kilometraje_final], [horas_conduccion], [consumo_combustible], [incidencias_reportadas], [descripcion_incidencias]) VALUES (22, 22, 22, 22, CAST(N'2024-01-31T09:00:00.000' AS DateTime), CAST(N'2024-01-31T12:15:00.000' AS DateTime), 11000, 11090, CAST(3.25 AS Decimal(6, 2)), CAST(15.50 AS Decimal(6, 2)), N'0', NULL)
INSERT [dbo].[Asignacion] ([id_asignacion], [id_bus], [id_conductor], [id_ruta], [fecha_asignacion], [fecha_finalizacion], [kilometraje_inicial], [kilometraje_final], [horas_conduccion], [consumo_combustible], [incidencias_reportadas], [descripcion_incidencias]) VALUES (23, 23, 23, 23, CAST(N'2024-02-01T10:30:00.000' AS DateTime), CAST(N'2024-02-01T14:00:00.000' AS DateTime), 12000, 12090, CAST(3.75 AS Decimal(6, 2)), CAST(17.00 AS Decimal(6, 2)), N'0', NULL)
INSERT [dbo].[Asignacion] ([id_asignacion], [id_bus], [id_conductor], [id_ruta], [fecha_asignacion], [fecha_finalizacion], [kilometraje_inicial], [kilometraje_final], [horas_conduccion], [consumo_combustible], [incidencias_reportadas], [descripcion_incidencias]) VALUES (24, 24, 24, 24, CAST(N'2024-02-02T06:00:00.000' AS DateTime), CAST(N'2024-02-02T09:00:00.000' AS DateTime), 13000, 13090, CAST(3.00 AS Decimal(6, 2)), CAST(14.50 AS Decimal(6, 2)), N'0', NULL)
INSERT [dbo].[Asignacion] ([id_asignacion], [id_bus], [id_conductor], [id_ruta], [fecha_asignacion], [fecha_finalizacion], [kilometraje_inicial], [kilometraje_final], [horas_conduccion], [consumo_combustible], [incidencias_reportadas], [descripcion_incidencias]) VALUES (25, 25, 25, 25, CAST(N'2024-02-03T07:30:00.000' AS DateTime), CAST(N'2024-02-03T10:45:00.000' AS DateTime), 14000, 14090, CAST(3.25 AS Decimal(6, 2)), CAST(16.50 AS Decimal(6, 2)), N'0', NULL)
INSERT [dbo].[Asignacion] ([id_asignacion], [id_bus], [id_conductor], [id_ruta], [fecha_asignacion], [fecha_finalizacion], [kilometraje_inicial], [kilometraje_final], [horas_conduccion], [consumo_combustible], [incidencias_reportadas], [descripcion_incidencias]) VALUES (26, 26, 26, 26, CAST(N'2024-02-04T08:00:00.000' AS DateTime), CAST(N'2024-02-04T11:15:00.000' AS DateTime), 15000, 15090, CAST(3.50 AS Decimal(6, 2)), CAST(17.50 AS Decimal(6, 2)), N'0', NULL)
INSERT [dbo].[Asignacion] ([id_asignacion], [id_bus], [id_conductor], [id_ruta], [fecha_asignacion], [fecha_finalizacion], [kilometraje_inicial], [kilometraje_final], [horas_conduccion], [consumo_combustible], [incidencias_reportadas], [descripcion_incidencias]) VALUES (27, 27, 27, 27, CAST(N'2024-02-05T09:15:00.000' AS DateTime), CAST(N'2024-02-05T12:30:00.000' AS DateTime), 16000, 16090, CAST(3.25 AS Decimal(6, 2)), CAST(16.00 AS Decimal(6, 2)), N'0', NULL)
INSERT [dbo].[Asignacion] ([id_asignacion], [id_bus], [id_conductor], [id_ruta], [fecha_asignacion], [fecha_finalizacion], [kilometraje_inicial], [kilometraje_final], [horas_conduccion], [consumo_combustible], [incidencias_reportadas], [descripcion_incidencias]) VALUES (28, 28, 28, 28, CAST(N'2024-02-06T07:45:00.000' AS DateTime), CAST(N'2024-02-06T11:00:00.000' AS DateTime), 17000, 17090, CAST(3.75 AS Decimal(6, 2)), CAST(18.00 AS Decimal(6, 2)), N'1', N'Vibración en el eje')
INSERT [dbo].[Asignacion] ([id_asignacion], [id_bus], [id_conductor], [id_ruta], [fecha_asignacion], [fecha_finalizacion], [kilometraje_inicial], [kilometraje_final], [horas_conduccion], [consumo_combustible], [incidencias_reportadas], [descripcion_incidencias]) VALUES (29, 29, 29, 29, CAST(N'2024-02-07T06:30:00.000' AS DateTime), CAST(N'2024-02-07T09:45:00.000' AS DateTime), 18000, 18090, CAST(3.00 AS Decimal(6, 2)), CAST(14.50 AS Decimal(6, 2)), N'0', NULL)
INSERT [dbo].[Asignacion] ([id_asignacion], [id_bus], [id_conductor], [id_ruta], [fecha_asignacion], [fecha_finalizacion], [kilometraje_inicial], [kilometraje_final], [horas_conduccion], [consumo_combustible], [incidencias_reportadas], [descripcion_incidencias]) VALUES (30, 30, 30, 30, CAST(N'2024-02-08T08:00:00.000' AS DateTime), CAST(N'2024-02-08T11:15:00.000' AS DateTime), 19000, 19090, CAST(3.50 AS Decimal(6, 2)), CAST(15.00 AS Decimal(6, 2)), N'0', NULL)
INSERT [dbo].[Asignacion] ([id_asignacion], [id_bus], [id_conductor], [id_ruta], [fecha_asignacion], [fecha_finalizacion], [kilometraje_inicial], [kilometraje_final], [horas_conduccion], [consumo_combustible], [incidencias_reportadas], [descripcion_incidencias]) VALUES (31, 31, 31, 31, CAST(N'2024-02-09T07:00:00.000' AS DateTime), CAST(N'2024-02-09T10:30:00.000' AS DateTime), 20000, 20090, CAST(3.00 AS Decimal(6, 2)), CAST(16.50 AS Decimal(6, 2)), N'0', NULL)
INSERT [dbo].[Asignacion] ([id_asignacion], [id_bus], [id_conductor], [id_ruta], [fecha_asignacion], [fecha_finalizacion], [kilometraje_inicial], [kilometraje_final], [horas_conduccion], [consumo_combustible], [incidencias_reportadas], [descripcion_incidencias]) VALUES (32, 32, 32, 32, CAST(N'2024-02-10T09:00:00.000' AS DateTime), CAST(N'2024-02-10T12:15:00.000' AS DateTime), 21000, 21090, CAST(3.25 AS Decimal(6, 2)), CAST(17.00 AS Decimal(6, 2)), N'0', NULL)
INSERT [dbo].[Asignacion] ([id_asignacion], [id_bus], [id_conductor], [id_ruta], [fecha_asignacion], [fecha_finalizacion], [kilometraje_inicial], [kilometraje_final], [horas_conduccion], [consumo_combustible], [incidencias_reportadas], [descripcion_incidencias]) VALUES (33, 33, 33, 33, CAST(N'2024-02-11T06:45:00.000' AS DateTime), CAST(N'2024-02-11T10:00:00.000' AS DateTime), 22000, 22090, CAST(3.75 AS Decimal(6, 2)), CAST(18.50 AS Decimal(6, 2)), N'0', NULL)
INSERT [dbo].[Asignacion] ([id_asignacion], [id_bus], [id_conductor], [id_ruta], [fecha_asignacion], [fecha_finalizacion], [kilometraje_inicial], [kilometraje_final], [horas_conduccion], [consumo_combustible], [incidencias_reportadas], [descripcion_incidencias]) VALUES (34, 34, 34, 34, CAST(N'2024-02-12T08:30:00.000' AS DateTime), CAST(N'2024-02-12T11:45:00.000' AS DateTime), 23000, 23090, CAST(3.25 AS Decimal(6, 2)), CAST(19.00 AS Decimal(6, 2)), N'1', N'Sistema eléctrico intermitente')
INSERT [dbo].[Asignacion] ([id_asignacion], [id_bus], [id_conductor], [id_ruta], [fecha_asignacion], [fecha_finalizacion], [kilometraje_inicial], [kilometraje_final], [horas_conduccion], [consumo_combustible], [incidencias_reportadas], [descripcion_incidencias]) VALUES (35, 35, 35, 35, CAST(N'2024-02-13T07:15:00.000' AS DateTime), CAST(N'2024-02-13T10:30:00.000' AS DateTime), 24000, 24090, CAST(3.50 AS Decimal(6, 2)), CAST(20.00 AS Decimal(6, 2)), N'0', NULL)
INSERT [dbo].[Asignacion] ([id_asignacion], [id_bus], [id_conductor], [id_ruta], [fecha_asignacion], [fecha_finalizacion], [kilometraje_inicial], [kilometraje_final], [horas_conduccion], [consumo_combustible], [incidencias_reportadas], [descripcion_incidencias]) VALUES (36, 36, 36, 36, CAST(N'2024-02-14T10:00:00.000' AS DateTime), CAST(N'2024-02-14T13:30:00.000' AS DateTime), 25000, 25090, CAST(3.25 AS Decimal(6, 2)), CAST(21.50 AS Decimal(6, 2)), N'0', NULL)
INSERT [dbo].[Asignacion] ([id_asignacion], [id_bus], [id_conductor], [id_ruta], [fecha_asignacion], [fecha_finalizacion], [kilometraje_inicial], [kilometraje_final], [horas_conduccion], [consumo_combustible], [incidencias_reportadas], [descripcion_incidencias]) VALUES (37, 37, 37, 37, CAST(N'2024-02-15T06:00:00.000' AS DateTime), CAST(N'2024-02-15T09:30:00.000' AS DateTime), 26000, 26090, CAST(3.00 AS Decimal(6, 2)), CAST(22.00 AS Decimal(6, 2)), N'0', NULL)
INSERT [dbo].[Asignacion] ([id_asignacion], [id_bus], [id_conductor], [id_ruta], [fecha_asignacion], [fecha_finalizacion], [kilometraje_inicial], [kilometraje_final], [horas_conduccion], [consumo_combustible], [incidencias_reportadas], [descripcion_incidencias]) VALUES (38, 38, 38, 38, CAST(N'2024-02-16T09:00:00.000' AS DateTime), CAST(N'2024-02-16T12:15:00.000' AS DateTime), 27000, 27090, CAST(3.25 AS Decimal(6, 2)), CAST(23.00 AS Decimal(6, 2)), N'0', NULL)
INSERT [dbo].[Asignacion] ([id_asignacion], [id_bus], [id_conductor], [id_ruta], [fecha_asignacion], [fecha_finalizacion], [kilometraje_inicial], [kilometraje_final], [horas_conduccion], [consumo_combustible], [incidencias_reportadas], [descripcion_incidencias]) VALUES (39, 39, 39, 39, CAST(N'2024-02-17T07:30:00.000' AS DateTime), CAST(N'2024-02-17T11:00:00.000' AS DateTime), 28000, 28090, CAST(3.50 AS Decimal(6, 2)), CAST(24.00 AS Decimal(6, 2)), N'0', NULL)
INSERT [dbo].[Asignacion] ([id_asignacion], [id_bus], [id_conductor], [id_ruta], [fecha_asignacion], [fecha_finalizacion], [kilometraje_inicial], [kilometraje_final], [horas_conduccion], [consumo_combustible], [incidencias_reportadas], [descripcion_incidencias]) VALUES (40, 40, 40, 40, CAST(N'2024-02-18T08:30:00.000' AS DateTime), CAST(N'2024-02-18T11:45:00.000' AS DateTime), 29000, 29090, CAST(3.25 AS Decimal(6, 2)), CAST(25.00 AS Decimal(6, 2)), N'0', NULL)
SET IDENTITY_INSERT [dbo].[Asignacion] OFF
GO
SET IDENTITY_INSERT [dbo].[Bus] ON 

INSERT [dbo].[Bus] ([id_bus], [placa], [marca], [modelo], [anio_fabricacion], [capacidad_pasajeros], [numero_motor], [numero_chasis], [fecha_incorporacion], [fecha_ultimo_mantenimiento], [kilometraje_actual], [estado_operativo], [ciclo_mantenimiento_km], [ciclo_mantenimiento_dias], [imagen_vehiculo], [observaciones]) VALUES (1, N'BAM123', N'Mercedes-Benz', N'OF 1721', 2018, 40, N'MB12345MN1', N'CH12345X01', CAST(N'2019-01-10' AS Date), CAST(N'2024-05-15' AS Date), 215000, N'Operativo', 5000, 90, NULL, N'Sin observaciones')
INSERT [dbo].[Bus] ([id_bus], [placa], [marca], [modelo], [anio_fabricacion], [capacidad_pasajeros], [numero_motor], [numero_chasis], [fecha_incorporacion], [fecha_ultimo_mantenimiento], [kilometraje_actual], [estado_operativo], [ciclo_mantenimiento_km], [ciclo_mantenimiento_dias], [imagen_vehiculo], [observaciones]) VALUES (2, N'BDX456', N'Volvo', N'B270F', 2020, 45, N'VO45678MN2', N'CH45678X02', CAST(N'2020-07-20' AS Date), CAST(N'2024-06-01' AS Date), 185000, N'Mantenimiento', 5000, 90, NULL, N'Cambio de aceite reciente')
INSERT [dbo].[Bus] ([id_bus], [placa], [marca], [modelo], [anio_fabricacion], [capacidad_pasajeros], [numero_motor], [numero_chasis], [fecha_incorporacion], [fecha_ultimo_mantenimiento], [kilometraje_actual], [estado_operativo], [ciclo_mantenimiento_km], [ciclo_mantenimiento_dias], [imagen_vehiculo], [observaciones]) VALUES (3, N'CRL789', N'Scania', N'K310', 2017, 50, N'SC78901MN3', N'CH78901X03', CAST(N'2018-03-15' AS Date), CAST(N'2024-04-28' AS Date), 240000, N'Operativo', 5000, 90, NULL, N'Revisión general completa')
INSERT [dbo].[Bus] ([id_bus], [placa], [marca], [modelo], [anio_fabricacion], [capacidad_pasajeros], [numero_motor], [numero_chasis], [fecha_incorporacion], [fecha_ultimo_mantenimiento], [kilometraje_actual], [estado_operativo], [ciclo_mantenimiento_km], [ciclo_mantenimiento_dias], [imagen_vehiculo], [observaciones]) VALUES (4, N'DHF321', N'Yutong', N'ZK6122', 2019, 42, N'YT32123MN4', N'CH32123X04', CAST(N'2019-10-12' AS Date), CAST(N'2024-06-30' AS Date), 160000, N'Operativo', 5000, 90, NULL, N'Sin novedades')
INSERT [dbo].[Bus] ([id_bus], [placa], [marca], [modelo], [anio_fabricacion], [capacidad_pasajeros], [numero_motor], [numero_chasis], [fecha_incorporacion], [fecha_ultimo_mantenimiento], [kilometraje_actual], [estado_operativo], [ciclo_mantenimiento_km], [ciclo_mantenimiento_dias], [imagen_vehiculo], [observaciones]) VALUES (5, N'EXG654', N'Hyundai', N'Universe', 2021, 44, N'HY65456MN5', N'CH65456X05', CAST(N'2022-02-18' AS Date), CAST(N'2024-06-10' AS Date), 130000, N'Operativo', 5000, 90, NULL, N'Buen estado general')
INSERT [dbo].[Bus] ([id_bus], [placa], [marca], [modelo], [anio_fabricacion], [capacidad_pasajeros], [numero_motor], [numero_chasis], [fecha_incorporacion], [fecha_ultimo_mantenimiento], [kilometraje_actual], [estado_operativo], [ciclo_mantenimiento_km], [ciclo_mantenimiento_dias], [imagen_vehiculo], [observaciones]) VALUES (6, N'FZL987', N'Volvo', N'B380R', 2015, 48, N'VO98765MN6', N'CH98765X06', CAST(N'2015-09-22' AS Date), CAST(N'2024-05-01' AS Date), 280000, N'Reparacion', 5000, 90, NULL, N'Falla en suspensión')
INSERT [dbo].[Bus] ([id_bus], [placa], [marca], [modelo], [anio_fabricacion], [capacidad_pasajeros], [numero_motor], [numero_chasis], [fecha_incorporacion], [fecha_ultimo_mantenimiento], [kilometraje_actual], [estado_operativo], [ciclo_mantenimiento_km], [ciclo_mantenimiento_dias], [imagen_vehiculo], [observaciones]) VALUES (7, N'GHT432', N'Mercedes-Benz', N'O500', 2016, 46, N'MB43210MN7', N'CH43210X07', CAST(N'2016-12-30' AS Date), CAST(N'2024-04-20' AS Date), 260000, N'Operativo', 5000, 90, NULL, N'')
INSERT [dbo].[Bus] ([id_bus], [placa], [marca], [modelo], [anio_fabricacion], [capacidad_pasajeros], [numero_motor], [numero_chasis], [fecha_incorporacion], [fecha_ultimo_mantenimiento], [kilometraje_actual], [estado_operativo], [ciclo_mantenimiento_km], [ciclo_mantenimiento_dias], [imagen_vehiculo], [observaciones]) VALUES (8, N'HRN765', N'Scania', N'K250UB', 2022, 43, N'SC76543MN8', N'CH76543X08', CAST(N'2022-05-01' AS Date), CAST(N'2024-06-25' AS Date), 95000, N'Operativo', 5000, 90, NULL, N'')
INSERT [dbo].[Bus] ([id_bus], [placa], [marca], [modelo], [anio_fabricacion], [capacidad_pasajeros], [numero_motor], [numero_chasis], [fecha_incorporacion], [fecha_ultimo_mantenimiento], [kilometraje_actual], [estado_operativo], [ciclo_mantenimiento_km], [ciclo_mantenimiento_dias], [imagen_vehiculo], [observaciones]) VALUES (9, N'JUL098', N'Volvo', N'B310R', 2018, 49, N'VO09876MN9', N'CH09876X09', CAST(N'2019-03-18' AS Date), CAST(N'2024-05-30' AS Date), 190000, N'Operativo', 5000, 90, NULL, N'Revisión de frenos hecha')
INSERT [dbo].[Bus] ([id_bus], [placa], [marca], [modelo], [anio_fabricacion], [capacidad_pasajeros], [numero_motor], [numero_chasis], [fecha_incorporacion], [fecha_ultimo_mantenimiento], [kilometraje_actual], [estado_operativo], [ciclo_mantenimiento_km], [ciclo_mantenimiento_dias], [imagen_vehiculo], [observaciones]) VALUES (10, N'KLM321', N'Hyundai', N'County', 2023, 30, N'HY32154MN10', N'CH32154X10', CAST(N'2023-06-01' AS Date), CAST(N'2024-06-20' AS Date), 40000, N'Operativo', 5000, 90, NULL, N'')
INSERT [dbo].[Bus] ([id_bus], [placa], [marca], [modelo], [anio_fabricacion], [capacidad_pasajeros], [numero_motor], [numero_chasis], [fecha_incorporacion], [fecha_ultimo_mantenimiento], [kilometraje_actual], [estado_operativo], [ciclo_mantenimiento_km], [ciclo_mantenimiento_dias], [imagen_vehiculo], [observaciones]) VALUES (11, N'LNP654', N'Yutong', N'ZK6129', 2019, 47, N'YT65432MN11', N'CH65432X11', CAST(N'2020-01-15' AS Date), CAST(N'2024-05-18' AS Date), 170000, N'Operativo', 5000, 90, NULL, N'')
INSERT [dbo].[Bus] ([id_bus], [placa], [marca], [modelo], [anio_fabricacion], [capacidad_pasajeros], [numero_motor], [numero_chasis], [fecha_incorporacion], [fecha_ultimo_mantenimiento], [kilometraje_actual], [estado_operativo], [ciclo_mantenimiento_km], [ciclo_mantenimiento_dias], [imagen_vehiculo], [observaciones]) VALUES (12, N'MQR987', N'Mercedes-Benz', N'OF 1724', 2020, 42, N'MB98761MN12', N'CH98761X12', CAST(N'2020-09-01' AS Date), CAST(N'2024-06-12' AS Date), 145000, N'Mantenimiento', 5000, 90, NULL, N'')
INSERT [dbo].[Bus] ([id_bus], [placa], [marca], [modelo], [anio_fabricacion], [capacidad_pasajeros], [numero_motor], [numero_chasis], [fecha_incorporacion], [fecha_ultimo_mantenimiento], [kilometraje_actual], [estado_operativo], [ciclo_mantenimiento_km], [ciclo_mantenimiento_dias], [imagen_vehiculo], [observaciones]) VALUES (13, N'NTS210', N'Volvo', N'B270F', 2016, 45, N'VO21098MN13', N'CH21098X13', CAST(N'2016-10-20' AS Date), CAST(N'2024-06-01' AS Date), 275000, N'Operativo', 5000, 90, NULL, N'')
INSERT [dbo].[Bus] ([id_bus], [placa], [marca], [modelo], [anio_fabricacion], [capacidad_pasajeros], [numero_motor], [numero_chasis], [fecha_incorporacion], [fecha_ultimo_mantenimiento], [kilometraje_actual], [estado_operativo], [ciclo_mantenimiento_km], [ciclo_mantenimiento_dias], [imagen_vehiculo], [observaciones]) VALUES (14, N'OLR543', N'Scania', N'K360IB', 2021, 48, N'SC54321MN14', N'CH54321X14', CAST(N'2021-07-07' AS Date), CAST(N'2024-06-27' AS Date), 120000, N'Operativo', 5000, 90, NULL, N'')
INSERT [dbo].[Bus] ([id_bus], [placa], [marca], [modelo], [anio_fabricacion], [capacidad_pasajeros], [numero_motor], [numero_chasis], [fecha_incorporacion], [fecha_ultimo_mantenimiento], [kilometraje_actual], [estado_operativo], [ciclo_mantenimiento_km], [ciclo_mantenimiento_dias], [imagen_vehiculo], [observaciones]) VALUES (15, N'PGX876', N'Hyundai', N'Universe', 2017, 44, N'HY87654MN15', N'CH87654X15', CAST(N'2018-02-02' AS Date), CAST(N'2024-05-05' AS Date), 230000, N'Reparacion', 5000, 90, NULL, N'Motor recalienta')
INSERT [dbo].[Bus] ([id_bus], [placa], [marca], [modelo], [anio_fabricacion], [capacidad_pasajeros], [numero_motor], [numero_chasis], [fecha_incorporacion], [fecha_ultimo_mantenimiento], [kilometraje_actual], [estado_operativo], [ciclo_mantenimiento_km], [ciclo_mantenimiento_dias], [imagen_vehiculo], [observaciones]) VALUES (16, N'QWE109', N'Yutong', N'ZK6132', 2020, 50, N'YT10987MN16', N'CH10987X16', CAST(N'2020-03-11' AS Date), CAST(N'2024-06-10' AS Date), 160000, N'Operativo', 5000, 90, NULL, N'')
INSERT [dbo].[Bus] ([id_bus], [placa], [marca], [modelo], [anio_fabricacion], [capacidad_pasajeros], [numero_motor], [numero_chasis], [fecha_incorporacion], [fecha_ultimo_mantenimiento], [kilometraje_actual], [estado_operativo], [ciclo_mantenimiento_km], [ciclo_mantenimiento_dias], [imagen_vehiculo], [observaciones]) VALUES (17, N'RTA432', N'Mercedes-Benz', N'O500RSD', 2019, 46, N'MB43212MN17', N'CH43212X17', CAST(N'2019-11-29' AS Date), CAST(N'2024-06-05' AS Date), 190000, N'Operativo', 5000, 90, NULL, N'')
INSERT [dbo].[Bus] ([id_bus], [placa], [marca], [modelo], [anio_fabricacion], [capacidad_pasajeros], [numero_motor], [numero_chasis], [fecha_incorporacion], [fecha_ultimo_mantenimiento], [kilometraje_actual], [estado_operativo], [ciclo_mantenimiento_km], [ciclo_mantenimiento_dias], [imagen_vehiculo], [observaciones]) VALUES (18, N'SUV765', N'Scania', N'K410IB', 2018, 50, N'SC76543MN18', N'CH76543X18', CAST(N'2018-06-15' AS Date), CAST(N'2024-06-02' AS Date), 220000, N'Mantenimiento', 5000, 90, NULL, N'Cambio de neumáticos')
INSERT [dbo].[Bus] ([id_bus], [placa], [marca], [modelo], [anio_fabricacion], [capacidad_pasajeros], [numero_motor], [numero_chasis], [fecha_incorporacion], [fecha_ultimo_mantenimiento], [kilometraje_actual], [estado_operativo], [ciclo_mantenimiento_km], [ciclo_mantenimiento_dias], [imagen_vehiculo], [observaciones]) VALUES (19, N'TXY098', N'Volvo', N'B380R', 2022, 48, N'VO09876MN19', N'CH09876X19', CAST(N'2022-09-01' AS Date), CAST(N'2024-06-30' AS Date), 90000, N'Operativo', 5000, 90, NULL, N'')
INSERT [dbo].[Bus] ([id_bus], [placa], [marca], [modelo], [anio_fabricacion], [capacidad_pasajeros], [numero_motor], [numero_chasis], [fecha_incorporacion], [fecha_ultimo_mantenimiento], [kilometraje_actual], [estado_operativo], [ciclo_mantenimiento_km], [ciclo_mantenimiento_dias], [imagen_vehiculo], [observaciones]) VALUES (20, N'UZA321', N'Hyundai', N'County', 2015, 30, N'HY32165MN20', N'CH32165X20', CAST(N'2015-04-20' AS Date), CAST(N'2024-04-25' AS Date), 310000, N'Baja', 5000, 90, NULL, N'Dado de baja por obsolescencia')
INSERT [dbo].[Bus] ([id_bus], [placa], [marca], [modelo], [anio_fabricacion], [capacidad_pasajeros], [numero_motor], [numero_chasis], [fecha_incorporacion], [fecha_ultimo_mantenimiento], [kilometraje_actual], [estado_operativo], [ciclo_mantenimiento_km], [ciclo_mantenimiento_dias], [imagen_vehiculo], [observaciones]) VALUES (21, N'VBN654', N'Yutong', N'ZK6136', 2016, 47, N'YT65498MN21', N'CH65498X21', CAST(N'2016-07-10' AS Date), CAST(N'2024-05-01' AS Date), 260000, N'Operativo', 5000, 90, NULL, N'')
INSERT [dbo].[Bus] ([id_bus], [placa], [marca], [modelo], [anio_fabricacion], [capacidad_pasajeros], [numero_motor], [numero_chasis], [fecha_incorporacion], [fecha_ultimo_mantenimiento], [kilometraje_actual], [estado_operativo], [ciclo_mantenimiento_km], [ciclo_mantenimiento_dias], [imagen_vehiculo], [observaciones]) VALUES (22, N'WEM987', N'Mercedes-Benz', N'OF 1721', 2020, 42, N'MB98762MN22', N'CH98762X22', CAST(N'2020-04-12' AS Date), CAST(N'2024-06-15' AS Date), 140000, N'Operativo', 5000, 90, NULL, N'')
INSERT [dbo].[Bus] ([id_bus], [placa], [marca], [modelo], [anio_fabricacion], [capacidad_pasajeros], [numero_motor], [numero_chasis], [fecha_incorporacion], [fecha_ultimo_mantenimiento], [kilometraje_actual], [estado_operativo], [ciclo_mantenimiento_km], [ciclo_mantenimiento_dias], [imagen_vehiculo], [observaciones]) VALUES (23, N'XTO210', N'Volvo', N'B270F', 2021, 45, N'VO21099MN23', N'CH21099X23', CAST(N'2021-11-01' AS Date), CAST(N'2024-06-12' AS Date), 100000, N'Operativo', 5000, 90, NULL, N'')
INSERT [dbo].[Bus] ([id_bus], [placa], [marca], [modelo], [anio_fabricacion], [capacidad_pasajeros], [numero_motor], [numero_chasis], [fecha_incorporacion], [fecha_ultimo_mantenimiento], [kilometraje_actual], [estado_operativo], [ciclo_mantenimiento_km], [ciclo_mantenimiento_dias], [imagen_vehiculo], [observaciones]) VALUES (24, N'YLU543', N'Scania', N'K310UB', 2017, 44, N'SC54322MN24', N'CH54322X24', CAST(N'2017-08-25' AS Date), CAST(N'2024-05-15' AS Date), 250000, N'Reparacion', 5000, 90, NULL, N'Motor con ruido anormal')
INSERT [dbo].[Bus] ([id_bus], [placa], [marca], [modelo], [anio_fabricacion], [capacidad_pasajeros], [numero_motor], [numero_chasis], [fecha_incorporacion], [fecha_ultimo_mantenimiento], [kilometraje_actual], [estado_operativo], [ciclo_mantenimiento_km], [ciclo_mantenimiento_dias], [imagen_vehiculo], [observaciones]) VALUES (25, N'ZAV876', N'Hyundai', N'Universe', 2019, 44, N'HY87655MN25', N'CH87655X25', CAST(N'2019-06-01' AS Date), CAST(N'2024-06-20' AS Date), 180000, N'Operativo', 5000, 90, NULL, N'')
INSERT [dbo].[Bus] ([id_bus], [placa], [marca], [modelo], [anio_fabricacion], [capacidad_pasajeros], [numero_motor], [numero_chasis], [fecha_incorporacion], [fecha_ultimo_mantenimiento], [kilometraje_actual], [estado_operativo], [ciclo_mantenimiento_km], [ciclo_mantenimiento_dias], [imagen_vehiculo], [observaciones]) VALUES (26, N'ABC109', N'Yutong', N'ZK6132', 2016, 50, N'YT10988MN26', N'CH10988X26', CAST(N'2016-05-10' AS Date), CAST(N'2024-06-01' AS Date), 300000, N'Operativo', 5000, 90, NULL, N'')
INSERT [dbo].[Bus] ([id_bus], [placa], [marca], [modelo], [anio_fabricacion], [capacidad_pasajeros], [numero_motor], [numero_chasis], [fecha_incorporacion], [fecha_ultimo_mantenimiento], [kilometraje_actual], [estado_operativo], [ciclo_mantenimiento_km], [ciclo_mantenimiento_dias], [imagen_vehiculo], [observaciones]) VALUES (27, N'BCD432', N'Mercedes-Benz', N'O500RS', 2015, 46, N'MB43213MN27', N'CH43213X27', CAST(N'2015-10-12' AS Date), CAST(N'2024-05-28' AS Date), 290000, N'Mantenimiento', 5000, 90, NULL, N'')
INSERT [dbo].[Bus] ([id_bus], [placa], [marca], [modelo], [anio_fabricacion], [capacidad_pasajeros], [numero_motor], [numero_chasis], [fecha_incorporacion], [fecha_ultimo_mantenimiento], [kilometraje_actual], [estado_operativo], [ciclo_mantenimiento_km], [ciclo_mantenimiento_dias], [imagen_vehiculo], [observaciones]) VALUES (28, N'CDE765', N'Scania', N'K360IB', 2022, 48, N'SC76544MN28', N'CH76544X28', CAST(N'2022-01-01' AS Date), CAST(N'2024-06-30' AS Date), 70000, N'Operativo', 5000, 90, NULL, N'')
INSERT [dbo].[Bus] ([id_bus], [placa], [marca], [modelo], [anio_fabricacion], [capacidad_pasajeros], [numero_motor], [numero_chasis], [fecha_incorporacion], [fecha_ultimo_mantenimiento], [kilometraje_actual], [estado_operativo], [ciclo_mantenimiento_km], [ciclo_mantenimiento_dias], [imagen_vehiculo], [observaciones]) VALUES (29, N'DEF098', N'Volvo', N'B380R', 2018, 48, N'VO09877MN29', N'CH09877X29', CAST(N'2018-08-20' AS Date), CAST(N'2024-06-05' AS Date), 210000, N'Operativo', 5000, 90, NULL, N'')
INSERT [dbo].[Bus] ([id_bus], [placa], [marca], [modelo], [anio_fabricacion], [capacidad_pasajeros], [numero_motor], [numero_chasis], [fecha_incorporacion], [fecha_ultimo_mantenimiento], [kilometraje_actual], [estado_operativo], [ciclo_mantenimiento_km], [ciclo_mantenimiento_dias], [imagen_vehiculo], [observaciones]) VALUES (30, N'EFG321', N'Hyundai', N'County', 2023, 30, N'HY32166MN30', N'CH32166X30', CAST(N'2023-05-01' AS Date), CAST(N'2024-06-15' AS Date), 35000, N'Operativo', 5000, 90, NULL, N'')
INSERT [dbo].[Bus] ([id_bus], [placa], [marca], [modelo], [anio_fabricacion], [capacidad_pasajeros], [numero_motor], [numero_chasis], [fecha_incorporacion], [fecha_ultimo_mantenimiento], [kilometraje_actual], [estado_operativo], [ciclo_mantenimiento_km], [ciclo_mantenimiento_dias], [imagen_vehiculo], [observaciones]) VALUES (31, N'FGH654', N'Yutong', N'ZK6129', 2020, 47, N'YT65433MN31', N'CH65433X31', CAST(N'2020-06-30' AS Date), CAST(N'2024-06-20' AS Date), 130000, N'Operativo', 5000, 90, NULL, N'')
INSERT [dbo].[Bus] ([id_bus], [placa], [marca], [modelo], [anio_fabricacion], [capacidad_pasajeros], [numero_motor], [numero_chasis], [fecha_incorporacion], [fecha_ultimo_mantenimiento], [kilometraje_actual], [estado_operativo], [ciclo_mantenimiento_km], [ciclo_mantenimiento_dias], [imagen_vehiculo], [observaciones]) VALUES (32, N'GHI987', N'Mercedes-Benz', N'OF 1724', 2021, 42, N'MB98763MN32', N'CH98763X32', CAST(N'2021-02-11' AS Date), CAST(N'2024-06-10' AS Date), 110000, N'Operativo', 5000, 90, NULL, N'')
INSERT [dbo].[Bus] ([id_bus], [placa], [marca], [modelo], [anio_fabricacion], [capacidad_pasajeros], [numero_motor], [numero_chasis], [fecha_incorporacion], [fecha_ultimo_mantenimiento], [kilometraje_actual], [estado_operativo], [ciclo_mantenimiento_km], [ciclo_mantenimiento_dias], [imagen_vehiculo], [observaciones]) VALUES (33, N'HIJ210', N'Volvo', N'B270F', 2019, 45, N'VO21100MN33', N'CH21100X33', CAST(N'2019-12-20' AS Date), CAST(N'2024-06-01' AS Date), 170000, N'Operativo', 5000, 90, NULL, N'')
INSERT [dbo].[Bus] ([id_bus], [placa], [marca], [modelo], [anio_fabricacion], [capacidad_pasajeros], [numero_motor], [numero_chasis], [fecha_incorporacion], [fecha_ultimo_mantenimiento], [kilometraje_actual], [estado_operativo], [ciclo_mantenimiento_km], [ciclo_mantenimiento_dias], [imagen_vehiculo], [observaciones]) VALUES (34, N'IJK543', N'Scania', N'K410IB', 2022, 50, N'SC54323MN34', N'CH54323X34', CAST(N'2022-08-01' AS Date), CAST(N'2024-06-25' AS Date), 95000, N'Operativo', 5000, 90, NULL, N'')
INSERT [dbo].[Bus] ([id_bus], [placa], [marca], [modelo], [anio_fabricacion], [capacidad_pasajeros], [numero_motor], [numero_chasis], [fecha_incorporacion], [fecha_ultimo_mantenimiento], [kilometraje_actual], [estado_operativo], [ciclo_mantenimiento_km], [ciclo_mantenimiento_dias], [imagen_vehiculo], [observaciones]) VALUES (35, N'JKL876', N'Hyundai', N'Universe', 2017, 44, N'HY87656MN35', N'CH87656X35', CAST(N'2018-01-01' AS Date), CAST(N'2024-05-30' AS Date), 220000, N'Reparacion', 5000, 90, NULL, N'')
INSERT [dbo].[Bus] ([id_bus], [placa], [marca], [modelo], [anio_fabricacion], [capacidad_pasajeros], [numero_motor], [numero_chasis], [fecha_incorporacion], [fecha_ultimo_mantenimiento], [kilometraje_actual], [estado_operativo], [ciclo_mantenimiento_km], [ciclo_mantenimiento_dias], [imagen_vehiculo], [observaciones]) VALUES (36, N'KLM109', N'Yutong', N'ZK6132', 2018, 50, N'YT10989MN36', N'CH10989X36', CAST(N'2019-04-15' AS Date), CAST(N'2024-06-18' AS Date), 200000, N'Operativo', 5000, 90, NULL, N'')
INSERT [dbo].[Bus] ([id_bus], [placa], [marca], [modelo], [anio_fabricacion], [capacidad_pasajeros], [numero_motor], [numero_chasis], [fecha_incorporacion], [fecha_ultimo_mantenimiento], [kilometraje_actual], [estado_operativo], [ciclo_mantenimiento_km], [ciclo_mantenimiento_dias], [imagen_vehiculo], [observaciones]) VALUES (37, N'LMN432', N'Mercedes-Benz', N'O500RS', 2016, 46, N'MB43214MN37', N'CH43214X37', CAST(N'2016-12-01' AS Date), CAST(N'2024-05-15' AS Date), 270000, N'Mantenimiento', 5000, 90, NULL, N'')
INSERT [dbo].[Bus] ([id_bus], [placa], [marca], [modelo], [anio_fabricacion], [capacidad_pasajeros], [numero_motor], [numero_chasis], [fecha_incorporacion], [fecha_ultimo_mantenimiento], [kilometraje_actual], [estado_operativo], [ciclo_mantenimiento_km], [ciclo_mantenimiento_dias], [imagen_vehiculo], [observaciones]) VALUES (38, N'MNO765', N'Scania', N'K360IB', 2020, 48, N'SC76545MN38', N'CH76545X38', CAST(N'2020-08-12' AS Date), CAST(N'2024-06-20' AS Date), 150000, N'Operativo', 5000, 90, NULL, N'')
INSERT [dbo].[Bus] ([id_bus], [placa], [marca], [modelo], [anio_fabricacion], [capacidad_pasajeros], [numero_motor], [numero_chasis], [fecha_incorporacion], [fecha_ultimo_mantenimiento], [kilometraje_actual], [estado_operativo], [ciclo_mantenimiento_km], [ciclo_mantenimiento_dias], [imagen_vehiculo], [observaciones]) VALUES (39, N'NOP098', N'Volvo', N'B380R', 2023, 48, N'VO09878MN39', N'CH09878X39', CAST(N'2023-01-01' AS Date), CAST(N'2024-06-25' AS Date), 40000, N'Operativo', 5000, 90, NULL, N'')
INSERT [dbo].[Bus] ([id_bus], [placa], [marca], [modelo], [anio_fabricacion], [capacidad_pasajeros], [numero_motor], [numero_chasis], [fecha_incorporacion], [fecha_ultimo_mantenimiento], [kilometraje_actual], [estado_operativo], [ciclo_mantenimiento_km], [ciclo_mantenimiento_dias], [imagen_vehiculo], [observaciones]) VALUES (40, N'OPQ321', N'Hyundai', N'County', 2021, 30, N'HY32167MN40', N'CH32167X40', CAST(N'2021-10-10' AS Date), CAST(N'2024-06-28' AS Date), 115000, N'Operativo', 5000, 90, NULL, N'')
SET IDENTITY_INSERT [dbo].[Bus] OFF
GO
SET IDENTITY_INSERT [dbo].[Conductor] ON 

INSERT [dbo].[Conductor] ([id_conductor], [dni], [nombre_completo], [licencia_conducir], [categoria_licencia], [fecha_contratacion], [fecha_vencimiento_licencia], [horas_conduccion_mes], [evaluacion_conduccion], [estado]) VALUES (1, N'45871236', N'Luis Gómez Herrera', N'B12569874', N'A3C', CAST(N'2019-03-10' AS Date), CAST(N'2026-03-10' AS Date), 160, CAST(4.50 AS Decimal(3, 2)), N'Activo')
INSERT [dbo].[Conductor] ([id_conductor], [dni], [nombre_completo], [licencia_conducir], [categoria_licencia], [fecha_contratacion], [fecha_vencimiento_licencia], [horas_conduccion_mes], [evaluacion_conduccion], [estado]) VALUES (2, N'43219876', N'Carlos Ruiz Morales', N'B98712345', N'A2B', CAST(N'2020-01-15' AS Date), CAST(N'2025-01-15' AS Date), 140, CAST(4.20 AS Decimal(3, 2)), N'Activo')
INSERT [dbo].[Conductor] ([id_conductor], [dni], [nombre_completo], [licencia_conducir], [categoria_licencia], [fecha_contratacion], [fecha_vencimiento_licencia], [horas_conduccion_mes], [evaluacion_conduccion], [estado]) VALUES (3, N'46871239', N'Miguel Torres Zúñiga', N'C32165487', N'A3B', CAST(N'2021-05-20' AS Date), CAST(N'2026-05-20' AS Date), 120, CAST(3.80 AS Decimal(3, 2)), N'Vacaciones')
INSERT [dbo].[Conductor] ([id_conductor], [dni], [nombre_completo], [licencia_conducir], [categoria_licencia], [fecha_contratacion], [fecha_vencimiento_licencia], [horas_conduccion_mes], [evaluacion_conduccion], [estado]) VALUES (4, N'47213678', N'José Martínez Ramírez', N'D11234567', N'A3C', CAST(N'2018-11-25' AS Date), CAST(N'2024-11-25' AS Date), 180, CAST(4.70 AS Decimal(3, 2)), N'Activo')
INSERT [dbo].[Conductor] ([id_conductor], [dni], [nombre_completo], [licencia_conducir], [categoria_licencia], [fecha_contratacion], [fecha_vencimiento_licencia], [horas_conduccion_mes], [evaluacion_conduccion], [estado]) VALUES (5, N'49081236', N'Hugo Fernández Rojas', N'B99887766', N'A2B', CAST(N'2017-06-01' AS Date), CAST(N'2025-06-01' AS Date), 130, CAST(4.10 AS Decimal(3, 2)), N'Suspendido')
INSERT [dbo].[Conductor] ([id_conductor], [dni], [nombre_completo], [licencia_conducir], [categoria_licencia], [fecha_contratacion], [fecha_vencimiento_licencia], [horas_conduccion_mes], [evaluacion_conduccion], [estado]) VALUES (6, N'48452369', N'Julio Lázaro Ayala', N'C11557799', N'A3C', CAST(N'2019-07-19' AS Date), CAST(N'2025-07-19' AS Date), 150, CAST(4.00 AS Decimal(3, 2)), N'Activo')
INSERT [dbo].[Conductor] ([id_conductor], [dni], [nombre_completo], [licencia_conducir], [categoria_licencia], [fecha_contratacion], [fecha_vencimiento_licencia], [horas_conduccion_mes], [evaluacion_conduccion], [estado]) VALUES (7, N'46123456', N'Daniel Mendoza Ruiz', N'C33366688', N'A3B', CAST(N'2022-02-10' AS Date), CAST(N'2027-02-10' AS Date), 110, CAST(3.90 AS Decimal(3, 2)), N'Activo')
INSERT [dbo].[Conductor] ([id_conductor], [dni], [nombre_completo], [licencia_conducir], [categoria_licencia], [fecha_contratacion], [fecha_vencimiento_licencia], [horas_conduccion_mes], [evaluacion_conduccion], [estado]) VALUES (8, N'47789123', N'Ricardo Salas Vilca', N'D44558899', N'A3B', CAST(N'2020-09-01' AS Date), CAST(N'2025-09-01' AS Date), 170, CAST(4.30 AS Decimal(3, 2)), N'Inactivo')
INSERT [dbo].[Conductor] ([id_conductor], [dni], [nombre_completo], [licencia_conducir], [categoria_licencia], [fecha_contratacion], [fecha_vencimiento_licencia], [horas_conduccion_mes], [evaluacion_conduccion], [estado]) VALUES (9, N'45678912', N'Sandro Requena Paz', N'B12341234', N'A3C', CAST(N'2016-03-18' AS Date), CAST(N'2024-03-18' AS Date), 190, CAST(4.60 AS Decimal(3, 2)), N'Activo')
INSERT [dbo].[Conductor] ([id_conductor], [dni], [nombre_completo], [licencia_conducir], [categoria_licencia], [fecha_contratacion], [fecha_vencimiento_licencia], [horas_conduccion_mes], [evaluacion_conduccion], [estado]) VALUES (10, N'48762134', N'Javier Alarcón Huamán', N'C22233344', N'A2B', CAST(N'2018-08-09' AS Date), CAST(N'2024-08-09' AS Date), 140, CAST(3.70 AS Decimal(3, 2)), N'Activo')
INSERT [dbo].[Conductor] ([id_conductor], [dni], [nombre_completo], [licencia_conducir], [categoria_licencia], [fecha_contratacion], [fecha_vencimiento_licencia], [horas_conduccion_mes], [evaluacion_conduccion], [estado]) VALUES (11, N'48873214', N'Luis Romero Quispe', N'C33445566', N'A3C', CAST(N'2020-10-01' AS Date), CAST(N'2026-10-01' AS Date), 150, CAST(4.40 AS Decimal(3, 2)), N'Activo')
INSERT [dbo].[Conductor] ([id_conductor], [dni], [nombre_completo], [licencia_conducir], [categoria_licencia], [fecha_contratacion], [fecha_vencimiento_licencia], [horas_conduccion_mes], [evaluacion_conduccion], [estado]) VALUES (12, N'47651233', N'Pedro Ramírez Solano', N'B77889900', N'A2B', CAST(N'2021-04-05' AS Date), CAST(N'2026-04-05' AS Date), 120, CAST(3.95 AS Decimal(3, 2)), N'Activo')
INSERT [dbo].[Conductor] ([id_conductor], [dni], [nombre_completo], [licencia_conducir], [categoria_licencia], [fecha_contratacion], [fecha_vencimiento_licencia], [horas_conduccion_mes], [evaluacion_conduccion], [estado]) VALUES (13, N'46781235', N'Juan Castañeda Rivas', N'D11223344', N'A3B', CAST(N'2019-12-12' AS Date), CAST(N'2024-12-12' AS Date), 180, CAST(4.55 AS Decimal(3, 2)), N'Activo')
INSERT [dbo].[Conductor] ([id_conductor], [dni], [nombre_completo], [licencia_conducir], [categoria_licencia], [fecha_contratacion], [fecha_vencimiento_licencia], [horas_conduccion_mes], [evaluacion_conduccion], [estado]) VALUES (14, N'47568931', N'Oscar Paredes Salazar', N'B11122233', N'A2B', CAST(N'2020-06-15' AS Date), CAST(N'2025-06-15' AS Date), 135, CAST(4.20 AS Decimal(3, 2)), N'Vacaciones')
INSERT [dbo].[Conductor] ([id_conductor], [dni], [nombre_completo], [licencia_conducir], [categoria_licencia], [fecha_contratacion], [fecha_vencimiento_licencia], [horas_conduccion_mes], [evaluacion_conduccion], [estado]) VALUES (15, N'48231357', N'Carlos Meza Lozano', N'B55566677', N'A3C', CAST(N'2017-10-08' AS Date), CAST(N'2024-10-08' AS Date), 160, CAST(4.00 AS Decimal(3, 2)), N'Activo')
INSERT [dbo].[Conductor] ([id_conductor], [dni], [nombre_completo], [licencia_conducir], [categoria_licencia], [fecha_contratacion], [fecha_vencimiento_licencia], [horas_conduccion_mes], [evaluacion_conduccion], [estado]) VALUES (16, N'47986523', N'Víctor Navarro Soria', N'D99887711', N'A3B', CAST(N'2018-04-04' AS Date), CAST(N'2024-04-04' AS Date), 145, CAST(3.85 AS Decimal(3, 2)), N'Activo')
INSERT [dbo].[Conductor] ([id_conductor], [dni], [nombre_completo], [licencia_conducir], [categoria_licencia], [fecha_contratacion], [fecha_vencimiento_licencia], [horas_conduccion_mes], [evaluacion_conduccion], [estado]) VALUES (17, N'49123877', N'Jaime Gutiérrez Peña', N'C77788899', N'A3C', CAST(N'2023-01-10' AS Date), CAST(N'2028-01-10' AS Date), 90, CAST(4.10 AS Decimal(3, 2)), N'Activo')
INSERT [dbo].[Conductor] ([id_conductor], [dni], [nombre_completo], [licencia_conducir], [categoria_licencia], [fecha_contratacion], [fecha_vencimiento_licencia], [horas_conduccion_mes], [evaluacion_conduccion], [estado]) VALUES (18, N'49237865', N'Edgar Manco Canales', N'B22334455', N'A2B', CAST(N'2022-07-07' AS Date), CAST(N'2027-07-07' AS Date), 115, CAST(3.95 AS Decimal(3, 2)), N'Suspendido')
INSERT [dbo].[Conductor] ([id_conductor], [dni], [nombre_completo], [licencia_conducir], [categoria_licencia], [fecha_contratacion], [fecha_vencimiento_licencia], [horas_conduccion_mes], [evaluacion_conduccion], [estado]) VALUES (19, N'47123489', N'Franklin Mamani Tapia', N'C55667788', N'A3B', CAST(N'2020-03-03' AS Date), CAST(N'2025-03-03' AS Date), 170, CAST(4.35 AS Decimal(3, 2)), N'Activo')
INSERT [dbo].[Conductor] ([id_conductor], [dni], [nombre_completo], [licencia_conducir], [categoria_licencia], [fecha_contratacion], [fecha_vencimiento_licencia], [horas_conduccion_mes], [evaluacion_conduccion], [estado]) VALUES (20, N'46908762', N'César Luyo Vílchez', N'D33445566', N'A3C', CAST(N'2019-11-01' AS Date), CAST(N'2024-11-01' AS Date), 180, CAST(4.60 AS Decimal(3, 2)), N'Activo')
INSERT [dbo].[Conductor] ([id_conductor], [dni], [nombre_completo], [licencia_conducir], [categoria_licencia], [fecha_contratacion], [fecha_vencimiento_licencia], [horas_conduccion_mes], [evaluacion_conduccion], [estado]) VALUES (21, N'48321098', N'Marco Rojas Llanos', N'B66778899', N'A2B', CAST(N'2016-05-02' AS Date), CAST(N'2024-05-02' AS Date), 160, CAST(4.10 AS Decimal(3, 2)), N'Activo')
INSERT [dbo].[Conductor] ([id_conductor], [dni], [nombre_completo], [licencia_conducir], [categoria_licencia], [fecha_contratacion], [fecha_vencimiento_licencia], [horas_conduccion_mes], [evaluacion_conduccion], [estado]) VALUES (22, N'48693217', N'Darwin Bravo Luján', N'C88990011', N'A3B', CAST(N'2021-09-19' AS Date), CAST(N'2026-09-19' AS Date), 130, CAST(4.00 AS Decimal(3, 2)), N'Activo')
INSERT [dbo].[Conductor] ([id_conductor], [dni], [nombre_completo], [licencia_conducir], [categoria_licencia], [fecha_contratacion], [fecha_vencimiento_licencia], [horas_conduccion_mes], [evaluacion_conduccion], [estado]) VALUES (23, N'47823910', N'Nelson Zapata Vargas', N'C33445577', N'A3C', CAST(N'2022-03-10' AS Date), CAST(N'2027-03-10' AS Date), 110, CAST(3.90 AS Decimal(3, 2)), N'Activo')
INSERT [dbo].[Conductor] ([id_conductor], [dni], [nombre_completo], [licencia_conducir], [categoria_licencia], [fecha_contratacion], [fecha_vencimiento_licencia], [horas_conduccion_mes], [evaluacion_conduccion], [estado]) VALUES (24, N'47321876', N'Félix Villanueva Saavedra', N'D77665544', N'A3C', CAST(N'2019-01-01' AS Date), CAST(N'2024-01-01' AS Date), 170, CAST(4.50 AS Decimal(3, 2)), N'Activo')
INSERT [dbo].[Conductor] ([id_conductor], [dni], [nombre_completo], [licencia_conducir], [categoria_licencia], [fecha_contratacion], [fecha_vencimiento_licencia], [horas_conduccion_mes], [evaluacion_conduccion], [estado]) VALUES (25, N'49423157', N'Arturo Delgado Gamarra', N'B33344455', N'A2B', CAST(N'2017-12-25' AS Date), CAST(N'2025-12-25' AS Date), 160, CAST(4.20 AS Decimal(3, 2)), N'Inactivo')
INSERT [dbo].[Conductor] ([id_conductor], [dni], [nombre_completo], [licencia_conducir], [categoria_licencia], [fecha_contratacion], [fecha_vencimiento_licencia], [horas_conduccion_mes], [evaluacion_conduccion], [estado]) VALUES (26, N'45573219', N'Gustavo Ríos Zamora', N'C11223344', N'A3C', CAST(N'2021-08-01' AS Date), CAST(N'2026-08-01' AS Date), 100, CAST(3.75 AS Decimal(3, 2)), N'Activo')
INSERT [dbo].[Conductor] ([id_conductor], [dni], [nombre_completo], [licencia_conducir], [categoria_licencia], [fecha_contratacion], [fecha_vencimiento_licencia], [horas_conduccion_mes], [evaluacion_conduccion], [estado]) VALUES (27, N'46512938', N'Víctor Chávez Farfán', N'B44556677', N'A3B', CAST(N'2020-11-11' AS Date), CAST(N'2025-11-11' AS Date), 145, CAST(4.10 AS Decimal(3, 2)), N'Activo')
INSERT [dbo].[Conductor] ([id_conductor], [dni], [nombre_completo], [licencia_conducir], [categoria_licencia], [fecha_contratacion], [fecha_vencimiento_licencia], [horas_conduccion_mes], [evaluacion_conduccion], [estado]) VALUES (28, N'47086542', N'Rolando Huamán Herrera', N'C22113344', N'A3C', CAST(N'2018-05-30' AS Date), CAST(N'2024-05-30' AS Date), 180, CAST(4.40 AS Decimal(3, 2)), N'Suspendido')
INSERT [dbo].[Conductor] ([id_conductor], [dni], [nombre_completo], [licencia_conducir], [categoria_licencia], [fecha_contratacion], [fecha_vencimiento_licencia], [horas_conduccion_mes], [evaluacion_conduccion], [estado]) VALUES (29, N'46329814', N'Manuel Arévalo Pinto', N'B99882211', N'A2B', CAST(N'2022-02-14' AS Date), CAST(N'2027-02-14' AS Date), 125, CAST(3.85 AS Decimal(3, 2)), N'Activo')
INSERT [dbo].[Conductor] ([id_conductor], [dni], [nombre_completo], [licencia_conducir], [categoria_licencia], [fecha_contratacion], [fecha_vencimiento_licencia], [horas_conduccion_mes], [evaluacion_conduccion], [estado]) VALUES (30, N'48906324', N'Enrique Contreras Soto', N'C55223366', N'A3C', CAST(N'2019-08-01' AS Date), CAST(N'2024-08-01' AS Date), 140, CAST(4.30 AS Decimal(3, 2)), N'Activo')
INSERT [dbo].[Conductor] ([id_conductor], [dni], [nombre_completo], [licencia_conducir], [categoria_licencia], [fecha_contratacion], [fecha_vencimiento_licencia], [horas_conduccion_mes], [evaluacion_conduccion], [estado]) VALUES (31, N'46683124', N'Renzo Delgado Sánchez', N'D55447788', N'A3B', CAST(N'2020-12-20' AS Date), CAST(N'2025-12-20' AS Date), 150, CAST(4.10 AS Decimal(3, 2)), N'Activo')
INSERT [dbo].[Conductor] ([id_conductor], [dni], [nombre_completo], [licencia_conducir], [categoria_licencia], [fecha_contratacion], [fecha_vencimiento_licencia], [horas_conduccion_mes], [evaluacion_conduccion], [estado]) VALUES (32, N'46891276', N'Walter Espinoza Zárate', N'C44556677', N'A3C', CAST(N'2021-06-25' AS Date), CAST(N'2026-06-25' AS Date), 130, CAST(4.00 AS Decimal(3, 2)), N'Activo')
INSERT [dbo].[Conductor] ([id_conductor], [dni], [nombre_completo], [licencia_conducir], [categoria_licencia], [fecha_contratacion], [fecha_vencimiento_licencia], [horas_conduccion_mes], [evaluacion_conduccion], [estado]) VALUES (33, N'46210987', N'Alan Canales Bravo', N'B11223344', N'A2B', CAST(N'2017-11-18' AS Date), CAST(N'2025-11-18' AS Date), 160, CAST(4.25 AS Decimal(3, 2)), N'Vacaciones')
INSERT [dbo].[Conductor] ([id_conductor], [dni], [nombre_completo], [licencia_conducir], [categoria_licencia], [fecha_contratacion], [fecha_vencimiento_licencia], [horas_conduccion_mes], [evaluacion_conduccion], [estado]) VALUES (34, N'49327456', N'Ernesto Cárdenas Torres', N'C33446677', N'A3B', CAST(N'2018-01-15' AS Date), CAST(N'2024-01-15' AS Date), 150, CAST(3.95 AS Decimal(3, 2)), N'Activo')
INSERT [dbo].[Conductor] ([id_conductor], [dni], [nombre_completo], [licencia_conducir], [categoria_licencia], [fecha_contratacion], [fecha_vencimiento_licencia], [horas_conduccion_mes], [evaluacion_conduccion], [estado]) VALUES (35, N'48102645', N'Wilmer Ramos García', N'D22334455', N'A3C', CAST(N'2023-03-10' AS Date), CAST(N'2028-03-10' AS Date), 90, CAST(4.50 AS Decimal(3, 2)), N'Activo')
INSERT [dbo].[Conductor] ([id_conductor], [dni], [nombre_completo], [licencia_conducir], [categoria_licencia], [fecha_contratacion], [fecha_vencimiento_licencia], [horas_conduccion_mes], [evaluacion_conduccion], [estado]) VALUES (36, N'47916324', N'Leonardo Ruiz Caballero', N'B66778890', N'A3C', CAST(N'2020-04-04' AS Date), CAST(N'2025-04-04' AS Date), 145, CAST(4.10 AS Decimal(3, 2)), N'Activo')
INSERT [dbo].[Conductor] ([id_conductor], [dni], [nombre_completo], [licencia_conducir], [categoria_licencia], [fecha_contratacion], [fecha_vencimiento_licencia], [horas_conduccion_mes], [evaluacion_conduccion], [estado]) VALUES (37, N'47490236', N'Samuel Pérez Valencia', N'C33445599', N'A3B', CAST(N'2022-06-06' AS Date), CAST(N'2027-06-06' AS Date), 130, CAST(3.80 AS Decimal(3, 2)), N'Activo')
INSERT [dbo].[Conductor] ([id_conductor], [dni], [nombre_completo], [licencia_conducir], [categoria_licencia], [fecha_contratacion], [fecha_vencimiento_licencia], [horas_conduccion_mes], [evaluacion_conduccion], [estado]) VALUES (38, N'46573108', N'Fernando Tapia Meza', N'D55667788', N'A3C', CAST(N'2021-10-01' AS Date), CAST(N'2026-10-01' AS Date), 140, CAST(4.15 AS Decimal(3, 2)), N'Activo')
INSERT [dbo].[Conductor] ([id_conductor], [dni], [nombre_completo], [licencia_conducir], [categoria_licencia], [fecha_contratacion], [fecha_vencimiento_licencia], [horas_conduccion_mes], [evaluacion_conduccion], [estado]) VALUES (39, N'45718293', N'Raúl Herrera Chávez', N'C44556688', N'A2B', CAST(N'2016-02-29' AS Date), CAST(N'2024-02-29' AS Date), 190, CAST(4.40 AS Decimal(3, 2)), N'Activo')
INSERT [dbo].[Conductor] ([id_conductor], [dni], [nombre_completo], [licencia_conducir], [categoria_licencia], [fecha_contratacion], [fecha_vencimiento_licencia], [horas_conduccion_mes], [evaluacion_conduccion], [estado]) VALUES (40, N'48629018', N'Sergio Salazar Medina', N'C55443322', N'A3C', CAST(N'2023-01-01' AS Date), CAST(N'2028-01-01' AS Date), 100, CAST(3.95 AS Decimal(3, 2)), N'Activo')
SET IDENTITY_INSERT [dbo].[Conductor] OFF
GO
SET IDENTITY_INSERT [dbo].[DetalleMantenimiento] ON 

INSERT [dbo].[DetalleMantenimiento] ([id_detalle], [id_mantenimiento], [id_item], [realizado], [valor_encontrado], [cumplimiento], [observaciones], [fecha_hora_ejecucion]) VALUES (2, 2, 1, N'1', N'OK', N'1', N'Sin observaciones', CAST(N'2024-07-15T08:15:00.000' AS DateTime))
INSERT [dbo].[DetalleMantenimiento] ([id_detalle], [id_mantenimiento], [id_item], [realizado], [valor_encontrado], [cumplimiento], [observaciones], [fecha_hora_ejecucion]) VALUES (3, 3, 2, N'1', N'Requiere ajuste', N'0', N'Tornillos flojos', CAST(N'2024-08-01T09:20:00.000' AS DateTime))
INSERT [dbo].[DetalleMantenimiento] ([id_detalle], [id_mantenimiento], [id_item], [realizado], [valor_encontrado], [cumplimiento], [observaciones], [fecha_hora_ejecucion]) VALUES (4, 4, 3, N'1', N'Bien', N'1', N'Correcto', CAST(N'2024-07-20T07:45:00.000' AS DateTime))
INSERT [dbo].[DetalleMantenimiento] ([id_detalle], [id_mantenimiento], [id_item], [realizado], [valor_encontrado], [cumplimiento], [observaciones], [fecha_hora_ejecucion]) VALUES (5, 5, 4, N'0', N'Desgaste', N'0', N'Se recomendará cambio', CAST(N'2024-08-05T10:30:00.000' AS DateTime))
INSERT [dbo].[DetalleMantenimiento] ([id_detalle], [id_mantenimiento], [id_item], [realizado], [valor_encontrado], [cumplimiento], [observaciones], [fecha_hora_ejecucion]) VALUES (6, 6, 5, N'1', N'OK', N'1', N'', CAST(N'2024-07-25T08:20:00.000' AS DateTime))
INSERT [dbo].[DetalleMantenimiento] ([id_detalle], [id_mantenimiento], [id_item], [realizado], [valor_encontrado], [cumplimiento], [observaciones], [fecha_hora_ejecucion]) VALUES (7, 7, 6, N'1', N'Correcto', N'1', N'', CAST(N'2024-07-30T07:45:00.000' AS DateTime))
INSERT [dbo].[DetalleMantenimiento] ([id_detalle], [id_mantenimiento], [id_item], [realizado], [valor_encontrado], [cumplimiento], [observaciones], [fecha_hora_ejecucion]) VALUES (8, 8, 7, N'0', N'Mal estado', N'0', N'Requiere cambio', CAST(N'2024-08-02T08:30:00.000' AS DateTime))
INSERT [dbo].[DetalleMantenimiento] ([id_detalle], [id_mantenimiento], [id_item], [realizado], [valor_encontrado], [cumplimiento], [observaciones], [fecha_hora_ejecucion]) VALUES (9, 9, 8, N'1', N'Óptimo', N'1', N'', CAST(N'2024-07-18T09:15:00.000' AS DateTime))
INSERT [dbo].[DetalleMantenimiento] ([id_detalle], [id_mantenimiento], [id_item], [realizado], [valor_encontrado], [cumplimiento], [observaciones], [fecha_hora_ejecucion]) VALUES (10, 10, 9, N'1', N'Aceptable', N'1', N'', CAST(N'2024-07-22T08:30:00.000' AS DateTime))
INSERT [dbo].[DetalleMantenimiento] ([id_detalle], [id_mantenimiento], [id_item], [realizado], [valor_encontrado], [cumplimiento], [observaciones], [fecha_hora_ejecucion]) VALUES (11, 11, 10, N'1', N'Correcto', N'1', N'', CAST(N'2024-08-10T10:20:00.000' AS DateTime))
INSERT [dbo].[DetalleMantenimiento] ([id_detalle], [id_mantenimiento], [id_item], [realizado], [valor_encontrado], [cumplimiento], [observaciones], [fecha_hora_ejecucion]) VALUES (12, 12, 11, N'1', N'Normal', N'1', N'', CAST(N'2024-07-10T08:15:00.000' AS DateTime))
INSERT [dbo].[DetalleMantenimiento] ([id_detalle], [id_mantenimiento], [id_item], [realizado], [valor_encontrado], [cumplimiento], [observaciones], [fecha_hora_ejecucion]) VALUES (13, 13, 12, N'0', N'Debajo del estándar', N'0', N'Revisión pendiente', CAST(N'2024-07-12T07:30:00.000' AS DateTime))
INSERT [dbo].[DetalleMantenimiento] ([id_detalle], [id_mantenimiento], [id_item], [realizado], [valor_encontrado], [cumplimiento], [observaciones], [fecha_hora_ejecucion]) VALUES (14, 14, 13, N'1', N'Sin fallas', N'1', N'', CAST(N'2024-07-28T09:45:00.000' AS DateTime))
INSERT [dbo].[DetalleMantenimiento] ([id_detalle], [id_mantenimiento], [id_item], [realizado], [valor_encontrado], [cumplimiento], [observaciones], [fecha_hora_ejecucion]) VALUES (15, 15, 14, N'0', N'Desalineado', N'0', N'Balanceo necesario', CAST(N'2024-08-12T08:30:00.000' AS DateTime))
INSERT [dbo].[DetalleMantenimiento] ([id_detalle], [id_mantenimiento], [id_item], [realizado], [valor_encontrado], [cumplimiento], [observaciones], [fecha_hora_ejecucion]) VALUES (16, 16, 15, N'1', N'Todo bien', N'1', N'', CAST(N'2024-07-27T10:15:00.000' AS DateTime))
INSERT [dbo].[DetalleMantenimiento] ([id_detalle], [id_mantenimiento], [id_item], [realizado], [valor_encontrado], [cumplimiento], [observaciones], [fecha_hora_ejecucion]) VALUES (17, 17, 16, N'0', N'Ruidos detectados', N'0', N'Investigación requerida', CAST(N'2024-07-19T09:15:00.000' AS DateTime))
INSERT [dbo].[DetalleMantenimiento] ([id_detalle], [id_mantenimiento], [id_item], [realizado], [valor_encontrado], [cumplimiento], [observaciones], [fecha_hora_ejecucion]) VALUES (18, 18, 17, N'1', N'OK', N'1', N'', CAST(N'2024-08-03T09:00:00.000' AS DateTime))
INSERT [dbo].[DetalleMantenimiento] ([id_detalle], [id_mantenimiento], [id_item], [realizado], [valor_encontrado], [cumplimiento], [observaciones], [fecha_hora_ejecucion]) VALUES (19, 19, 18, N'1', N'Bien', N'1', N'', CAST(N'2024-08-06T09:45:00.000' AS DateTime))
INSERT [dbo].[DetalleMantenimiento] ([id_detalle], [id_mantenimiento], [id_item], [realizado], [valor_encontrado], [cumplimiento], [observaciones], [fecha_hora_ejecucion]) VALUES (20, 20, 19, N'0', N'Rotura menor', N'0', N'Requiere repuesto', CAST(N'2024-07-21T07:15:00.000' AS DateTime))
INSERT [dbo].[DetalleMantenimiento] ([id_detalle], [id_mantenimiento], [id_item], [realizado], [valor_encontrado], [cumplimiento], [observaciones], [fecha_hora_ejecucion]) VALUES (21, 21, 20, N'1', N'Estable', N'1', N'', CAST(N'2024-07-29T07:30:00.000' AS DateTime))
INSERT [dbo].[DetalleMantenimiento] ([id_detalle], [id_mantenimiento], [id_item], [realizado], [valor_encontrado], [cumplimiento], [observaciones], [fecha_hora_ejecucion]) VALUES (22, 22, 21, N'1', N'Sin fugas', N'1', N'', CAST(N'2024-07-16T08:15:00.000' AS DateTime))
INSERT [dbo].[DetalleMantenimiento] ([id_detalle], [id_mantenimiento], [id_item], [realizado], [valor_encontrado], [cumplimiento], [observaciones], [fecha_hora_ejecucion]) VALUES (23, 23, 22, N'0', N'Sistema apagado', N'0', N'Problemas eléctricos', CAST(N'2024-07-17T10:15:00.000' AS DateTime))
INSERT [dbo].[DetalleMantenimiento] ([id_detalle], [id_mantenimiento], [id_item], [realizado], [valor_encontrado], [cumplimiento], [observaciones], [fecha_hora_ejecucion]) VALUES (24, 24, 23, N'1', N'Correcto', N'1', N'', CAST(N'2024-07-23T08:20:00.000' AS DateTime))
INSERT [dbo].[DetalleMantenimiento] ([id_detalle], [id_mantenimiento], [id_item], [realizado], [valor_encontrado], [cumplimiento], [observaciones], [fecha_hora_ejecucion]) VALUES (25, 25, 24, N'1', N'Estable', N'1', N'', CAST(N'2024-07-24T08:20:00.000' AS DateTime))
INSERT [dbo].[DetalleMantenimiento] ([id_detalle], [id_mantenimiento], [id_item], [realizado], [valor_encontrado], [cumplimiento], [observaciones], [fecha_hora_ejecucion]) VALUES (26, 26, 25, N'1', N'OK', N'1', N'', CAST(N'2024-07-26T09:15:00.000' AS DateTime))
INSERT [dbo].[DetalleMantenimiento] ([id_detalle], [id_mantenimiento], [id_item], [realizado], [valor_encontrado], [cumplimiento], [observaciones], [fecha_hora_ejecucion]) VALUES (27, 27, 26, N'0', N'Presión baja', N'0', N'Requiere verificación', CAST(N'2024-08-04T07:45:00.000' AS DateTime))
INSERT [dbo].[DetalleMantenimiento] ([id_detalle], [id_mantenimiento], [id_item], [realizado], [valor_encontrado], [cumplimiento], [observaciones], [fecha_hora_ejecucion]) VALUES (28, 28, 27, N'1', N'Todo funciona', N'1', N'', CAST(N'2024-08-09T08:15:00.000' AS DateTime))
INSERT [dbo].[DetalleMantenimiento] ([id_detalle], [id_mantenimiento], [id_item], [realizado], [valor_encontrado], [cumplimiento], [observaciones], [fecha_hora_ejecucion]) VALUES (29, 29, 28, N'1', N'Bien', N'1', N'', CAST(N'2024-08-11T09:15:00.000' AS DateTime))
INSERT [dbo].[DetalleMantenimiento] ([id_detalle], [id_mantenimiento], [id_item], [realizado], [valor_encontrado], [cumplimiento], [observaciones], [fecha_hora_ejecucion]) VALUES (30, 30, 29, N'0', N'Alerta de temperatura', N'0', N'Motor caliente', CAST(N'2024-08-13T10:20:00.000' AS DateTime))
INSERT [dbo].[DetalleMantenimiento] ([id_detalle], [id_mantenimiento], [id_item], [realizado], [valor_encontrado], [cumplimiento], [observaciones], [fecha_hora_ejecucion]) VALUES (31, 31, 30, N'1', N'Correcto', N'1', N'', CAST(N'2024-08-14T08:15:00.000' AS DateTime))
INSERT [dbo].[DetalleMantenimiento] ([id_detalle], [id_mantenimiento], [id_item], [realizado], [valor_encontrado], [cumplimiento], [observaciones], [fecha_hora_ejecucion]) VALUES (32, 32, 31, N'1', N'Verificado', N'1', N'', CAST(N'2024-07-13T07:45:00.000' AS DateTime))
INSERT [dbo].[DetalleMantenimiento] ([id_detalle], [id_mantenimiento], [id_item], [realizado], [valor_encontrado], [cumplimiento], [observaciones], [fecha_hora_ejecucion]) VALUES (33, 33, 32, N'0', N'Ruido detectado', N'0', N'Mantenimiento adicional', CAST(N'2024-07-14T08:30:00.000' AS DateTime))
INSERT [dbo].[DetalleMantenimiento] ([id_detalle], [id_mantenimiento], [id_item], [realizado], [valor_encontrado], [cumplimiento], [observaciones], [fecha_hora_ejecucion]) VALUES (34, 34, 33, N'1', N'Normal', N'1', N'', CAST(N'2024-07-31T08:45:00.000' AS DateTime))
INSERT [dbo].[DetalleMantenimiento] ([id_detalle], [id_mantenimiento], [id_item], [realizado], [valor_encontrado], [cumplimiento], [observaciones], [fecha_hora_ejecucion]) VALUES (35, 35, 34, N'1', N'Correcto', N'1', N'', CAST(N'2024-08-15T09:30:00.000' AS DateTime))
INSERT [dbo].[DetalleMantenimiento] ([id_detalle], [id_mantenimiento], [id_item], [realizado], [valor_encontrado], [cumplimiento], [observaciones], [fecha_hora_ejecucion]) VALUES (36, 36, 35, N'1', N'OK', N'1', N'', CAST(N'2024-08-16T09:30:00.000' AS DateTime))
INSERT [dbo].[DetalleMantenimiento] ([id_detalle], [id_mantenimiento], [id_item], [realizado], [valor_encontrado], [cumplimiento], [observaciones], [fecha_hora_ejecucion]) VALUES (37, 37, 36, N'1', N'Sin novedad', N'1', N'', CAST(N'2024-08-17T10:15:00.000' AS DateTime))
INSERT [dbo].[DetalleMantenimiento] ([id_detalle], [id_mantenimiento], [id_item], [realizado], [valor_encontrado], [cumplimiento], [observaciones], [fecha_hora_ejecucion]) VALUES (38, 38, 37, N'1', N'Correcto', N'1', N'', CAST(N'2024-08-18T07:15:00.000' AS DateTime))
INSERT [dbo].[DetalleMantenimiento] ([id_detalle], [id_mantenimiento], [id_item], [realizado], [valor_encontrado], [cumplimiento], [observaciones], [fecha_hora_ejecucion]) VALUES (39, 39, 38, N'1', N'Todo bien', N'1', N'', CAST(N'2024-08-19T09:15:00.000' AS DateTime))
INSERT [dbo].[DetalleMantenimiento] ([id_detalle], [id_mantenimiento], [id_item], [realizado], [valor_encontrado], [cumplimiento], [observaciones], [fecha_hora_ejecucion]) VALUES (40, 40, 39, N'1', N'OK', N'1', N'', CAST(N'2024-08-20T10:45:00.000' AS DateTime))
INSERT [dbo].[DetalleMantenimiento] ([id_detalle], [id_mantenimiento], [id_item], [realizado], [valor_encontrado], [cumplimiento], [observaciones], [fecha_hora_ejecucion]) VALUES (41, 41, 40, N'1', N'Estándar', N'1', N'', CAST(N'2024-08-21T08:45:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[DetalleMantenimiento] OFF
GO
SET IDENTITY_INSERT [dbo].[DetalleOrdenCompra] ON 

INSERT [dbo].[DetalleOrdenCompra] ([id_detalle], [id_orden], [codigo_item], [descripcion], [cantidad], [unidad_medida], [precio_unitario]) VALUES (2, 33, N'ITM-033', N'Filtro de aire', CAST(2.00 AS Decimal(10, 2)), N'unidad', CAST(150.00 AS Decimal(10, 2)))
INSERT [dbo].[DetalleOrdenCompra] ([id_detalle], [id_orden], [codigo_item], [descripcion], [cantidad], [unidad_medida], [precio_unitario]) VALUES (3, 34, N'ITM-034', N'Aceite sintético', CAST(4.00 AS Decimal(10, 2)), N'litro', CAST(60.00 AS Decimal(10, 2)))
INSERT [dbo].[DetalleOrdenCompra] ([id_detalle], [id_orden], [codigo_item], [descripcion], [cantidad], [unidad_medida], [precio_unitario]) VALUES (4, 35, N'ITM-035', N'Pastillas de freno', CAST(2.00 AS Decimal(10, 2)), N'juego', CAST(200.00 AS Decimal(10, 2)))
INSERT [dbo].[DetalleOrdenCompra] ([id_detalle], [id_orden], [codigo_item], [descripcion], [cantidad], [unidad_medida], [precio_unitario]) VALUES (5, 36, N'ITM-036', N'Revisión eléctrica', CAST(1.00 AS Decimal(10, 2)), N'servicio', CAST(300.00 AS Decimal(10, 2)))
INSERT [dbo].[DetalleOrdenCompra] ([id_detalle], [id_orden], [codigo_item], [descripcion], [cantidad], [unidad_medida], [precio_unitario]) VALUES (6, 37, N'ITM-037', N'Limpieza de inyectores', CAST(1.00 AS Decimal(10, 2)), N'servicio', CAST(280.00 AS Decimal(10, 2)))
INSERT [dbo].[DetalleOrdenCompra] ([id_detalle], [id_orden], [codigo_item], [descripcion], [cantidad], [unidad_medida], [precio_unitario]) VALUES (7, 38, N'ITM-038', N'Cambio de batería', CAST(1.00 AS Decimal(10, 2)), N'unidad', CAST(450.00 AS Decimal(10, 2)))
INSERT [dbo].[DetalleOrdenCompra] ([id_detalle], [id_orden], [codigo_item], [descripcion], [cantidad], [unidad_medida], [precio_unitario]) VALUES (8, 39, N'ITM-039', N'Sensor de temperatura', CAST(2.00 AS Decimal(10, 2)), N'unidad', CAST(120.00 AS Decimal(10, 2)))
INSERT [dbo].[DetalleOrdenCompra] ([id_detalle], [id_orden], [codigo_item], [descripcion], [cantidad], [unidad_medida], [precio_unitario]) VALUES (9, 40, N'ITM-040', N'Lubricante de motor', CAST(3.00 AS Decimal(10, 2)), N'litro', CAST(50.00 AS Decimal(10, 2)))
INSERT [dbo].[DetalleOrdenCompra] ([id_detalle], [id_orden], [codigo_item], [descripcion], [cantidad], [unidad_medida], [precio_unitario]) VALUES (10, 41, N'ITM-041', N'Neumático 22R', CAST(1.00 AS Decimal(10, 2)), N'unidad', CAST(800.00 AS Decimal(10, 2)))
INSERT [dbo].[DetalleOrdenCompra] ([id_detalle], [id_orden], [codigo_item], [descripcion], [cantidad], [unidad_medida], [precio_unitario]) VALUES (11, 42, N'ITM-042', N'Kit luces LED', CAST(1.00 AS Decimal(10, 2)), N'kit', CAST(500.00 AS Decimal(10, 2)))
INSERT [dbo].[DetalleOrdenCompra] ([id_detalle], [id_orden], [codigo_item], [descripcion], [cantidad], [unidad_medida], [precio_unitario]) VALUES (12, 43, N'ITM-043', N'Espejo retrovisor', CAST(2.00 AS Decimal(10, 2)), N'unidad', CAST(100.00 AS Decimal(10, 2)))
INSERT [dbo].[DetalleOrdenCompra] ([id_detalle], [id_orden], [codigo_item], [descripcion], [cantidad], [unidad_medida], [precio_unitario]) VALUES (13, 44, N'ITM-044', N'Radiador', CAST(1.00 AS Decimal(10, 2)), N'unidad', CAST(700.00 AS Decimal(10, 2)))
INSERT [dbo].[DetalleOrdenCompra] ([id_detalle], [id_orden], [codigo_item], [descripcion], [cantidad], [unidad_medida], [precio_unitario]) VALUES (14, 45, N'ITM-045', N'Alternador', CAST(1.00 AS Decimal(10, 2)), N'unidad', CAST(950.00 AS Decimal(10, 2)))
INSERT [dbo].[DetalleOrdenCompra] ([id_detalle], [id_orden], [codigo_item], [descripcion], [cantidad], [unidad_medida], [precio_unitario]) VALUES (15, 46, N'ITM-046', N'Motor de arranque', CAST(1.00 AS Decimal(10, 2)), N'unidad', CAST(1050.00 AS Decimal(10, 2)))
INSERT [dbo].[DetalleOrdenCompra] ([id_detalle], [id_orden], [codigo_item], [descripcion], [cantidad], [unidad_medida], [precio_unitario]) VALUES (16, 47, N'ITM-047', N'Fusibles', CAST(10.00 AS Decimal(10, 2)), N'unidad', CAST(10.00 AS Decimal(10, 2)))
INSERT [dbo].[DetalleOrdenCompra] ([id_detalle], [id_orden], [codigo_item], [descripcion], [cantidad], [unidad_medida], [precio_unitario]) VALUES (17, 48, N'ITM-048', N'Bombilla halógena', CAST(4.00 AS Decimal(10, 2)), N'unidad', CAST(30.00 AS Decimal(10, 2)))
INSERT [dbo].[DetalleOrdenCompra] ([id_detalle], [id_orden], [codigo_item], [descripcion], [cantidad], [unidad_medida], [precio_unitario]) VALUES (18, 49, N'ITM-049', N'Revisión de suspensión', CAST(1.00 AS Decimal(10, 2)), N'servicio', CAST(350.00 AS Decimal(10, 2)))
INSERT [dbo].[DetalleOrdenCompra] ([id_detalle], [id_orden], [codigo_item], [descripcion], [cantidad], [unidad_medida], [precio_unitario]) VALUES (19, 50, N'ITM-050', N'Cambio de bujías', CAST(4.00 AS Decimal(10, 2)), N'unidad', CAST(60.00 AS Decimal(10, 2)))
INSERT [dbo].[DetalleOrdenCompra] ([id_detalle], [id_orden], [codigo_item], [descripcion], [cantidad], [unidad_medida], [precio_unitario]) VALUES (20, 51, N'ITM-051', N'Mantenimiento de caja', CAST(1.00 AS Decimal(10, 2)), N'servicio', CAST(500.00 AS Decimal(10, 2)))
INSERT [dbo].[DetalleOrdenCompra] ([id_detalle], [id_orden], [codigo_item], [descripcion], [cantidad], [unidad_medida], [precio_unitario]) VALUES (21, 52, N'ITM-052', N'Correa de distribución', CAST(1.00 AS Decimal(10, 2)), N'unidad', CAST(300.00 AS Decimal(10, 2)))
INSERT [dbo].[DetalleOrdenCompra] ([id_detalle], [id_orden], [codigo_item], [descripcion], [cantidad], [unidad_medida], [precio_unitario]) VALUES (22, 53, N'ITM-053', N'Filtro de combustible', CAST(2.00 AS Decimal(10, 2)), N'unidad', CAST(140.00 AS Decimal(10, 2)))
INSERT [dbo].[DetalleOrdenCompra] ([id_detalle], [id_orden], [codigo_item], [descripcion], [cantidad], [unidad_medida], [precio_unitario]) VALUES (23, 54, N'ITM-054', N'Revisión completa', CAST(1.00 AS Decimal(10, 2)), N'servicio', CAST(1000.00 AS Decimal(10, 2)))
INSERT [dbo].[DetalleOrdenCompra] ([id_detalle], [id_orden], [codigo_item], [descripcion], [cantidad], [unidad_medida], [precio_unitario]) VALUES (24, 55, N'ITM-055', N'Inspección técnica', CAST(1.00 AS Decimal(10, 2)), N'servicio', CAST(200.00 AS Decimal(10, 2)))
INSERT [dbo].[DetalleOrdenCompra] ([id_detalle], [id_orden], [codigo_item], [descripcion], [cantidad], [unidad_medida], [precio_unitario]) VALUES (25, 56, N'ITM-056', N'Líquido de frenos', CAST(2.00 AS Decimal(10, 2)), N'litro', CAST(40.00 AS Decimal(10, 2)))
INSERT [dbo].[DetalleOrdenCompra] ([id_detalle], [id_orden], [codigo_item], [descripcion], [cantidad], [unidad_medida], [precio_unitario]) VALUES (26, 57, N'ITM-057', N'Batería 12V', CAST(1.00 AS Decimal(10, 2)), N'unidad', CAST(380.00 AS Decimal(10, 2)))
INSERT [dbo].[DetalleOrdenCompra] ([id_detalle], [id_orden], [codigo_item], [descripcion], [cantidad], [unidad_medida], [precio_unitario]) VALUES (27, 58, N'ITM-058', N'Cámara de reversa', CAST(1.00 AS Decimal(10, 2)), N'unidad', CAST(250.00 AS Decimal(10, 2)))
INSERT [dbo].[DetalleOrdenCompra] ([id_detalle], [id_orden], [codigo_item], [descripcion], [cantidad], [unidad_medida], [precio_unitario]) VALUES (28, 59, N'ITM-059', N'Balatas traseras', CAST(2.00 AS Decimal(10, 2)), N'juego', CAST(180.00 AS Decimal(10, 2)))
INSERT [dbo].[DetalleOrdenCompra] ([id_detalle], [id_orden], [codigo_item], [descripcion], [cantidad], [unidad_medida], [precio_unitario]) VALUES (29, 60, N'ITM-060', N'Pulido de faros', CAST(1.00 AS Decimal(10, 2)), N'servicio', CAST(150.00 AS Decimal(10, 2)))
INSERT [dbo].[DetalleOrdenCompra] ([id_detalle], [id_orden], [codigo_item], [descripcion], [cantidad], [unidad_medida], [precio_unitario]) VALUES (30, 61, N'ITM-061', N'Limpieza sistema frenos', CAST(1.00 AS Decimal(10, 2)), N'servicio', CAST(220.00 AS Decimal(10, 2)))
INSERT [dbo].[DetalleOrdenCompra] ([id_detalle], [id_orden], [codigo_item], [descripcion], [cantidad], [unidad_medida], [precio_unitario]) VALUES (31, 62, N'ITM-062', N'Aceite hidráulico', CAST(3.00 AS Decimal(10, 2)), N'litro', CAST(75.00 AS Decimal(10, 2)))
INSERT [dbo].[DetalleOrdenCompra] ([id_detalle], [id_orden], [codigo_item], [descripcion], [cantidad], [unidad_medida], [precio_unitario]) VALUES (32, 63, N'ITM-063', N'Revisión alineación', CAST(1.00 AS Decimal(10, 2)), N'servicio', CAST(180.00 AS Decimal(10, 2)))
INSERT [dbo].[DetalleOrdenCompra] ([id_detalle], [id_orden], [codigo_item], [descripcion], [cantidad], [unidad_medida], [precio_unitario]) VALUES (33, 64, N'ITM-064', N'Cambio sensores ABS', CAST(1.00 AS Decimal(10, 2)), N'unidad', CAST(400.00 AS Decimal(10, 2)))
INSERT [dbo].[DetalleOrdenCompra] ([id_detalle], [id_orden], [codigo_item], [descripcion], [cantidad], [unidad_medida], [precio_unitario]) VALUES (34, 65, N'ITM-065', N'Revisión de motor', CAST(1.00 AS Decimal(10, 2)), N'servicio', CAST(700.00 AS Decimal(10, 2)))
INSERT [dbo].[DetalleOrdenCompra] ([id_detalle], [id_orden], [codigo_item], [descripcion], [cantidad], [unidad_medida], [precio_unitario]) VALUES (35, 66, N'ITM-066', N'Cambio correa alternador', CAST(1.00 AS Decimal(10, 2)), N'unidad', CAST(220.00 AS Decimal(10, 2)))
INSERT [dbo].[DetalleOrdenCompra] ([id_detalle], [id_orden], [codigo_item], [descripcion], [cantidad], [unidad_medida], [precio_unitario]) VALUES (36, 67, N'ITM-067', N'Líquido refrigerante', CAST(2.00 AS Decimal(10, 2)), N'litro', CAST(60.00 AS Decimal(10, 2)))
INSERT [dbo].[DetalleOrdenCompra] ([id_detalle], [id_orden], [codigo_item], [descripcion], [cantidad], [unidad_medida], [precio_unitario]) VALUES (37, 68, N'ITM-068', N'Inspección de embrague', CAST(1.00 AS Decimal(10, 2)), N'servicio', CAST(600.00 AS Decimal(10, 2)))
INSERT [dbo].[DetalleOrdenCompra] ([id_detalle], [id_orden], [codigo_item], [descripcion], [cantidad], [unidad_medida], [precio_unitario]) VALUES (38, 69, N'ITM-069', N'Sistema eléctrico completo', CAST(1.00 AS Decimal(10, 2)), N'servicio', CAST(950.00 AS Decimal(10, 2)))
INSERT [dbo].[DetalleOrdenCompra] ([id_detalle], [id_orden], [codigo_item], [descripcion], [cantidad], [unidad_medida], [precio_unitario]) VALUES (39, 70, N'ITM-070', N'Cambio de inyectores', CAST(4.00 AS Decimal(10, 2)), N'unidad', CAST(300.00 AS Decimal(10, 2)))
INSERT [dbo].[DetalleOrdenCompra] ([id_detalle], [id_orden], [codigo_item], [descripcion], [cantidad], [unidad_medida], [precio_unitario]) VALUES (40, 71, N'ITM-071', N'Tapizado de asiento', CAST(1.00 AS Decimal(10, 2)), N'unidad', CAST(400.00 AS Decimal(10, 2)))
INSERT [dbo].[DetalleOrdenCompra] ([id_detalle], [id_orden], [codigo_item], [descripcion], [cantidad], [unidad_medida], [precio_unitario]) VALUES (41, 72, N'ITM-072', N'Mantenimiento climatizador', CAST(1.00 AS Decimal(10, 2)), N'servicio', CAST(550.00 AS Decimal(10, 2)))
SET IDENTITY_INSERT [dbo].[DetalleOrdenCompra] OFF
GO
SET IDENTITY_INSERT [dbo].[HistoricoFallo] ON 

INSERT [dbo].[HistoricoFallo] ([id_fallo], [id_bus], [id_conductor], [id_asignacion], [fecha_reporte], [fecha_solucion], [descripcion_fallo], [sintomas], [diagnostico], [accion_correctiva], [kilometraje_ocurrencia], [gravedad], [causa_raiz], [costo_reparacion]) VALUES (1, 1, 1, 1, CAST(N'2024-06-01T08:00:00.000' AS DateTime), CAST(N'2024-06-03T10:00:00.000' AS DateTime), N'Frenos defectuosos', N'Ruidos al frenar', N'Pastillas desgastadas', N'Cambio de pastillas', 45000, N'Moderado', N'Desgaste natural', CAST(120.00 AS Decimal(10, 2)))
INSERT [dbo].[HistoricoFallo] ([id_fallo], [id_bus], [id_conductor], [id_asignacion], [fecha_reporte], [fecha_solucion], [descripcion_fallo], [sintomas], [diagnostico], [accion_correctiva], [kilometraje_ocurrencia], [gravedad], [causa_raiz], [costo_reparacion]) VALUES (2, 2, 2, 2, CAST(N'2024-06-05T09:30:00.000' AS DateTime), CAST(N'2024-06-06T12:00:00.000' AS DateTime), N'Motor con vibraciones', N'Vibración excesiva', N'Soporte flojo', N'Ajuste de soporte', 52000, N'Leve', N'Fijación débil', CAST(45.00 AS Decimal(10, 2)))
INSERT [dbo].[HistoricoFallo] ([id_fallo], [id_bus], [id_conductor], [id_asignacion], [fecha_reporte], [fecha_solucion], [descripcion_fallo], [sintomas], [diagnostico], [accion_correctiva], [kilometraje_ocurrencia], [gravedad], [causa_raiz], [costo_reparacion]) VALUES (3, 3, 3, 3, CAST(N'2024-06-10T07:45:00.000' AS DateTime), CAST(N'2024-06-12T11:30:00.000' AS DateTime), N'Calentamiento del motor', N'Temperatura elevada', N'Falta de refrigerante', N'Recarga de refrigerante', 48000, N'Grave', N'Fuga lenta', CAST(75.00 AS Decimal(10, 2)))
INSERT [dbo].[HistoricoFallo] ([id_fallo], [id_bus], [id_conductor], [id_asignacion], [fecha_reporte], [fecha_solucion], [descripcion_fallo], [sintomas], [diagnostico], [accion_correctiva], [kilometraje_ocurrencia], [gravedad], [causa_raiz], [costo_reparacion]) VALUES (4, 4, 4, 4, CAST(N'2024-06-15T10:00:00.000' AS DateTime), CAST(N'2024-06-16T14:00:00.000' AS DateTime), N'Fallo en luces traseras', N'No encienden', N'Conexión suelta', N'Reconexión de cables', 30000, N'Leve', N'Mala instalación', CAST(30.00 AS Decimal(10, 2)))
INSERT [dbo].[HistoricoFallo] ([id_fallo], [id_bus], [id_conductor], [id_asignacion], [fecha_reporte], [fecha_solucion], [descripcion_fallo], [sintomas], [diagnostico], [accion_correctiva], [kilometraje_ocurrencia], [gravedad], [causa_raiz], [costo_reparacion]) VALUES (5, 5, 5, 5, CAST(N'2024-06-18T08:30:00.000' AS DateTime), CAST(N'2024-06-20T13:00:00.000' AS DateTime), N'Llantas desgastadas', N'Poca tracción', N'Desgaste por uso', N'Cambio de llantas', 60000, N'Moderado', N'Kilometraje alto', CAST(360.00 AS Decimal(10, 2)))
INSERT [dbo].[HistoricoFallo] ([id_fallo], [id_bus], [id_conductor], [id_asignacion], [fecha_reporte], [fecha_solucion], [descripcion_fallo], [sintomas], [diagnostico], [accion_correctiva], [kilometraje_ocurrencia], [gravedad], [causa_raiz], [costo_reparacion]) VALUES (6, 6, 6, 6, CAST(N'2024-06-21T09:15:00.000' AS DateTime), CAST(N'2024-06-22T11:00:00.000' AS DateTime), N'Ruidos en dirección', N'Ruido al girar', N'Falta de lubricación', N'Engrase del sistema', 39000, N'Leve', N'Mantenimiento insuficiente', CAST(40.00 AS Decimal(10, 2)))
INSERT [dbo].[HistoricoFallo] ([id_fallo], [id_bus], [id_conductor], [id_asignacion], [fecha_reporte], [fecha_solucion], [descripcion_fallo], [sintomas], [diagnostico], [accion_correctiva], [kilometraje_ocurrencia], [gravedad], [causa_raiz], [costo_reparacion]) VALUES (7, 7, 7, 7, CAST(N'2024-06-23T07:50:00.000' AS DateTime), CAST(N'2024-06-25T16:00:00.000' AS DateTime), N'Escape con humo negro', N'Humo oscuro al acelerar', N'Mezcla rica en combustible', N'Ajuste de inyectores', 55000, N'Grave', N'Fallo en sensor', CAST(160.00 AS Decimal(10, 2)))
INSERT [dbo].[HistoricoFallo] ([id_fallo], [id_bus], [id_conductor], [id_asignacion], [fecha_reporte], [fecha_solucion], [descripcion_fallo], [sintomas], [diagnostico], [accion_correctiva], [kilometraje_ocurrencia], [gravedad], [causa_raiz], [costo_reparacion]) VALUES (8, 8, 8, 8, CAST(N'2024-06-28T09:30:00.000' AS DateTime), CAST(N'2024-06-29T13:00:00.000' AS DateTime), N'Batería sin carga', N'No enciende motor', N'Batería agotada', N'Reemplazo de batería', 31000, N'Moderado', N'Ciclo cumplido', CAST(280.00 AS Decimal(10, 2)))
INSERT [dbo].[HistoricoFallo] ([id_fallo], [id_bus], [id_conductor], [id_asignacion], [fecha_reporte], [fecha_solucion], [descripcion_fallo], [sintomas], [diagnostico], [accion_correctiva], [kilometraje_ocurrencia], [gravedad], [causa_raiz], [costo_reparacion]) VALUES (9, 9, 9, 9, CAST(N'2024-07-01T10:45:00.000' AS DateTime), CAST(N'2024-07-02T15:00:00.000' AS DateTime), N'Fallo en alternador', N'Luces bajan de intensidad', N'Alternador defectuoso', N'Reemplazo de alternador', 62000, N'Crítico', N'Desgaste interno', CAST(450.00 AS Decimal(10, 2)))
INSERT [dbo].[HistoricoFallo] ([id_fallo], [id_bus], [id_conductor], [id_asignacion], [fecha_reporte], [fecha_solucion], [descripcion_fallo], [sintomas], [diagnostico], [accion_correctiva], [kilometraje_ocurrencia], [gravedad], [causa_raiz], [costo_reparacion]) VALUES (10, 10, 10, 10, CAST(N'2024-07-03T08:20:00.000' AS DateTime), CAST(N'2024-07-04T12:30:00.000' AS DateTime), N'Problema de arranque', N'Tarda en encender', N'Fallo en bujía', N'Cambio de bujías', 57000, N'Moderado', N'Componentes antiguos', CAST(90.00 AS Decimal(10, 2)))
INSERT [dbo].[HistoricoFallo] ([id_fallo], [id_bus], [id_conductor], [id_asignacion], [fecha_reporte], [fecha_solucion], [descripcion_fallo], [sintomas], [diagnostico], [accion_correctiva], [kilometraje_ocurrencia], [gravedad], [causa_raiz], [costo_reparacion]) VALUES (11, 11, 11, 11, CAST(N'2024-07-05T00:00:00.000' AS DateTime), CAST(N'2024-07-06T00:00:00.000' AS DateTime), N'Golpes en suspensión', N'Golpes al pasar baches', N'Amortiguadores vencidos', N'Cambio de amortiguadores', 47000, N'Grave', N'Desgaste', CAST(300.00 AS Decimal(10, 2)))
INSERT [dbo].[HistoricoFallo] ([id_fallo], [id_bus], [id_conductor], [id_asignacion], [fecha_reporte], [fecha_solucion], [descripcion_fallo], [sintomas], [diagnostico], [accion_correctiva], [kilometraje_ocurrencia], [gravedad], [causa_raiz], [costo_reparacion]) VALUES (12, 12, 12, 12, CAST(N'2024-07-07T00:00:00.000' AS DateTime), CAST(N'2024-07-08T00:00:00.000' AS DateTime), N'Frenado irregular', N'Frena de golpe', N'Discos rayados', N'Rectificación de discos', 51000, N'Moderado', N'Fricción extrema', CAST(110.00 AS Decimal(10, 2)))
INSERT [dbo].[HistoricoFallo] ([id_fallo], [id_bus], [id_conductor], [id_asignacion], [fecha_reporte], [fecha_solucion], [descripcion_fallo], [sintomas], [diagnostico], [accion_correctiva], [kilometraje_ocurrencia], [gravedad], [causa_raiz], [costo_reparacion]) VALUES (13, 13, 13, 13, CAST(N'2024-07-09T00:00:00.000' AS DateTime), CAST(N'2024-07-10T00:00:00.000' AS DateTime), N'Luces intermitentes fallan', N'No parpadean', N'Relé dañado', N'Reemplazo de relé', 43000, N'Leve', N'Fallo eléctrico', CAST(40.00 AS Decimal(10, 2)))
INSERT [dbo].[HistoricoFallo] ([id_fallo], [id_bus], [id_conductor], [id_asignacion], [fecha_reporte], [fecha_solucion], [descripcion_fallo], [sintomas], [diagnostico], [accion_correctiva], [kilometraje_ocurrencia], [gravedad], [causa_raiz], [costo_reparacion]) VALUES (14, 14, 14, 14, CAST(N'2024-07-11T00:00:00.000' AS DateTime), CAST(N'2024-07-12T00:00:00.000' AS DateTime), N'Olor a combustible', N'Olor en cabina', N'Fuga en manguera', N'Cambio de manguera', 39000, N'Grave', N'Grieta en conexión', CAST(60.00 AS Decimal(10, 2)))
INSERT [dbo].[HistoricoFallo] ([id_fallo], [id_bus], [id_conductor], [id_asignacion], [fecha_reporte], [fecha_solucion], [descripcion_fallo], [sintomas], [diagnostico], [accion_correctiva], [kilometraje_ocurrencia], [gravedad], [causa_raiz], [costo_reparacion]) VALUES (15, 15, 15, 15, CAST(N'2024-07-13T00:00:00.000' AS DateTime), CAST(N'2024-07-14T00:00:00.000' AS DateTime), N'Problemas en embrague', N'No entra cambio', N'Desgaste en plato', N'Reemplazo de embrague', 70000, N'Crítico', N'Uso excesivo', CAST(500.00 AS Decimal(10, 2)))
INSERT [dbo].[HistoricoFallo] ([id_fallo], [id_bus], [id_conductor], [id_asignacion], [fecha_reporte], [fecha_solucion], [descripcion_fallo], [sintomas], [diagnostico], [accion_correctiva], [kilometraje_ocurrencia], [gravedad], [causa_raiz], [costo_reparacion]) VALUES (16, 16, 16, 16, CAST(N'2024-07-15T00:00:00.000' AS DateTime), CAST(N'2024-07-16T00:00:00.000' AS DateTime), N'Vibración en volante', N'A alta velocidad', N'Desbalanceo de ruedas', N'Balanceo', 47000, N'Moderado', N'Golpe previo', CAST(45.00 AS Decimal(10, 2)))
INSERT [dbo].[HistoricoFallo] ([id_fallo], [id_bus], [id_conductor], [id_asignacion], [fecha_reporte], [fecha_solucion], [descripcion_fallo], [sintomas], [diagnostico], [accion_correctiva], [kilometraje_ocurrencia], [gravedad], [causa_raiz], [costo_reparacion]) VALUES (17, 17, 17, 17, CAST(N'2024-07-17T00:00:00.000' AS DateTime), CAST(N'2024-07-18T00:00:00.000' AS DateTime), N'Falla en limpiaparabrisas', N'No funcionan', N'Motor quemado', N'Cambio de motor', 32000, N'Leve', N'Corto circuito', CAST(90.00 AS Decimal(10, 2)))
INSERT [dbo].[HistoricoFallo] ([id_fallo], [id_bus], [id_conductor], [id_asignacion], [fecha_reporte], [fecha_solucion], [descripcion_fallo], [sintomas], [diagnostico], [accion_correctiva], [kilometraje_ocurrencia], [gravedad], [causa_raiz], [costo_reparacion]) VALUES (18, 18, 18, 18, CAST(N'2024-07-19T00:00:00.000' AS DateTime), CAST(N'2024-07-20T00:00:00.000' AS DateTime), N'Ruido en motor', N'Al acelerar', N'Tensor flojo', N'Tensado de correa', 61000, N'Moderado', N'Mal ajuste', CAST(70.00 AS Decimal(10, 2)))
INSERT [dbo].[HistoricoFallo] ([id_fallo], [id_bus], [id_conductor], [id_asignacion], [fecha_reporte], [fecha_solucion], [descripcion_fallo], [sintomas], [diagnostico], [accion_correctiva], [kilometraje_ocurrencia], [gravedad], [causa_raiz], [costo_reparacion]) VALUES (19, 19, 19, 19, CAST(N'2024-07-21T00:00:00.000' AS DateTime), CAST(N'2024-07-22T00:00:00.000' AS DateTime), N'Calor excesivo en cabina', N'Ventilación débil', N'Radiador tapado', N'Limpieza del radiador', 50000, N'Grave', N'Suciedad acumulada', CAST(85.00 AS Decimal(10, 2)))
INSERT [dbo].[HistoricoFallo] ([id_fallo], [id_bus], [id_conductor], [id_asignacion], [fecha_reporte], [fecha_solucion], [descripcion_fallo], [sintomas], [diagnostico], [accion_correctiva], [kilometraje_ocurrencia], [gravedad], [causa_raiz], [costo_reparacion]) VALUES (20, 20, 20, 20, CAST(N'2024-07-23T00:00:00.000' AS DateTime), CAST(N'2024-07-24T00:00:00.000' AS DateTime), N'Alarma sin motivo', N'Se activa sola', N'Sensor mal calibrado', N'Reconfiguración', 36000, N'Leve', N'Error de software', CAST(30.00 AS Decimal(10, 2)))
INSERT [dbo].[HistoricoFallo] ([id_fallo], [id_bus], [id_conductor], [id_asignacion], [fecha_reporte], [fecha_solucion], [descripcion_fallo], [sintomas], [diagnostico], [accion_correctiva], [kilometraje_ocurrencia], [gravedad], [causa_raiz], [costo_reparacion]) VALUES (21, 21, 21, 21, CAST(N'2024-07-25T00:00:00.000' AS DateTime), CAST(N'2024-07-26T00:00:00.000' AS DateTime), N'Luces bajas dañadas', N'No iluminan', N'Bombilla fundida', N'Cambio de bombilla', 32000, N'Leve', N'Uso continuo', CAST(15.00 AS Decimal(10, 2)))
INSERT [dbo].[HistoricoFallo] ([id_fallo], [id_bus], [id_conductor], [id_asignacion], [fecha_reporte], [fecha_solucion], [descripcion_fallo], [sintomas], [diagnostico], [accion_correctiva], [kilometraje_ocurrencia], [gravedad], [causa_raiz], [costo_reparacion]) VALUES (22, 22, 22, 22, CAST(N'2024-07-27T00:00:00.000' AS DateTime), CAST(N'2024-07-28T00:00:00.000' AS DateTime), N'Tablero sin encender', N'No muestra datos', N'Fallo eléctrico', N'Cambio de fusible', 35000, N'Moderado', N'Fusible dañado', CAST(25.00 AS Decimal(10, 2)))
INSERT [dbo].[HistoricoFallo] ([id_fallo], [id_bus], [id_conductor], [id_asignacion], [fecha_reporte], [fecha_solucion], [descripcion_fallo], [sintomas], [diagnostico], [accion_correctiva], [kilometraje_ocurrencia], [gravedad], [causa_raiz], [costo_reparacion]) VALUES (23, 23, 23, 23, CAST(N'2024-07-29T00:00:00.000' AS DateTime), CAST(N'2024-07-30T00:00:00.000' AS DateTime), N'Fallo en reversa', N'No responde', N'Sensor fallido', N'Cambio de sensor', 41000, N'Grave', N'Corto circuito', CAST(120.00 AS Decimal(10, 2)))
INSERT [dbo].[HistoricoFallo] ([id_fallo], [id_bus], [id_conductor], [id_asignacion], [fecha_reporte], [fecha_solucion], [descripcion_fallo], [sintomas], [diagnostico], [accion_correctiva], [kilometraje_ocurrencia], [gravedad], [causa_raiz], [costo_reparacion]) VALUES (24, 24, 24, 24, CAST(N'2024-08-01T00:00:00.000' AS DateTime), CAST(N'2024-08-02T00:00:00.000' AS DateTime), N'Exceso de humo blanco', N'Al encender', N'Combustible contaminado', N'Purgado de sistema', 62000, N'Crítico', N'Diésel sucio', CAST(180.00 AS Decimal(10, 2)))
INSERT [dbo].[HistoricoFallo] ([id_fallo], [id_bus], [id_conductor], [id_asignacion], [fecha_reporte], [fecha_solucion], [descripcion_fallo], [sintomas], [diagnostico], [accion_correctiva], [kilometraje_ocurrencia], [gravedad], [causa_raiz], [costo_reparacion]) VALUES (25, 25, 25, 25, CAST(N'2024-08-03T00:00:00.000' AS DateTime), CAST(N'2024-08-04T00:00:00.000' AS DateTime), N'Ventanas no suben', N'Botón sin respuesta', N'Motor eléctrico dañado', N'Cambio de motor', 38000, N'Leve', N'Uso excesivo', CAST(90.00 AS Decimal(10, 2)))
INSERT [dbo].[HistoricoFallo] ([id_fallo], [id_bus], [id_conductor], [id_asignacion], [fecha_reporte], [fecha_solucion], [descripcion_fallo], [sintomas], [diagnostico], [accion_correctiva], [kilometraje_ocurrencia], [gravedad], [causa_raiz], [costo_reparacion]) VALUES (26, 26, 26, 26, CAST(N'2024-08-05T00:00:00.000' AS DateTime), CAST(N'2024-08-06T00:00:00.000' AS DateTime), N'Freno de mano flojo', N'No retiene', N'Cable flojo', N'Tensado de cable', 47000, N'Moderado', N'Mal uso', CAST(55.00 AS Decimal(10, 2)))
INSERT [dbo].[HistoricoFallo] ([id_fallo], [id_bus], [id_conductor], [id_asignacion], [fecha_reporte], [fecha_solucion], [descripcion_fallo], [sintomas], [diagnostico], [accion_correctiva], [kilometraje_ocurrencia], [gravedad], [causa_raiz], [costo_reparacion]) VALUES (27, 27, 27, 27, CAST(N'2024-08-07T00:00:00.000' AS DateTime), CAST(N'2024-08-08T00:00:00.000' AS DateTime), N'Ruidos en ejes', N'Al frenar', N'Eje desalineado', N'Alineación', 59000, N'Moderado', N'Impacto fuerte', CAST(150.00 AS Decimal(10, 2)))
INSERT [dbo].[HistoricoFallo] ([id_fallo], [id_bus], [id_conductor], [id_asignacion], [fecha_reporte], [fecha_solucion], [descripcion_fallo], [sintomas], [diagnostico], [accion_correctiva], [kilometraje_ocurrencia], [gravedad], [causa_raiz], [costo_reparacion]) VALUES (28, 28, 28, 28, CAST(N'2024-08-09T00:00:00.000' AS DateTime), CAST(N'2024-08-10T00:00:00.000' AS DateTime), N'Luz check encendida', N'Sin razón aparente', N'Fallo sensor motor', N'Revisión electrónica', 40000, N'Grave', N'Sensor sucio', CAST(110.00 AS Decimal(10, 2)))
INSERT [dbo].[HistoricoFallo] ([id_fallo], [id_bus], [id_conductor], [id_asignacion], [fecha_reporte], [fecha_solucion], [descripcion_fallo], [sintomas], [diagnostico], [accion_correctiva], [kilometraje_ocurrencia], [gravedad], [causa_raiz], [costo_reparacion]) VALUES (29, 29, 29, 29, CAST(N'2024-08-11T00:00:00.000' AS DateTime), CAST(N'2024-08-12T00:00:00.000' AS DateTime), N'Pérdida de potencia', N'No acelera bien', N'Filtro de aire sucio', N'Reemplazo', 43000, N'Leve', N'Mantenimiento pendiente', CAST(35.00 AS Decimal(10, 2)))
INSERT [dbo].[HistoricoFallo] ([id_fallo], [id_bus], [id_conductor], [id_asignacion], [fecha_reporte], [fecha_solucion], [descripcion_fallo], [sintomas], [diagnostico], [accion_correctiva], [kilometraje_ocurrencia], [gravedad], [causa_raiz], [costo_reparacion]) VALUES (30, 30, 30, 30, CAST(N'2024-08-13T00:00:00.000' AS DateTime), CAST(N'2024-08-14T00:00:00.000' AS DateTime), N'Puerta no cierra bien', N'Cierra con fuerza', N'Bisagra floja', N'Ajuste', 37000, N'Leve', N'Desgaste', CAST(25.00 AS Decimal(10, 2)))
INSERT [dbo].[HistoricoFallo] ([id_fallo], [id_bus], [id_conductor], [id_asignacion], [fecha_reporte], [fecha_solucion], [descripcion_fallo], [sintomas], [diagnostico], [accion_correctiva], [kilometraje_ocurrencia], [gravedad], [causa_raiz], [costo_reparacion]) VALUES (31, 31, 31, 31, CAST(N'2024-08-15T00:00:00.000' AS DateTime), CAST(N'2024-08-16T00:00:00.000' AS DateTime), N'Golpes en motor', N'Suena al arrancar', N'Pistón dañado', N'Cambio parcial', 64000, N'Crítico', N'Impacto interno', CAST(550.00 AS Decimal(10, 2)))
INSERT [dbo].[HistoricoFallo] ([id_fallo], [id_bus], [id_conductor], [id_asignacion], [fecha_reporte], [fecha_solucion], [descripcion_fallo], [sintomas], [diagnostico], [accion_correctiva], [kilometraje_ocurrencia], [gravedad], [causa_raiz], [costo_reparacion]) VALUES (32, 32, 32, 32, CAST(N'2024-08-17T00:00:00.000' AS DateTime), CAST(N'2024-08-18T00:00:00.000' AS DateTime), N'Ventilador no activa', N'Motor caliente', N'Sensor no responde', N'Reemplazo', 58000, N'Grave', N'Falla eléctrica', CAST(95.00 AS Decimal(10, 2)))
INSERT [dbo].[HistoricoFallo] ([id_fallo], [id_bus], [id_conductor], [id_asignacion], [fecha_reporte], [fecha_solucion], [descripcion_fallo], [sintomas], [diagnostico], [accion_correctiva], [kilometraje_ocurrencia], [gravedad], [causa_raiz], [costo_reparacion]) VALUES (33, 33, 33, 33, CAST(N'2024-08-19T00:00:00.000' AS DateTime), CAST(N'2024-08-20T00:00:00.000' AS DateTime), N'Faros sin intensidad', N'Poca luz', N'Cables viejos', N'Recableado', 46000, N'Moderado', N'Oxidación', CAST(85.00 AS Decimal(10, 2)))
INSERT [dbo].[HistoricoFallo] ([id_fallo], [id_bus], [id_conductor], [id_asignacion], [fecha_reporte], [fecha_solucion], [descripcion_fallo], [sintomas], [diagnostico], [accion_correctiva], [kilometraje_ocurrencia], [gravedad], [causa_raiz], [costo_reparacion]) VALUES (34, 34, 34, 34, CAST(N'2024-08-21T00:00:00.000' AS DateTime), CAST(N'2024-08-22T00:00:00.000' AS DateTime), N'Escape con fugas', N'Sonido raro', N'Junta deteriorada', N'Sustitución', 54000, N'Grave', N'Uso prolongado', CAST(130.00 AS Decimal(10, 2)))
INSERT [dbo].[HistoricoFallo] ([id_fallo], [id_bus], [id_conductor], [id_asignacion], [fecha_reporte], [fecha_solucion], [descripcion_fallo], [sintomas], [diagnostico], [accion_correctiva], [kilometraje_ocurrencia], [gravedad], [causa_raiz], [costo_reparacion]) VALUES (35, 35, 35, 35, CAST(N'2024-08-23T00:00:00.000' AS DateTime), CAST(N'2024-08-24T00:00:00.000' AS DateTime), N'Sistema de frenos ABS', N'Luz encendida', N'Sensor ABS fallido', N'Reemplazo', 57000, N'Crítico', N'Golpe', CAST(180.00 AS Decimal(10, 2)))
INSERT [dbo].[HistoricoFallo] ([id_fallo], [id_bus], [id_conductor], [id_asignacion], [fecha_reporte], [fecha_solucion], [descripcion_fallo], [sintomas], [diagnostico], [accion_correctiva], [kilometraje_ocurrencia], [gravedad], [causa_raiz], [costo_reparacion]) VALUES (36, 36, 36, 36, CAST(N'2024-08-25T00:00:00.000' AS DateTime), CAST(N'2024-08-26T00:00:00.000' AS DateTime), N'Alarma de cinturón', N'Pita sin razón', N'Sensor flojo', N'Revisión', 35000, N'Leve', N'Mal contacto', CAST(20.00 AS Decimal(10, 2)))
INSERT [dbo].[HistoricoFallo] ([id_fallo], [id_bus], [id_conductor], [id_asignacion], [fecha_reporte], [fecha_solucion], [descripcion_fallo], [sintomas], [diagnostico], [accion_correctiva], [kilometraje_ocurrencia], [gravedad], [causa_raiz], [costo_reparacion]) VALUES (37, 37, 37, 37, CAST(N'2024-08-27T00:00:00.000' AS DateTime), CAST(N'2024-08-28T00:00:00.000' AS DateTime), N'Luz testigo de batería', N'Encendida permanente', N'Alternador débil', N'Revisión general', 60000, N'Grave', N'Falla interna', CAST(145.00 AS Decimal(10, 2)))
INSERT [dbo].[HistoricoFallo] ([id_fallo], [id_bus], [id_conductor], [id_asignacion], [fecha_reporte], [fecha_solucion], [descripcion_fallo], [sintomas], [diagnostico], [accion_correctiva], [kilometraje_ocurrencia], [gravedad], [causa_raiz], [costo_reparacion]) VALUES (38, 38, 38, 38, CAST(N'2024-08-29T00:00:00.000' AS DateTime), CAST(N'2024-08-30T00:00:00.000' AS DateTime), N'Chirrido de correa', N'Al encender', N'Correa suelta', N'Tensado', 42000, N'Leve', N'Desgaste natural', CAST(25.00 AS Decimal(10, 2)))
INSERT [dbo].[HistoricoFallo] ([id_fallo], [id_bus], [id_conductor], [id_asignacion], [fecha_reporte], [fecha_solucion], [descripcion_fallo], [sintomas], [diagnostico], [accion_correctiva], [kilometraje_ocurrencia], [gravedad], [causa_raiz], [costo_reparacion]) VALUES (39, 39, 39, 39, CAST(N'2024-08-31T00:00:00.000' AS DateTime), CAST(N'2024-09-01T00:00:00.000' AS DateTime), N'Inestabilidad al frenar', N'Se va hacia un lado', N'Presión desigual', N'Revisión completa', 51000, N'Moderado', N'Mal ajuste', CAST(70.00 AS Decimal(10, 2)))
INSERT [dbo].[HistoricoFallo] ([id_fallo], [id_bus], [id_conductor], [id_asignacion], [fecha_reporte], [fecha_solucion], [descripcion_fallo], [sintomas], [diagnostico], [accion_correctiva], [kilometraje_ocurrencia], [gravedad], [causa_raiz], [costo_reparacion]) VALUES (40, 40, 40, 40, CAST(N'2024-09-02T00:00:00.000' AS DateTime), CAST(N'2024-09-03T00:00:00.000' AS DateTime), N'Sensor velocidad errático', N'Marcación inestable', N'Sensor dañado', N'Cambio de sensor', 45000, N'Moderado', N'Golpe', CAST(100.00 AS Decimal(10, 2)))
SET IDENTITY_INSERT [dbo].[HistoricoFallo] OFF
GO
SET IDENTITY_INSERT [dbo].[InspeccionDiaria] ON 

INSERT [dbo].[InspeccionDiaria] ([id_inspeccion], [id_bus], [id_conductor], [fecha_inspeccion], [hora_inspeccion], [kilometraje], [nivel_combustible], [estado_neumaticos], [nivel_aceite], [nivel_refrigerante], [nivel_fluido_frenos], [luces_funcionando], [frenos_operativos], [sistema_electrico_ok], [observaciones], [aprobado]) VALUES (1, 1, 1, CAST(N'2024-07-01' AS Date), CAST(N'07:15:00' AS Time), 10500, N'Alto', N'Bueno', N'Medio', N'Alto', N'Medio', N'1', N'1', N'1', N'Sin novedades.', N'1')
INSERT [dbo].[InspeccionDiaria] ([id_inspeccion], [id_bus], [id_conductor], [fecha_inspeccion], [hora_inspeccion], [kilometraje], [nivel_combustible], [estado_neumaticos], [nivel_aceite], [nivel_refrigerante], [nivel_fluido_frenos], [luces_funcionando], [frenos_operativos], [sistema_electrico_ok], [observaciones], [aprobado]) VALUES (2, 2, 2, CAST(N'2024-07-01' AS Date), CAST(N'07:20:00' AS Time), 15800, N'Medio', N'Regular', N'Medio', N'Medio', N'Bajo', N'1', N'1', N'1', N'Leve desgaste en neumáticos.', N'1')
INSERT [dbo].[InspeccionDiaria] ([id_inspeccion], [id_bus], [id_conductor], [fecha_inspeccion], [hora_inspeccion], [kilometraje], [nivel_combustible], [estado_neumaticos], [nivel_aceite], [nivel_refrigerante], [nivel_fluido_frenos], [luces_funcionando], [frenos_operativos], [sistema_electrico_ok], [observaciones], [aprobado]) VALUES (3, 3, 3, CAST(N'2024-07-01' AS Date), CAST(N'07:25:00' AS Time), 20500, N'Bajo', N'Bueno', N'Bajo', N'Medio', N'Medio', N'0', N'1', N'1', N'Falta aceite.', N'0')
INSERT [dbo].[InspeccionDiaria] ([id_inspeccion], [id_bus], [id_conductor], [fecha_inspeccion], [hora_inspeccion], [kilometraje], [nivel_combustible], [estado_neumaticos], [nivel_aceite], [nivel_refrigerante], [nivel_fluido_frenos], [luces_funcionando], [frenos_operativos], [sistema_electrico_ok], [observaciones], [aprobado]) VALUES (4, 4, 4, CAST(N'2024-07-01' AS Date), CAST(N'07:30:00' AS Time), 8000, N'Alto', N'Bueno', N'Alto', N'Alto', N'Alto', N'1', N'1', N'1', N'Todo en orden.', N'1')
INSERT [dbo].[InspeccionDiaria] ([id_inspeccion], [id_bus], [id_conductor], [fecha_inspeccion], [hora_inspeccion], [kilometraje], [nivel_combustible], [estado_neumaticos], [nivel_aceite], [nivel_refrigerante], [nivel_fluido_frenos], [luces_funcionando], [frenos_operativos], [sistema_electrico_ok], [observaciones], [aprobado]) VALUES (5, 5, 5, CAST(N'2024-07-02' AS Date), CAST(N'07:10:00' AS Time), 9500, N'Medio', N'Bueno', N'Medio', N'Medio', N'Medio', N'1', N'0', N'1', N'Frenos con respuesta tardía.', N'0')
INSERT [dbo].[InspeccionDiaria] ([id_inspeccion], [id_bus], [id_conductor], [fecha_inspeccion], [hora_inspeccion], [kilometraje], [nivel_combustible], [estado_neumaticos], [nivel_aceite], [nivel_refrigerante], [nivel_fluido_frenos], [luces_funcionando], [frenos_operativos], [sistema_electrico_ok], [observaciones], [aprobado]) VALUES (6, 6, 6, CAST(N'2024-07-02' AS Date), CAST(N'07:15:00' AS Time), 15000, N'Alto', N'Bueno', N'Alto', N'Medio', N'Alto', N'1', N'1', N'1', N'Sin observaciones.', N'1')
INSERT [dbo].[InspeccionDiaria] ([id_inspeccion], [id_bus], [id_conductor], [fecha_inspeccion], [hora_inspeccion], [kilometraje], [nivel_combustible], [estado_neumaticos], [nivel_aceite], [nivel_refrigerante], [nivel_fluido_frenos], [luces_funcionando], [frenos_operativos], [sistema_electrico_ok], [observaciones], [aprobado]) VALUES (7, 7, 7, CAST(N'2024-07-02' AS Date), CAST(N'07:20:00' AS Time), 17800, N'Bajo', N'Regular', N'Bajo', N'Bajo', N'Bajo', N'0', N'0', N'0', N'Varios niveles bajos.', N'0')
INSERT [dbo].[InspeccionDiaria] ([id_inspeccion], [id_bus], [id_conductor], [fecha_inspeccion], [hora_inspeccion], [kilometraje], [nivel_combustible], [estado_neumaticos], [nivel_aceite], [nivel_refrigerante], [nivel_fluido_frenos], [luces_funcionando], [frenos_operativos], [sistema_electrico_ok], [observaciones], [aprobado]) VALUES (8, 8, 8, CAST(N'2024-07-02' AS Date), CAST(N'07:25:00' AS Time), 20000, N'Medio', N'Bueno', N'Medio', N'Alto', N'Medio', N'1', N'1', N'1', N'Revisión completa sin fallas.', N'1')
INSERT [dbo].[InspeccionDiaria] ([id_inspeccion], [id_bus], [id_conductor], [fecha_inspeccion], [hora_inspeccion], [kilometraje], [nivel_combustible], [estado_neumaticos], [nivel_aceite], [nivel_refrigerante], [nivel_fluido_frenos], [luces_funcionando], [frenos_operativos], [sistema_electrico_ok], [observaciones], [aprobado]) VALUES (9, 9, 9, CAST(N'2024-07-03' AS Date), CAST(N'07:30:00' AS Time), 21000, N'Alto', N'Bueno', N'Alto', N'Alto', N'Medio', N'1', N'1', N'1', N'Sin novedades.', N'1')
INSERT [dbo].[InspeccionDiaria] ([id_inspeccion], [id_bus], [id_conductor], [fecha_inspeccion], [hora_inspeccion], [kilometraje], [nivel_combustible], [estado_neumaticos], [nivel_aceite], [nivel_refrigerante], [nivel_fluido_frenos], [luces_funcionando], [frenos_operativos], [sistema_electrico_ok], [observaciones], [aprobado]) VALUES (10, 10, 10, CAST(N'2024-07-03' AS Date), CAST(N'07:10:00' AS Time), 16000, N'Medio', N'Regular', N'Medio', N'Medio', N'Bajo', N'1', N'1', N'1', N'Revisión visual OK.', N'1')
INSERT [dbo].[InspeccionDiaria] ([id_inspeccion], [id_bus], [id_conductor], [fecha_inspeccion], [hora_inspeccion], [kilometraje], [nivel_combustible], [estado_neumaticos], [nivel_aceite], [nivel_refrigerante], [nivel_fluido_frenos], [luces_funcionando], [frenos_operativos], [sistema_electrico_ok], [observaciones], [aprobado]) VALUES (11, 11, 11, CAST(N'2024-07-03' AS Date), CAST(N'07:15:00' AS Time), 14300, N'Alto', N'Bueno', N'Alto', N'Alto', N'Alto', N'1', N'1', N'1', N'Todo correcto.', N'1')
INSERT [dbo].[InspeccionDiaria] ([id_inspeccion], [id_bus], [id_conductor], [fecha_inspeccion], [hora_inspeccion], [kilometraje], [nivel_combustible], [estado_neumaticos], [nivel_aceite], [nivel_refrigerante], [nivel_fluido_frenos], [luces_funcionando], [frenos_operativos], [sistema_electrico_ok], [observaciones], [aprobado]) VALUES (12, 12, 12, CAST(N'2024-07-03' AS Date), CAST(N'07:20:00' AS Time), 12500, N'Medio', N'Bueno', N'Medio', N'Alto', N'Medio', N'1', N'1', N'1', N'Sin observaciones.', N'1')
INSERT [dbo].[InspeccionDiaria] ([id_inspeccion], [id_bus], [id_conductor], [fecha_inspeccion], [hora_inspeccion], [kilometraje], [nivel_combustible], [estado_neumaticos], [nivel_aceite], [nivel_refrigerante], [nivel_fluido_frenos], [luces_funcionando], [frenos_operativos], [sistema_electrico_ok], [observaciones], [aprobado]) VALUES (13, 13, 13, CAST(N'2024-07-03' AS Date), CAST(N'07:25:00' AS Time), 17200, N'Bajo', N'Malo', N'Bajo', N'Bajo', N'Bajo', N'0', N'0', N'0', N'Condiciones críticas.', N'0')
INSERT [dbo].[InspeccionDiaria] ([id_inspeccion], [id_bus], [id_conductor], [fecha_inspeccion], [hora_inspeccion], [kilometraje], [nivel_combustible], [estado_neumaticos], [nivel_aceite], [nivel_refrigerante], [nivel_fluido_frenos], [luces_funcionando], [frenos_operativos], [sistema_electrico_ok], [observaciones], [aprobado]) VALUES (14, 14, 14, CAST(N'2024-07-03' AS Date), CAST(N'07:30:00' AS Time), 19600, N'Medio', N'Bueno', N'Medio', N'Medio', N'Medio', N'1', N'1', N'1', N'Todo funcional.', N'1')
INSERT [dbo].[InspeccionDiaria] ([id_inspeccion], [id_bus], [id_conductor], [fecha_inspeccion], [hora_inspeccion], [kilometraje], [nivel_combustible], [estado_neumaticos], [nivel_aceite], [nivel_refrigerante], [nivel_fluido_frenos], [luces_funcionando], [frenos_operativos], [sistema_electrico_ok], [observaciones], [aprobado]) VALUES (15, 15, 15, CAST(N'2024-07-04' AS Date), CAST(N'07:10:00' AS Time), 8300, N'Alto', N'Bueno', N'Alto', N'Alto', N'Alto', N'1', N'1', N'1', N'Inspección satisfactoria.', N'1')
INSERT [dbo].[InspeccionDiaria] ([id_inspeccion], [id_bus], [id_conductor], [fecha_inspeccion], [hora_inspeccion], [kilometraje], [nivel_combustible], [estado_neumaticos], [nivel_aceite], [nivel_refrigerante], [nivel_fluido_frenos], [luces_funcionando], [frenos_operativos], [sistema_electrico_ok], [observaciones], [aprobado]) VALUES (16, 16, 16, CAST(N'2024-07-04' AS Date), CAST(N'07:15:00' AS Time), 9100, N'Medio', N'Bueno', N'Medio', N'Alto', N'Medio', N'1', N'1', N'1', N'Observación menor.', N'1')
INSERT [dbo].[InspeccionDiaria] ([id_inspeccion], [id_bus], [id_conductor], [fecha_inspeccion], [hora_inspeccion], [kilometraje], [nivel_combustible], [estado_neumaticos], [nivel_aceite], [nivel_refrigerante], [nivel_fluido_frenos], [luces_funcionando], [frenos_operativos], [sistema_electrico_ok], [observaciones], [aprobado]) VALUES (17, 17, 17, CAST(N'2024-07-04' AS Date), CAST(N'07:20:00' AS Time), 11000, N'Bajo', N'Regular', N'Bajo', N'Medio', N'Medio', N'0', N'1', N'1', N'Luz testigo encendida.', N'0')
INSERT [dbo].[InspeccionDiaria] ([id_inspeccion], [id_bus], [id_conductor], [fecha_inspeccion], [hora_inspeccion], [kilometraje], [nivel_combustible], [estado_neumaticos], [nivel_aceite], [nivel_refrigerante], [nivel_fluido_frenos], [luces_funcionando], [frenos_operativos], [sistema_electrico_ok], [observaciones], [aprobado]) VALUES (18, 18, 18, CAST(N'2024-07-04' AS Date), CAST(N'07:25:00' AS Time), 12400, N'Medio', N'Bueno', N'Medio', N'Medio', N'Medio', N'1', N'1', N'1', N'Todo en regla.', N'1')
INSERT [dbo].[InspeccionDiaria] ([id_inspeccion], [id_bus], [id_conductor], [fecha_inspeccion], [hora_inspeccion], [kilometraje], [nivel_combustible], [estado_neumaticos], [nivel_aceite], [nivel_refrigerante], [nivel_fluido_frenos], [luces_funcionando], [frenos_operativos], [sistema_electrico_ok], [observaciones], [aprobado]) VALUES (19, 19, 19, CAST(N'2024-07-04' AS Date), CAST(N'07:30:00' AS Time), 13900, N'Alto', N'Bueno', N'Alto', N'Alto', N'Alto', N'1', N'1', N'1', N'Sistema verificado.', N'1')
INSERT [dbo].[InspeccionDiaria] ([id_inspeccion], [id_bus], [id_conductor], [fecha_inspeccion], [hora_inspeccion], [kilometraje], [nivel_combustible], [estado_neumaticos], [nivel_aceite], [nivel_refrigerante], [nivel_fluido_frenos], [luces_funcionando], [frenos_operativos], [sistema_electrico_ok], [observaciones], [aprobado]) VALUES (20, 20, 20, CAST(N'2024-07-05' AS Date), CAST(N'07:10:00' AS Time), 15300, N'Medio', N'Bueno', N'Medio', N'Alto', N'Medio', N'1', N'1', N'1', N'OK.', N'1')
INSERT [dbo].[InspeccionDiaria] ([id_inspeccion], [id_bus], [id_conductor], [fecha_inspeccion], [hora_inspeccion], [kilometraje], [nivel_combustible], [estado_neumaticos], [nivel_aceite], [nivel_refrigerante], [nivel_fluido_frenos], [luces_funcionando], [frenos_operativos], [sistema_electrico_ok], [observaciones], [aprobado]) VALUES (21, 21, 21, CAST(N'2024-07-05' AS Date), CAST(N'07:15:00' AS Time), 16000, N'Alto', N'Bueno', N'Alto', N'Alto', N'Alto', N'1', N'1', N'1', N'Todo conforme.', N'1')
INSERT [dbo].[InspeccionDiaria] ([id_inspeccion], [id_bus], [id_conductor], [fecha_inspeccion], [hora_inspeccion], [kilometraje], [nivel_combustible], [estado_neumaticos], [nivel_aceite], [nivel_refrigerante], [nivel_fluido_frenos], [luces_funcionando], [frenos_operativos], [sistema_electrico_ok], [observaciones], [aprobado]) VALUES (22, 22, 22, CAST(N'2024-07-05' AS Date), CAST(N'07:20:00' AS Time), 17500, N'Medio', N'Regular', N'Medio', N'Medio', N'Medio', N'1', N'1', N'1', N'Sin observaciones.', N'1')
INSERT [dbo].[InspeccionDiaria] ([id_inspeccion], [id_bus], [id_conductor], [fecha_inspeccion], [hora_inspeccion], [kilometraje], [nivel_combustible], [estado_neumaticos], [nivel_aceite], [nivel_refrigerante], [nivel_fluido_frenos], [luces_funcionando], [frenos_operativos], [sistema_electrico_ok], [observaciones], [aprobado]) VALUES (23, 23, 23, CAST(N'2024-07-05' AS Date), CAST(N'07:25:00' AS Time), 19000, N'Bajo', N'Malo', N'Bajo', N'Bajo', N'Bajo', N'0', N'0', N'0', N'Revisión urgente requerida.', N'0')
INSERT [dbo].[InspeccionDiaria] ([id_inspeccion], [id_bus], [id_conductor], [fecha_inspeccion], [hora_inspeccion], [kilometraje], [nivel_combustible], [estado_neumaticos], [nivel_aceite], [nivel_refrigerante], [nivel_fluido_frenos], [luces_funcionando], [frenos_operativos], [sistema_electrico_ok], [observaciones], [aprobado]) VALUES (24, 24, 24, CAST(N'2024-07-05' AS Date), CAST(N'07:30:00' AS Time), 20400, N'Medio', N'Bueno', N'Medio', N'Medio', N'Medio', N'1', N'1', N'1', N'Sistema revisado.', N'1')
INSERT [dbo].[InspeccionDiaria] ([id_inspeccion], [id_bus], [id_conductor], [fecha_inspeccion], [hora_inspeccion], [kilometraje], [nivel_combustible], [estado_neumaticos], [nivel_aceite], [nivel_refrigerante], [nivel_fluido_frenos], [luces_funcionando], [frenos_operativos], [sistema_electrico_ok], [observaciones], [aprobado]) VALUES (25, 25, 25, CAST(N'2024-07-06' AS Date), CAST(N'07:10:00' AS Time), 21900, N'Alto', N'Bueno', N'Alto', N'Alto', N'Alto', N'1', N'1', N'1', N'Correcto.', N'1')
INSERT [dbo].[InspeccionDiaria] ([id_inspeccion], [id_bus], [id_conductor], [fecha_inspeccion], [hora_inspeccion], [kilometraje], [nivel_combustible], [estado_neumaticos], [nivel_aceite], [nivel_refrigerante], [nivel_fluido_frenos], [luces_funcionando], [frenos_operativos], [sistema_electrico_ok], [observaciones], [aprobado]) VALUES (26, 26, 26, CAST(N'2024-07-06' AS Date), CAST(N'07:15:00' AS Time), 23300, N'Medio', N'Bueno', N'Medio', N'Alto', N'Medio', N'1', N'1', N'1', N'Todo estable.', N'1')
INSERT [dbo].[InspeccionDiaria] ([id_inspeccion], [id_bus], [id_conductor], [fecha_inspeccion], [hora_inspeccion], [kilometraje], [nivel_combustible], [estado_neumaticos], [nivel_aceite], [nivel_refrigerante], [nivel_fluido_frenos], [luces_funcionando], [frenos_operativos], [sistema_electrico_ok], [observaciones], [aprobado]) VALUES (27, 27, 27, CAST(N'2024-07-06' AS Date), CAST(N'07:20:00' AS Time), 24700, N'Bajo', N'Regular', N'Bajo', N'Bajo', N'Bajo', N'0', N'0', N'0', N'Fallas detectadas.', N'0')
INSERT [dbo].[InspeccionDiaria] ([id_inspeccion], [id_bus], [id_conductor], [fecha_inspeccion], [hora_inspeccion], [kilometraje], [nivel_combustible], [estado_neumaticos], [nivel_aceite], [nivel_refrigerante], [nivel_fluido_frenos], [luces_funcionando], [frenos_operativos], [sistema_electrico_ok], [observaciones], [aprobado]) VALUES (28, 28, 28, CAST(N'2024-07-06' AS Date), CAST(N'07:25:00' AS Time), 26000, N'Medio', N'Bueno', N'Medio', N'Medio', N'Medio', N'1', N'1', N'1', N'Sin fallas.', N'1')
INSERT [dbo].[InspeccionDiaria] ([id_inspeccion], [id_bus], [id_conductor], [fecha_inspeccion], [hora_inspeccion], [kilometraje], [nivel_combustible], [estado_neumaticos], [nivel_aceite], [nivel_refrigerante], [nivel_fluido_frenos], [luces_funcionando], [frenos_operativos], [sistema_electrico_ok], [observaciones], [aprobado]) VALUES (29, 29, 29, CAST(N'2024-07-06' AS Date), CAST(N'07:30:00' AS Time), 27400, N'Alto', N'Bueno', N'Alto', N'Alto', N'Alto', N'1', N'1', N'1', N'Perfecto estado.', N'1')
INSERT [dbo].[InspeccionDiaria] ([id_inspeccion], [id_bus], [id_conductor], [fecha_inspeccion], [hora_inspeccion], [kilometraje], [nivel_combustible], [estado_neumaticos], [nivel_aceite], [nivel_refrigerante], [nivel_fluido_frenos], [luces_funcionando], [frenos_operativos], [sistema_electrico_ok], [observaciones], [aprobado]) VALUES (30, 30, 30, CAST(N'2024-07-07' AS Date), CAST(N'07:10:00' AS Time), 28800, N'Medio', N'Bueno', N'Medio', N'Alto', N'Medio', N'1', N'1', N'1', N'Todo funcionando.', N'1')
INSERT [dbo].[InspeccionDiaria] ([id_inspeccion], [id_bus], [id_conductor], [fecha_inspeccion], [hora_inspeccion], [kilometraje], [nivel_combustible], [estado_neumaticos], [nivel_aceite], [nivel_refrigerante], [nivel_fluido_frenos], [luces_funcionando], [frenos_operativos], [sistema_electrico_ok], [observaciones], [aprobado]) VALUES (31, 31, 31, CAST(N'2024-07-07' AS Date), CAST(N'07:15:00' AS Time), 30000, N'Alto', N'Bueno', N'Alto', N'Alto', N'Alto', N'1', N'1', N'1', N'Revisión exitosa.', N'1')
INSERT [dbo].[InspeccionDiaria] ([id_inspeccion], [id_bus], [id_conductor], [fecha_inspeccion], [hora_inspeccion], [kilometraje], [nivel_combustible], [estado_neumaticos], [nivel_aceite], [nivel_refrigerante], [nivel_fluido_frenos], [luces_funcionando], [frenos_operativos], [sistema_electrico_ok], [observaciones], [aprobado]) VALUES (32, 32, 32, CAST(N'2024-07-07' AS Date), CAST(N'07:20:00' AS Time), 31500, N'Medio', N'Regular', N'Medio', N'Medio', N'Medio', N'1', N'1', N'1', N'Condiciones aceptables.', N'1')
INSERT [dbo].[InspeccionDiaria] ([id_inspeccion], [id_bus], [id_conductor], [fecha_inspeccion], [hora_inspeccion], [kilometraje], [nivel_combustible], [estado_neumaticos], [nivel_aceite], [nivel_refrigerante], [nivel_fluido_frenos], [luces_funcionando], [frenos_operativos], [sistema_electrico_ok], [observaciones], [aprobado]) VALUES (33, 33, 33, CAST(N'2024-07-07' AS Date), CAST(N'07:25:00' AS Time), 32800, N'Bajo', N'Malo', N'Bajo', N'Bajo', N'Bajo', N'0', N'0', N'0', N'Revisión fallida.', N'0')
INSERT [dbo].[InspeccionDiaria] ([id_inspeccion], [id_bus], [id_conductor], [fecha_inspeccion], [hora_inspeccion], [kilometraje], [nivel_combustible], [estado_neumaticos], [nivel_aceite], [nivel_refrigerante], [nivel_fluido_frenos], [luces_funcionando], [frenos_operativos], [sistema_electrico_ok], [observaciones], [aprobado]) VALUES (34, 34, 34, CAST(N'2024-07-07' AS Date), CAST(N'07:30:00' AS Time), 34000, N'Medio', N'Bueno', N'Medio', N'Medio', N'Medio', N'1', N'1', N'1', N'OK.', N'1')
INSERT [dbo].[InspeccionDiaria] ([id_inspeccion], [id_bus], [id_conductor], [fecha_inspeccion], [hora_inspeccion], [kilometraje], [nivel_combustible], [estado_neumaticos], [nivel_aceite], [nivel_refrigerante], [nivel_fluido_frenos], [luces_funcionando], [frenos_operativos], [sistema_electrico_ok], [observaciones], [aprobado]) VALUES (35, 35, 35, CAST(N'2024-07-08' AS Date), CAST(N'07:10:00' AS Time), 35500, N'Alto', N'Bueno', N'Alto', N'Alto', N'Alto', N'1', N'1', N'1', N'Todo excelente.', N'1')
INSERT [dbo].[InspeccionDiaria] ([id_inspeccion], [id_bus], [id_conductor], [fecha_inspeccion], [hora_inspeccion], [kilometraje], [nivel_combustible], [estado_neumaticos], [nivel_aceite], [nivel_refrigerante], [nivel_fluido_frenos], [luces_funcionando], [frenos_operativos], [sistema_electrico_ok], [observaciones], [aprobado]) VALUES (36, 36, 36, CAST(N'2024-07-08' AS Date), CAST(N'07:15:00' AS Time), 36900, N'Medio', N'Bueno', N'Medio', N'Alto', N'Medio', N'1', N'1', N'1', N'Sin incidentes.', N'1')
INSERT [dbo].[InspeccionDiaria] ([id_inspeccion], [id_bus], [id_conductor], [fecha_inspeccion], [hora_inspeccion], [kilometraje], [nivel_combustible], [estado_neumaticos], [nivel_aceite], [nivel_refrigerante], [nivel_fluido_frenos], [luces_funcionando], [frenos_operativos], [sistema_electrico_ok], [observaciones], [aprobado]) VALUES (37, 37, 37, CAST(N'2024-07-08' AS Date), CAST(N'07:20:00' AS Time), 38300, N'Bajo', N'Regular', N'Bajo', N'Bajo', N'Bajo', N'0', N'0', N'0', N'Revisión negativa.', N'0')
INSERT [dbo].[InspeccionDiaria] ([id_inspeccion], [id_bus], [id_conductor], [fecha_inspeccion], [hora_inspeccion], [kilometraje], [nivel_combustible], [estado_neumaticos], [nivel_aceite], [nivel_refrigerante], [nivel_fluido_frenos], [luces_funcionando], [frenos_operativos], [sistema_electrico_ok], [observaciones], [aprobado]) VALUES (38, 38, 38, CAST(N'2024-07-08' AS Date), CAST(N'07:25:00' AS Time), 39700, N'Medio', N'Bueno', N'Medio', N'Medio', N'Medio', N'1', N'1', N'1', N'Inspección aprobada.', N'1')
INSERT [dbo].[InspeccionDiaria] ([id_inspeccion], [id_bus], [id_conductor], [fecha_inspeccion], [hora_inspeccion], [kilometraje], [nivel_combustible], [estado_neumaticos], [nivel_aceite], [nivel_refrigerante], [nivel_fluido_frenos], [luces_funcionando], [frenos_operativos], [sistema_electrico_ok], [observaciones], [aprobado]) VALUES (39, 39, 39, CAST(N'2024-07-08' AS Date), CAST(N'07:30:00' AS Time), 41000, N'Alto', N'Bueno', N'Alto', N'Alto', N'Alto', N'1', N'1', N'1', N'Todo bien.', N'1')
INSERT [dbo].[InspeccionDiaria] ([id_inspeccion], [id_bus], [id_conductor], [fecha_inspeccion], [hora_inspeccion], [kilometraje], [nivel_combustible], [estado_neumaticos], [nivel_aceite], [nivel_refrigerante], [nivel_fluido_frenos], [luces_funcionando], [frenos_operativos], [sistema_electrico_ok], [observaciones], [aprobado]) VALUES (40, 40, 40, CAST(N'2024-07-09' AS Date), CAST(N'07:10:00' AS Time), 42300, N'Medio', N'Bueno', N'Medio', N'Alto', N'Medio', N'1', N'1', N'1', N'Sin novedades.', N'1')
SET IDENTITY_INSERT [dbo].[InspeccionDiaria] OFF
GO
SET IDENTITY_INSERT [dbo].[ItemChecklist] ON 

INSERT [dbo].[ItemChecklist] ([id_item], [id_tipo], [codigo_item], [descripcion], [es_critico], [orden_ejecucion], [parametro_aceptacion]) VALUES (1, 1, N'CA001', N'Verificar nivel de aceite antes del drenaje', N'1', 1, N'Nivel aceptable antes del cambio')
INSERT [dbo].[ItemChecklist] ([id_item], [id_tipo], [codigo_item], [descripcion], [es_critico], [orden_ejecucion], [parametro_aceptacion]) VALUES (2, 1, N'CA002', N'Drenar aceite usado completamente', N'1', 2, N'Sin residuos visibles')
INSERT [dbo].[ItemChecklist] ([id_item], [id_tipo], [codigo_item], [descripcion], [es_critico], [orden_ejecucion], [parametro_aceptacion]) VALUES (3, 1, N'CA003', N'Cambiar filtro de aceite', N'0', 3, N'Filtro nuevo y correcto')
INSERT [dbo].[ItemChecklist] ([id_item], [id_tipo], [codigo_item], [descripcion], [es_critico], [orden_ejecucion], [parametro_aceptacion]) VALUES (4, 1, N'CA004', N'Llenar aceite nuevo según especificaciones', N'1', 4, N'Litros y viscosidad recomendados')
INSERT [dbo].[ItemChecklist] ([id_item], [id_tipo], [codigo_item], [descripcion], [es_critico], [orden_ejecucion], [parametro_aceptacion]) VALUES (5, 2, N'RF001', N'Inspeccionar desgaste de pastillas', N'1', 1, N'Menos de 5mm = cambio')
INSERT [dbo].[ItemChecklist] ([id_item], [id_tipo], [codigo_item], [descripcion], [es_critico], [orden_ejecucion], [parametro_aceptacion]) VALUES (6, 2, N'RF002', N'Revisar discos de freno', N'1', 2, N'Sin fisuras ni desgaste extremo')
INSERT [dbo].[ItemChecklist] ([id_item], [id_tipo], [codigo_item], [descripcion], [es_critico], [orden_ejecucion], [parametro_aceptacion]) VALUES (7, 2, N'RF003', N'Verificar nivel de líquido de freno', N'1', 3, N'Entre MIN y MAX')
INSERT [dbo].[ItemChecklist] ([id_item], [id_tipo], [codigo_item], [descripcion], [es_critico], [orden_ejecucion], [parametro_aceptacion]) VALUES (8, 2, N'RF004', N'Prueba de frenado en pista', N'1', 4, N'Respuesta inmediata')
INSERT [dbo].[ItemChecklist] ([id_item], [id_tipo], [codigo_item], [descripcion], [es_critico], [orden_ejecucion], [parametro_aceptacion]) VALUES (9, 3, N'FA001', N'Retirar filtro de aire antiguo', N'0', 1, N'Acceso sin daño a la caja')
INSERT [dbo].[ItemChecklist] ([id_item], [id_tipo], [codigo_item], [descripcion], [es_critico], [orden_ejecucion], [parametro_aceptacion]) VALUES (10, 3, N'FA002', N'Inspeccionar caja del filtro', N'0', 2, N'Libre de suciedad')
INSERT [dbo].[ItemChecklist] ([id_item], [id_tipo], [codigo_item], [descripcion], [es_critico], [orden_ejecucion], [parametro_aceptacion]) VALUES (11, 3, N'FA003', N'Instalar nuevo filtro correctamente', N'1', 3, N'Encaje y orientación adecuados')
INSERT [dbo].[ItemChecklist] ([id_item], [id_tipo], [codigo_item], [descripcion], [es_critico], [orden_ejecucion], [parametro_aceptacion]) VALUES (12, 3, N'FA004', N'Prueba de flujo de aire', N'0', 4, N'Sin obstrucción')
INSERT [dbo].[ItemChecklist] ([id_item], [id_tipo], [codigo_item], [descripcion], [es_critico], [orden_ejecucion], [parametro_aceptacion]) VALUES (13, 4, N'CB001', N'Desmontar bujías viejas', N'1', 1, N'Sin daño en roscas')
INSERT [dbo].[ItemChecklist] ([id_item], [id_tipo], [codigo_item], [descripcion], [es_critico], [orden_ejecucion], [parametro_aceptacion]) VALUES (14, 4, N'CB002', N'Limpiar asiento de bujías', N'0', 2, N'Sin residuos')
INSERT [dbo].[ItemChecklist] ([id_item], [id_tipo], [codigo_item], [descripcion], [es_critico], [orden_ejecucion], [parametro_aceptacion]) VALUES (15, 4, N'CB003', N'Instalar bujías nuevas', N'1', 3, N'Torque correcto')
INSERT [dbo].[ItemChecklist] ([id_item], [id_tipo], [codigo_item], [descripcion], [es_critico], [orden_ejecucion], [parametro_aceptacion]) VALUES (16, 4, N'CB004', N'Revisión de chispa', N'1', 4, N'Encendido inmediato')
INSERT [dbo].[ItemChecklist] ([id_item], [id_tipo], [codigo_item], [descripcion], [es_critico], [orden_ejecucion], [parametro_aceptacion]) VALUES (17, 5, N'IS001', N'Verificar amortiguadores', N'1', 1, N'Sin fugas ni rebotes')
INSERT [dbo].[ItemChecklist] ([id_item], [id_tipo], [codigo_item], [descripcion], [es_critico], [orden_ejecucion], [parametro_aceptacion]) VALUES (18, 5, N'IS002', N'Inspeccionar brazos y rótulas', N'1', 2, N'Sin juego ni grietas')
INSERT [dbo].[ItemChecklist] ([id_item], [id_tipo], [codigo_item], [descripcion], [es_critico], [orden_ejecucion], [parametro_aceptacion]) VALUES (19, 5, N'IS003', N'Revisar topes y bujes', N'0', 3, N'Sin desgaste')
INSERT [dbo].[ItemChecklist] ([id_item], [id_tipo], [codigo_item], [descripcion], [es_critico], [orden_ejecucion], [parametro_aceptacion]) VALUES (20, 5, N'IS004', N'Prueba de rebote en marcha', N'1', 4, N'Rebote estable')
INSERT [dbo].[ItemChecklist] ([id_item], [id_tipo], [codigo_item], [descripcion], [es_critico], [orden_ejecucion], [parametro_aceptacion]) VALUES (21, 6, N'RL001', N'Probar luces delanteras', N'1', 1, N'Alto y bajo funcionando')
INSERT [dbo].[ItemChecklist] ([id_item], [id_tipo], [codigo_item], [descripcion], [es_critico], [orden_ejecucion], [parametro_aceptacion]) VALUES (22, 6, N'RL002', N'Probar luces traseras', N'1', 2, N'Funcionan al frenar')
INSERT [dbo].[ItemChecklist] ([id_item], [id_tipo], [codigo_item], [descripcion], [es_critico], [orden_ejecucion], [parametro_aceptacion]) VALUES (23, 6, N'RL003', N'Probar direccionales', N'0', 3, N'Ámbar y sincronizadas')
INSERT [dbo].[ItemChecklist] ([id_item], [id_tipo], [codigo_item], [descripcion], [es_critico], [orden_ejecucion], [parametro_aceptacion]) VALUES (24, 6, N'RL004', N'Probar luz de retroceso', N'0', 4, N'Encendido al poner reversa')
INSERT [dbo].[ItemChecklist] ([id_item], [id_tipo], [codigo_item], [descripcion], [es_critico], [orden_ejecucion], [parametro_aceptacion]) VALUES (25, 7, N'FC001', N'Retirar filtro antiguo', N'1', 1, N'Sin derrame de combustible')
INSERT [dbo].[ItemChecklist] ([id_item], [id_tipo], [codigo_item], [descripcion], [es_critico], [orden_ejecucion], [parametro_aceptacion]) VALUES (26, 7, N'FC002', N'Revisar líneas de combustible', N'1', 2, N'Sin fugas ni grietas')
INSERT [dbo].[ItemChecklist] ([id_item], [id_tipo], [codigo_item], [descripcion], [es_critico], [orden_ejecucion], [parametro_aceptacion]) VALUES (27, 7, N'FC003', N'Instalar filtro nuevo', N'1', 3, N'Flujo correcto')
INSERT [dbo].[ItemChecklist] ([id_item], [id_tipo], [codigo_item], [descripcion], [es_critico], [orden_ejecucion], [parametro_aceptacion]) VALUES (28, 7, N'FC004', N'Probar arranque', N'0', 4, N'Motor encendido sin fallos')
INSERT [dbo].[ItemChecklist] ([id_item], [id_tipo], [codigo_item], [descripcion], [es_critico], [orden_ejecucion], [parametro_aceptacion]) VALUES (29, 8, N'CR001', N'Drenar refrigerante viejo', N'1', 1, N'Sin residuos sólidos')
INSERT [dbo].[ItemChecklist] ([id_item], [id_tipo], [codigo_item], [descripcion], [es_critico], [orden_ejecucion], [parametro_aceptacion]) VALUES (30, 8, N'CR002', N'Lavar circuito si es necesario', N'0', 2, N'Limpieza completa')
INSERT [dbo].[ItemChecklist] ([id_item], [id_tipo], [codigo_item], [descripcion], [es_critico], [orden_ejecucion], [parametro_aceptacion]) VALUES (31, 8, N'CR003', N'Llenar con nuevo refrigerante', N'1', 3, N'Nivel hasta marca máxima')
INSERT [dbo].[ItemChecklist] ([id_item], [id_tipo], [codigo_item], [descripcion], [es_critico], [orden_ejecucion], [parametro_aceptacion]) VALUES (32, 8, N'CR004', N'Prueba de temperatura', N'1', 4, N'Motor no se sobrecalienta')
INSERT [dbo].[ItemChecklist] ([id_item], [id_tipo], [codigo_item], [descripcion], [es_critico], [orden_ejecucion], [parametro_aceptacion]) VALUES (33, 9, N'RN001', N'Inspeccionar presión de aire', N'1', 1, N'Dentro del rango especificado')
INSERT [dbo].[ItemChecklist] ([id_item], [id_tipo], [codigo_item], [descripcion], [es_critico], [orden_ejecucion], [parametro_aceptacion]) VALUES (34, 9, N'RN002', N'Revisar profundidad de dibujo', N'1', 2, N'Mínimo 3 mm')
INSERT [dbo].[ItemChecklist] ([id_item], [id_tipo], [codigo_item], [descripcion], [es_critico], [orden_ejecucion], [parametro_aceptacion]) VALUES (35, 9, N'RN003', N'Inspección visual de daños', N'1', 3, N'Sin cortes ni deformaciones')
INSERT [dbo].[ItemChecklist] ([id_item], [id_tipo], [codigo_item], [descripcion], [es_critico], [orden_ejecucion], [parametro_aceptacion]) VALUES (36, 9, N'RN004', N'Rotar neumáticos si aplica', N'0', 4, N'Distribución uniforme')
INSERT [dbo].[ItemChecklist] ([id_item], [id_tipo], [codigo_item], [descripcion], [es_critico], [orden_ejecucion], [parametro_aceptacion]) VALUES (37, 10, N'AB001', N'Verificar alineación de ejes', N'1', 1, N'Dentro de tolerancia')
INSERT [dbo].[ItemChecklist] ([id_item], [id_tipo], [codigo_item], [descripcion], [es_critico], [orden_ejecucion], [parametro_aceptacion]) VALUES (38, 10, N'AB002', N'Balanceo de cada rueda', N'1', 2, N'Sin vibraciones')
INSERT [dbo].[ItemChecklist] ([id_item], [id_tipo], [codigo_item], [descripcion], [es_critico], [orden_ejecucion], [parametro_aceptacion]) VALUES (39, 10, N'AB003', N'Inspeccionar dirección', N'1', 3, N'Sin desviaciones')
INSERT [dbo].[ItemChecklist] ([id_item], [id_tipo], [codigo_item], [descripcion], [es_critico], [orden_ejecucion], [parametro_aceptacion]) VALUES (40, 10, N'AB004', N'Prueba en carretera', N'0', 4, N'Comportamiento estable')
SET IDENTITY_INSERT [dbo].[ItemChecklist] OFF
GO
SET IDENTITY_INSERT [dbo].[Mantenimiento] ON 

INSERT [dbo].[Mantenimiento] ([id_mantenimiento], [id_bus], [id_tipo], [id_programacion], [fecha_inicio], [fecha_fin], [kilometraje_ejecucion], [horas_invertidas], [costo_total], [estado], [observaciones], [tecnico_responsable], [firma_responsable]) VALUES (2, 1, 1, 37, CAST(N'2024-07-15T08:00:00.000' AS DateTime), CAST(N'2024-07-15T10:00:00.000' AS DateTime), 10000, CAST(2.00 AS Decimal(5, 2)), CAST(300.00 AS Decimal(10, 2)), N'Completado', N'Cambio de aceite estándar', N'Carlos Rojas', N'firma_carlos.jpg')
INSERT [dbo].[Mantenimiento] ([id_mantenimiento], [id_bus], [id_tipo], [id_programacion], [fecha_inicio], [fecha_fin], [kilometraje_ejecucion], [horas_invertidas], [costo_total], [estado], [observaciones], [tecnico_responsable], [firma_responsable]) VALUES (3, 2, 2, 38, CAST(N'2024-08-01T09:00:00.000' AS DateTime), NULL, 12000, CAST(1.50 AS Decimal(5, 2)), CAST(150.00 AS Decimal(10, 2)), N'En Proceso', N'Inspección en curso', N'Luis Gamarra', NULL)
INSERT [dbo].[Mantenimiento] ([id_mantenimiento], [id_bus], [id_tipo], [id_programacion], [fecha_inicio], [fecha_fin], [kilometraje_ejecucion], [horas_invertidas], [costo_total], [estado], [observaciones], [tecnico_responsable], [firma_responsable]) VALUES (4, 3, 3, 39, CAST(N'2024-07-20T07:30:00.000' AS DateTime), CAST(N'2024-07-20T08:30:00.000' AS DateTime), 9000, CAST(1.00 AS Decimal(5, 2)), CAST(80.00 AS Decimal(10, 2)), N'Completado', N'Filtro cambiado sin novedad', N'Pedro López', N'firma_pedro.jpg')
INSERT [dbo].[Mantenimiento] ([id_mantenimiento], [id_bus], [id_tipo], [id_programacion], [fecha_inicio], [fecha_fin], [kilometraje_ejecucion], [horas_invertidas], [costo_total], [estado], [observaciones], [tecnico_responsable], [firma_responsable]) VALUES (5, 4, 4, 40, CAST(N'2024-08-05T10:00:00.000' AS DateTime), NULL, 15000, CAST(2.50 AS Decimal(5, 2)), CAST(350.00 AS Decimal(10, 2)), N'En Proceso', N'Bujías a revisar', N'María Pinto', NULL)
INSERT [dbo].[Mantenimiento] ([id_mantenimiento], [id_bus], [id_tipo], [id_programacion], [fecha_inicio], [fecha_fin], [kilometraje_ejecucion], [horas_invertidas], [costo_total], [estado], [observaciones], [tecnico_responsable], [firma_responsable]) VALUES (6, 5, 5, 41, CAST(N'2024-07-25T08:00:00.000' AS DateTime), CAST(N'2024-07-25T09:45:00.000' AS DateTime), 14000, CAST(1.75 AS Decimal(5, 2)), CAST(200.00 AS Decimal(10, 2)), N'Completado', N'Amortiguadores cambiados', N'Alfredo Reyes', N'firma_alfredo.jpg')
INSERT [dbo].[Mantenimiento] ([id_mantenimiento], [id_bus], [id_tipo], [id_programacion], [fecha_inicio], [fecha_fin], [kilometraje_ejecucion], [horas_invertidas], [costo_total], [estado], [observaciones], [tecnico_responsable], [firma_responsable]) VALUES (7, 6, 6, 42, CAST(N'2024-07-30T07:30:00.000' AS DateTime), CAST(N'2024-07-30T09:00:00.000' AS DateTime), 13000, CAST(1.50 AS Decimal(5, 2)), CAST(90.00 AS Decimal(10, 2)), N'Completado', N'Luces delanteras corregidas', N'Lucía Ramos', N'firma_lucia.jpg')
INSERT [dbo].[Mantenimiento] ([id_mantenimiento], [id_bus], [id_tipo], [id_programacion], [fecha_inicio], [fecha_fin], [kilometraje_ejecucion], [horas_invertidas], [costo_total], [estado], [observaciones], [tecnico_responsable], [firma_responsable]) VALUES (8, 7, 7, 43, CAST(N'2024-08-02T08:00:00.000' AS DateTime), NULL, 16000, CAST(1.50 AS Decimal(5, 2)), CAST(100.00 AS Decimal(10, 2)), N'En Proceso', N'Filtro combustible pendiente de entrega', N'Miguel Díaz', NULL)
INSERT [dbo].[Mantenimiento] ([id_mantenimiento], [id_bus], [id_tipo], [id_programacion], [fecha_inicio], [fecha_fin], [kilometraje_ejecucion], [horas_invertidas], [costo_total], [estado], [observaciones], [tecnico_responsable], [firma_responsable]) VALUES (9, 8, 8, 44, CAST(N'2024-07-18T09:00:00.000' AS DateTime), CAST(N'2024-07-18T11:00:00.000' AS DateTime), 11000, CAST(2.00 AS Decimal(5, 2)), CAST(120.00 AS Decimal(10, 2)), N'Completado', N'Cambio completo de refrigerante', N'Julio Navarro', N'firma_julio.jpg')
INSERT [dbo].[Mantenimiento] ([id_mantenimiento], [id_bus], [id_tipo], [id_programacion], [fecha_inicio], [fecha_fin], [kilometraje_ejecucion], [horas_invertidas], [costo_total], [estado], [observaciones], [tecnico_responsable], [firma_responsable]) VALUES (10, 9, 9, 45, CAST(N'2024-07-22T08:15:00.000' AS DateTime), CAST(N'2024-07-22T09:30:00.000' AS DateTime), 10500, CAST(1.25 AS Decimal(5, 2)), CAST(85.00 AS Decimal(10, 2)), N'Completado', N'Presión y desgaste verificados', N'Rosa León', N'firma_rosa.jpg')
INSERT [dbo].[Mantenimiento] ([id_mantenimiento], [id_bus], [id_tipo], [id_programacion], [fecha_inicio], [fecha_fin], [kilometraje_ejecucion], [horas_invertidas], [costo_total], [estado], [observaciones], [tecnico_responsable], [firma_responsable]) VALUES (11, 10, 10, 46, CAST(N'2024-08-10T10:00:00.000' AS DateTime), NULL, 17000, CAST(2.00 AS Decimal(5, 2)), CAST(300.00 AS Decimal(10, 2)), N'En Proceso', N'Balanceo en curso', N'Oscar Ruiz', NULL)
INSERT [dbo].[Mantenimiento] ([id_mantenimiento], [id_bus], [id_tipo], [id_programacion], [fecha_inicio], [fecha_fin], [kilometraje_ejecucion], [horas_invertidas], [costo_total], [estado], [observaciones], [tecnico_responsable], [firma_responsable]) VALUES (12, 11, 11, 47, CAST(N'2024-07-10T08:00:00.000' AS DateTime), CAST(N'2024-07-10T09:30:00.000' AS DateTime), 18000, CAST(1.50 AS Decimal(5, 2)), CAST(160.00 AS Decimal(10, 2)), N'Completado', N'Revisión general de sistema', N'Mónica Salas', N'firma_monica.jpg')
INSERT [dbo].[Mantenimiento] ([id_mantenimiento], [id_bus], [id_tipo], [id_programacion], [fecha_inicio], [fecha_fin], [kilometraje_ejecucion], [horas_invertidas], [costo_total], [estado], [observaciones], [tecnico_responsable], [firma_responsable]) VALUES (13, 12, 12, 48, CAST(N'2024-07-12T07:00:00.000' AS DateTime), NULL, 12500, CAST(1.80 AS Decimal(5, 2)), CAST(220.00 AS Decimal(10, 2)), N'En Proceso', N'Urgente: revisión electrónica', N'Diego Ramírez', NULL)
INSERT [dbo].[Mantenimiento] ([id_mantenimiento], [id_bus], [id_tipo], [id_programacion], [fecha_inicio], [fecha_fin], [kilometraje_ejecucion], [horas_invertidas], [costo_total], [estado], [observaciones], [tecnico_responsable], [firma_responsable]) VALUES (14, 13, 13, 49, CAST(N'2024-07-28T09:30:00.000' AS DateTime), CAST(N'2024-07-28T11:00:00.000' AS DateTime), 15500, CAST(1.50 AS Decimal(5, 2)), CAST(140.00 AS Decimal(10, 2)), N'Completado', N'Filtro aire motor cambiado', N'Ana Castro', N'firma_ana.jpg')
INSERT [dbo].[Mantenimiento] ([id_mantenimiento], [id_bus], [id_tipo], [id_programacion], [fecha_inicio], [fecha_fin], [kilometraje_ejecucion], [horas_invertidas], [costo_total], [estado], [observaciones], [tecnico_responsable], [firma_responsable]) VALUES (15, 14, 14, 50, CAST(N'2024-08-12T08:00:00.000' AS DateTime), NULL, 19000, CAST(2.20 AS Decimal(5, 2)), CAST(250.00 AS Decimal(10, 2)), N'En Proceso', N'Diagnóstico preliminar', N'Sergio Paredes', NULL)
INSERT [dbo].[Mantenimiento] ([id_mantenimiento], [id_bus], [id_tipo], [id_programacion], [fecha_inicio], [fecha_fin], [kilometraje_ejecucion], [horas_invertidas], [costo_total], [estado], [observaciones], [tecnico_responsable], [firma_responsable]) VALUES (16, 15, 15, 51, CAST(N'2024-07-27T10:00:00.000' AS DateTime), CAST(N'2024-07-27T11:30:00.000' AS DateTime), 13500, CAST(1.30 AS Decimal(5, 2)), CAST(110.00 AS Decimal(10, 2)), N'Completado', N'Limpieza y ajuste', N'Andrea Gómez', N'firma_andrea.jpg')
INSERT [dbo].[Mantenimiento] ([id_mantenimiento], [id_bus], [id_tipo], [id_programacion], [fecha_inicio], [fecha_fin], [kilometraje_ejecucion], [horas_invertidas], [costo_total], [estado], [observaciones], [tecnico_responsable], [firma_responsable]) VALUES (17, 16, 16, 52, CAST(N'2024-07-19T09:00:00.000' AS DateTime), NULL, 14500, CAST(2.50 AS Decimal(5, 2)), CAST(180.00 AS Decimal(10, 2)), N'En Proceso', N'Requiere repuesto pendiente', N'Víctor Soto', NULL)
INSERT [dbo].[Mantenimiento] ([id_mantenimiento], [id_bus], [id_tipo], [id_programacion], [fecha_inicio], [fecha_fin], [kilometraje_ejecucion], [horas_invertidas], [costo_total], [estado], [observaciones], [tecnico_responsable], [firma_responsable]) VALUES (18, 17, 17, 53, CAST(N'2024-08-03T08:45:00.000' AS DateTime), CAST(N'2024-08-03T10:00:00.000' AS DateTime), 16500, CAST(1.25 AS Decimal(5, 2)), CAST(135.00 AS Decimal(10, 2)), N'Completado', N'Mantenimiento menor', N'Camila Peña', N'firma_camila.jpg')
INSERT [dbo].[Mantenimiento] ([id_mantenimiento], [id_bus], [id_tipo], [id_programacion], [fecha_inicio], [fecha_fin], [kilometraje_ejecucion], [horas_invertidas], [costo_total], [estado], [observaciones], [tecnico_responsable], [firma_responsable]) VALUES (19, 18, 18, 54, CAST(N'2024-08-06T09:30:00.000' AS DateTime), NULL, 17500, CAST(2.00 AS Decimal(5, 2)), CAST(210.00 AS Decimal(10, 2)), N'En Proceso', N'Freno trasero defectuoso', N'Álvaro Chávez', NULL)
INSERT [dbo].[Mantenimiento] ([id_mantenimiento], [id_bus], [id_tipo], [id_programacion], [fecha_inicio], [fecha_fin], [kilometraje_ejecucion], [horas_invertidas], [costo_total], [estado], [observaciones], [tecnico_responsable], [firma_responsable]) VALUES (20, 19, 19, 55, CAST(N'2024-07-21T07:00:00.000' AS DateTime), CAST(N'2024-07-21T08:30:00.000' AS DateTime), 19500, CAST(1.50 AS Decimal(5, 2)), CAST(90.00 AS Decimal(10, 2)), N'Completado', N'Cambio filtro cabina', N'Diana Torres', N'firma_diana.jpg')
INSERT [dbo].[Mantenimiento] ([id_mantenimiento], [id_bus], [id_tipo], [id_programacion], [fecha_inicio], [fecha_fin], [kilometraje_ejecucion], [horas_invertidas], [costo_total], [estado], [observaciones], [tecnico_responsable], [firma_responsable]) VALUES (21, 20, 20, 56, CAST(N'2024-07-29T07:15:00.000' AS DateTime), NULL, 20000, CAST(2.10 AS Decimal(5, 2)), CAST(160.00 AS Decimal(10, 2)), N'En Proceso', N'Esperando proveedor externo', N'Raúl Vega', NULL)
INSERT [dbo].[Mantenimiento] ([id_mantenimiento], [id_bus], [id_tipo], [id_programacion], [fecha_inicio], [fecha_fin], [kilometraje_ejecucion], [horas_invertidas], [costo_total], [estado], [observaciones], [tecnico_responsable], [firma_responsable]) VALUES (22, 21, 1, 57, CAST(N'2024-07-16T08:00:00.000' AS DateTime), CAST(N'2024-07-16T09:30:00.000' AS DateTime), 10200, CAST(1.30 AS Decimal(5, 2)), CAST(140.00 AS Decimal(10, 2)), N'Completado', N'Aceite renovado', N'Laura Ponce', N'firma_laura.jpg')
INSERT [dbo].[Mantenimiento] ([id_mantenimiento], [id_bus], [id_tipo], [id_programacion], [fecha_inicio], [fecha_fin], [kilometraje_ejecucion], [horas_invertidas], [costo_total], [estado], [observaciones], [tecnico_responsable], [firma_responsable]) VALUES (23, 22, 2, 58, CAST(N'2024-07-17T10:00:00.000' AS DateTime), NULL, 10900, CAST(1.80 AS Decimal(5, 2)), CAST(150.00 AS Decimal(10, 2)), N'En Proceso', N'Frenos del eje trasero', N'Marco Hidalgo', NULL)
INSERT [dbo].[Mantenimiento] ([id_mantenimiento], [id_bus], [id_tipo], [id_programacion], [fecha_inicio], [fecha_fin], [kilometraje_ejecucion], [horas_invertidas], [costo_total], [estado], [observaciones], [tecnico_responsable], [firma_responsable]) VALUES (24, 23, 3, 59, CAST(N'2024-07-23T08:00:00.000' AS DateTime), CAST(N'2024-07-23T09:30:00.000' AS DateTime), 9800, CAST(1.40 AS Decimal(5, 2)), CAST(95.00 AS Decimal(10, 2)), N'Completado', N'Checklist completo', N'Teresa Luján', N'firma_teresa.jpg')
INSERT [dbo].[Mantenimiento] ([id_mantenimiento], [id_bus], [id_tipo], [id_programacion], [fecha_inicio], [fecha_fin], [kilometraje_ejecucion], [horas_invertidas], [costo_total], [estado], [observaciones], [tecnico_responsable], [firma_responsable]) VALUES (25, 24, 4, 60, CAST(N'2024-07-24T08:00:00.000' AS DateTime), NULL, 9400, CAST(2.00 AS Decimal(5, 2)), CAST(170.00 AS Decimal(10, 2)), N'En Proceso', N'Cableado expuesto', N'Hugo Mendoza', NULL)
INSERT [dbo].[Mantenimiento] ([id_mantenimiento], [id_bus], [id_tipo], [id_programacion], [fecha_inicio], [fecha_fin], [kilometraje_ejecucion], [horas_invertidas], [costo_total], [estado], [observaciones], [tecnico_responsable], [firma_responsable]) VALUES (26, 25, 5, 61, CAST(N'2024-07-26T09:00:00.000' AS DateTime), CAST(N'2024-07-26T10:00:00.000' AS DateTime), 8900, CAST(1.00 AS Decimal(5, 2)), CAST(60.00 AS Decimal(10, 2)), N'Completado', N'Pastillas verificadas', N'Verónica Tello', N'firma_veronica.jpg')
INSERT [dbo].[Mantenimiento] ([id_mantenimiento], [id_bus], [id_tipo], [id_programacion], [fecha_inicio], [fecha_fin], [kilometraje_ejecucion], [horas_invertidas], [costo_total], [estado], [observaciones], [tecnico_responsable], [firma_responsable]) VALUES (27, 26, 6, 62, CAST(N'2024-08-04T07:30:00.000' AS DateTime), NULL, 11500, CAST(1.70 AS Decimal(5, 2)), CAST(130.00 AS Decimal(10, 2)), N'En Proceso', N'Fallas eléctricas menores', N'Patricio Méndez', NULL)
INSERT [dbo].[Mantenimiento] ([id_mantenimiento], [id_bus], [id_tipo], [id_programacion], [fecha_inicio], [fecha_fin], [kilometraje_ejecucion], [horas_invertidas], [costo_total], [estado], [observaciones], [tecnico_responsable], [firma_responsable]) VALUES (28, 27, 7, 63, CAST(N'2024-08-09T08:00:00.000' AS DateTime), CAST(N'2024-08-09T09:30:00.000' AS DateTime), 11700, CAST(1.50 AS Decimal(5, 2)), CAST(90.00 AS Decimal(10, 2)), N'Completado', N'Filtro instalado correctamente', N'Carmen Zúñiga', N'firma_carmen.jpg')
INSERT [dbo].[Mantenimiento] ([id_mantenimiento], [id_bus], [id_tipo], [id_programacion], [fecha_inicio], [fecha_fin], [kilometraje_ejecucion], [horas_invertidas], [costo_total], [estado], [observaciones], [tecnico_responsable], [firma_responsable]) VALUES (29, 28, 8, 64, CAST(N'2024-08-11T09:00:00.000' AS DateTime), NULL, 12100, CAST(2.20 AS Decimal(5, 2)), CAST(200.00 AS Decimal(10, 2)), N'En Proceso', N'Radiador caliente', N'Fabián Calle', NULL)
INSERT [dbo].[Mantenimiento] ([id_mantenimiento], [id_bus], [id_tipo], [id_programacion], [fecha_inicio], [fecha_fin], [kilometraje_ejecucion], [horas_invertidas], [costo_total], [estado], [observaciones], [tecnico_responsable], [firma_responsable]) VALUES (30, 29, 9, 65, CAST(N'2024-08-13T10:00:00.000' AS DateTime), CAST(N'2024-08-13T11:00:00.000' AS DateTime), 12300, CAST(1.00 AS Decimal(5, 2)), CAST(75.00 AS Decimal(10, 2)), N'Completado', N'Inspección visual aprobada', N'Valeria Ríos', N'firma_valeria.jpg')
INSERT [dbo].[Mantenimiento] ([id_mantenimiento], [id_bus], [id_tipo], [id_programacion], [fecha_inicio], [fecha_fin], [kilometraje_ejecucion], [horas_invertidas], [costo_total], [estado], [observaciones], [tecnico_responsable], [firma_responsable]) VALUES (31, 30, 10, 66, CAST(N'2024-08-14T08:00:00.000' AS DateTime), NULL, 12500, CAST(1.90 AS Decimal(5, 2)), CAST(145.00 AS Decimal(10, 2)), N'En Proceso', N'Desalineación detectada', N'Cristian Aguilar', NULL)
INSERT [dbo].[Mantenimiento] ([id_mantenimiento], [id_bus], [id_tipo], [id_programacion], [fecha_inicio], [fecha_fin], [kilometraje_ejecucion], [horas_invertidas], [costo_total], [estado], [observaciones], [tecnico_responsable], [firma_responsable]) VALUES (32, 31, 11, 67, CAST(N'2024-07-13T07:30:00.000' AS DateTime), CAST(N'2024-07-13T08:30:00.000' AS DateTime), 8800, CAST(1.00 AS Decimal(5, 2)), CAST(80.00 AS Decimal(10, 2)), N'Completado', N'Verificación general OK', N'Juliana Ayala', N'firma_juliana.jpg')
INSERT [dbo].[Mantenimiento] ([id_mantenimiento], [id_bus], [id_tipo], [id_programacion], [fecha_inicio], [fecha_fin], [kilometraje_ejecucion], [horas_invertidas], [costo_total], [estado], [observaciones], [tecnico_responsable], [firma_responsable]) VALUES (33, 32, 12, 68, CAST(N'2024-07-14T08:00:00.000' AS DateTime), NULL, 8700, CAST(1.60 AS Decimal(5, 2)), CAST(95.00 AS Decimal(10, 2)), N'En Proceso', N'Electrónica sin respuesta', N'Rodrigo Silva', NULL)
INSERT [dbo].[Mantenimiento] ([id_mantenimiento], [id_bus], [id_tipo], [id_programacion], [fecha_inicio], [fecha_fin], [kilometraje_ejecucion], [horas_invertidas], [costo_total], [estado], [observaciones], [tecnico_responsable], [firma_responsable]) VALUES (34, 33, 13, 69, CAST(N'2024-07-31T08:30:00.000' AS DateTime), CAST(N'2024-07-31T09:30:00.000' AS DateTime), 8900, CAST(1.20 AS Decimal(5, 2)), CAST(70.00 AS Decimal(10, 2)), N'Completado', N'Checklist aprobado', N'Pilar Nolasco', N'firma_pilar.jpg')
INSERT [dbo].[Mantenimiento] ([id_mantenimiento], [id_bus], [id_tipo], [id_programacion], [fecha_inicio], [fecha_fin], [kilometraje_ejecucion], [horas_invertidas], [costo_total], [estado], [observaciones], [tecnico_responsable], [firma_responsable]) VALUES (35, 34, 14, 70, CAST(N'2024-08-15T09:00:00.000' AS DateTime), NULL, 9100, CAST(2.00 AS Decimal(5, 2)), CAST(150.00 AS Decimal(10, 2)), N'En Proceso', N'Balanceo intermedio', N'Esteban Vera', NULL)
INSERT [dbo].[Mantenimiento] ([id_mantenimiento], [id_bus], [id_tipo], [id_programacion], [fecha_inicio], [fecha_fin], [kilometraje_ejecucion], [horas_invertidas], [costo_total], [estado], [observaciones], [tecnico_responsable], [firma_responsable]) VALUES (36, 35, 15, 71, CAST(N'2024-08-16T09:15:00.000' AS DateTime), CAST(N'2024-08-16T10:45:00.000' AS DateTime), 9300, CAST(1.50 AS Decimal(5, 2)), CAST(110.00 AS Decimal(10, 2)), N'Completado', N'Neumáticos rotados', N'Liliana Vento', N'firma_liliana.jpg')
INSERT [dbo].[Mantenimiento] ([id_mantenimiento], [id_bus], [id_tipo], [id_programacion], [fecha_inicio], [fecha_fin], [kilometraje_ejecucion], [horas_invertidas], [costo_total], [estado], [observaciones], [tecnico_responsable], [firma_responsable]) VALUES (37, 36, 16, 72, CAST(N'2024-08-17T10:00:00.000' AS DateTime), NULL, 9500, CAST(1.70 AS Decimal(5, 2)), CAST(140.00 AS Decimal(10, 2)), N'En Proceso', N'Fugas menores detectadas', N'Tania Alva', NULL)
INSERT [dbo].[Mantenimiento] ([id_mantenimiento], [id_bus], [id_tipo], [id_programacion], [fecha_inicio], [fecha_fin], [kilometraje_ejecucion], [horas_invertidas], [costo_total], [estado], [observaciones], [tecnico_responsable], [firma_responsable]) VALUES (38, 37, 17, 73, CAST(N'2024-08-18T07:00:00.000' AS DateTime), CAST(N'2024-08-18T08:30:00.000' AS DateTime), 9700, CAST(1.30 AS Decimal(5, 2)), CAST(120.00 AS Decimal(10, 2)), N'Completado', N'Cambio total', N'Rómulo Reyes', N'firma_romulo.jpg')
INSERT [dbo].[Mantenimiento] ([id_mantenimiento], [id_bus], [id_tipo], [id_programacion], [fecha_inicio], [fecha_fin], [kilometraje_ejecucion], [horas_invertidas], [costo_total], [estado], [observaciones], [tecnico_responsable], [firma_responsable]) VALUES (39, 38, 18, 74, CAST(N'2024-08-19T09:00:00.000' AS DateTime), NULL, 9900, CAST(2.10 AS Decimal(5, 2)), CAST(190.00 AS Decimal(10, 2)), N'En Proceso', N'Tubería suelta', N'Giovana Mejía', NULL)
INSERT [dbo].[Mantenimiento] ([id_mantenimiento], [id_bus], [id_tipo], [id_programacion], [fecha_inicio], [fecha_fin], [kilometraje_ejecucion], [horas_invertidas], [costo_total], [estado], [observaciones], [tecnico_responsable], [firma_responsable]) VALUES (40, 39, 19, 75, CAST(N'2024-08-20T10:30:00.000' AS DateTime), CAST(N'2024-08-20T11:45:00.000' AS DateTime), 10100, CAST(1.40 AS Decimal(5, 2)), CAST(130.00 AS Decimal(10, 2)), N'Completado', N'Revisión aprobada', N'Jaime Lazo', N'firma_jaime.jpg')
INSERT [dbo].[Mantenimiento] ([id_mantenimiento], [id_bus], [id_tipo], [id_programacion], [fecha_inicio], [fecha_fin], [kilometraje_ejecucion], [horas_invertidas], [costo_total], [estado], [observaciones], [tecnico_responsable], [firma_responsable]) VALUES (41, 40, 20, 76, CAST(N'2024-08-21T08:30:00.000' AS DateTime), NULL, 10300, CAST(1.90 AS Decimal(5, 2)), CAST(160.00 AS Decimal(10, 2)), N'En Proceso', N'Insumos faltantes', N'Nadia Pizarro', NULL)
SET IDENTITY_INSERT [dbo].[Mantenimiento] OFF
GO
SET IDENTITY_INSERT [dbo].[OrdenCompra] ON 

INSERT [dbo].[OrdenCompra] ([id_orden], [id_proveedor], [id_mantenimiento], [numero_orden], [fecha_emision], [fecha_entrega_esperada], [estado], [subtotal], [igv], [total], [observaciones]) VALUES (33, 1, 2, N'ORD-0001', CAST(N'2025-07-03' AS Date), CAST(N'2025-07-08' AS Date), N'Pendiente', CAST(1000.00 AS Decimal(10, 2)), CAST(180.00 AS Decimal(10, 2)), CAST(1180.00 AS Decimal(10, 2)), N'Compra programada')
INSERT [dbo].[OrdenCompra] ([id_orden], [id_proveedor], [id_mantenimiento], [numero_orden], [fecha_emision], [fecha_entrega_esperada], [estado], [subtotal], [igv], [total], [observaciones]) VALUES (34, 2, 3, N'ORD-0002', CAST(N'2025-07-03' AS Date), CAST(N'2025-07-07' AS Date), N'Pendiente', CAST(1200.00 AS Decimal(10, 2)), CAST(216.00 AS Decimal(10, 2)), CAST(1416.00 AS Decimal(10, 2)), N'Orden urgente')
INSERT [dbo].[OrdenCompra] ([id_orden], [id_proveedor], [id_mantenimiento], [numero_orden], [fecha_emision], [fecha_entrega_esperada], [estado], [subtotal], [igv], [total], [observaciones]) VALUES (35, 3, 4, N'ORD-0003', CAST(N'2025-07-03' AS Date), CAST(N'2025-07-06' AS Date), N'Aprobada', CAST(950.00 AS Decimal(10, 2)), CAST(171.00 AS Decimal(10, 2)), CAST(1121.00 AS Decimal(10, 2)), N'Urgencia media')
INSERT [dbo].[OrdenCompra] ([id_orden], [id_proveedor], [id_mantenimiento], [numero_orden], [fecha_emision], [fecha_entrega_esperada], [estado], [subtotal], [igv], [total], [observaciones]) VALUES (36, 4, 5, N'ORD-0004', CAST(N'2025-07-03' AS Date), CAST(N'2025-07-10' AS Date), N'En Proceso', CAST(870.00 AS Decimal(10, 2)), CAST(156.60 AS Decimal(10, 2)), CAST(1026.60 AS Decimal(10, 2)), N'Compra técnica')
INSERT [dbo].[OrdenCompra] ([id_orden], [id_proveedor], [id_mantenimiento], [numero_orden], [fecha_emision], [fecha_entrega_esperada], [estado], [subtotal], [igv], [total], [observaciones]) VALUES (37, 5, 6, N'ORD-0005', CAST(N'2025-07-03' AS Date), CAST(N'2025-07-05' AS Date), N'Pendiente', CAST(1100.00 AS Decimal(10, 2)), CAST(198.00 AS Decimal(10, 2)), CAST(1298.00 AS Decimal(10, 2)), N'Verificar stock')
INSERT [dbo].[OrdenCompra] ([id_orden], [id_proveedor], [id_mantenimiento], [numero_orden], [fecha_emision], [fecha_entrega_esperada], [estado], [subtotal], [igv], [total], [observaciones]) VALUES (38, 6, 7, N'ORD-0006', CAST(N'2025-07-03' AS Date), CAST(N'2025-07-09' AS Date), N'Pendiente', CAST(1340.00 AS Decimal(10, 2)), CAST(241.20 AS Decimal(10, 2)), CAST(1581.20 AS Decimal(10, 2)), N'Compra crítica')
INSERT [dbo].[OrdenCompra] ([id_orden], [id_proveedor], [id_mantenimiento], [numero_orden], [fecha_emision], [fecha_entrega_esperada], [estado], [subtotal], [igv], [total], [observaciones]) VALUES (39, 7, 8, N'ORD-0007', CAST(N'2025-07-03' AS Date), CAST(N'2025-07-06' AS Date), N'Pendiente', CAST(1010.00 AS Decimal(10, 2)), CAST(181.80 AS Decimal(10, 2)), CAST(1191.80 AS Decimal(10, 2)), N'Inspección programada')
INSERT [dbo].[OrdenCompra] ([id_orden], [id_proveedor], [id_mantenimiento], [numero_orden], [fecha_emision], [fecha_entrega_esperada], [estado], [subtotal], [igv], [total], [observaciones]) VALUES (40, 8, 9, N'ORD-0008', CAST(N'2025-07-03' AS Date), CAST(N'2025-07-11' AS Date), N'Completada', CAST(940.00 AS Decimal(10, 2)), CAST(169.20 AS Decimal(10, 2)), CAST(1109.20 AS Decimal(10, 2)), N'Entrega rápida')
INSERT [dbo].[OrdenCompra] ([id_orden], [id_proveedor], [id_mantenimiento], [numero_orden], [fecha_emision], [fecha_entrega_esperada], [estado], [subtotal], [igv], [total], [observaciones]) VALUES (41, 9, 10, N'ORD-0009', CAST(N'2025-07-03' AS Date), CAST(N'2025-07-07' AS Date), N'Pendiente', CAST(1120.00 AS Decimal(10, 2)), CAST(201.60 AS Decimal(10, 2)), CAST(1321.60 AS Decimal(10, 2)), N'Inspección crítica')
INSERT [dbo].[OrdenCompra] ([id_orden], [id_proveedor], [id_mantenimiento], [numero_orden], [fecha_emision], [fecha_entrega_esperada], [estado], [subtotal], [igv], [total], [observaciones]) VALUES (42, 10, 11, N'ORD-0010', CAST(N'2025-07-03' AS Date), CAST(N'2025-07-08' AS Date), N'Pendiente', CAST(1500.00 AS Decimal(10, 2)), CAST(270.00 AS Decimal(10, 2)), CAST(1770.00 AS Decimal(10, 2)), N'Orden técnica')
INSERT [dbo].[OrdenCompra] ([id_orden], [id_proveedor], [id_mantenimiento], [numero_orden], [fecha_emision], [fecha_entrega_esperada], [estado], [subtotal], [igv], [total], [observaciones]) VALUES (43, 11, 12, N'ORD-0011', CAST(N'2025-07-03' AS Date), CAST(N'2025-07-09' AS Date), N'Pendiente', CAST(980.00 AS Decimal(10, 2)), CAST(176.40 AS Decimal(10, 2)), CAST(1156.40 AS Decimal(10, 2)), N'Compra validada')
INSERT [dbo].[OrdenCompra] ([id_orden], [id_proveedor], [id_mantenimiento], [numero_orden], [fecha_emision], [fecha_entrega_esperada], [estado], [subtotal], [igv], [total], [observaciones]) VALUES (44, 12, 13, N'ORD-0012', CAST(N'2025-07-03' AS Date), CAST(N'2025-07-10' AS Date), N'Pendiente', CAST(1230.00 AS Decimal(10, 2)), CAST(221.40 AS Decimal(10, 2)), CAST(1451.40 AS Decimal(10, 2)), N'Mantenimiento correctivo')
INSERT [dbo].[OrdenCompra] ([id_orden], [id_proveedor], [id_mantenimiento], [numero_orden], [fecha_emision], [fecha_entrega_esperada], [estado], [subtotal], [igv], [total], [observaciones]) VALUES (45, 13, 14, N'ORD-0013', CAST(N'2025-07-03' AS Date), CAST(N'2025-07-05' AS Date), N'Pendiente', CAST(1110.00 AS Decimal(10, 2)), CAST(199.80 AS Decimal(10, 2)), CAST(1309.80 AS Decimal(10, 2)), N'Urgente motor')
INSERT [dbo].[OrdenCompra] ([id_orden], [id_proveedor], [id_mantenimiento], [numero_orden], [fecha_emision], [fecha_entrega_esperada], [estado], [subtotal], [igv], [total], [observaciones]) VALUES (46, 14, 15, N'ORD-0014', CAST(N'2025-07-03' AS Date), CAST(N'2025-07-06' AS Date), N'Pendiente', CAST(890.00 AS Decimal(10, 2)), CAST(160.20 AS Decimal(10, 2)), CAST(1050.20 AS Decimal(10, 2)), N'Entrega en curso')
INSERT [dbo].[OrdenCompra] ([id_orden], [id_proveedor], [id_mantenimiento], [numero_orden], [fecha_emision], [fecha_entrega_esperada], [estado], [subtotal], [igv], [total], [observaciones]) VALUES (47, 15, 16, N'ORD-0015', CAST(N'2025-07-03' AS Date), CAST(N'2025-07-08' AS Date), N'Pendiente', CAST(990.00 AS Decimal(10, 2)), CAST(178.20 AS Decimal(10, 2)), CAST(1168.20 AS Decimal(10, 2)), N'Inspección luz')
INSERT [dbo].[OrdenCompra] ([id_orden], [id_proveedor], [id_mantenimiento], [numero_orden], [fecha_emision], [fecha_entrega_esperada], [estado], [subtotal], [igv], [total], [observaciones]) VALUES (48, 16, 17, N'ORD-0016', CAST(N'2025-07-03' AS Date), CAST(N'2025-07-07' AS Date), N'Pendiente', CAST(1060.00 AS Decimal(10, 2)), CAST(190.80 AS Decimal(10, 2)), CAST(1250.80 AS Decimal(10, 2)), N'Verificar niveles')
INSERT [dbo].[OrdenCompra] ([id_orden], [id_proveedor], [id_mantenimiento], [numero_orden], [fecha_emision], [fecha_entrega_esperada], [estado], [subtotal], [igv], [total], [observaciones]) VALUES (49, 17, 18, N'ORD-0017', CAST(N'2025-07-03' AS Date), CAST(N'2025-07-06' AS Date), N'Pendiente', CAST(970.00 AS Decimal(10, 2)), CAST(174.60 AS Decimal(10, 2)), CAST(1144.60 AS Decimal(10, 2)), N'Cambio aceite')
INSERT [dbo].[OrdenCompra] ([id_orden], [id_proveedor], [id_mantenimiento], [numero_orden], [fecha_emision], [fecha_entrega_esperada], [estado], [subtotal], [igv], [total], [observaciones]) VALUES (50, 18, 19, N'ORD-0018', CAST(N'2025-07-03' AS Date), CAST(N'2025-07-09' AS Date), N'Pendiente', CAST(1020.00 AS Decimal(10, 2)), CAST(183.60 AS Decimal(10, 2)), CAST(1203.60 AS Decimal(10, 2)), N'Freno delantero')
INSERT [dbo].[OrdenCompra] ([id_orden], [id_proveedor], [id_mantenimiento], [numero_orden], [fecha_emision], [fecha_entrega_esperada], [estado], [subtotal], [igv], [total], [observaciones]) VALUES (51, 19, 20, N'ORD-0019', CAST(N'2025-07-03' AS Date), CAST(N'2025-07-06' AS Date), N'Pendiente', CAST(890.00 AS Decimal(10, 2)), CAST(160.20 AS Decimal(10, 2)), CAST(1050.20 AS Decimal(10, 2)), N'Revisión motor')
INSERT [dbo].[OrdenCompra] ([id_orden], [id_proveedor], [id_mantenimiento], [numero_orden], [fecha_emision], [fecha_entrega_esperada], [estado], [subtotal], [igv], [total], [observaciones]) VALUES (52, 20, 21, N'ORD-0020', CAST(N'2025-07-03' AS Date), CAST(N'2025-07-08' AS Date), N'Pendiente', CAST(1300.00 AS Decimal(10, 2)), CAST(234.00 AS Decimal(10, 2)), CAST(1534.00 AS Decimal(10, 2)), N'Diagnóstico general')
INSERT [dbo].[OrdenCompra] ([id_orden], [id_proveedor], [id_mantenimiento], [numero_orden], [fecha_emision], [fecha_entrega_esperada], [estado], [subtotal], [igv], [total], [observaciones]) VALUES (53, 21, 22, N'ORD-0021', CAST(N'2025-07-03' AS Date), CAST(N'2025-07-06' AS Date), N'Pendiente', CAST(850.00 AS Decimal(10, 2)), CAST(153.00 AS Decimal(10, 2)), CAST(1003.00 AS Decimal(10, 2)), N'Sistema eléctrico')
INSERT [dbo].[OrdenCompra] ([id_orden], [id_proveedor], [id_mantenimiento], [numero_orden], [fecha_emision], [fecha_entrega_esperada], [estado], [subtotal], [igv], [total], [observaciones]) VALUES (54, 22, 23, N'ORD-0022', CAST(N'2025-07-03' AS Date), CAST(N'2025-07-07' AS Date), N'Pendiente', CAST(960.00 AS Decimal(10, 2)), CAST(172.80 AS Decimal(10, 2)), CAST(1132.80 AS Decimal(10, 2)), N'Cambio de luces')
INSERT [dbo].[OrdenCompra] ([id_orden], [id_proveedor], [id_mantenimiento], [numero_orden], [fecha_emision], [fecha_entrega_esperada], [estado], [subtotal], [igv], [total], [observaciones]) VALUES (55, 23, 24, N'ORD-0023', CAST(N'2025-07-03' AS Date), CAST(N'2025-07-06' AS Date), N'Pendiente', CAST(1200.00 AS Decimal(10, 2)), CAST(216.00 AS Decimal(10, 2)), CAST(1416.00 AS Decimal(10, 2)), N'Inspección general')
INSERT [dbo].[OrdenCompra] ([id_orden], [id_proveedor], [id_mantenimiento], [numero_orden], [fecha_emision], [fecha_entrega_esperada], [estado], [subtotal], [igv], [total], [observaciones]) VALUES (56, 24, 25, N'ORD-0024', CAST(N'2025-07-03' AS Date), CAST(N'2025-07-07' AS Date), N'Pendiente', CAST(1100.00 AS Decimal(10, 2)), CAST(198.00 AS Decimal(10, 2)), CAST(1298.00 AS Decimal(10, 2)), N'Verificar sistema')
INSERT [dbo].[OrdenCompra] ([id_orden], [id_proveedor], [id_mantenimiento], [numero_orden], [fecha_emision], [fecha_entrega_esperada], [estado], [subtotal], [igv], [total], [observaciones]) VALUES (57, 25, 26, N'ORD-0025', CAST(N'2025-07-03' AS Date), CAST(N'2025-07-06' AS Date), N'Pendiente', CAST(1250.00 AS Decimal(10, 2)), CAST(225.00 AS Decimal(10, 2)), CAST(1475.00 AS Decimal(10, 2)), N'Mantenimiento externo')
INSERT [dbo].[OrdenCompra] ([id_orden], [id_proveedor], [id_mantenimiento], [numero_orden], [fecha_emision], [fecha_entrega_esperada], [estado], [subtotal], [igv], [total], [observaciones]) VALUES (58, 26, 27, N'ORD-0026', CAST(N'2025-07-03' AS Date), CAST(N'2025-07-08' AS Date), N'Pendiente', CAST(980.00 AS Decimal(10, 2)), CAST(176.40 AS Decimal(10, 2)), CAST(1156.40 AS Decimal(10, 2)), N'Revisión luces')
INSERT [dbo].[OrdenCompra] ([id_orden], [id_proveedor], [id_mantenimiento], [numero_orden], [fecha_emision], [fecha_entrega_esperada], [estado], [subtotal], [igv], [total], [observaciones]) VALUES (59, 27, 28, N'ORD-0027', CAST(N'2025-07-03' AS Date), CAST(N'2025-07-07' AS Date), N'Pendiente', CAST(940.00 AS Decimal(10, 2)), CAST(169.20 AS Decimal(10, 2)), CAST(1109.20 AS Decimal(10, 2)), N'Cambio frenos')
INSERT [dbo].[OrdenCompra] ([id_orden], [id_proveedor], [id_mantenimiento], [numero_orden], [fecha_emision], [fecha_entrega_esperada], [estado], [subtotal], [igv], [total], [observaciones]) VALUES (60, 28, 29, N'ORD-0028', CAST(N'2025-07-03' AS Date), CAST(N'2025-07-09' AS Date), N'Pendiente', CAST(870.00 AS Decimal(10, 2)), CAST(156.60 AS Decimal(10, 2)), CAST(1026.60 AS Decimal(10, 2)), N'Revisión urgente')
INSERT [dbo].[OrdenCompra] ([id_orden], [id_proveedor], [id_mantenimiento], [numero_orden], [fecha_emision], [fecha_entrega_esperada], [estado], [subtotal], [igv], [total], [observaciones]) VALUES (61, 29, 30, N'ORD-0029', CAST(N'2025-07-03' AS Date), CAST(N'2025-07-05' AS Date), N'Pendiente', CAST(1050.00 AS Decimal(10, 2)), CAST(189.00 AS Decimal(10, 2)), CAST(1239.00 AS Decimal(10, 2)), N'Rotación neumáticos')
INSERT [dbo].[OrdenCompra] ([id_orden], [id_proveedor], [id_mantenimiento], [numero_orden], [fecha_emision], [fecha_entrega_esperada], [estado], [subtotal], [igv], [total], [observaciones]) VALUES (62, 30, 31, N'ORD-0030', CAST(N'2025-07-03' AS Date), CAST(N'2025-07-06' AS Date), N'Pendiente', CAST(1130.00 AS Decimal(10, 2)), CAST(203.40 AS Decimal(10, 2)), CAST(1333.40 AS Decimal(10, 2)), N'Neumáticos nuevos')
INSERT [dbo].[OrdenCompra] ([id_orden], [id_proveedor], [id_mantenimiento], [numero_orden], [fecha_emision], [fecha_entrega_esperada], [estado], [subtotal], [igv], [total], [observaciones]) VALUES (63, 1, 32, N'ORD-0031', CAST(N'2025-07-03' AS Date), CAST(N'2025-07-07' AS Date), N'Pendiente', CAST(1200.00 AS Decimal(10, 2)), CAST(216.00 AS Decimal(10, 2)), CAST(1416.00 AS Decimal(10, 2)), N'Inspección eje')
INSERT [dbo].[OrdenCompra] ([id_orden], [id_proveedor], [id_mantenimiento], [numero_orden], [fecha_emision], [fecha_entrega_esperada], [estado], [subtotal], [igv], [total], [observaciones]) VALUES (64, 2, 33, N'ORD-0032', CAST(N'2025-07-03' AS Date), CAST(N'2025-07-08' AS Date), N'Pendiente', CAST(990.00 AS Decimal(10, 2)), CAST(178.20 AS Decimal(10, 2)), CAST(1168.20 AS Decimal(10, 2)), N'Revisión técnica')
INSERT [dbo].[OrdenCompra] ([id_orden], [id_proveedor], [id_mantenimiento], [numero_orden], [fecha_emision], [fecha_entrega_esperada], [estado], [subtotal], [igv], [total], [observaciones]) VALUES (65, 3, 34, N'ORD-0033', CAST(N'2025-07-03' AS Date), CAST(N'2025-07-09' AS Date), N'Pendiente', CAST(1180.00 AS Decimal(10, 2)), CAST(212.40 AS Decimal(10, 2)), CAST(1392.40 AS Decimal(10, 2)), N'Cambio sensor')
INSERT [dbo].[OrdenCompra] ([id_orden], [id_proveedor], [id_mantenimiento], [numero_orden], [fecha_emision], [fecha_entrega_esperada], [estado], [subtotal], [igv], [total], [observaciones]) VALUES (66, 4, 35, N'ORD-0034', CAST(N'2025-07-03' AS Date), CAST(N'2025-07-06' AS Date), N'Pendiente', CAST(930.00 AS Decimal(10, 2)), CAST(167.40 AS Decimal(10, 2)), CAST(1097.40 AS Decimal(10, 2)), N'Limpieza de motor')
INSERT [dbo].[OrdenCompra] ([id_orden], [id_proveedor], [id_mantenimiento], [numero_orden], [fecha_emision], [fecha_entrega_esperada], [estado], [subtotal], [igv], [total], [observaciones]) VALUES (67, 5, 36, N'ORD-0035', CAST(N'2025-07-03' AS Date), CAST(N'2025-07-05' AS Date), N'Pendiente', CAST(970.00 AS Decimal(10, 2)), CAST(174.60 AS Decimal(10, 2)), CAST(1144.60 AS Decimal(10, 2)), N'Mantenimiento frenos')
INSERT [dbo].[OrdenCompra] ([id_orden], [id_proveedor], [id_mantenimiento], [numero_orden], [fecha_emision], [fecha_entrega_esperada], [estado], [subtotal], [igv], [total], [observaciones]) VALUES (68, 6, 37, N'ORD-0036', CAST(N'2025-07-03' AS Date), CAST(N'2025-07-07' AS Date), N'Pendiente', CAST(1000.00 AS Decimal(10, 2)), CAST(180.00 AS Decimal(10, 2)), CAST(1180.00 AS Decimal(10, 2)), N'Lubricación ejes')
INSERT [dbo].[OrdenCompra] ([id_orden], [id_proveedor], [id_mantenimiento], [numero_orden], [fecha_emision], [fecha_entrega_esperada], [estado], [subtotal], [igv], [total], [observaciones]) VALUES (69, 7, 38, N'ORD-0037', CAST(N'2025-07-03' AS Date), CAST(N'2025-07-08' AS Date), N'Pendiente', CAST(950.00 AS Decimal(10, 2)), CAST(171.00 AS Decimal(10, 2)), CAST(1121.00 AS Decimal(10, 2)), N'Verificación luces')
INSERT [dbo].[OrdenCompra] ([id_orden], [id_proveedor], [id_mantenimiento], [numero_orden], [fecha_emision], [fecha_entrega_esperada], [estado], [subtotal], [igv], [total], [observaciones]) VALUES (70, 8, 39, N'ORD-0038', CAST(N'2025-07-03' AS Date), CAST(N'2025-07-06' AS Date), N'Pendiente', CAST(870.00 AS Decimal(10, 2)), CAST(156.60 AS Decimal(10, 2)), CAST(1026.60 AS Decimal(10, 2)), N'Revisión final')
INSERT [dbo].[OrdenCompra] ([id_orden], [id_proveedor], [id_mantenimiento], [numero_orden], [fecha_emision], [fecha_entrega_esperada], [estado], [subtotal], [igv], [total], [observaciones]) VALUES (71, 9, 40, N'ORD-0039', CAST(N'2025-07-03' AS Date), CAST(N'2025-07-09' AS Date), N'Pendiente', CAST(1020.00 AS Decimal(10, 2)), CAST(183.60 AS Decimal(10, 2)), CAST(1203.60 AS Decimal(10, 2)), N'Entrega técnica')
INSERT [dbo].[OrdenCompra] ([id_orden], [id_proveedor], [id_mantenimiento], [numero_orden], [fecha_emision], [fecha_entrega_esperada], [estado], [subtotal], [igv], [total], [observaciones]) VALUES (72, 10, 41, N'ORD-0040', CAST(N'2025-07-03' AS Date), CAST(N'2025-07-07' AS Date), N'Pendiente', CAST(1060.00 AS Decimal(10, 2)), CAST(190.80 AS Decimal(10, 2)), CAST(1250.80 AS Decimal(10, 2)), N'Prueba operativa')
SET IDENTITY_INSERT [dbo].[OrdenCompra] OFF
GO
SET IDENTITY_INSERT [dbo].[ProgramacionMantenimiento] ON 

INSERT [dbo].[ProgramacionMantenimiento] ([id_programacion], [id_bus], [id_tipo], [fecha_programada], [kilometraje_estimado], [prioridad], [estado], [fecha_recordatorio]) VALUES (37, 1, 1, CAST(N'2024-07-15' AS Date), 10000, N'Rutina', N'Pendiente', CAST(N'2024-07-10' AS Date))
INSERT [dbo].[ProgramacionMantenimiento] ([id_programacion], [id_bus], [id_tipo], [fecha_programada], [kilometraje_estimado], [prioridad], [estado], [fecha_recordatorio]) VALUES (38, 2, 2, CAST(N'2024-08-01' AS Date), 12000, N'Media', N'Pendiente', CAST(N'2024-07-25' AS Date))
INSERT [dbo].[ProgramacionMantenimiento] ([id_programacion], [id_bus], [id_tipo], [fecha_programada], [kilometraje_estimado], [prioridad], [estado], [fecha_recordatorio]) VALUES (39, 3, 3, CAST(N'2024-07-20' AS Date), 9000, N'Rutina', N'Pendiente', CAST(N'2024-07-18' AS Date))
INSERT [dbo].[ProgramacionMantenimiento] ([id_programacion], [id_bus], [id_tipo], [fecha_programada], [kilometraje_estimado], [prioridad], [estado], [fecha_recordatorio]) VALUES (40, 4, 4, CAST(N'2024-08-05' AS Date), 15000, N'Media', N'Pendiente', CAST(N'2024-08-01' AS Date))
INSERT [dbo].[ProgramacionMantenimiento] ([id_programacion], [id_bus], [id_tipo], [fecha_programada], [kilometraje_estimado], [prioridad], [estado], [fecha_recordatorio]) VALUES (41, 5, 5, CAST(N'2024-07-25' AS Date), 14000, N'Alta', N'Pendiente', CAST(N'2024-07-20' AS Date))
INSERT [dbo].[ProgramacionMantenimiento] ([id_programacion], [id_bus], [id_tipo], [fecha_programada], [kilometraje_estimado], [prioridad], [estado], [fecha_recordatorio]) VALUES (42, 6, 6, CAST(N'2024-07-30' AS Date), 13000, N'Rutina', N'Pendiente', CAST(N'2024-07-26' AS Date))
INSERT [dbo].[ProgramacionMantenimiento] ([id_programacion], [id_bus], [id_tipo], [fecha_programada], [kilometraje_estimado], [prioridad], [estado], [fecha_recordatorio]) VALUES (43, 7, 7, CAST(N'2024-08-02' AS Date), 16000, N'Media', N'Pendiente', CAST(N'2024-07-28' AS Date))
INSERT [dbo].[ProgramacionMantenimiento] ([id_programacion], [id_bus], [id_tipo], [fecha_programada], [kilometraje_estimado], [prioridad], [estado], [fecha_recordatorio]) VALUES (44, 8, 8, CAST(N'2024-07-18' AS Date), 11000, N'Media', N'Pendiente', CAST(N'2024-07-15' AS Date))
INSERT [dbo].[ProgramacionMantenimiento] ([id_programacion], [id_bus], [id_tipo], [fecha_programada], [kilometraje_estimado], [prioridad], [estado], [fecha_recordatorio]) VALUES (45, 9, 9, CAST(N'2024-07-22' AS Date), 10500, N'Media', N'Pendiente', CAST(N'2024-07-20' AS Date))
INSERT [dbo].[ProgramacionMantenimiento] ([id_programacion], [id_bus], [id_tipo], [fecha_programada], [kilometraje_estimado], [prioridad], [estado], [fecha_recordatorio]) VALUES (46, 10, 10, CAST(N'2024-08-10' AS Date), 17000, N'Media', N'Pendiente', CAST(N'2024-08-05' AS Date))
INSERT [dbo].[ProgramacionMantenimiento] ([id_programacion], [id_bus], [id_tipo], [fecha_programada], [kilometraje_estimado], [prioridad], [estado], [fecha_recordatorio]) VALUES (47, 11, 11, CAST(N'2024-07-10' AS Date), 18000, N'Alta', N'En Proceso', CAST(N'2024-07-08' AS Date))
INSERT [dbo].[ProgramacionMantenimiento] ([id_programacion], [id_bus], [id_tipo], [fecha_programada], [kilometraje_estimado], [prioridad], [estado], [fecha_recordatorio]) VALUES (48, 12, 12, CAST(N'2024-07-12' AS Date), 12500, N'Urgente', N'En Proceso', CAST(N'2024-07-10' AS Date))
INSERT [dbo].[ProgramacionMantenimiento] ([id_programacion], [id_bus], [id_tipo], [fecha_programada], [kilometraje_estimado], [prioridad], [estado], [fecha_recordatorio]) VALUES (49, 13, 13, CAST(N'2024-07-28' AS Date), 15500, N'Urgente', N'Pendiente', CAST(N'2024-07-24' AS Date))
INSERT [dbo].[ProgramacionMantenimiento] ([id_programacion], [id_bus], [id_tipo], [fecha_programada], [kilometraje_estimado], [prioridad], [estado], [fecha_recordatorio]) VALUES (50, 14, 14, CAST(N'2024-08-12' AS Date), 19000, N'Urgente', N'Pendiente', CAST(N'2024-08-08' AS Date))
INSERT [dbo].[ProgramacionMantenimiento] ([id_programacion], [id_bus], [id_tipo], [fecha_programada], [kilometraje_estimado], [prioridad], [estado], [fecha_recordatorio]) VALUES (51, 15, 15, CAST(N'2024-07-27' AS Date), 13500, N'Alta', N'Pendiente', CAST(N'2024-07-23' AS Date))
INSERT [dbo].[ProgramacionMantenimiento] ([id_programacion], [id_bus], [id_tipo], [fecha_programada], [kilometraje_estimado], [prioridad], [estado], [fecha_recordatorio]) VALUES (52, 16, 16, CAST(N'2024-07-19' AS Date), 14500, N'Alta', N'En Proceso', CAST(N'2024-07-15' AS Date))
INSERT [dbo].[ProgramacionMantenimiento] ([id_programacion], [id_bus], [id_tipo], [fecha_programada], [kilometraje_estimado], [prioridad], [estado], [fecha_recordatorio]) VALUES (53, 17, 17, CAST(N'2024-08-03' AS Date), 16500, N'Media', N'Pendiente', CAST(N'2024-07-29' AS Date))
INSERT [dbo].[ProgramacionMantenimiento] ([id_programacion], [id_bus], [id_tipo], [fecha_programada], [kilometraje_estimado], [prioridad], [estado], [fecha_recordatorio]) VALUES (54, 18, 18, CAST(N'2024-08-06' AS Date), 17500, N'Alta', N'Pendiente', CAST(N'2024-08-01' AS Date))
INSERT [dbo].[ProgramacionMantenimiento] ([id_programacion], [id_bus], [id_tipo], [fecha_programada], [kilometraje_estimado], [prioridad], [estado], [fecha_recordatorio]) VALUES (55, 19, 19, CAST(N'2024-07-21' AS Date), 19500, N'Alta', N'Pendiente', CAST(N'2024-07-18' AS Date))
INSERT [dbo].[ProgramacionMantenimiento] ([id_programacion], [id_bus], [id_tipo], [fecha_programada], [kilometraje_estimado], [prioridad], [estado], [fecha_recordatorio]) VALUES (56, 20, 20, CAST(N'2024-07-29' AS Date), 20000, N'Media', N'Pendiente', CAST(N'2024-07-26' AS Date))
INSERT [dbo].[ProgramacionMantenimiento] ([id_programacion], [id_bus], [id_tipo], [fecha_programada], [kilometraje_estimado], [prioridad], [estado], [fecha_recordatorio]) VALUES (57, 21, 1, CAST(N'2024-07-16' AS Date), 10200, N'Media', N'Pendiente', CAST(N'2024-07-13' AS Date))
INSERT [dbo].[ProgramacionMantenimiento] ([id_programacion], [id_bus], [id_tipo], [fecha_programada], [kilometraje_estimado], [prioridad], [estado], [fecha_recordatorio]) VALUES (58, 22, 2, CAST(N'2024-07-17' AS Date), 10900, N'Media', N'Pendiente', CAST(N'2024-07-14' AS Date))
INSERT [dbo].[ProgramacionMantenimiento] ([id_programacion], [id_bus], [id_tipo], [fecha_programada], [kilometraje_estimado], [prioridad], [estado], [fecha_recordatorio]) VALUES (59, 23, 3, CAST(N'2024-07-23' AS Date), 9800, N'Alta', N'Pendiente', CAST(N'2024-07-20' AS Date))
INSERT [dbo].[ProgramacionMantenimiento] ([id_programacion], [id_bus], [id_tipo], [fecha_programada], [kilometraje_estimado], [prioridad], [estado], [fecha_recordatorio]) VALUES (60, 24, 4, CAST(N'2024-07-24' AS Date), 9400, N'Alta', N'Pendiente', CAST(N'2024-07-21' AS Date))
INSERT [dbo].[ProgramacionMantenimiento] ([id_programacion], [id_bus], [id_tipo], [fecha_programada], [kilometraje_estimado], [prioridad], [estado], [fecha_recordatorio]) VALUES (61, 25, 5, CAST(N'2024-07-26' AS Date), 8900, N'Media', N'Pendiente', CAST(N'2024-07-23' AS Date))
INSERT [dbo].[ProgramacionMantenimiento] ([id_programacion], [id_bus], [id_tipo], [fecha_programada], [kilometraje_estimado], [prioridad], [estado], [fecha_recordatorio]) VALUES (62, 26, 6, CAST(N'2024-08-04' AS Date), 11500, N'Media', N'Pendiente', CAST(N'2024-07-31' AS Date))
INSERT [dbo].[ProgramacionMantenimiento] ([id_programacion], [id_bus], [id_tipo], [fecha_programada], [kilometraje_estimado], [prioridad], [estado], [fecha_recordatorio]) VALUES (63, 27, 7, CAST(N'2024-08-09' AS Date), 11700, N'Rutina', N'Pendiente', CAST(N'2024-08-05' AS Date))
INSERT [dbo].[ProgramacionMantenimiento] ([id_programacion], [id_bus], [id_tipo], [fecha_programada], [kilometraje_estimado], [prioridad], [estado], [fecha_recordatorio]) VALUES (64, 28, 8, CAST(N'2024-08-11' AS Date), 12100, N'Media', N'Pendiente', CAST(N'2024-08-07' AS Date))
INSERT [dbo].[ProgramacionMantenimiento] ([id_programacion], [id_bus], [id_tipo], [fecha_programada], [kilometraje_estimado], [prioridad], [estado], [fecha_recordatorio]) VALUES (65, 29, 9, CAST(N'2024-08-13' AS Date), 12300, N'Alta', N'Pendiente', CAST(N'2024-08-09' AS Date))
INSERT [dbo].[ProgramacionMantenimiento] ([id_programacion], [id_bus], [id_tipo], [fecha_programada], [kilometraje_estimado], [prioridad], [estado], [fecha_recordatorio]) VALUES (66, 30, 10, CAST(N'2024-08-14' AS Date), 12500, N'Urgente', N'Pendiente', CAST(N'2024-08-10' AS Date))
INSERT [dbo].[ProgramacionMantenimiento] ([id_programacion], [id_bus], [id_tipo], [fecha_programada], [kilometraje_estimado], [prioridad], [estado], [fecha_recordatorio]) VALUES (67, 31, 11, CAST(N'2024-07-13' AS Date), 8800, N'Media', N'Pendiente', CAST(N'2024-07-10' AS Date))
INSERT [dbo].[ProgramacionMantenimiento] ([id_programacion], [id_bus], [id_tipo], [fecha_programada], [kilometraje_estimado], [prioridad], [estado], [fecha_recordatorio]) VALUES (68, 32, 12, CAST(N'2024-07-14' AS Date), 8700, N'Alta', N'Pendiente', CAST(N'2024-07-11' AS Date))
INSERT [dbo].[ProgramacionMantenimiento] ([id_programacion], [id_bus], [id_tipo], [fecha_programada], [kilometraje_estimado], [prioridad], [estado], [fecha_recordatorio]) VALUES (69, 33, 13, CAST(N'2024-07-31' AS Date), 8900, N'Rutina', N'Pendiente', CAST(N'2024-07-28' AS Date))
INSERT [dbo].[ProgramacionMantenimiento] ([id_programacion], [id_bus], [id_tipo], [fecha_programada], [kilometraje_estimado], [prioridad], [estado], [fecha_recordatorio]) VALUES (70, 34, 14, CAST(N'2024-08-15' AS Date), 9100, N'Media', N'Pendiente', CAST(N'2024-08-12' AS Date))
INSERT [dbo].[ProgramacionMantenimiento] ([id_programacion], [id_bus], [id_tipo], [fecha_programada], [kilometraje_estimado], [prioridad], [estado], [fecha_recordatorio]) VALUES (71, 35, 15, CAST(N'2024-08-16' AS Date), 9300, N'Urgente', N'Pendiente', CAST(N'2024-08-13' AS Date))
INSERT [dbo].[ProgramacionMantenimiento] ([id_programacion], [id_bus], [id_tipo], [fecha_programada], [kilometraje_estimado], [prioridad], [estado], [fecha_recordatorio]) VALUES (72, 36, 16, CAST(N'2024-08-17' AS Date), 9500, N'Media', N'Pendiente', CAST(N'2024-08-14' AS Date))
INSERT [dbo].[ProgramacionMantenimiento] ([id_programacion], [id_bus], [id_tipo], [fecha_programada], [kilometraje_estimado], [prioridad], [estado], [fecha_recordatorio]) VALUES (73, 37, 17, CAST(N'2024-08-18' AS Date), 9700, N'Alta', N'Pendiente', CAST(N'2024-08-15' AS Date))
INSERT [dbo].[ProgramacionMantenimiento] ([id_programacion], [id_bus], [id_tipo], [fecha_programada], [kilometraje_estimado], [prioridad], [estado], [fecha_recordatorio]) VALUES (74, 38, 18, CAST(N'2024-08-19' AS Date), 9900, N'Urgente', N'Pendiente', CAST(N'2024-08-16' AS Date))
INSERT [dbo].[ProgramacionMantenimiento] ([id_programacion], [id_bus], [id_tipo], [fecha_programada], [kilometraje_estimado], [prioridad], [estado], [fecha_recordatorio]) VALUES (75, 39, 19, CAST(N'2024-08-20' AS Date), 10100, N'Media', N'Pendiente', CAST(N'2024-08-17' AS Date))
INSERT [dbo].[ProgramacionMantenimiento] ([id_programacion], [id_bus], [id_tipo], [fecha_programada], [kilometraje_estimado], [prioridad], [estado], [fecha_recordatorio]) VALUES (76, 40, 20, CAST(N'2024-08-21' AS Date), 10300, N'Alta', N'Pendiente', CAST(N'2024-08-18' AS Date))
SET IDENTITY_INSERT [dbo].[ProgramacionMantenimiento] OFF
GO
SET IDENTITY_INSERT [dbo].[Proveedor] ON 

INSERT [dbo].[Proveedor] ([id_proveedor], [ruc], [razon_social], [contacto_principal], [telefono], [email], [direccion], [especialidad], [evaluacion_proveedor], [activo]) VALUES (1, N'20123456780', N'Repuestos Lucho S.A.C.', N'Luis Fernández', N'989123456', N'lfernandez@replucho.com', N'Av. Industrial 123, Lima', N'Repuestos', CAST(4.50 AS Decimal(3, 2)), N'1')
INSERT [dbo].[Proveedor] ([id_proveedor], [ruc], [razon_social], [contacto_principal], [telefono], [email], [direccion], [especialidad], [evaluacion_proveedor], [activo]) VALUES (2, N'20123456781', N'Soluciones Mecánicas SAC', N'Javier Ruiz', N'987654321', N'jruiz@solmec.pe', N'Jr. Junín 450, Arequipa', N'Mecánica', CAST(4.20 AS Decimal(3, 2)), N'1')
INSERT [dbo].[Proveedor] ([id_proveedor], [ruc], [razon_social], [contacto_principal], [telefono], [email], [direccion], [especialidad], [evaluacion_proveedor], [activo]) VALUES (3, N'20123456782', N'ElectroDiesel Perú', N'María Soto', N'986543210', N'msoto@ediesel.pe', N'Calle Tarata 123, Lima', N'Electricidad', CAST(4.70 AS Decimal(3, 2)), N'1')
INSERT [dbo].[Proveedor] ([id_proveedor], [ruc], [razon_social], [contacto_principal], [telefono], [email], [direccion], [especialidad], [evaluacion_proveedor], [activo]) VALUES (4, N'20123456783', N'Neumáticos del Sur', N'Carlos Ramos', N'985432109', N'carlos@neusur.com', N'Av. Grau 789, Cusco', N'Neumáticos', CAST(4.00 AS Decimal(3, 2)), N'1')
INSERT [dbo].[Proveedor] ([id_proveedor], [ruc], [razon_social], [contacto_principal], [telefono], [email], [direccion], [especialidad], [evaluacion_proveedor], [activo]) VALUES (5, N'20123456784', N'Carrocerías Andinas', N'Carmen Silva', N'984321098', N'csilva@carroandinas.pe', N'Av. Faucett 1210, Callao', N'Carrocería', CAST(3.90 AS Decimal(3, 2)), N'1')
INSERT [dbo].[Proveedor] ([id_proveedor], [ruc], [razon_social], [contacto_principal], [telefono], [email], [direccion], [especialidad], [evaluacion_proveedor], [activo]) VALUES (6, N'20123456785', N'Multiservicios JJ', N'José Paredes', N'983210987', N'jparedes@multi-jj.pe', N'Mza. G Lt. 6, Villa El Salvador', N'Mecánica', CAST(4.30 AS Decimal(3, 2)), N'1')
INSERT [dbo].[Proveedor] ([id_proveedor], [ruc], [razon_social], [contacto_principal], [telefono], [email], [direccion], [especialidad], [evaluacion_proveedor], [activo]) VALUES (7, N'20123456786', N'Frenos y Más', N'Lucía Huamán', N'982109876', N'lhuaman@fym.pe', N'Pasaje Los Andes 543, Trujillo', N'Repuestos', CAST(4.10 AS Decimal(3, 2)), N'1')
INSERT [dbo].[Proveedor] ([id_proveedor], [ruc], [razon_social], [contacto_principal], [telefono], [email], [direccion], [especialidad], [evaluacion_proveedor], [activo]) VALUES (8, N'20123456787', N'Proveedora Eléctrica SAC', N'Raúl Castro', N'981098765', N'rcastro@proel.pe', N'Av. Javier Prado 785, Lima', N'Electricidad', CAST(3.80 AS Decimal(3, 2)), N'1')
INSERT [dbo].[Proveedor] ([id_proveedor], [ruc], [razon_social], [contacto_principal], [telefono], [email], [direccion], [especialidad], [evaluacion_proveedor], [activo]) VALUES (9, N'20123456788', N'Tornillos Express', N'Alberto Chávez', N'980987654', N'achavez@tornillex.pe', N'Jr. Bolívar 120, Huancayo', N'Repuestos', CAST(4.40 AS Decimal(3, 2)), N'1')
INSERT [dbo].[Proveedor] ([id_proveedor], [ruc], [razon_social], [contacto_principal], [telefono], [email], [direccion], [especialidad], [evaluacion_proveedor], [activo]) VALUES (10, N'20123456789', N'Autopartes América', N'Daniela Quispe', N'979876543', N'dquispe@automer.pe', N'Av. América Sur 654, Trujillo', N'Repuestos', CAST(4.00 AS Decimal(3, 2)), N'1')
INSERT [dbo].[Proveedor] ([id_proveedor], [ruc], [razon_social], [contacto_principal], [telefono], [email], [direccion], [especialidad], [evaluacion_proveedor], [activo]) VALUES (11, N'20123456790', N'MotorPower S.A.C.', N'Miguel Inga', N'978765432', N'minga@motorpower.com', N'Calle Amazonas 456, Chiclayo', N'Mecánica', CAST(4.50 AS Decimal(3, 2)), N'1')
INSERT [dbo].[Proveedor] ([id_proveedor], [ruc], [razon_social], [contacto_principal], [telefono], [email], [direccion], [especialidad], [evaluacion_proveedor], [activo]) VALUES (12, N'20123456791', N'Energía Total S.A.', N'Marina Vera', N'977654321', N'mvera@energtotal.pe', N'Jr. San Martín 321, Lima', N'Electricidad', CAST(3.70 AS Decimal(3, 2)), N'1')
INSERT [dbo].[Proveedor] ([id_proveedor], [ruc], [razon_social], [contacto_principal], [telefono], [email], [direccion], [especialidad], [evaluacion_proveedor], [activo]) VALUES (13, N'20123456792', N'Andina Repuestos', N'Felipe Gutiérrez', N'976543210', N'fgutierrez@arep.pe', N'Calle Lima 120, Tacna', N'Repuestos', CAST(4.60 AS Decimal(3, 2)), N'1')
INSERT [dbo].[Proveedor] ([id_proveedor], [ruc], [razon_social], [contacto_principal], [telefono], [email], [direccion], [especialidad], [evaluacion_proveedor], [activo]) VALUES (14, N'20123456793', N'Autotecnica S.A.C.', N'Diana Poma', N'975432109', N'dpoma@autotec.pe', N'Av. Arequipa 210, Lima', N'Mecánica', CAST(4.20 AS Decimal(3, 2)), N'1')
INSERT [dbo].[Proveedor] ([id_proveedor], [ruc], [razon_social], [contacto_principal], [telefono], [email], [direccion], [especialidad], [evaluacion_proveedor], [activo]) VALUES (15, N'20123456794', N'Diesel Proveedores SAC', N'Juan Mejía', N'974321098', N'jmejia@dieselpro.pe', N'Jr. San Juan 105, Cajamarca', N'Repuestos', CAST(4.40 AS Decimal(3, 2)), N'1')
INSERT [dbo].[Proveedor] ([id_proveedor], [ruc], [razon_social], [contacto_principal], [telefono], [email], [direccion], [especialidad], [evaluacion_proveedor], [activo]) VALUES (16, N'20123456795', N'Carrocerías Nacionales', N'Oscar Ureta', N'973210987', N'oureta@carnac.pe', N'Carretera Central km 5, Ate', N'Carrocería', CAST(4.10 AS Decimal(3, 2)), N'1')
INSERT [dbo].[Proveedor] ([id_proveedor], [ruc], [razon_social], [contacto_principal], [telefono], [email], [direccion], [especialidad], [evaluacion_proveedor], [activo]) VALUES (17, N'20123456796', N'Electrobus Perú', N'Lorena Salas', N'972109876', N'lsalas@electrobus.pe', N'Av. Brasil 750, Lima', N'Electricidad', CAST(4.30 AS Decimal(3, 2)), N'1')
INSERT [dbo].[Proveedor] ([id_proveedor], [ruc], [razon_social], [contacto_principal], [telefono], [email], [direccion], [especialidad], [evaluacion_proveedor], [activo]) VALUES (18, N'20123456797', N'Full Neumáticos', N'Pedro Morán', N'971098765', N'pmoran@fullneumaticos.pe', N'Calle Los Incas 240, Piura', N'Neumáticos', CAST(3.90 AS Decimal(3, 2)), N'1')
INSERT [dbo].[Proveedor] ([id_proveedor], [ruc], [razon_social], [contacto_principal], [telefono], [email], [direccion], [especialidad], [evaluacion_proveedor], [activo]) VALUES (19, N'20123456798', N'Repuestos Rápidos', N'Nancy Huerta', N'970987654', N'nhuerta@reprap.pe', N'Av. Universitaria 450, Lima', N'Repuestos', CAST(4.10 AS Decimal(3, 2)), N'1')
INSERT [dbo].[Proveedor] ([id_proveedor], [ruc], [razon_social], [contacto_principal], [telefono], [email], [direccion], [especialidad], [evaluacion_proveedor], [activo]) VALUES (20, N'20123456799', N'MegaTech Perú', N'Alejandro Zevallos', N'969876543', N'azevallos@megatech.pe', N'Jr. Los Laureles 150, Huánuco', N'Electricidad', CAST(4.00 AS Decimal(3, 2)), N'1')
INSERT [dbo].[Proveedor] ([id_proveedor], [ruc], [razon_social], [contacto_principal], [telefono], [email], [direccion], [especialidad], [evaluacion_proveedor], [activo]) VALUES (21, N'20123456800', N'MotorGenius S.A.', N'Dalia Ticona', N'968765432', N'dticona@motorgenius.pe', N'Av. Aviación 1500, Lima', N'Mecánica', CAST(4.30 AS Decimal(3, 2)), N'1')
INSERT [dbo].[Proveedor] ([id_proveedor], [ruc], [razon_social], [contacto_principal], [telefono], [email], [direccion], [especialidad], [evaluacion_proveedor], [activo]) VALUES (22, N'20123456801', N'Inversiones y Repuestos El Sol', N'Carlos Núñez', N'967654321', N'cnunez@elsolrep.pe', N'Calle Santa Rosa 105, Lima', N'Repuestos', CAST(4.20 AS Decimal(3, 2)), N'1')
INSERT [dbo].[Proveedor] ([id_proveedor], [ruc], [razon_social], [contacto_principal], [telefono], [email], [direccion], [especialidad], [evaluacion_proveedor], [activo]) VALUES (23, N'20123456802', N'TecnoAuto S.A.C.', N'Edith Reyes', N'966543210', N'ereyes@tecauto.pe', N'Jr. Callao 333, Huacho', N'Electricidad', CAST(4.40 AS Decimal(3, 2)), N'1')
INSERT [dbo].[Proveedor] ([id_proveedor], [ruc], [razon_social], [contacto_principal], [telefono], [email], [direccion], [especialidad], [evaluacion_proveedor], [activo]) VALUES (24, N'20123456803', N'Todo Freno', N'Manuel Alva', N'965432109', N'malva@todofreno.pe', N'Av. Grau 890, Arequipa', N'Mecánica', CAST(3.80 AS Decimal(3, 2)), N'1')
INSERT [dbo].[Proveedor] ([id_proveedor], [ruc], [razon_social], [contacto_principal], [telefono], [email], [direccion], [especialidad], [evaluacion_proveedor], [activo]) VALUES (25, N'20123456804', N'Distribuciones Vega', N'Milagros Vega', N'964321098', N'mvega@disvega.pe', N'Calle Las Gardenias 305, Lima', N'Repuestos', CAST(4.00 AS Decimal(3, 2)), N'1')
INSERT [dbo].[Proveedor] ([id_proveedor], [ruc], [razon_social], [contacto_principal], [telefono], [email], [direccion], [especialidad], [evaluacion_proveedor], [activo]) VALUES (26, N'20123456805', N'Electroservice Perú', N'Alex Arévalo', N'963210987', N'aarevalo@elecser.pe', N'Jr. Huánuco 150, Iquitos', N'Electricidad', CAST(3.90 AS Decimal(3, 2)), N'1')
INSERT [dbo].[Proveedor] ([id_proveedor], [ruc], [razon_social], [contacto_principal], [telefono], [email], [direccion], [especialidad], [evaluacion_proveedor], [activo]) VALUES (27, N'20123456806', N'Neuma Center', N'Rocío Pérez', N'962109876', N'rperez@neumacenter.pe', N'Av. Bolívar 500, Cusco', N'Neumáticos', CAST(4.10 AS Decimal(3, 2)), N'1')
INSERT [dbo].[Proveedor] ([id_proveedor], [ruc], [razon_social], [contacto_principal], [telefono], [email], [direccion], [especialidad], [evaluacion_proveedor], [activo]) VALUES (28, N'20123456807', N'Repuestos Importados', N'Kevin López', N'961098765', N'klopez@repimport.pe', N'Av. Túpac Amaru 740, Lima', N'Repuestos', CAST(4.50 AS Decimal(3, 2)), N'1')
INSERT [dbo].[Proveedor] ([id_proveedor], [ruc], [razon_social], [contacto_principal], [telefono], [email], [direccion], [especialidad], [evaluacion_proveedor], [activo]) VALUES (29, N'20123456808', N'Mecánica del Norte', N'Gabriel Montoya', N'960987654', N'gmontoya@mecnorte.pe', N'Jr. Ayacucho 105, Cajamarca', N'Mecánica', CAST(4.20 AS Decimal(3, 2)), N'1')
INSERT [dbo].[Proveedor] ([id_proveedor], [ruc], [razon_social], [contacto_principal], [telefono], [email], [direccion], [especialidad], [evaluacion_proveedor], [activo]) VALUES (30, N'20123456809', N'Corporación TractoSur', N'Esther Aranda', N'959876543', N'earanda@tractosur.pe', N'Carretera Panamericana km 10, Ica', N'Carrocería', CAST(4.30 AS Decimal(3, 2)), N'1')
SET IDENTITY_INSERT [dbo].[Proveedor] OFF
GO
SET IDENTITY_INSERT [dbo].[RepuestoUtilizado] ON 

INSERT [dbo].[RepuestoUtilizado] ([id_repuesto], [id_mantenimiento], [codigo_repuesto], [descripcion], [cantidad], [unidad_medida], [costo_unitario], [numero_serie], [proveedor], [garantia_meses]) VALUES (1, 2, N'REP-001', N'Filtro de aceite', CAST(1.00 AS Decimal(10, 2)), N'unidad', CAST(25.00 AS Decimal(10, 2)), N'FILT12345', N'Repuestos S.A.', 6)
INSERT [dbo].[RepuestoUtilizado] ([id_repuesto], [id_mantenimiento], [codigo_repuesto], [descripcion], [cantidad], [unidad_medida], [costo_unitario], [numero_serie], [proveedor], [garantia_meses]) VALUES (2, 3, N'REP-002', N'Filtro de aire', CAST(1.00 AS Decimal(10, 2)), N'unidad', CAST(35.00 AS Decimal(10, 2)), N'AIRE12345', N'Repuestos S.A.', 6)
INSERT [dbo].[RepuestoUtilizado] ([id_repuesto], [id_mantenimiento], [codigo_repuesto], [descripcion], [cantidad], [unidad_medida], [costo_unitario], [numero_serie], [proveedor], [garantia_meses]) VALUES (3, 4, N'REP-003', N'Aceite sintético 15W40', CAST(4.00 AS Decimal(10, 2)), N'litros', CAST(12.00 AS Decimal(10, 2)), NULL, N'Lubricantes Perú', 0)
INSERT [dbo].[RepuestoUtilizado] ([id_repuesto], [id_mantenimiento], [codigo_repuesto], [descripcion], [cantidad], [unidad_medida], [costo_unitario], [numero_serie], [proveedor], [garantia_meses]) VALUES (4, 5, N'REP-004', N'Pastillas de freno', CAST(2.00 AS Decimal(10, 2)), N'unidad', CAST(45.00 AS Decimal(10, 2)), N'FREN12345', N'Frenos del Sur', 12)
INSERT [dbo].[RepuestoUtilizado] ([id_repuesto], [id_mantenimiento], [codigo_repuesto], [descripcion], [cantidad], [unidad_medida], [costo_unitario], [numero_serie], [proveedor], [garantia_meses]) VALUES (5, 6, N'REP-005', N'Batería 12V', CAST(1.00 AS Decimal(10, 2)), N'unidad', CAST(300.00 AS Decimal(10, 2)), N'BAT12345', N'PowerBat', 24)
INSERT [dbo].[RepuestoUtilizado] ([id_repuesto], [id_mantenimiento], [codigo_repuesto], [descripcion], [cantidad], [unidad_medida], [costo_unitario], [numero_serie], [proveedor], [garantia_meses]) VALUES (6, 7, N'REP-006', N'Llanta radial 195', CAST(1.00 AS Decimal(10, 2)), N'unidad', CAST(180.00 AS Decimal(10, 2)), N'LLAN12345', N'Neumáticos Andes', 12)
INSERT [dbo].[RepuestoUtilizado] ([id_repuesto], [id_mantenimiento], [codigo_repuesto], [descripcion], [cantidad], [unidad_medida], [costo_unitario], [numero_serie], [proveedor], [garantia_meses]) VALUES (7, 8, N'REP-007', N'Filtro de combustible', CAST(1.00 AS Decimal(10, 2)), N'unidad', CAST(30.00 AS Decimal(10, 2)), N'COMB12345', N'Repuestos S.A.', 6)
INSERT [dbo].[RepuestoUtilizado] ([id_repuesto], [id_mantenimiento], [codigo_repuesto], [descripcion], [cantidad], [unidad_medida], [costo_unitario], [numero_serie], [proveedor], [garantia_meses]) VALUES (8, 9, N'REP-008', N'Lámpara LED frontal', CAST(2.00 AS Decimal(10, 2)), N'unidad', CAST(20.00 AS Decimal(10, 2)), N'LED12345', N'Electricidad SAC', 12)
INSERT [dbo].[RepuestoUtilizado] ([id_repuesto], [id_mantenimiento], [codigo_repuesto], [descripcion], [cantidad], [unidad_medida], [costo_unitario], [numero_serie], [proveedor], [garantia_meses]) VALUES (9, 10, N'REP-009', N'Correa de distribución', CAST(1.00 AS Decimal(10, 2)), N'unidad', CAST(90.00 AS Decimal(10, 2)), N'CORR12345', N'Motores y Más', 12)
INSERT [dbo].[RepuestoUtilizado] ([id_repuesto], [id_mantenimiento], [codigo_repuesto], [descripcion], [cantidad], [unidad_medida], [costo_unitario], [numero_serie], [proveedor], [garantia_meses]) VALUES (10, 11, N'REP-010', N'Sensor de temperatura', CAST(1.00 AS Decimal(10, 2)), N'unidad', CAST(75.00 AS Decimal(10, 2)), N'TEMP12345', N'ElectroTech', 12)
INSERT [dbo].[RepuestoUtilizado] ([id_repuesto], [id_mantenimiento], [codigo_repuesto], [descripcion], [cantidad], [unidad_medida], [costo_unitario], [numero_serie], [proveedor], [garantia_meses]) VALUES (11, 12, N'REP-011', N'Aceite de caja', CAST(3.00 AS Decimal(10, 2)), N'litros', CAST(14.00 AS Decimal(10, 2)), NULL, N'Lubricantes Perú', 0)
INSERT [dbo].[RepuestoUtilizado] ([id_repuesto], [id_mantenimiento], [codigo_repuesto], [descripcion], [cantidad], [unidad_medida], [costo_unitario], [numero_serie], [proveedor], [garantia_meses]) VALUES (12, 13, N'REP-012', N'Ventilador de motor', CAST(1.00 AS Decimal(10, 2)), N'unidad', CAST(150.00 AS Decimal(10, 2)), N'VENT12345', N'Motores y Más', 12)
INSERT [dbo].[RepuestoUtilizado] ([id_repuesto], [id_mantenimiento], [codigo_repuesto], [descripcion], [cantidad], [unidad_medida], [costo_unitario], [numero_serie], [proveedor], [garantia_meses]) VALUES (13, 14, N'REP-013', N'Limpia parabrisas', CAST(1.00 AS Decimal(10, 2)), N'unidad', CAST(18.00 AS Decimal(10, 2)), N'PARA12345', N'AutoEquipos', 6)
INSERT [dbo].[RepuestoUtilizado] ([id_repuesto], [id_mantenimiento], [codigo_repuesto], [descripcion], [cantidad], [unidad_medida], [costo_unitario], [numero_serie], [proveedor], [garantia_meses]) VALUES (14, 15, N'REP-014', N'Termostato', CAST(1.00 AS Decimal(10, 2)), N'unidad', CAST(70.00 AS Decimal(10, 2)), N'TERM12345', N'ElectroTech', 12)
INSERT [dbo].[RepuestoUtilizado] ([id_repuesto], [id_mantenimiento], [codigo_repuesto], [descripcion], [cantidad], [unidad_medida], [costo_unitario], [numero_serie], [proveedor], [garantia_meses]) VALUES (15, 16, N'REP-015', N'Fusible 20A', CAST(4.00 AS Decimal(10, 2)), N'unidad', CAST(3.00 AS Decimal(10, 2)), NULL, N'Electricidad SAC', 0)
INSERT [dbo].[RepuestoUtilizado] ([id_repuesto], [id_mantenimiento], [codigo_repuesto], [descripcion], [cantidad], [unidad_medida], [costo_unitario], [numero_serie], [proveedor], [garantia_meses]) VALUES (16, 17, N'REP-016', N'Espejo lateral derecho', CAST(1.00 AS Decimal(10, 2)), N'unidad', CAST(55.00 AS Decimal(10, 2)), N'ESP12345', N'Carrocerías J&M', 6)
INSERT [dbo].[RepuestoUtilizado] ([id_repuesto], [id_mantenimiento], [codigo_repuesto], [descripcion], [cantidad], [unidad_medida], [costo_unitario], [numero_serie], [proveedor], [garantia_meses]) VALUES (17, 18, N'REP-017', N'Disco de freno', CAST(2.00 AS Decimal(10, 2)), N'unidad', CAST(110.00 AS Decimal(10, 2)), N'DISC12345', N'Frenos del Sur', 12)
INSERT [dbo].[RepuestoUtilizado] ([id_repuesto], [id_mantenimiento], [codigo_repuesto], [descripcion], [cantidad], [unidad_medida], [costo_unitario], [numero_serie], [proveedor], [garantia_meses]) VALUES (18, 19, N'REP-018', N'Amortiguador delantero', CAST(2.00 AS Decimal(10, 2)), N'unidad', CAST(130.00 AS Decimal(10, 2)), N'AMOR12345', N'Suspensiones SAC', 12)
INSERT [dbo].[RepuestoUtilizado] ([id_repuesto], [id_mantenimiento], [codigo_repuesto], [descripcion], [cantidad], [unidad_medida], [costo_unitario], [numero_serie], [proveedor], [garantia_meses]) VALUES (19, 20, N'REP-019', N'Refrigerante motor', CAST(3.00 AS Decimal(10, 2)), N'litros', CAST(15.00 AS Decimal(10, 2)), NULL, N'Lubricantes Perú', 0)
INSERT [dbo].[RepuestoUtilizado] ([id_repuesto], [id_mantenimiento], [codigo_repuesto], [descripcion], [cantidad], [unidad_medida], [costo_unitario], [numero_serie], [proveedor], [garantia_meses]) VALUES (20, 21, N'REP-020', N'Filtro de habitáculo', CAST(1.00 AS Decimal(10, 2)), N'unidad', CAST(20.00 AS Decimal(10, 2)), N'HAB12345', N'Repuestos S.A.', 6)
INSERT [dbo].[RepuestoUtilizado] ([id_repuesto], [id_mantenimiento], [codigo_repuesto], [descripcion], [cantidad], [unidad_medida], [costo_unitario], [numero_serie], [proveedor], [garantia_meses]) VALUES (21, 22, N'REP-021', N'Bobina de encendido', CAST(1.00 AS Decimal(10, 2)), N'unidad', CAST(85.00 AS Decimal(10, 2)), N'BOB12345', N'Electricidad SAC', 12)
INSERT [dbo].[RepuestoUtilizado] ([id_repuesto], [id_mantenimiento], [codigo_repuesto], [descripcion], [cantidad], [unidad_medida], [costo_unitario], [numero_serie], [proveedor], [garantia_meses]) VALUES (22, 23, N'REP-022', N'Relé electrónico', CAST(1.00 AS Decimal(10, 2)), N'unidad', CAST(22.00 AS Decimal(10, 2)), N'RELE12345', N'ElectroTech', 6)
INSERT [dbo].[RepuestoUtilizado] ([id_repuesto], [id_mantenimiento], [codigo_repuesto], [descripcion], [cantidad], [unidad_medida], [costo_unitario], [numero_serie], [proveedor], [garantia_meses]) VALUES (23, 24, N'REP-023', N'Rodamiento de rueda', CAST(1.00 AS Decimal(10, 2)), N'unidad', CAST(45.00 AS Decimal(10, 2)), N'ROD12345', N'Ruedas S.A.', 12)
INSERT [dbo].[RepuestoUtilizado] ([id_repuesto], [id_mantenimiento], [codigo_repuesto], [descripcion], [cantidad], [unidad_medida], [costo_unitario], [numero_serie], [proveedor], [garantia_meses]) VALUES (24, 25, N'REP-024', N'Tapón de aceite', CAST(1.00 AS Decimal(10, 2)), N'unidad', CAST(7.00 AS Decimal(10, 2)), N'TAP12345', N'Repuestos S.A.', 6)
INSERT [dbo].[RepuestoUtilizado] ([id_repuesto], [id_mantenimiento], [codigo_repuesto], [descripcion], [cantidad], [unidad_medida], [costo_unitario], [numero_serie], [proveedor], [garantia_meses]) VALUES (25, 26, N'REP-025', N'Soporte motor', CAST(1.00 AS Decimal(10, 2)), N'unidad', CAST(90.00 AS Decimal(10, 2)), N'SOP12345', N'Motores y Más', 12)
INSERT [dbo].[RepuestoUtilizado] ([id_repuesto], [id_mantenimiento], [codigo_repuesto], [descripcion], [cantidad], [unidad_medida], [costo_unitario], [numero_serie], [proveedor], [garantia_meses]) VALUES (26, 27, N'REP-026', N'Antena de radio', CAST(1.00 AS Decimal(10, 2)), N'unidad', CAST(25.00 AS Decimal(10, 2)), N'ANT12345', N'AutoEquipos', 6)
INSERT [dbo].[RepuestoUtilizado] ([id_repuesto], [id_mantenimiento], [codigo_repuesto], [descripcion], [cantidad], [unidad_medida], [costo_unitario], [numero_serie], [proveedor], [garantia_meses]) VALUES (27, 28, N'REP-027', N'Luces intermitentes', CAST(4.00 AS Decimal(10, 2)), N'unidad', CAST(10.00 AS Decimal(10, 2)), N'INT12345', N'Electricidad SAC', 6)
INSERT [dbo].[RepuestoUtilizado] ([id_repuesto], [id_mantenimiento], [codigo_repuesto], [descripcion], [cantidad], [unidad_medida], [costo_unitario], [numero_serie], [proveedor], [garantia_meses]) VALUES (28, 29, N'REP-028', N'Relevo de arranque', CAST(1.00 AS Decimal(10, 2)), N'unidad', CAST(35.00 AS Decimal(10, 2)), N'ARR12345', N'ElectroTech', 12)
INSERT [dbo].[RepuestoUtilizado] ([id_repuesto], [id_mantenimiento], [codigo_repuesto], [descripcion], [cantidad], [unidad_medida], [costo_unitario], [numero_serie], [proveedor], [garantia_meses]) VALUES (29, 30, N'REP-029', N'Caja de fusibles', CAST(1.00 AS Decimal(10, 2)), N'unidad', CAST(60.00 AS Decimal(10, 2)), N'FUS12345', N'Electricidad SAC', 12)
INSERT [dbo].[RepuestoUtilizado] ([id_repuesto], [id_mantenimiento], [codigo_repuesto], [descripcion], [cantidad], [unidad_medida], [costo_unitario], [numero_serie], [proveedor], [garantia_meses]) VALUES (30, 31, N'REP-030', N'Tapizado de asiento', CAST(1.00 AS Decimal(10, 2)), N'unidad', CAST(100.00 AS Decimal(10, 2)), N'TAPIZ12345', N'Carrocerías J&M', 12)
INSERT [dbo].[RepuestoUtilizado] ([id_repuesto], [id_mantenimiento], [codigo_repuesto], [descripcion], [cantidad], [unidad_medida], [costo_unitario], [numero_serie], [proveedor], [garantia_meses]) VALUES (31, 32, N'REP-031', N'Cable de batería', CAST(1.00 AS Decimal(10, 2)), N'unidad', CAST(15.00 AS Decimal(10, 2)), N'CAB12345', N'PowerBat', 6)
INSERT [dbo].[RepuestoUtilizado] ([id_repuesto], [id_mantenimiento], [codigo_repuesto], [descripcion], [cantidad], [unidad_medida], [costo_unitario], [numero_serie], [proveedor], [garantia_meses]) VALUES (32, 33, N'REP-032', N'Manguera de radiador', CAST(1.00 AS Decimal(10, 2)), N'unidad', CAST(20.00 AS Decimal(10, 2)), N'RADI12345', N'Motores y Más', 6)
INSERT [dbo].[RepuestoUtilizado] ([id_repuesto], [id_mantenimiento], [codigo_repuesto], [descripcion], [cantidad], [unidad_medida], [costo_unitario], [numero_serie], [proveedor], [garantia_meses]) VALUES (33, 34, N'REP-033', N'Valvula EGR', CAST(1.00 AS Decimal(10, 2)), N'unidad', CAST(180.00 AS Decimal(10, 2)), N'EGR12345', N'Repuestos S.A.', 12)
INSERT [dbo].[RepuestoUtilizado] ([id_repuesto], [id_mantenimiento], [codigo_repuesto], [descripcion], [cantidad], [unidad_medida], [costo_unitario], [numero_serie], [proveedor], [garantia_meses]) VALUES (34, 35, N'REP-034', N'Sensor ABS', CAST(1.00 AS Decimal(10, 2)), N'unidad', CAST(95.00 AS Decimal(10, 2)), N'ABS12345', N'ElectroTech', 12)
INSERT [dbo].[RepuestoUtilizado] ([id_repuesto], [id_mantenimiento], [codigo_repuesto], [descripcion], [cantidad], [unidad_medida], [costo_unitario], [numero_serie], [proveedor], [garantia_meses]) VALUES (35, 36, N'REP-035', N'Limpiador de inyectores', CAST(2.00 AS Decimal(10, 2)), N'unidad', CAST(22.00 AS Decimal(10, 2)), NULL, N'Lubricantes Perú', 0)
INSERT [dbo].[RepuestoUtilizado] ([id_repuesto], [id_mantenimiento], [codigo_repuesto], [descripcion], [cantidad], [unidad_medida], [costo_unitario], [numero_serie], [proveedor], [garantia_meses]) VALUES (36, 37, N'REP-036', N'Motor de limpiaparabrisas', CAST(1.00 AS Decimal(10, 2)), N'unidad', CAST(120.00 AS Decimal(10, 2)), N'MOTLIM123', N'AutoEquipos', 12)
INSERT [dbo].[RepuestoUtilizado] ([id_repuesto], [id_mantenimiento], [codigo_repuesto], [descripcion], [cantidad], [unidad_medida], [costo_unitario], [numero_serie], [proveedor], [garantia_meses]) VALUES (37, 38, N'REP-037', N'Sensor de oxígeno', CAST(1.00 AS Decimal(10, 2)), N'unidad', CAST(100.00 AS Decimal(10, 2)), N'OXY12345', N'ElectroTech', 12)
INSERT [dbo].[RepuestoUtilizado] ([id_repuesto], [id_mantenimiento], [codigo_repuesto], [descripcion], [cantidad], [unidad_medida], [costo_unitario], [numero_serie], [proveedor], [garantia_meses]) VALUES (38, 39, N'REP-038', N'Tornillos de culata', CAST(8.00 AS Decimal(10, 2)), N'unidad', CAST(3.50 AS Decimal(10, 2)), NULL, N'Motores y Más', 6)
INSERT [dbo].[RepuestoUtilizado] ([id_repuesto], [id_mantenimiento], [codigo_repuesto], [descripcion], [cantidad], [unidad_medida], [costo_unitario], [numero_serie], [proveedor], [garantia_meses]) VALUES (39, 40, N'REP-039', N'Empaque de tapa válvulas', CAST(1.00 AS Decimal(10, 2)), N'unidad', CAST(18.00 AS Decimal(10, 2)), N'VAL12345', N'Repuestos S.A.', 6)
INSERT [dbo].[RepuestoUtilizado] ([id_repuesto], [id_mantenimiento], [codigo_repuesto], [descripcion], [cantidad], [unidad_medida], [costo_unitario], [numero_serie], [proveedor], [garantia_meses]) VALUES (40, 41, N'REP-040', N'Soporte de alternador', CAST(1.00 AS Decimal(10, 2)), N'unidad', CAST(50.00 AS Decimal(10, 2)), N'ALT12345', N'Motores y Más', 12)
SET IDENTITY_INSERT [dbo].[RepuestoUtilizado] OFF
GO
SET IDENTITY_INSERT [dbo].[Ruta] ON 

INSERT [dbo].[Ruta] ([id_ruta], [codigo_ruta], [nombre_ruta], [origen], [destino], [distancia_km], [tipo_terreno], [tiempo_estimado_horas], [nivel_dificultad]) VALUES (1, N'RUTA001', N'Lima - Callao', N'Lima', N'Callao', CAST(15.30 AS Decimal(10, 2)), N'Urbano', CAST(0.75 AS Decimal(5, 2)), N'Bajo')
INSERT [dbo].[Ruta] ([id_ruta], [codigo_ruta], [nombre_ruta], [origen], [destino], [distancia_km], [tipo_terreno], [tiempo_estimado_horas], [nivel_dificultad]) VALUES (2, N'RUTA002', N'Lima - Huacho', N'Lima', N'Huacho', CAST(140.00 AS Decimal(10, 2)), N'Interurbano', CAST(2.50 AS Decimal(5, 2)), N'Medio')
INSERT [dbo].[Ruta] ([id_ruta], [codigo_ruta], [nombre_ruta], [origen], [destino], [distancia_km], [tipo_terreno], [tiempo_estimado_horas], [nivel_dificultad]) VALUES (3, N'RUTA003', N'Lima - Chosica', N'Lima', N'Chosica', CAST(38.50 AS Decimal(10, 2)), N'Interurbano', CAST(1.20 AS Decimal(5, 2)), N'Bajo')
INSERT [dbo].[Ruta] ([id_ruta], [codigo_ruta], [nombre_ruta], [origen], [destino], [distancia_km], [tipo_terreno], [tiempo_estimado_horas], [nivel_dificultad]) VALUES (4, N'RUTA004', N'Lima - Cañete', N'Lima', N'Cañete', CAST(144.70 AS Decimal(10, 2)), N'Interurbano', CAST(2.40 AS Decimal(5, 2)), N'Medio')
INSERT [dbo].[Ruta] ([id_ruta], [codigo_ruta], [nombre_ruta], [origen], [destino], [distancia_km], [tipo_terreno], [tiempo_estimado_horas], [nivel_dificultad]) VALUES (5, N'RUTA005', N'Cañete - Chincha', N'Cañete', N'Chincha', CAST(91.80 AS Decimal(10, 2)), N'Interurbano', CAST(1.50 AS Decimal(5, 2)), N'Medio')
INSERT [dbo].[Ruta] ([id_ruta], [codigo_ruta], [nombre_ruta], [origen], [destino], [distancia_km], [tipo_terreno], [tiempo_estimado_horas], [nivel_dificultad]) VALUES (6, N'RUTA006', N'Lima - Huaral', N'Lima', N'Huaral', CAST(82.10 AS Decimal(10, 2)), N'Interurbano', CAST(2.00 AS Decimal(5, 2)), N'Medio')
INSERT [dbo].[Ruta] ([id_ruta], [codigo_ruta], [nombre_ruta], [origen], [destino], [distancia_km], [tipo_terreno], [tiempo_estimado_horas], [nivel_dificultad]) VALUES (7, N'RUTA007', N'Huaral - Oyón', N'Huaral', N'Oyón', CAST(145.60 AS Decimal(10, 2)), N'Montañoso', CAST(4.50 AS Decimal(5, 2)), N'Alto')
INSERT [dbo].[Ruta] ([id_ruta], [codigo_ruta], [nombre_ruta], [origen], [destino], [distancia_km], [tipo_terreno], [tiempo_estimado_horas], [nivel_dificultad]) VALUES (8, N'RUTA008', N'Lima - Huaraz', N'Lima', N'Huaraz', CAST(400.00 AS Decimal(10, 2)), N'Montañoso', CAST(7.00 AS Decimal(5, 2)), N'Alto')
INSERT [dbo].[Ruta] ([id_ruta], [codigo_ruta], [nombre_ruta], [origen], [destino], [distancia_km], [tipo_terreno], [tiempo_estimado_horas], [nivel_dificultad]) VALUES (9, N'RUTA009', N'Lima - Ica', N'Lima', N'Ica', CAST(320.00 AS Decimal(10, 2)), N'Interurbano', CAST(5.00 AS Decimal(5, 2)), N'Medio')
INSERT [dbo].[Ruta] ([id_ruta], [codigo_ruta], [nombre_ruta], [origen], [destino], [distancia_km], [tipo_terreno], [tiempo_estimado_horas], [nivel_dificultad]) VALUES (10, N'RUTA010', N'Lima - Arequipa', N'Lima', N'Arequipa', CAST(1000.00 AS Decimal(10, 2)), N'Desértico', CAST(17.00 AS Decimal(5, 2)), N'Alto')
INSERT [dbo].[Ruta] ([id_ruta], [codigo_ruta], [nombre_ruta], [origen], [destino], [distancia_km], [tipo_terreno], [tiempo_estimado_horas], [nivel_dificultad]) VALUES (11, N'RUTA011', N'Ica - Nazca', N'Ica', N'Nazca', CAST(150.00 AS Decimal(10, 2)), N'Desértico', CAST(2.50 AS Decimal(5, 2)), N'Medio')
INSERT [dbo].[Ruta] ([id_ruta], [codigo_ruta], [nombre_ruta], [origen], [destino], [distancia_km], [tipo_terreno], [tiempo_estimado_horas], [nivel_dificultad]) VALUES (12, N'RUTA012', N'Nazca - Cusco', N'Nazca', N'Cusco', CAST(630.00 AS Decimal(10, 2)), N'Montañoso', CAST(12.00 AS Decimal(5, 2)), N'Alto')
INSERT [dbo].[Ruta] ([id_ruta], [codigo_ruta], [nombre_ruta], [origen], [destino], [distancia_km], [tipo_terreno], [tiempo_estimado_horas], [nivel_dificultad]) VALUES (13, N'RUTA013', N'Cusco - Puno', N'Cusco', N'Puno', CAST(387.00 AS Decimal(10, 2)), N'Montañoso', CAST(8.00 AS Decimal(5, 2)), N'Medio')
INSERT [dbo].[Ruta] ([id_ruta], [codigo_ruta], [nombre_ruta], [origen], [destino], [distancia_km], [tipo_terreno], [tiempo_estimado_horas], [nivel_dificultad]) VALUES (14, N'RUTA014', N'Puno - Arequipa', N'Puno', N'Arequipa', CAST(292.00 AS Decimal(10, 2)), N'Montañoso', CAST(6.00 AS Decimal(5, 2)), N'Medio')
INSERT [dbo].[Ruta] ([id_ruta], [codigo_ruta], [nombre_ruta], [origen], [destino], [distancia_km], [tipo_terreno], [tiempo_estimado_horas], [nivel_dificultad]) VALUES (15, N'RUTA015', N'Arequipa - Moquegua', N'Arequipa', N'Moquegua', CAST(250.00 AS Decimal(10, 2)), N'Interurbano', CAST(4.30 AS Decimal(5, 2)), N'Medio')
INSERT [dbo].[Ruta] ([id_ruta], [codigo_ruta], [nombre_ruta], [origen], [destino], [distancia_km], [tipo_terreno], [tiempo_estimado_horas], [nivel_dificultad]) VALUES (16, N'RUTA016', N'Moquegua - Tacna', N'Moquegua', N'Tacna', CAST(160.00 AS Decimal(10, 2)), N'Interurbano', CAST(3.00 AS Decimal(5, 2)), N'Bajo')
INSERT [dbo].[Ruta] ([id_ruta], [codigo_ruta], [nombre_ruta], [origen], [destino], [distancia_km], [tipo_terreno], [tiempo_estimado_horas], [nivel_dificultad]) VALUES (17, N'RUTA017', N'Lima - Pucallpa', N'Lima', N'Pucallpa', CAST(700.00 AS Decimal(10, 2)), N'Montañoso', CAST(14.00 AS Decimal(5, 2)), N'Alto')
INSERT [dbo].[Ruta] ([id_ruta], [codigo_ruta], [nombre_ruta], [origen], [destino], [distancia_km], [tipo_terreno], [tiempo_estimado_horas], [nivel_dificultad]) VALUES (18, N'RUTA018', N'Lima - Tarapoto', N'Lima', N'Tarapoto', CAST(950.00 AS Decimal(10, 2)), N'Montañoso', CAST(16.00 AS Decimal(5, 2)), N'Alto')
INSERT [dbo].[Ruta] ([id_ruta], [codigo_ruta], [nombre_ruta], [origen], [destino], [distancia_km], [tipo_terreno], [tiempo_estimado_horas], [nivel_dificultad]) VALUES (19, N'RUTA019', N'Lima - Trujillo', N'Lima', N'Trujillo', CAST(560.00 AS Decimal(10, 2)), N'Interurbano', CAST(9.00 AS Decimal(5, 2)), N'Medio')
INSERT [dbo].[Ruta] ([id_ruta], [codigo_ruta], [nombre_ruta], [origen], [destino], [distancia_km], [tipo_terreno], [tiempo_estimado_horas], [nivel_dificultad]) VALUES (20, N'RUTA020', N'Trujillo - Chiclayo', N'Trujillo', N'Chiclayo', CAST(209.00 AS Decimal(10, 2)), N'Interurbano', CAST(3.20 AS Decimal(5, 2)), N'Bajo')
INSERT [dbo].[Ruta] ([id_ruta], [codigo_ruta], [nombre_ruta], [origen], [destino], [distancia_km], [tipo_terreno], [tiempo_estimado_horas], [nivel_dificultad]) VALUES (21, N'RUTA021', N'Chiclayo - Piura', N'Chiclayo', N'Piura', CAST(210.00 AS Decimal(10, 2)), N'Desértico', CAST(3.50 AS Decimal(5, 2)), N'Bajo')
INSERT [dbo].[Ruta] ([id_ruta], [codigo_ruta], [nombre_ruta], [origen], [destino], [distancia_km], [tipo_terreno], [tiempo_estimado_horas], [nivel_dificultad]) VALUES (22, N'RUTA022', N'Piura - Tumbes', N'Piura', N'Tumbes', CAST(290.00 AS Decimal(10, 2)), N'Desértico', CAST(4.50 AS Decimal(5, 2)), N'Medio')
INSERT [dbo].[Ruta] ([id_ruta], [codigo_ruta], [nombre_ruta], [origen], [destino], [distancia_km], [tipo_terreno], [tiempo_estimado_horas], [nivel_dificultad]) VALUES (23, N'RUTA023', N'Lima - Huancayo', N'Lima', N'Huancayo', CAST(300.00 AS Decimal(10, 2)), N'Montañoso', CAST(7.00 AS Decimal(5, 2)), N'Alto')
INSERT [dbo].[Ruta] ([id_ruta], [codigo_ruta], [nombre_ruta], [origen], [destino], [distancia_km], [tipo_terreno], [tiempo_estimado_horas], [nivel_dificultad]) VALUES (24, N'RUTA024', N'Huancayo - Ayacucho', N'Huancayo', N'Ayacucho', CAST(250.00 AS Decimal(10, 2)), N'Montañoso', CAST(6.00 AS Decimal(5, 2)), N'Alto')
INSERT [dbo].[Ruta] ([id_ruta], [codigo_ruta], [nombre_ruta], [origen], [destino], [distancia_km], [tipo_terreno], [tiempo_estimado_horas], [nivel_dificultad]) VALUES (25, N'RUTA025', N'Ayacucho - Andahuaylas', N'Ayacucho', N'Andahuaylas', CAST(200.00 AS Decimal(10, 2)), N'Montañoso', CAST(5.00 AS Decimal(5, 2)), N'Alto')
INSERT [dbo].[Ruta] ([id_ruta], [codigo_ruta], [nombre_ruta], [origen], [destino], [distancia_km], [tipo_terreno], [tiempo_estimado_horas], [nivel_dificultad]) VALUES (26, N'RUTA026', N'Andahuaylas - Abancay', N'Andahuaylas', N'Abancay', CAST(150.00 AS Decimal(10, 2)), N'Montañoso', CAST(3.50 AS Decimal(5, 2)), N'Medio')
INSERT [dbo].[Ruta] ([id_ruta], [codigo_ruta], [nombre_ruta], [origen], [destino], [distancia_km], [tipo_terreno], [tiempo_estimado_horas], [nivel_dificultad]) VALUES (27, N'RUTA027', N'Abancay - Cusco', N'Abancay', N'Cusco', CAST(190.00 AS Decimal(10, 2)), N'Montañoso', CAST(4.00 AS Decimal(5, 2)), N'Medio')
INSERT [dbo].[Ruta] ([id_ruta], [codigo_ruta], [nombre_ruta], [origen], [destino], [distancia_km], [tipo_terreno], [tiempo_estimado_horas], [nivel_dificultad]) VALUES (28, N'RUTA028', N'Lima - Cerro de Pasco', N'Lima', N'Cerro de Pasco', CAST(295.00 AS Decimal(10, 2)), N'Montañoso', CAST(6.00 AS Decimal(5, 2)), N'Alto')
INSERT [dbo].[Ruta] ([id_ruta], [codigo_ruta], [nombre_ruta], [origen], [destino], [distancia_km], [tipo_terreno], [tiempo_estimado_horas], [nivel_dificultad]) VALUES (29, N'RUTA029', N'Cerro de Pasco - Huánuco', N'Cerro de Pasco', N'Huánuco', CAST(195.00 AS Decimal(10, 2)), N'Montañoso', CAST(4.30 AS Decimal(5, 2)), N'Medio')
INSERT [dbo].[Ruta] ([id_ruta], [codigo_ruta], [nombre_ruta], [origen], [destino], [distancia_km], [tipo_terreno], [tiempo_estimado_horas], [nivel_dificultad]) VALUES (30, N'RUTA030', N'Huánuco - Tingo María', N'Huánuco', N'Tingo María', CAST(120.00 AS Decimal(10, 2)), N'Montañoso', CAST(2.30 AS Decimal(5, 2)), N'Medio')
INSERT [dbo].[Ruta] ([id_ruta], [codigo_ruta], [nombre_ruta], [origen], [destino], [distancia_km], [tipo_terreno], [tiempo_estimado_horas], [nivel_dificultad]) VALUES (31, N'RUTA031', N'Lima - Chimbote', N'Lima', N'Chimbote', CAST(430.00 AS Decimal(10, 2)), N'Interurbano', CAST(7.00 AS Decimal(5, 2)), N'Medio')
INSERT [dbo].[Ruta] ([id_ruta], [codigo_ruta], [nombre_ruta], [origen], [destino], [distancia_km], [tipo_terreno], [tiempo_estimado_horas], [nivel_dificultad]) VALUES (32, N'RUTA032', N'Chimbote - Trujillo', N'Chimbote', N'Trujillo', CAST(150.00 AS Decimal(10, 2)), N'Interurbano', CAST(2.20 AS Decimal(5, 2)), N'Bajo')
INSERT [dbo].[Ruta] ([id_ruta], [codigo_ruta], [nombre_ruta], [origen], [destino], [distancia_km], [tipo_terreno], [tiempo_estimado_horas], [nivel_dificultad]) VALUES (33, N'RUTA033', N'Lima - Iquitos (multimodal)', N'Lima', N'Iquitos', CAST(1200.00 AS Decimal(10, 2)), N'Desértico', CAST(24.00 AS Decimal(5, 2)), N'Alto')
INSERT [dbo].[Ruta] ([id_ruta], [codigo_ruta], [nombre_ruta], [origen], [destino], [distancia_km], [tipo_terreno], [tiempo_estimado_horas], [nivel_dificultad]) VALUES (34, N'RUTA034', N'Arequipa - Juliaca', N'Arequipa', N'Juliaca', CAST(300.00 AS Decimal(10, 2)), N'Montañoso', CAST(6.00 AS Decimal(5, 2)), N'Alto')
INSERT [dbo].[Ruta] ([id_ruta], [codigo_ruta], [nombre_ruta], [origen], [destino], [distancia_km], [tipo_terreno], [tiempo_estimado_horas], [nivel_dificultad]) VALUES (35, N'RUTA035', N'Lima - Canta', N'Lima', N'Canta', CAST(105.00 AS Decimal(10, 2)), N'Montañoso', CAST(2.50 AS Decimal(5, 2)), N'Medio')
INSERT [dbo].[Ruta] ([id_ruta], [codigo_ruta], [nombre_ruta], [origen], [destino], [distancia_km], [tipo_terreno], [tiempo_estimado_horas], [nivel_dificultad]) VALUES (36, N'RUTA036', N'Canta - Huayllay', N'Canta', N'Huayllay', CAST(170.00 AS Decimal(10, 2)), N'Montañoso', CAST(4.00 AS Decimal(5, 2)), N'Alto')
INSERT [dbo].[Ruta] ([id_ruta], [codigo_ruta], [nombre_ruta], [origen], [destino], [distancia_km], [tipo_terreno], [tiempo_estimado_horas], [nivel_dificultad]) VALUES (37, N'RUTA037', N'Huayllay - Cerro de Pasco', N'Huayllay', N'Cerro de Pasco', CAST(85.00 AS Decimal(10, 2)), N'Montañoso', CAST(1.50 AS Decimal(5, 2)), N'Medio')
INSERT [dbo].[Ruta] ([id_ruta], [codigo_ruta], [nombre_ruta], [origen], [destino], [distancia_km], [tipo_terreno], [tiempo_estimado_horas], [nivel_dificultad]) VALUES (38, N'RUTA038', N'Trujillo - Cajamarca', N'Trujillo', N'Cajamarca', CAST(265.00 AS Decimal(10, 2)), N'Montañoso', CAST(6.00 AS Decimal(5, 2)), N'Alto')
INSERT [dbo].[Ruta] ([id_ruta], [codigo_ruta], [nombre_ruta], [origen], [destino], [distancia_km], [tipo_terreno], [tiempo_estimado_horas], [nivel_dificultad]) VALUES (39, N'RUTA039', N'Chiclayo - Jaén', N'Chiclayo', N'Jaén', CAST(280.00 AS Decimal(10, 2)), N'Montañoso', CAST(6.00 AS Decimal(5, 2)), N'Medio')
INSERT [dbo].[Ruta] ([id_ruta], [codigo_ruta], [nombre_ruta], [origen], [destino], [distancia_km], [tipo_terreno], [tiempo_estimado_horas], [nivel_dificultad]) VALUES (40, N'RUTA040', N'Jaén - San Ignacio', N'Jaén', N'San Ignacio', CAST(110.00 AS Decimal(10, 2)), N'Montañoso', CAST(2.00 AS Decimal(5, 2)), N'Bajo')
SET IDENTITY_INSERT [dbo].[Ruta] OFF
GO
SET IDENTITY_INSERT [dbo].[TipoMantenimiento] ON 

INSERT [dbo].[TipoMantenimiento] ([id_tipo], [codigo_tipo], [nombre], [descripcion], [categoria], [prioridad], [intervalo_km], [intervalo_dias], [duracion_estimada_horas], [costo_estimado]) VALUES (1, N'PM001', N'Cambio de Aceite', N'Cambio de aceite del motor', N'Preventivo', N'Rutina', 5000, 90, CAST(1.50 AS Decimal(5, 2)), CAST(120.00 AS Decimal(10, 2)))
INSERT [dbo].[TipoMantenimiento] ([id_tipo], [codigo_tipo], [nombre], [descripcion], [categoria], [prioridad], [intervalo_km], [intervalo_dias], [duracion_estimada_horas], [costo_estimado]) VALUES (2, N'PM002', N'Revisión de Frenos', N'Inspección y ajuste de frenos', N'Preventivo', N'Media', 10000, 180, CAST(2.00 AS Decimal(5, 2)), CAST(200.00 AS Decimal(10, 2)))
INSERT [dbo].[TipoMantenimiento] ([id_tipo], [codigo_tipo], [nombre], [descripcion], [categoria], [prioridad], [intervalo_km], [intervalo_dias], [duracion_estimada_horas], [costo_estimado]) VALUES (3, N'PM003', N'Cambio de Filtro de Aire', N'Sustitución del filtro de aire del motor', N'Preventivo', N'Rutina', 7000, 120, CAST(1.00 AS Decimal(5, 2)), CAST(90.00 AS Decimal(10, 2)))
INSERT [dbo].[TipoMantenimiento] ([id_tipo], [codigo_tipo], [nombre], [descripcion], [categoria], [prioridad], [intervalo_km], [intervalo_dias], [duracion_estimada_horas], [costo_estimado]) VALUES (4, N'PM004', N'Cambio de Bujías', N'Reemplazo de bujías del motor', N'Preventivo', N'Media', 15000, 365, CAST(1.30 AS Decimal(5, 2)), CAST(110.00 AS Decimal(10, 2)))
INSERT [dbo].[TipoMantenimiento] ([id_tipo], [codigo_tipo], [nombre], [descripcion], [categoria], [prioridad], [intervalo_km], [intervalo_dias], [duracion_estimada_horas], [costo_estimado]) VALUES (5, N'PM005', N'Inspección de Suspensión', N'Chequeo general del sistema de suspensión', N'Preventivo', N'Alta', 10000, 180, CAST(2.50 AS Decimal(5, 2)), CAST(250.00 AS Decimal(10, 2)))
INSERT [dbo].[TipoMantenimiento] ([id_tipo], [codigo_tipo], [nombre], [descripcion], [categoria], [prioridad], [intervalo_km], [intervalo_dias], [duracion_estimada_horas], [costo_estimado]) VALUES (6, N'PM006', N'Revisión de Luces', N'Inspección del sistema de iluminación', N'Preventivo', N'Rutina', 3000, 60, CAST(0.80 AS Decimal(5, 2)), CAST(50.00 AS Decimal(10, 2)))
INSERT [dbo].[TipoMantenimiento] ([id_tipo], [codigo_tipo], [nombre], [descripcion], [categoria], [prioridad], [intervalo_km], [intervalo_dias], [duracion_estimada_horas], [costo_estimado]) VALUES (7, N'PM007', N'Cambio de Filtro de Combustible', N'Reemplazo del filtro de combustible', N'Preventivo', N'Media', 12000, 180, CAST(1.20 AS Decimal(5, 2)), CAST(95.00 AS Decimal(10, 2)))
INSERT [dbo].[TipoMantenimiento] ([id_tipo], [codigo_tipo], [nombre], [descripcion], [categoria], [prioridad], [intervalo_km], [intervalo_dias], [duracion_estimada_horas], [costo_estimado]) VALUES (8, N'PM008', N'Cambio de Refrigerante', N'Sustitución del líquido refrigerante', N'Preventivo', N'Media', 15000, 365, CAST(1.50 AS Decimal(5, 2)), CAST(130.00 AS Decimal(10, 2)))
INSERT [dbo].[TipoMantenimiento] ([id_tipo], [codigo_tipo], [nombre], [descripcion], [categoria], [prioridad], [intervalo_km], [intervalo_dias], [duracion_estimada_horas], [costo_estimado]) VALUES (9, N'PM009', N'Revisión de Neumáticos', N'Inspección y rotación de neumáticos', N'Preventivo', N'Media', 8000, 120, CAST(1.00 AS Decimal(5, 2)), CAST(60.00 AS Decimal(10, 2)))
INSERT [dbo].[TipoMantenimiento] ([id_tipo], [codigo_tipo], [nombre], [descripcion], [categoria], [prioridad], [intervalo_km], [intervalo_dias], [duracion_estimada_horas], [costo_estimado]) VALUES (10, N'PM010', N'Alineamiento y Balanceo', N'Servicio de alineación y balanceo', N'Preventivo', N'Media', 10000, 180, CAST(2.00 AS Decimal(5, 2)), CAST(160.00 AS Decimal(10, 2)))
INSERT [dbo].[TipoMantenimiento] ([id_tipo], [codigo_tipo], [nombre], [descripcion], [categoria], [prioridad], [intervalo_km], [intervalo_dias], [duracion_estimada_horas], [costo_estimado]) VALUES (11, N'CM001', N'Cambio de Pastillas de Freno', N'Reemplazo de pastillas desgastadas', N'Correctivo', N'Alta', NULL, NULL, CAST(2.00 AS Decimal(5, 2)), CAST(220.00 AS Decimal(10, 2)))
INSERT [dbo].[TipoMantenimiento] ([id_tipo], [codigo_tipo], [nombre], [descripcion], [categoria], [prioridad], [intervalo_km], [intervalo_dias], [duracion_estimada_horas], [costo_estimado]) VALUES (12, N'CM002', N'Cambio de Amortiguadores', N'Sustitución de amortiguadores', N'Correctivo', N'Alta', NULL, NULL, CAST(3.00 AS Decimal(5, 2)), CAST(350.00 AS Decimal(10, 2)))
INSERT [dbo].[TipoMantenimiento] ([id_tipo], [codigo_tipo], [nombre], [descripcion], [categoria], [prioridad], [intervalo_km], [intervalo_dias], [duracion_estimada_horas], [costo_estimado]) VALUES (13, N'CM003', N'Reparación del Sistema Eléctrico', N'Solución de fallos eléctricos', N'Correctivo', N'Urgente', NULL, NULL, CAST(3.50 AS Decimal(5, 2)), CAST(400.00 AS Decimal(10, 2)))
INSERT [dbo].[TipoMantenimiento] ([id_tipo], [codigo_tipo], [nombre], [descripcion], [categoria], [prioridad], [intervalo_km], [intervalo_dias], [duracion_estimada_horas], [costo_estimado]) VALUES (14, N'CM004', N'Reparación del Motor', N'Corrección de fallas en el motor', N'Correctivo', N'Urgente', NULL, NULL, CAST(5.00 AS Decimal(5, 2)), CAST(1000.00 AS Decimal(10, 2)))
INSERT [dbo].[TipoMantenimiento] ([id_tipo], [codigo_tipo], [nombre], [descripcion], [categoria], [prioridad], [intervalo_km], [intervalo_dias], [duracion_estimada_horas], [costo_estimado]) VALUES (15, N'CM005', N'Reparación de Caja de Cambios', N'Reparación del sistema de transmisión', N'Correctivo', N'Urgente', NULL, NULL, CAST(6.00 AS Decimal(5, 2)), CAST(1200.00 AS Decimal(10, 2)))
INSERT [dbo].[TipoMantenimiento] ([id_tipo], [codigo_tipo], [nombre], [descripcion], [categoria], [prioridad], [intervalo_km], [intervalo_dias], [duracion_estimada_horas], [costo_estimado]) VALUES (16, N'CM006', N'Cambio de Radiador', N'Reemplazo por fuga o daño', N'Correctivo', N'Alta', NULL, NULL, CAST(2.50 AS Decimal(5, 2)), CAST(350.00 AS Decimal(10, 2)))
INSERT [dbo].[TipoMantenimiento] ([id_tipo], [codigo_tipo], [nombre], [descripcion], [categoria], [prioridad], [intervalo_km], [intervalo_dias], [duracion_estimada_horas], [costo_estimado]) VALUES (17, N'CM007', N'Reemplazo de Batería', N'Cambio por batería agotada', N'Correctivo', N'Media', NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(150.00 AS Decimal(10, 2)))
INSERT [dbo].[TipoMantenimiento] ([id_tipo], [codigo_tipo], [nombre], [descripcion], [categoria], [prioridad], [intervalo_km], [intervalo_dias], [duracion_estimada_horas], [costo_estimado]) VALUES (18, N'CM008', N'Reparación de Frenos', N'Reparación general del sistema de frenos', N'Correctivo', N'Alta', NULL, NULL, CAST(2.50 AS Decimal(5, 2)), CAST(280.00 AS Decimal(10, 2)))
INSERT [dbo].[TipoMantenimiento] ([id_tipo], [codigo_tipo], [nombre], [descripcion], [categoria], [prioridad], [intervalo_km], [intervalo_dias], [duracion_estimada_horas], [costo_estimado]) VALUES (19, N'CM009', N'Cambio de Correa de Distribución', N'Sustitución por desgaste', N'Correctivo', N'Alta', NULL, NULL, CAST(2.00 AS Decimal(5, 2)), CAST(220.00 AS Decimal(10, 2)))
INSERT [dbo].[TipoMantenimiento] ([id_tipo], [codigo_tipo], [nombre], [descripcion], [categoria], [prioridad], [intervalo_km], [intervalo_dias], [duracion_estimada_horas], [costo_estimado]) VALUES (20, N'CM010', N'Reparación de Carrocería', N'Eliminación de abolladuras y pintura', N'Correctivo', N'Media', NULL, NULL, CAST(4.00 AS Decimal(5, 2)), CAST(600.00 AS Decimal(10, 2)))
INSERT [dbo].[TipoMantenimiento] ([id_tipo], [codigo_tipo], [nombre], [descripcion], [categoria], [prioridad], [intervalo_km], [intervalo_dias], [duracion_estimada_horas], [costo_estimado]) VALUES (21, N'PR001', N'Análisis Predictivo de Motor', N'Evaluación por sensores del motor', N'Predictivo', N'Media', 10000, 180, CAST(1.50 AS Decimal(5, 2)), CAST(300.00 AS Decimal(10, 2)))
INSERT [dbo].[TipoMantenimiento] ([id_tipo], [codigo_tipo], [nombre], [descripcion], [categoria], [prioridad], [intervalo_km], [intervalo_dias], [duracion_estimada_horas], [costo_estimado]) VALUES (22, N'PR002', N'Monitoreo de Temperatura de Frenos', N'Uso de sensores térmicos', N'Predictivo', N'Media', 8000, 120, CAST(1.20 AS Decimal(5, 2)), CAST(250.00 AS Decimal(10, 2)))
INSERT [dbo].[TipoMantenimiento] ([id_tipo], [codigo_tipo], [nombre], [descripcion], [categoria], [prioridad], [intervalo_km], [intervalo_dias], [duracion_estimada_horas], [costo_estimado]) VALUES (23, N'PR003', N'Vibración en Transmisión', N'Sensor de vibración para fallas', N'Predictivo', N'Alta', 12000, 180, CAST(2.00 AS Decimal(5, 2)), CAST(400.00 AS Decimal(10, 2)))
INSERT [dbo].[TipoMantenimiento] ([id_tipo], [codigo_tipo], [nombre], [descripcion], [categoria], [prioridad], [intervalo_km], [intervalo_dias], [duracion_estimada_horas], [costo_estimado]) VALUES (24, N'PR004', N'Análisis de Sonido del Motor', N'Micrófono para detectar fallos', N'Predictivo', N'Media', 10000, 180, CAST(1.00 AS Decimal(5, 2)), CAST(210.00 AS Decimal(10, 2)))
INSERT [dbo].[TipoMantenimiento] ([id_tipo], [codigo_tipo], [nombre], [descripcion], [categoria], [prioridad], [intervalo_km], [intervalo_dias], [duracion_estimada_horas], [costo_estimado]) VALUES (25, N'PR005', N'Revisión por Diagnóstico Digital', N'Evaluación electrónica de fallas', N'Predictivo', N'Media', 10000, 180, CAST(2.00 AS Decimal(5, 2)), CAST(350.00 AS Decimal(10, 2)))
INSERT [dbo].[TipoMantenimiento] ([id_tipo], [codigo_tipo], [nombre], [descripcion], [categoria], [prioridad], [intervalo_km], [intervalo_dias], [duracion_estimada_horas], [costo_estimado]) VALUES (26, N'OT001', N'Lavado General', N'Limpieza interior y exterior', N'Otros', N'Rutina', NULL, 30, CAST(1.00 AS Decimal(5, 2)), CAST(50.00 AS Decimal(10, 2)))
INSERT [dbo].[TipoMantenimiento] ([id_tipo], [codigo_tipo], [nombre], [descripcion], [categoria], [prioridad], [intervalo_km], [intervalo_dias], [duracion_estimada_horas], [costo_estimado]) VALUES (27, N'OT002', N'Pulido de Carrocería', N'Mejorar apariencia externa', N'Otros', N'Media', NULL, 60, CAST(2.00 AS Decimal(5, 2)), CAST(150.00 AS Decimal(10, 2)))
INSERT [dbo].[TipoMantenimiento] ([id_tipo], [codigo_tipo], [nombre], [descripcion], [categoria], [prioridad], [intervalo_km], [intervalo_dias], [duracion_estimada_horas], [costo_estimado]) VALUES (28, N'OT003', N'Desinfección del Vehículo', N'Desinfección interna por higiene', N'Otros', N'Media', NULL, 30, CAST(1.50 AS Decimal(5, 2)), CAST(80.00 AS Decimal(10, 2)))
INSERT [dbo].[TipoMantenimiento] ([id_tipo], [codigo_tipo], [nombre], [descripcion], [categoria], [prioridad], [intervalo_km], [intervalo_dias], [duracion_estimada_horas], [costo_estimado]) VALUES (29, N'OT004', N'Revisión Técnica MTC', N'Preparación para revisión obligatoria', N'Otros', N'Alta', NULL, 365, CAST(2.00 AS Decimal(5, 2)), CAST(200.00 AS Decimal(10, 2)))
INSERT [dbo].[TipoMantenimiento] ([id_tipo], [codigo_tipo], [nombre], [descripcion], [categoria], [prioridad], [intervalo_km], [intervalo_dias], [duracion_estimada_horas], [costo_estimado]) VALUES (30, N'OT005', N'Cambio de Plumillas', N'Reemplazo por desgaste', N'Otros', N'Rutina', NULL, 180, CAST(0.50 AS Decimal(5, 2)), CAST(30.00 AS Decimal(10, 2)))
INSERT [dbo].[TipoMantenimiento] ([id_tipo], [codigo_tipo], [nombre], [descripcion], [categoria], [prioridad], [intervalo_km], [intervalo_dias], [duracion_estimada_horas], [costo_estimado]) VALUES (31, N'PM011', N'Cambio de Aceite de Caja', N'Mantenimiento a caja automática', N'Preventivo', N'Media', 15000, 365, CAST(1.80 AS Decimal(5, 2)), CAST(180.00 AS Decimal(10, 2)))
INSERT [dbo].[TipoMantenimiento] ([id_tipo], [codigo_tipo], [nombre], [descripcion], [categoria], [prioridad], [intervalo_km], [intervalo_dias], [duracion_estimada_horas], [costo_estimado]) VALUES (32, N'CM011', N'Reemplazo de Alternador', N'Alternador dañado por sobrecarga', N'Correctivo', N'Urgente', NULL, NULL, CAST(2.80 AS Decimal(5, 2)), CAST(480.00 AS Decimal(10, 2)))
INSERT [dbo].[TipoMantenimiento] ([id_tipo], [codigo_tipo], [nombre], [descripcion], [categoria], [prioridad], [intervalo_km], [intervalo_dias], [duracion_estimada_horas], [costo_estimado]) VALUES (33, N'PM012', N'Revisión de Sistema de Escape', N'Chequeo de fugas en escape', N'Preventivo', N'Media', 10000, 180, CAST(1.50 AS Decimal(5, 2)), CAST(160.00 AS Decimal(10, 2)))
INSERT [dbo].[TipoMantenimiento] ([id_tipo], [codigo_tipo], [nombre], [descripcion], [categoria], [prioridad], [intervalo_km], [intervalo_dias], [duracion_estimada_horas], [costo_estimado]) VALUES (34, N'CM012', N'Reemplazo de Espejos Laterales', N'Rotura o pérdida de espejos', N'Correctivo', N'Media', NULL, NULL, CAST(0.50 AS Decimal(5, 2)), CAST(80.00 AS Decimal(10, 2)))
INSERT [dbo].[TipoMantenimiento] ([id_tipo], [codigo_tipo], [nombre], [descripcion], [categoria], [prioridad], [intervalo_km], [intervalo_dias], [duracion_estimada_horas], [costo_estimado]) VALUES (35, N'PM013', N'Inspección de Dirección Hidráulica', N'Chequeo de fugas y presión', N'Preventivo', N'Alta', 10000, 180, CAST(1.50 AS Decimal(5, 2)), CAST(200.00 AS Decimal(10, 2)))
SET IDENTITY_INSERT [dbo].[TipoMantenimiento] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Bus__0C0574256E267312]    Script Date: 04/07/2025 16:36:23 ******/
ALTER TABLE [dbo].[Bus] ADD UNIQUE NONCLUSTERED 
(
	[placa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Bus__56E95CAB71B0F43C]    Script Date: 04/07/2025 16:36:23 ******/
ALTER TABLE [dbo].[Bus] ADD UNIQUE NONCLUSTERED 
(
	[numero_chasis] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Bus__CDAD749EEA6B57B1]    Script Date: 04/07/2025 16:36:23 ******/
ALTER TABLE [dbo].[Bus] ADD UNIQUE NONCLUSTERED 
(
	[numero_motor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Conducto__D87608A7EBA3F7ED]    Script Date: 04/07/2025 16:36:23 ******/
ALTER TABLE [dbo].[Conductor] ADD UNIQUE NONCLUSTERED 
(
	[dni] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__ItemChec__371CE7BD7A751420]    Script Date: 04/07/2025 16:36:23 ******/
ALTER TABLE [dbo].[ItemChecklist] ADD UNIQUE NONCLUSTERED 
(
	[id_tipo] ASC,
	[codigo_item] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__OrdenCom__3706711590B124DB]    Script Date: 04/07/2025 16:36:23 ******/
ALTER TABLE [dbo].[OrdenCompra] ADD UNIQUE NONCLUSTERED 
(
	[numero_orden] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Proveedo__C2B74E61F157D9F0]    Script Date: 04/07/2025 16:36:23 ******/
ALTER TABLE [dbo].[Proveedor] ADD UNIQUE NONCLUSTERED 
(
	[ruc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Ruta__84C0A1F432D91C01]    Script Date: 04/07/2025 16:36:23 ******/
ALTER TABLE [dbo].[Ruta] ADD UNIQUE NONCLUSTERED 
(
	[codigo_ruta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__TipoMant__A895DE311A37785A]    Script Date: 04/07/2025 16:36:23 ******/
ALTER TABLE [dbo].[TipoMantenimiento] ADD UNIQUE NONCLUSTERED 
(
	[codigo_tipo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AlertaMantenimiento] ADD  DEFAULT (getdate()) FOR [fecha_generacion]
GO
ALTER TABLE [dbo].[AlertaMantenimiento] ADD  DEFAULT ('Pendiente') FOR [estado]
GO
ALTER TABLE [dbo].[Asignacion] ADD  DEFAULT (getdate()) FOR [fecha_asignacion]
GO
ALTER TABLE [dbo].[Asignacion] ADD  DEFAULT ('0') FOR [incidencias_reportadas]
GO
ALTER TABLE [dbo].[Bus] ADD  DEFAULT ((0)) FOR [kilometraje_actual]
GO
ALTER TABLE [dbo].[Bus] ADD  DEFAULT ('Operativo') FOR [estado_operativo]
GO
ALTER TABLE [dbo].[Bus] ADD  DEFAULT ((5000)) FOR [ciclo_mantenimiento_km]
GO
ALTER TABLE [dbo].[Bus] ADD  DEFAULT ((90)) FOR [ciclo_mantenimiento_dias]
GO
ALTER TABLE [dbo].[Conductor] ADD  DEFAULT ((0)) FOR [horas_conduccion_mes]
GO
ALTER TABLE [dbo].[Conductor] ADD  DEFAULT ('Activo') FOR [estado]
GO
ALTER TABLE [dbo].[DetalleMantenimiento] ADD  DEFAULT ('0') FOR [realizado]
GO
ALTER TABLE [dbo].[HistoricoFallo] ADD  DEFAULT (getdate()) FOR [fecha_reporte]
GO
ALTER TABLE [dbo].[InspeccionDiaria] ADD  DEFAULT (getdate()) FOR [fecha_inspeccion]
GO
ALTER TABLE [dbo].[InspeccionDiaria] ADD  DEFAULT ('0') FOR [aprobado]
GO
ALTER TABLE [dbo].[ItemChecklist] ADD  DEFAULT ('0') FOR [es_critico]
GO
ALTER TABLE [dbo].[Mantenimiento] ADD  DEFAULT ('En Proceso') FOR [estado]
GO
ALTER TABLE [dbo].[OrdenCompra] ADD  DEFAULT (getdate()) FOR [fecha_emision]
GO
ALTER TABLE [dbo].[OrdenCompra] ADD  DEFAULT ('Pendiente') FOR [estado]
GO
ALTER TABLE [dbo].[ProgramacionMantenimiento] ADD  DEFAULT ('Pendiente') FOR [estado]
GO
ALTER TABLE [dbo].[Proveedor] ADD  DEFAULT ('1') FOR [activo]
GO
ALTER TABLE [dbo].[AlertaMantenimiento]  WITH CHECK ADD FOREIGN KEY([id_bus])
REFERENCES [dbo].[Bus] ([id_bus])
GO
ALTER TABLE [dbo].[AlertaMantenimiento]  WITH CHECK ADD FOREIGN KEY([id_mantenimiento_relacionado])
REFERENCES [dbo].[Mantenimiento] ([id_mantenimiento])
GO
ALTER TABLE [dbo].[Asignacion]  WITH CHECK ADD FOREIGN KEY([id_bus])
REFERENCES [dbo].[Bus] ([id_bus])
GO
ALTER TABLE [dbo].[Asignacion]  WITH CHECK ADD FOREIGN KEY([id_conductor])
REFERENCES [dbo].[Conductor] ([id_conductor])
GO
ALTER TABLE [dbo].[Asignacion]  WITH CHECK ADD FOREIGN KEY([id_ruta])
REFERENCES [dbo].[Ruta] ([id_ruta])
GO
ALTER TABLE [dbo].[DetalleMantenimiento]  WITH CHECK ADD FOREIGN KEY([id_item])
REFERENCES [dbo].[ItemChecklist] ([id_item])
GO
ALTER TABLE [dbo].[DetalleMantenimiento]  WITH CHECK ADD FOREIGN KEY([id_mantenimiento])
REFERENCES [dbo].[Mantenimiento] ([id_mantenimiento])
GO
ALTER TABLE [dbo].[DetalleOrdenCompra]  WITH CHECK ADD FOREIGN KEY([id_orden])
REFERENCES [dbo].[OrdenCompra] ([id_orden])
GO
ALTER TABLE [dbo].[HistoricoFallo]  WITH CHECK ADD FOREIGN KEY([id_asignacion])
REFERENCES [dbo].[Asignacion] ([id_asignacion])
GO
ALTER TABLE [dbo].[HistoricoFallo]  WITH CHECK ADD FOREIGN KEY([id_bus])
REFERENCES [dbo].[Bus] ([id_bus])
GO
ALTER TABLE [dbo].[HistoricoFallo]  WITH CHECK ADD FOREIGN KEY([id_conductor])
REFERENCES [dbo].[Conductor] ([id_conductor])
GO
ALTER TABLE [dbo].[InspeccionDiaria]  WITH CHECK ADD FOREIGN KEY([id_bus])
REFERENCES [dbo].[Bus] ([id_bus])
GO
ALTER TABLE [dbo].[InspeccionDiaria]  WITH CHECK ADD FOREIGN KEY([id_conductor])
REFERENCES [dbo].[Conductor] ([id_conductor])
GO
ALTER TABLE [dbo].[ItemChecklist]  WITH CHECK ADD FOREIGN KEY([id_tipo])
REFERENCES [dbo].[TipoMantenimiento] ([id_tipo])
GO
ALTER TABLE [dbo].[Mantenimiento]  WITH CHECK ADD FOREIGN KEY([id_bus])
REFERENCES [dbo].[Bus] ([id_bus])
GO
ALTER TABLE [dbo].[Mantenimiento]  WITH CHECK ADD FOREIGN KEY([id_programacion])
REFERENCES [dbo].[ProgramacionMantenimiento] ([id_programacion])
GO
ALTER TABLE [dbo].[Mantenimiento]  WITH CHECK ADD FOREIGN KEY([id_tipo])
REFERENCES [dbo].[TipoMantenimiento] ([id_tipo])
GO
ALTER TABLE [dbo].[OrdenCompra]  WITH CHECK ADD FOREIGN KEY([id_mantenimiento])
REFERENCES [dbo].[Mantenimiento] ([id_mantenimiento])
GO
ALTER TABLE [dbo].[OrdenCompra]  WITH CHECK ADD FOREIGN KEY([id_proveedor])
REFERENCES [dbo].[Proveedor] ([id_proveedor])
GO
ALTER TABLE [dbo].[ProgramacionMantenimiento]  WITH CHECK ADD FOREIGN KEY([id_bus])
REFERENCES [dbo].[Bus] ([id_bus])
GO
ALTER TABLE [dbo].[ProgramacionMantenimiento]  WITH CHECK ADD FOREIGN KEY([id_tipo])
REFERENCES [dbo].[TipoMantenimiento] ([id_tipo])
GO
ALTER TABLE [dbo].[RepuestoUtilizado]  WITH CHECK ADD FOREIGN KEY([id_mantenimiento])
REFERENCES [dbo].[Mantenimiento] ([id_mantenimiento])
GO
ALTER TABLE [dbo].[AlertaMantenimiento]  WITH CHECK ADD CHECK  (([criticidad]='Urgente' OR [criticidad]='Alta' OR [criticidad]='Media' OR [criticidad]='Baja'))
GO
ALTER TABLE [dbo].[AlertaMantenimiento]  WITH CHECK ADD CHECK  (([estado]='Descartada' OR [estado]='Atendida' OR [estado]='Pendiente'))
GO
ALTER TABLE [dbo].[AlertaMantenimiento]  WITH CHECK ADD CHECK  (([tipo_alerta]='Inspección' OR [tipo_alerta]='Fallo' OR [tipo_alerta]='Tiempo' OR [tipo_alerta]='Kilometraje'))
GO
ALTER TABLE [dbo].[Asignacion]  WITH CHECK ADD CHECK  (([incidencias_reportadas]='1' OR [incidencias_reportadas]='0'))
GO
ALTER TABLE [dbo].[Bus]  WITH CHECK ADD CHECK  (([estado_operativo]='Baja' OR [estado_operativo]='Reparacion' OR [estado_operativo]='Mantenimiento' OR [estado_operativo]='Operativo'))
GO
ALTER TABLE [dbo].[Conductor]  WITH CHECK ADD CHECK  (([estado]='Inactivo' OR [estado]='Vacaciones' OR [estado]='Suspendido' OR [estado]='Activo'))
GO
ALTER TABLE [dbo].[Conductor]  WITH CHECK ADD CHECK  (([evaluacion_conduccion]>=(1) AND [evaluacion_conduccion]<=(5)))
GO
ALTER TABLE [dbo].[HistoricoFallo]  WITH CHECK ADD CHECK  (([gravedad]='Crítico' OR [gravedad]='Grave' OR [gravedad]='Moderado' OR [gravedad]='Leve'))
GO
ALTER TABLE [dbo].[Mantenimiento]  WITH CHECK ADD CHECK  (([estado]='Incompleto' OR [estado]='Completado' OR [estado]='En Proceso'))
GO
ALTER TABLE [dbo].[OrdenCompra]  WITH CHECK ADD CHECK  (([estado]='Cancelada' OR [estado]='Completada' OR [estado]='En Proceso' OR [estado]='Aprobada' OR [estado]='Pendiente'))
GO
ALTER TABLE [dbo].[ProgramacionMantenimiento]  WITH CHECK ADD CHECK  (([estado]='Cancelado' OR [estado]='Completado' OR [estado]='En Proceso' OR [estado]='Pendiente'))
GO
ALTER TABLE [dbo].[ProgramacionMantenimiento]  WITH CHECK ADD CHECK  (([prioridad]='Urgente' OR [prioridad]='Alta' OR [prioridad]='Media' OR [prioridad]='Rutina'))
GO
ALTER TABLE [dbo].[Proveedor]  WITH CHECK ADD CHECK  (([especialidad]='Otros' OR [especialidad]='Neumáticos' OR [especialidad]='Electricidad' OR [especialidad]='Carrocería' OR [especialidad]='Mecánica' OR [especialidad]='Repuestos'))
GO
ALTER TABLE [dbo].[Proveedor]  WITH CHECK ADD CHECK  (([evaluacion_proveedor]>=(1) AND [evaluacion_proveedor]<=(5)))
GO
ALTER TABLE [dbo].[Ruta]  WITH CHECK ADD CHECK  (([nivel_dificultad]='Alto' OR [nivel_dificultad]='Medio' OR [nivel_dificultad]='Bajo'))
GO
ALTER TABLE [dbo].[Ruta]  WITH CHECK ADD CHECK  (([tipo_terreno]='Desértico' OR [tipo_terreno]='Montañoso' OR [tipo_terreno]='Interurbano' OR [tipo_terreno]='Urbano'))
GO
ALTER TABLE [dbo].[TipoMantenimiento]  WITH CHECK ADD CHECK  (([categoria]='Otros' OR [categoria]='Predictivo' OR [categoria]='Correctivo' OR [categoria]='Preventivo'))
GO
ALTER TABLE [dbo].[TipoMantenimiento]  WITH CHECK ADD CHECK  (([prioridad]='Urgente' OR [prioridad]='Alta' OR [prioridad]='Media' OR [prioridad]='Rutina'))
GO
USE [master]
GO
ALTER DATABASE [ExpresoJF] SET  READ_WRITE 
GO
