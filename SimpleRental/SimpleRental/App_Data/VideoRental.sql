USE [master]
GO
/****** Object:  Database [VideoRental]    Script Date: 2/7/2020 9:01:56 PM ******/
CREATE DATABASE [VideoRental]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'VideoRental', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\VideoRental.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'VideoRental_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\VideoRental_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [VideoRental] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [VideoRental].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [VideoRental] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [VideoRental] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [VideoRental] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [VideoRental] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [VideoRental] SET ARITHABORT OFF 
GO
ALTER DATABASE [VideoRental] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [VideoRental] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [VideoRental] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [VideoRental] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [VideoRental] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [VideoRental] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [VideoRental] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [VideoRental] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [VideoRental] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [VideoRental] SET  DISABLE_BROKER 
GO
ALTER DATABASE [VideoRental] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [VideoRental] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [VideoRental] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [VideoRental] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [VideoRental] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [VideoRental] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [VideoRental] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [VideoRental] SET RECOVERY FULL 
GO
ALTER DATABASE [VideoRental] SET  MULTI_USER 
GO
ALTER DATABASE [VideoRental] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [VideoRental] SET DB_CHAINING OFF 
GO
ALTER DATABASE [VideoRental] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [VideoRental] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [VideoRental] SET DELAYED_DURABILITY = DISABLED 
GO
USE [VideoRental]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 2/7/2020 9:01:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[CustomerID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerName] [nvarchar](100) NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Genres]    Script Date: 2/7/2020 9:01:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Genres](
	[GenreID] [int] IDENTITY(1,1) NOT NULL,
	[GenreName] [nvarchar](100) NULL,
 CONSTRAINT [PK_Genres] PRIMARY KEY CLUSTERED 
(
	[GenreID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Movies]    Script Date: 2/7/2020 9:01:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Movies](
	[MovieID] [int] IDENTITY(1,1) NOT NULL,
	[MovieName] [nvarchar](100) NULL,
	[GenreFK] [int] NULL,
	[CustomerFK] [int] NULL,
 CONSTRAINT [PK_Movies] PRIMARY KEY CLUSTERED 
(
	[MovieID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RentalHeader]    Script Date: 2/7/2020 9:01:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RentalHeader](
	[RentalID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerFK] [int] NULL,
	[DateRented] [datetime] NULL,
	[MovieFK] [int] NULL,
	[DateReturned] [datetime] NULL,
 CONSTRAINT [PK_RentalHeader] PRIMARY KEY CLUSTERED 
(
	[RentalID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RentedMovies]    Script Date: 2/7/2020 9:01:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RentedMovies](
	[RentedID] [int] IDENTITY(1,1) NOT NULL,
	[MovieFK] [int] NULL,
	[DateReturned] [datetime] NULL,
	[RentalFK] [int] NULL,
 CONSTRAINT [PK_RentedMovies] PRIMARY KEY CLUSTERED 
(
	[RentedID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Customers] ON 

INSERT [dbo].[Customers] ([CustomerID], [CustomerName]) VALUES (1, N'Jaime Alzaga')
INSERT [dbo].[Customers] ([CustomerID], [CustomerName]) VALUES (2, N'Customer 2')
INSERT [dbo].[Customers] ([CustomerID], [CustomerName]) VALUES (3, N'Customer 3')
INSERT [dbo].[Customers] ([CustomerID], [CustomerName]) VALUES (4, N'Customer 4')
INSERT [dbo].[Customers] ([CustomerID], [CustomerName]) VALUES (7, N'Bogs William')
INSERT [dbo].[Customers] ([CustomerID], [CustomerName]) VALUES (8, N'Customer 5')
SET IDENTITY_INSERT [dbo].[Customers] OFF
SET IDENTITY_INSERT [dbo].[Genres] ON 

INSERT [dbo].[Genres] ([GenreID], [GenreName]) VALUES (1, N'Action')
INSERT [dbo].[Genres] ([GenreID], [GenreName]) VALUES (2, N'Comedy')
INSERT [dbo].[Genres] ([GenreID], [GenreName]) VALUES (3, N'Family')
SET IDENTITY_INSERT [dbo].[Genres] OFF
SET IDENTITY_INSERT [dbo].[Movies] ON 

INSERT [dbo].[Movies] ([MovieID], [MovieName], [GenreFK], [CustomerFK]) VALUES (1, N'End Game', 1, 1)
INSERT [dbo].[Movies] ([MovieID], [MovieName], [GenreFK], [CustomerFK]) VALUES (2, N'Captain Marvel', 1, 1)
INSERT [dbo].[Movies] ([MovieID], [MovieName], [GenreFK], [CustomerFK]) VALUES (3, N'BookSmart', 2, NULL)
INSERT [dbo].[Movies] ([MovieID], [MovieName], [GenreFK], [CustomerFK]) VALUES (4, N'Long Shot', 2, 1)
INSERT [dbo].[Movies] ([MovieID], [MovieName], [GenreFK], [CustomerFK]) VALUES (5, N'Frozen 2', 3, NULL)
INSERT [dbo].[Movies] ([MovieID], [MovieName], [GenreFK], [CustomerFK]) VALUES (6, N'Adams Family', 3, 1)
SET IDENTITY_INSERT [dbo].[Movies] OFF
SET IDENTITY_INSERT [dbo].[RentalHeader] ON 

INSERT [dbo].[RentalHeader] ([RentalID], [CustomerFK], [DateRented], [MovieFK], [DateReturned]) VALUES (1, 1, CAST(N'2020-01-01 00:00:00.000' AS DateTime), 1, CAST(N'2020-01-10 00:00:00.000' AS DateTime))
INSERT [dbo].[RentalHeader] ([RentalID], [CustomerFK], [DateRented], [MovieFK], [DateReturned]) VALUES (2, 2, CAST(N'2020-01-02 00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[RentalHeader] ([RentalID], [CustomerFK], [DateRented], [MovieFK], [DateReturned]) VALUES (4, 4, CAST(N'2020-01-10 00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[RentalHeader] ([RentalID], [CustomerFK], [DateRented], [MovieFK], [DateReturned]) VALUES (8, 3, CAST(N'2019-11-15 00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[RentalHeader] ([RentalID], [CustomerFK], [DateRented], [MovieFK], [DateReturned]) VALUES (9, 7, CAST(N'2019-10-15 00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[RentalHeader] ([RentalID], [CustomerFK], [DateRented], [MovieFK], [DateReturned]) VALUES (10, 8, CAST(N'2020-01-18 00:00:00.000' AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[RentalHeader] OFF
SET IDENTITY_INSERT [dbo].[RentedMovies] ON 

INSERT [dbo].[RentedMovies] ([RentedID], [MovieFK], [DateReturned], [RentalFK]) VALUES (8, 1, NULL, 1)
INSERT [dbo].[RentedMovies] ([RentedID], [MovieFK], [DateReturned], [RentalFK]) VALUES (9, 4, NULL, 1)
INSERT [dbo].[RentedMovies] ([RentedID], [MovieFK], [DateReturned], [RentalFK]) VALUES (11, 3, NULL, 4)
INSERT [dbo].[RentedMovies] ([RentedID], [MovieFK], [DateReturned], [RentalFK]) VALUES (12, 5, NULL, 8)
INSERT [dbo].[RentedMovies] ([RentedID], [MovieFK], [DateReturned], [RentalFK]) VALUES (13, 2, NULL, 9)
INSERT [dbo].[RentedMovies] ([RentedID], [MovieFK], [DateReturned], [RentalFK]) VALUES (1010, 2, NULL, 1009)
INSERT [dbo].[RentedMovies] ([RentedID], [MovieFK], [DateReturned], [RentalFK]) VALUES (1012, 3, NULL, 2)
INSERT [dbo].[RentedMovies] ([RentedID], [MovieFK], [DateReturned], [RentalFK]) VALUES (1013, 6, NULL, 2)
INSERT [dbo].[RentedMovies] ([RentedID], [MovieFK], [DateReturned], [RentalFK]) VALUES (1014, 1, NULL, 1)
INSERT [dbo].[RentedMovies] ([RentedID], [MovieFK], [DateReturned], [RentalFK]) VALUES (1015, 2, NULL, 1)
INSERT [dbo].[RentedMovies] ([RentedID], [MovieFK], [DateReturned], [RentalFK]) VALUES (1016, 3, NULL, 1)
INSERT [dbo].[RentedMovies] ([RentedID], [MovieFK], [DateReturned], [RentalFK]) VALUES (1017, 5, NULL, 1)
INSERT [dbo].[RentedMovies] ([RentedID], [MovieFK], [DateReturned], [RentalFK]) VALUES (1018, 4, NULL, 1)
INSERT [dbo].[RentedMovies] ([RentedID], [MovieFK], [DateReturned], [RentalFK]) VALUES (2024, 2, NULL, 10)
INSERT [dbo].[RentedMovies] ([RentedID], [MovieFK], [DateReturned], [RentalFK]) VALUES (2042, 5, NULL, 1023)
INSERT [dbo].[RentedMovies] ([RentedID], [MovieFK], [DateReturned], [RentalFK]) VALUES (2044, 5, NULL, 1024)
INSERT [dbo].[RentedMovies] ([RentedID], [MovieFK], [DateReturned], [RentalFK]) VALUES (2045, 4, NULL, 1024)
SET IDENTITY_INSERT [dbo].[RentedMovies] OFF
USE [master]
GO
ALTER DATABASE [VideoRental] SET  READ_WRITE 
GO
