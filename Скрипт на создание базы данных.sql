USE [master]
GO
/****** Object:  Database [KayukovDem23]    Script Date: 06.12.2023 18:25:35 ******/
CREATE DATABASE [KayukovDem23]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'KayukovDem23', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\KayukovDem23.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'KayukovDem23_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\KayukovDem23_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [KayukovDem23] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [KayukovDem23].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [KayukovDem23] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [KayukovDem23] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [KayukovDem23] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [KayukovDem23] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [KayukovDem23] SET ARITHABORT OFF 
GO
ALTER DATABASE [KayukovDem23] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [KayukovDem23] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [KayukovDem23] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [KayukovDem23] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [KayukovDem23] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [KayukovDem23] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [KayukovDem23] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [KayukovDem23] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [KayukovDem23] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [KayukovDem23] SET  DISABLE_BROKER 
GO
ALTER DATABASE [KayukovDem23] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [KayukovDem23] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [KayukovDem23] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [KayukovDem23] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [KayukovDem23] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [KayukovDem23] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [KayukovDem23] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [KayukovDem23] SET RECOVERY FULL 
GO
ALTER DATABASE [KayukovDem23] SET  MULTI_USER 
GO
ALTER DATABASE [KayukovDem23] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [KayukovDem23] SET DB_CHAINING OFF 
GO
ALTER DATABASE [KayukovDem23] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [KayukovDem23] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [KayukovDem23] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [KayukovDem23] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'KayukovDem23', N'ON'
GO
ALTER DATABASE [KayukovDem23] SET QUERY_STORE = OFF
GO
USE [KayukovDem23]
GO
/****** Object:  Table [dbo].[Client]    Script Date: 06.12.2023 18:25:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Client](
	[Id] [int] NOT NULL,
	[Surname] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Forename] [nvarchar](50) NOT NULL,
	[SeriesPassport] [int] NOT NULL,
	[NumberPassport] [int] NOT NULL,
	[DateOfBirth] [date] NOT NULL,
	[Index] [int] NOT NULL,
	[idCity] [int] NOT NULL,
	[IdStreet] [int] NOT NULL,
	[Home] [nvarchar](50) NOT NULL,
	[Flat] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Client] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[City]    Script Date: 06.12.2023 18:25:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[City](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_City] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Street]    Script Date: 06.12.2023 18:25:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Street](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Street] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Street] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[ClientView]    Script Date: 06.12.2023 18:25:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ClientView] AS
SELECT       CONCAT(dbo.Client.Surname,' ', dbo.Client.Name,' ', dbo.Client.Forename) AS Client,
dbo.Client.DateOfBirth, dbo.Client.SeriesPassport, dbo.Client.NumberPassport,
 dbo.Client.[Index], dbo.City.Title, dbo.Street.Street, dbo.Client.Home AS Home, dbo.Client.Flat,
dbo.Client.Id,dbo.Client.Email, dbo.Client.Password
FROM            dbo.Client INNER JOIN
                         dbo.Street ON dbo.Client.IdStreet = dbo.Street.Id INNER JOIN
                         dbo.City ON dbo.Client.idCity = dbo.City.Id
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 06.12.2023 18:25:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[Id] [int] NOT NULL,
	[idPost] [int] NOT NULL,
	[Surname] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Forename] [nvarchar](50) NOT NULL,
	[Login] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TypeInput]    Script Date: 06.12.2023 18:25:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TypeInput](
	[Id] [int] NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Type_input] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HistoryEmployee]    Script Date: 06.12.2023 18:25:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HistoryEmployee](
	[idEmployee] [int] NOT NULL,
	[DateInput] [datetime] NULL,
	[idInput] [int] NOT NULL,
	[idHistory] [int] IDENTITY(1,1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idHistory] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[EmployeeView]    Script Date: 06.12.2023 18:25:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[EmployeeView] as
SELECT CONCAT(dbo.Employee.Surname,' ', dbo.Employee.Name, ' ',dbo.Employee.Forename) AS Employee, 
dbo.Employee.Login, dbo.HistoryEmployee.idHistory,
CAST(dbo.HistoryEmployee.DateInput AS DATE) as Date, 
CAST(dbo.HistoryEmployee.DateInput AS TIME) as Time, 
dbo.Employee.Id, dbo.TypeInput.Title AS Input
FROM dbo.TypeInput 
INNER JOIN dbo.HistoryEmployee ON dbo.TypeInput.Id = dbo.HistoryEmployee.idInput 
INNER JOIN dbo.Employee ON dbo.HistoryEmployee.idEmployee = dbo.Employee.Id
GO
/****** Object:  Table [dbo].[ServiceandOrder]    Script Date: 06.12.2023 18:25:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ServiceandOrder](
	[idOrder] [nvarchar](50) NOT NULL,
	[DateCreate] [date] NOT NULL,
	[idClient] [int] NOT NULL,
	[idService] [int] NOT NULL,
	[NumberOrder] [int] NOT NULL,
	[Id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_ServiceandOrder] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 06.12.2023 18:25:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[Id] [int] NOT NULL,
	[DateCreate] [date] NOT NULL,
	[TimeOrder] [time](7) NOT NULL,
	[idClient] [int] NOT NULL,
	[idStatus] [int] NOT NULL,
	[DateClose] [date] NULL,
	[TimeRental] [int] NOT NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Service]    Script Date: 06.12.2023 18:25:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Service](
	[IdService] [int] NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[CodeService] [nvarchar](50) NOT NULL,
	[Price] [money] NOT NULL,
 CONSTRAINT [PK_Service] PRIMARY KEY CLUSTERED 
(
	[IdService] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Status]    Script Date: 06.12.2023 18:25:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Status](
	[Id] [int] NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Status] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[OrderView]    Script Date: 06.12.2023 18:25:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREate view [dbo].[OrderView] as
SELECT         dbo.Client.Id, CONCAT(dbo.Client.Surname, ' ', dbo.Client.Name, ' ',dbo.Client.Forename) AS Client, STRING_AGG(dbo.Service.Title, ',') AS Service,
dbo.[Order].DateCreate, dbo.[Order].TimeOrder, dbo.[Order].DateClose, dbo.[Order].TimeRental, dbo.Status.Title AS Status, 
                         dbo.Street.Street, SUM(dbo.Service.Price) as Price
FROM            dbo.City INNER JOIN
                         dbo.Client ON dbo.City.Id = dbo.Client.idCity INNER JOIN
                         dbo.[Order] ON dbo.Client.Id = dbo.[Order].idClient INNER JOIN
                         dbo.ServiceandOrder ON dbo.Client.Id = dbo.ServiceandOrder.idClient AND dbo.[Order].Id = dbo.ServiceandOrder.NumberOrder INNER JOIN
                         dbo.Service ON dbo.ServiceandOrder.idService = dbo.Service.IdService INNER JOIN
                         dbo.Status ON dbo.[Order].idStatus = dbo.Status.Id INNER JOIN
                         dbo.Street ON dbo.Client.IdStreet = dbo.Street.Id
GROUP BY dbo.Client.Id, CONCAT(dbo.Client.Surname, ' ', dbo.Client.Name, ' ',dbo.Client.Forename), dbo.City.Title,
dbo.[Order].DateCreate, dbo.[Order].TimeOrder, dbo.[Order].DateClose, dbo.[Order].TimeRental, dbo.Status.Title,
                         dbo.Street.Street
GO
/****** Object:  Table [dbo].[Post]    Script Date: 06.12.2023 18:25:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Post](
	[Id] [int] NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Post] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Client]  WITH CHECK ADD  CONSTRAINT [FK_Client_City] FOREIGN KEY([idCity])
REFERENCES [dbo].[City] ([Id])
GO
ALTER TABLE [dbo].[Client] CHECK CONSTRAINT [FK_Client_City]
GO
ALTER TABLE [dbo].[Client]  WITH CHECK ADD  CONSTRAINT [FK_Client_Street] FOREIGN KEY([IdStreet])
REFERENCES [dbo].[Street] ([Id])
GO
ALTER TABLE [dbo].[Client] CHECK CONSTRAINT [FK_Client_Street]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Post] FOREIGN KEY([idPost])
REFERENCES [dbo].[Post] ([Id])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_Post]
GO
ALTER TABLE [dbo].[HistoryEmployee]  WITH CHECK ADD  CONSTRAINT [FK_HistoryEmployee_Employee] FOREIGN KEY([idEmployee])
REFERENCES [dbo].[Employee] ([Id])
GO
ALTER TABLE [dbo].[HistoryEmployee] CHECK CONSTRAINT [FK_HistoryEmployee_Employee]
GO
ALTER TABLE [dbo].[HistoryEmployee]  WITH CHECK ADD  CONSTRAINT [FK_HistoryEmployee_TypeInput] FOREIGN KEY([idInput])
REFERENCES [dbo].[TypeInput] ([Id])
GO
ALTER TABLE [dbo].[HistoryEmployee] CHECK CONSTRAINT [FK_HistoryEmployee_TypeInput]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Client] FOREIGN KEY([idClient])
REFERENCES [dbo].[Client] ([Id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Client]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Status] FOREIGN KEY([idStatus])
REFERENCES [dbo].[Status] ([Id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Status]
GO
ALTER TABLE [dbo].[ServiceandOrder]  WITH CHECK ADD  CONSTRAINT [FK_ServiceandOrder_Client] FOREIGN KEY([idClient])
REFERENCES [dbo].[Client] ([Id])
GO
ALTER TABLE [dbo].[ServiceandOrder] CHECK CONSTRAINT [FK_ServiceandOrder_Client]
GO
ALTER TABLE [dbo].[ServiceandOrder]  WITH CHECK ADD  CONSTRAINT [FK_ServiceandOrder_Order] FOREIGN KEY([NumberOrder])
REFERENCES [dbo].[Order] ([Id])
GO
ALTER TABLE [dbo].[ServiceandOrder] CHECK CONSTRAINT [FK_ServiceandOrder_Order]
GO
ALTER TABLE [dbo].[ServiceandOrder]  WITH CHECK ADD  CONSTRAINT [FK_ServiceandOrder_Service] FOREIGN KEY([idService])
REFERENCES [dbo].[Service] ([IdService])
GO
ALTER TABLE [dbo].[ServiceandOrder] CHECK CONSTRAINT [FK_ServiceandOrder_Service]
GO
USE [master]
GO
ALTER DATABASE [KayukovDem23] SET  READ_WRITE 
GO
