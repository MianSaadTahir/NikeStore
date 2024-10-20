USE [master]
GO
/****** Object:  Database [Nike]    Script Date: 4/23/2024 14:46:54 ******/
CREATE DATABASE [Nike]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Nike', FILENAME = N'D:\Softwares\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Nike.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Nike_log', FILENAME = N'D:\Softwares\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Nike_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Nike] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Nike].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Nike] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Nike] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Nike] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Nike] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Nike] SET ARITHABORT OFF 
GO
ALTER DATABASE [Nike] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Nike] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Nike] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Nike] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Nike] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Nike] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Nike] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Nike] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Nike] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Nike] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Nike] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Nike] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Nike] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Nike] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Nike] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Nike] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Nike] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Nike] SET RECOVERY FULL 
GO
ALTER DATABASE [Nike] SET  MULTI_USER 
GO
ALTER DATABASE [Nike] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Nike] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Nike] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Nike] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Nike] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Nike] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Nike', N'ON'
GO
ALTER DATABASE [Nike] SET QUERY_STORE = ON
GO
ALTER DATABASE [Nike] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Nike]
GO
/****** Object:  Table [dbo].[Cart]    Script Date: 4/23/2024 14:46:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart](
	[SuitID] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Price] [decimal](18, 0) NOT NULL,
 CONSTRAINT [PK_Cart] PRIMARY KEY CLUSTERED 
(
	[SuitID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Feedbacks]    Script Date: 4/23/2024 14:46:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feedbacks](
	[CustomerName] [varchar](50) NOT NULL,
	[FeedbackText] [varchar](50) NOT NULL,
	[Rating] [int] NOT NULL,
	[DateSubmitted] [date] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Suits]    Script Date: 4/23/2024 14:46:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Suits](
	[SuitID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Size] [varchar](50) NOT NULL,
	[Color] [varchar](50) NOT NULL,
	[Quantity] [int] NOT NULL,
	[Price] [decimal](18, 0) NOT NULL,
 CONSTRAINT [PK_Suits] PRIMARY KEY CLUSTERED 
(
	[SuitID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 4/23/2024 14:46:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Username] [varchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[Role] [varchar](50) NULL
) ON [PRIMARY]
GO
INSERT [dbo].[Feedbacks] ([CustomerName], [FeedbackText], [Rating], [DateSubmitted]) VALUES (N'abc', N'hello', 1, CAST(N'2024-04-23' AS Date))
INSERT [dbo].[Feedbacks] ([CustomerName], [FeedbackText], [Rating], [DateSubmitted]) VALUES (N'ali', N'good quality fabric', 4, CAST(N'2024-04-23' AS Date))
GO
SET IDENTITY_INSERT [dbo].[Suits] ON 

INSERT [dbo].[Suits] ([SuitID], [Name], [Size], [Color], [Quantity], [Price]) VALUES (2, N'nike jumper', N'M', N'Grey', 100, CAST(9500 AS Decimal(18, 0)))
INSERT [dbo].[Suits] ([SuitID], [Name], [Size], [Color], [Quantity], [Price]) VALUES (4, N'air jordan', N'L', N'Black', 300, CAST(5000 AS Decimal(18, 0)))
INSERT [dbo].[Suits] ([SuitID], [Name], [Size], [Color], [Quantity], [Price]) VALUES (5, N'Dior x Nike Air Force', N'S', N'Blue', 500, CAST(1000 AS Decimal(18, 0)))
SET IDENTITY_INSERT [dbo].[Suits] OFF
GO
INSERT [dbo].[Users] ([Username], [Password], [Role]) VALUES (N'saad', N'111', N'admin')
INSERT [dbo].[Users] ([Username], [Password], [Role]) VALUES (N'ali', N'lala', N'customer')
INSERT [dbo].[Users] ([Username], [Password], [Role]) VALUES (N'abc', N'1', N'customer')
GO
USE [master]
GO
ALTER DATABASE [Nike] SET  READ_WRITE 
GO
