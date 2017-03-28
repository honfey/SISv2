USE [master]
GO
/****** Object:  Database [SISV2]    Script Date: 2017/3/28 下午 01:56:39 ******/
CREATE DATABASE [SISV2]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SISV2', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\SISV2.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'SISV2_log', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\SISV2_log.ldf' , SIZE = 816KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [SISV2] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SISV2].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SISV2] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SISV2] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SISV2] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SISV2] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SISV2] SET ARITHABORT OFF 
GO
ALTER DATABASE [SISV2] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [SISV2] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SISV2] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SISV2] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SISV2] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SISV2] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SISV2] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SISV2] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SISV2] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SISV2] SET  ENABLE_BROKER 
GO
ALTER DATABASE [SISV2] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SISV2] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SISV2] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SISV2] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SISV2] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SISV2] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SISV2] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SISV2] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [SISV2] SET  MULTI_USER 
GO
ALTER DATABASE [SISV2] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SISV2] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SISV2] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SISV2] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [SISV2] SET DELAYED_DURABILITY = DISABLED 
GO
USE [SISV2]
GO
/****** Object:  Schema [Administrator]    Script Date: 2017/3/28 下午 01:56:39 ******/
CREATE SCHEMA [Administrator]
GO
/****** Object:  Schema [Training]    Script Date: 2017/3/28 下午 01:56:39 ******/
CREATE SCHEMA [Training]
GO
/****** Object:  Table [Administrator].[Package]    Script Date: 2017/3/28 下午 01:56:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Administrator].[Package](
	[PackageId] [int] IDENTITY(1,1) NOT NULL,
	[PaymentPlan] [int] NULL,
	[LoanPercent] [int] NULL,
	[Amount] [decimal](18, 0) NULL,
	[SaleComfirmation] [varchar](50) NULL,
	[cd] [time](7) NULL,
	[cb] [int] NULL,
	[ud] [time](7) NULL,
	[ub] [int] NULL,
	[st] [tinyint] NULL,
 CONSTRAINT [PK_Package] PRIMARY KEY CLUSTERED 
(
	[PackageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 2017/3/28 下午 01:56:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 2017/3/28 下午 01:56:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 2017/3/28 下午 01:56:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 2017/3/28 下午 01:56:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 2017/3/28 下午 01:56:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](128) NOT NULL,
	[RoleId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 2017/3/28 下午 01:56:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](128) NOT NULL,
	[Email] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEndDateUtc] [datetime] NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [Training].[Address]    Script Date: 2017/3/28 下午 01:56:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Training].[Address](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StudentId] [int] NULL,
	[StreetLine1] [varchar](50) NULL,
	[StreetLine2] [varchar](50) NULL,
	[PostCode] [varchar](50) NULL,
	[City] [varchar](20) NULL,
	[State] [varchar](20) NULL,
	[Country] [varchar](30) NULL,
	[cd] [time](7) NULL,
	[cb] [int] NULL,
	[ud] [time](7) NULL,
	[ub] [int] NULL,
	[st] [tinyint] NULL,
 CONSTRAINT [PK_Address] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Training].[Attendance]    Script Date: 2017/3/28 下午 01:56:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Training].[Attendance](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ClassStudentId] [int] NULL,
	[MorningIn] [time](7) NULL,
	[MorningOut] [time](7) NULL,
	[AfternoonIn] [time](7) NULL,
	[AfternoonOut] [time](7) NULL,
	[TodayDate] [date] NULL,
	[MStatus] [varchar](50) NULL,
	[AStatus] [varchar](50) NULL,
	[Status] [bit] NULL,
	[EditBy] [varchar](50) NULL,
	[EditDate] [datetime] NULL,
	[cd] [time](7) NULL,
	[cb] [int] NULL,
	[ud] [time](7) NULL,
	[ub] [int] NULL,
	[st] [tinyint] NULL,
 CONSTRAINT [PK_Table1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Training].[ClassStudent]    Script Date: 2017/3/28 下午 01:56:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Training].[ClassStudent](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Course_ModuleId] [int] NULL,
	[StudentId] [int] NULL,
	[Day] [int] NULL,
	[Exam_Day] [int] NULL,
	[Trial_Day] [int] NULL,
	[Project_Day] [int] NULL,
	[Status] [bit] NULL,
	[CreateDate] [date] NULL,
	[cd] [time](7) NULL,
	[cb] [int] NULL,
	[ud] [time](7) NULL,
	[ub] [int] NULL,
	[st] [tinyint] NULL,
 CONSTRAINT [PK_ClassStudent] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Training].[Course]    Script Date: 2017/3/28 下午 01:56:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Training].[Course](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CourseCode] [varchar](50) NOT NULL,
	[PackageId] [int] NULL,
	[Name] [varchar](50) NULL,
	[cd] [time](7) NULL,
	[cb] [int] NULL,
	[ud] [time](7) NULL,
	[ub] [int] NULL,
	[st] [tinyint] NULL,
 CONSTRAINT [PK_Course] PRIMARY KEY CLUSTERED 
(
	[CourseCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Training].[Course_Module]    Script Date: 2017/3/28 下午 01:56:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Training].[Course_Module](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CourseId] [varchar](50) NULL,
	[ModuleId] [varchar](50) NULL,
	[TrainerId] [int] NULL,
	[cd] [time](7) NULL,
	[cb] [int] NULL,
	[ud] [time](7) NULL,
	[ub] [int] NULL,
	[st] [tinyint] NULL,
 CONSTRAINT [PK_Course_Module] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Training].[CourseWork]    Script Date: 2017/3/28 下午 01:56:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Training].[CourseWork](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ClassStudentId] [int] NULL,
	[Course_ModuleId] [int] NULL,
	[TestTypeId] [int] NULL,
	[ModuleStandardId] [int] NULL,
	[Marks] [int] NULL,
	[Status] [varchar](50) NULL,
	[Total1] [int] NULL,
	[Total2] [int] NULL,
	[Total3] [int] NULL,
	[Total4] [int] NULL,
	[cd] [time](7) NULL,
	[cb] [int] NULL,
	[ud] [time](7) NULL,
	[ub] [int] NULL,
	[st] [tinyint] NULL,
 CONSTRAINT [PK_Class_Test_ModuleStandard] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Training].[Guardian]    Script Date: 2017/3/28 下午 01:56:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Training].[Guardian](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StudentId] [int] NULL,
	[Gender] [varchar](50) NULL,
	[Name] [varchar](500) NULL,
	[IC] [int] NULL,
	[Edu] [varchar](50) NULL,
	[WorkStatus] [varchar](50) NULL,
	[Job] [varchar](50) NULL,
	[FeildWork] [varchar](50) NULL,
	[SectorJob] [varchar](50) NULL,
	[Salary] [money] NULL,
	[cb] [int] NULL,
	[cd] [time](7) NULL,
	[ub] [int] NULL,
	[ud] [time](7) NULL,
	[st] [tinyint] NULL,
 CONSTRAINT [PK_Guardian] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Training].[Image]    Script Date: 2017/3/28 下午 01:56:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Training].[Image](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FileName] [nvarchar](500) NULL,
	[CourseWorkId] [int] NULL,
	[cd] [time](7) NULL,
	[cb] [int] NULL,
	[ud] [time](7) NULL,
	[ub] [int] NULL,
	[st] [tinyint] NULL,
 CONSTRAINT [PK_Image] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Training].[Intake]    Script Date: 2017/3/28 下午 01:56:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Training].[Intake](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[YearId] [int] NOT NULL,
	[MonthId] [int] NOT NULL,
	[CourseCode] [varchar](50) NULL,
	[cd] [time](7) NULL,
	[cb] [int] NULL,
	[ud] [time](7) NULL,
	[ub] [int] NULL,
	[st] [tinyint] NULL,
 CONSTRAINT [PK_Intake] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Training].[Invoice]    Script Date: 2017/3/28 下午 01:56:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Training].[Invoice](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StudentId] [int] NULL,
	[Ref] [varchar](50) NULL,
	[Date] [date] NULL,
	[Description] [varchar](50) NULL,
	[Amount] [decimal](18, 2) NULL,
	[GST] [decimal](18, 2) NULL,
	[GSTAmt] [decimal](18, 2) NULL,
	[Total] [decimal](18, 2) NULL,
	[FinalTotal] [decimal](18, 2) NULL,
	[Color] [nvarchar](50) NULL,
	[cd] [time](7) NULL,
	[cb] [int] NULL,
	[ud] [time](7) NULL,
	[ub] [int] NULL,
	[st] [tinyint] NULL,
 CONSTRAINT [PK_Invoice] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Training].[MarkType]    Script Date: 2017/3/28 下午 01:56:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Training].[MarkType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[cd] [time](7) NULL,
	[cb] [int] NULL,
	[ud] [time](7) NULL,
	[ub] [int] NULL,
	[st] [tinyint] NULL,
 CONSTRAINT [PK_MarkType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Training].[Module]    Script Date: 2017/3/28 下午 01:56:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Training].[Module](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ModuleCode] [varchar](50) NOT NULL,
	[Name] [varchar](50) NULL,
	[cd] [time](7) NULL,
	[cb] [int] NULL,
	[ud] [time](7) NULL,
	[ub] [int] NULL,
	[st] [tinyint] NULL,
 CONSTRAINT [PK_Module] PRIMARY KEY CLUSTERED 
(
	[ModuleCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Training].[ModuleStandard]    Script Date: 2017/3/28 下午 01:56:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Training].[ModuleStandard](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Course_ModuleId] [int] NULL,
	[MarkTypeId] [int] NULL,
	[LabName] [varchar](50) NULL,
	[Marks] [int] NULL,
	[cd] [time](7) NULL,
	[cb] [int] NULL,
	[ud] [time](7) NULL,
	[ub] [int] NULL,
	[st] [tinyint] NULL,
 CONSTRAINT [PK_ModuleStandard] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Training].[Month]    Script Date: 2017/3/28 下午 01:56:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Training].[Month](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Month] [varchar](4) NULL,
	[cd] [time](7) NULL,
	[cb] [int] NULL,
	[ud] [time](7) NULL,
	[ub] [int] NULL,
	[st] [tinyint] NULL,
 CONSTRAINT [PK_Month] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Training].[Nationality]    Script Date: 2017/3/28 下午 01:56:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Training].[Nationality](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[cd] [time](7) NULL,
	[cb] [int] NULL,
	[ud] [time](7) NULL,
	[ub] [int] NULL,
	[st] [tinyint] NULL,
 CONSTRAINT [PK_Nationality] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Training].[Package_Course]    Script Date: 2017/3/28 下午 01:56:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Training].[Package_Course](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CourseId] [varchar](50) NOT NULL,
	[StudentId] [int] NULL,
	[TotalPrice] [decimal](18, 2) NULL,
	[FirstPay] [decimal](18, 2) NULL,
	[MonthlyInterest] [int] NULL,
	[TotalMonthlyP] [decimal](18, 2) NULL,
	[AfterPlnPay] [decimal](18, 2) NULL,
	[InterestRate] [int] NULL,
	[MonthlyPayment] [decimal](18, 2) NULL,
	[TotalLeft] [decimal](18, 2) NULL,
	[cd] [time](7) NULL,
	[cb] [int] NULL,
	[ud] [time](7) NULL,
	[ub] [int] NULL,
	[st] [tinyint] NULL,
 CONSTRAINT [PK_Package_Course_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Training].[Parent]    Script Date: 2017/3/28 下午 01:56:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Training].[Parent](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StudentId] [int] NULL,
	[FatherIC] [int] NULL,
	[FatherName] [varchar](500) NULL,
	[FatherEdu] [varchar](50) NULL,
	[FatherWorkStatus] [varchar](50) NULL,
	[FatherJob] [varchar](50) NULL,
	[FatherFeildWork] [varchar](50) NULL,
	[FatherSectorJob] [varchar](50) NULL,
	[FatherSalary] [money] NULL,
	[MotherIC] [int] NULL,
	[MotherName] [varchar](500) NULL,
	[MotherEdu] [varchar](50) NULL,
	[MotherWorkStatus] [varchar](50) NULL,
	[MotherJob] [varchar](50) NULL,
	[MotherFeildWork] [varchar](50) NULL,
	[MotherSectorJob] [varchar](50) NULL,
	[MotherSalary] [money] NULL,
	[cd] [time](7) NULL,
	[cb] [int] NULL,
	[ud] [time](7) NULL,
	[ub] [int] NULL,
	[st] [tinyint] NULL,
 CONSTRAINT [PK_Parent] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Training].[ReportCard]    Script Date: 2017/3/28 下午 01:56:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Training].[ReportCard](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Course_ModuleId] [int] NULL,
	[StudentId] [int] NULL,
	[IntakeId] [int] NULL,
	[TrainerId] [int] NULL,
	[ClassStudentId] [int] NULL,
	[ModuleStandardId] [int] NULL,
	[CourseWorkId] [int] NULL,
	[cd] [time](7) NULL,
	[cb] [int] NULL,
	[ud] [time](7) NULL,
	[ub] [int] NULL,
	[st] [tinyint] NULL,
 CONSTRAINT [PK_ReportCard] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Training].[Sibling]    Script Date: 2017/3/28 下午 01:56:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Training].[Sibling](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StudentId] [int] NOT NULL,
	[Name] [varchar](50) NULL,
	[Age] [int] NULL,
	[Gender] [varchar](50) NULL,
	[HomePosition] [int] NULL,
	[Occupation] [varchar](50) NULL,
	[IC] [int] NULL,
	[HandphoneNumber] [int] NULL,
	[Email] [varchar](100) NULL,
	[cd] [time](7) NULL,
	[cb] [int] NULL,
	[ud] [time](7) NULL,
	[ub] [int] NULL,
	[st] [tinyint] NULL,
 CONSTRAINT [PK_Sibling] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Training].[SPMResult]    Script Date: 2017/3/28 下午 01:56:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Training].[SPMResult](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StudentId] [int] NULL,
	[SubjectName] [varchar](50) NULL,
	[Grade] [nchar](10) NULL,
	[cd] [time](7) NULL,
	[cb] [int] NULL,
	[ud] [time](7) NULL,
	[ub] [int] NULL,
	[st] [tinyint] NULL,
 CONSTRAINT [PK_SPMResult] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Training].[Student]    Script Date: 2017/3/28 下午 01:56:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Training].[Student](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StudentId] [varchar](50) NULL,
	[IntakeId] [int] NULL,
	[SPMResultId] [int] NULL,
	[Insurence] [bit] NULL,
	[Name] [varchar](50) NULL,
	[Age] [int] NULL,
	[DOB] [date] NULL,
	[IC] [bigint] NOT NULL,
	[NationalityId] [int] NULL,
	[Gender] [varchar](50) NULL,
	[Status] [varchar](50) NULL,
	[PhoneNum] [varchar](50) NULL,
	[OtherPhoneNum] [varchar](50) NULL,
	[EmailAddress] [varchar](50) NULL,
	[Religion] [varchar](50) NULL,
	[SingleParent] [varchar](50) NULL,
	[StudentPicture] [varchar](max) NULL,
	[WorkingExp] [varchar](max) NULL,
	[HDYKSBIT] [varchar](max) NULL,
	[NumSibling] [int] NULL,
	[BirthOrd] [int] NULL,
	[cd] [time](7) NULL,
	[cb] [int] NULL,
	[ud] [time](7) NULL,
	[ub] [int] NULL,
	[st] [tinyint] NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Training].[Subject]    Script Date: 2017/3/28 下午 01:56:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Training].[Subject](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SubjectName] [varchar](50) NULL,
	[Grade] [nchar](10) NULL,
	[cd] [time](7) NULL,
	[cb] [int] NULL,
	[ud] [time](7) NULL,
	[ub] [int] NULL,
	[st] [tinyint] NULL,
 CONSTRAINT [PK_Subject] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Training].[TestType]    Script Date: 2017/3/28 下午 01:56:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Training].[TestType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[cd] [time](7) NULL,
	[cb] [int] NULL,
	[ud] [time](7) NULL,
	[ub] [int] NULL,
	[st] [tinyint] NULL,
 CONSTRAINT [PK_TestType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Training].[Trainer]    Script Date: 2017/3/28 下午 01:56:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Training].[Trainer](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TrainerPicture] [varchar](max) NULL,
	[IC] [varchar](50) NULL,
	[Name] [varchar](50) NULL,
	[FirstName] [varchar](50) NULL,
	[LastName] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[PhoneNum] [varchar](50) NULL,
	[Address1] [varchar](50) NULL,
	[Address2] [varchar](50) NULL,
	[Postcode] [varchar](50) NULL,
	[City] [varchar](50) NULL,
	[State] [varchar](50) NULL,
	[Country] [varchar](50) NULL,
	[Gender] [varchar](50) NULL,
	[Race] [varchar](50) NULL,
	[DateOfBirth] [date] NULL,
	[FileName] [varchar](max) NULL,
	[iohykSBIT] [varchar](max) NULL,
	[cd] [time](7) NULL,
	[cb] [int] NULL,
	[ud] [time](7) NULL,
	[ub] [int] NULL,
	[st] [tinyint] NULL,
 CONSTRAINT [PK_Trainer] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Training].[Year]    Script Date: 2017/3/28 下午 01:56:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Training].[Year](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Year] [varchar](50) NULL,
	[cd] [time](7) NULL,
	[cb] [int] NULL,
	[ud] [time](7) NULL,
	[ub] [int] NULL,
	[st] [tinyint] NULL,
 CONSTRAINT [PK_Year] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'201701190618280_InitialCreate', N'SISV2.Models.ApplicationDbContext', 0x1F8B0800000000000400DD5CDB6EE336107D2FD07F10F4D416A99538DDC536B077913A491B7473C13ABBE8DB82966847588952252A4D50F4CBFAD04FEA2F742851375E74B115DB290A146B717866381C92C3D151FEFDFB9FC9BB47DF331E7014BB01999A47A343D3C0C40E1C97ACA6664297DFBF31DFBDFDFAABC9B9E33F1A9F72B96326073D493C35EF290D4F2C2BB6EFB18FE291EFDA5110074B3AB203DF424E608D0F0F7FB48E8E2C0C10266019C6E44342A8EBE3F407FC9C05C4C6214D90771538D88BF9736899A7A8C635F2711C221B4FCDF9E5FCD37894C999C6A9E722B0618EBDA5692042028A285878F231C6731A0564350FE101F2EE9E420C724BE4C5985B7E528A771DC4E1980DC22A3BE6507612D3C0EF097874CCBD6289DDD7F2AD59780DFC760EFEA54F6CD4A9EFA6E6A583D3471F020F1C202A3C997911139E9A57858AD338BCC67494771C65901711C0FD11445F4655C403A373BF83228AC6A343F6DF81314B3C9A44784A704223E41D18B7C9C273ED5FF1D35DF00593E9F1D16279FCE6D56BE41CBFFE011FBFAA8E14C60A72B507F0E8360A421C816D78598CDF34AC7A3F4BEC5874ABF4C9BC02B1040BC234AED0E37B4C56F41E96CAF88D695CB88FD8C99FF0E0FA485C583FD0894609FCBC4E3C0F2D3C5CB45B8D3AD9FF1BB48E5FBD1E44EB357A7057E9D40BFA61E144B0AE3E602F6D8DEFDD305B5EB5F9FECCC52EA2C067BFEBF195B57E9E074964B3C1045A913B14AD30AD5B37B1CAE0ED14D20C6AF8B0CE51F73FB499A572782B45D980D65909B98A6DAF86DCDEE7D5DB39E24EC310262F0D2DE691A680AB1E5323A1DF8191B696E172D4355C080CE3FFBCFB9DFBC8F506D8FE3A68819C63E9463E2E46F95300C186486F9B6F511CC3EA777E41F17D83E9F0CF014C9F633B892028E714F9E1B36BBBBD0F08BE4EFC058BF5EDE91A6C6AEEFE082E904D83E89CB05E1BE3BD0FEC2F4142CF89738628FE48ED1C90FDBC73FDEE008398736ADB388E2F2098B1330B20A5CE012F093D1EF786635BD3AED38F99875C5F9D7F089BE8E75CB4CC41D412521EA21153E5224DA6BE0F562EE9666A2EAA3735936835958BF535958175B3944BEA0D4D055AEDCCA406CBEED2191A3EBD4B61F73FBFDBECF0D6ED051537CE6187C43F638223D8C69C5B44298E4839035DF68D5D240BE9F431A5CF7E36A59A3E212F195AD55AAB21DD04865F0D29ECFEAF86D44C78FCE03A2C2BE970E9C98501BE93BCFA3ED5BEE604CBB6BD1C6AC3DCB6F2EDEC01BAE5721AC781EDA6AB4051EEE2C58ABAFD90C319ED958B6C3462F503060681EEB2230F9EC0D84C31A86EC819F630C5C6A99D95036728B69123BB1106E4F4302C3F511586955590BA71DF493A21D271C43A2176098A61A5BA84CACBC225B61B22AFD54B42CF8E47181B7BA1436C39C321264C61AB27BA2857173D9801851E6152DA3C34B12A11D71C889AAC5537E76D296C39EF522D622B31D9923B6BE292E76FCF1298CD1EDB427036BBA48B01DA02DE2E0294DF55BA06807871D9B700156E4C9A00E529D55602B4EEB11D0468DD252F2E40B32B6AD7F917EEABFB169EF58BF2F68FF54677ED20366BFED8B3D0CC724FE843A1078EE4F03C5BB046FC48159733B093DFCF629EEA8A21C2C0E798D64B3665BEABCC43AD661031889A00CB406B01E5AFFE24206941F5302EAFE5355AC7B3881EB079DDAD1196EFFD026C250664ECEA2BD08AA0FE45A9189C9D6E1FC5C88A689082BCD365A182A3080871F3AA0FBC8353747559D9315D72E13ED97065607C321A1CD492B96A9C940F66702FE5A1D9EE255542D62725DBC84B42FAA4F1523E98C1BDC463B4DD498AA4A0475AB0918BEA47F8408B2DAF7414A74DD136B1324E147F30B134E4A9C9150A4397AC2A642AFEC498674CAAD9F7F3FE44233FC3B0EC58C1372AAC2D34D120422B2CB4826AB0F4C28D627A86285A2056E79939BE24A63C5B35DB7FAEB27A7CCA93989F03B934FB377FB35A7D615F3B65E53484F7BE80B1F92C97490BE88A9957773718AD0D792852D4EC678197F8449F5AE97B676FEEAAFDB32732C2C412EC975227C94F52825B777AA7299197C3C6D353E42CEB4F911E42E7E83CE3ACBA5A9785EA51F2A254154557A8DAD994E992978ED3246684FD67A915E179D612A7A15401F8A39E18152683045669EB8E5A279B5431EB2DDD11054649155268EA616595375233B2DAB0169EC6A36A89EE1A64A648155D6EED8EACE08C54A115CD6B602B6C16DBBAA32A68255560457377EC9263226E9F7B7C5A69EF296B1C57D92576B3F34A83F13C7BE130C75DE55D7D15A8F2B827167F1B2F81F1E77B1947DA9BDC1A7194552D368B230D867EB7A9BDDFAE6F368D2FE5F598B597D6B50DBDE9A5BD1EAF5FB43E6B4C48573851A4D05E5CE5842BDB845F9FDA3F8A91EE53998869E46E84487A8A29F6474C6034FFDD9B792E665B772E708588BBC431CD881AE6F8F0682C7C5DB33F5FBA5871EC788AEBA7EE7397FA9C6D8173451E5064DFA34866406CF03548092A15972F89831FA7E69F69AF93B44EC1FE953E3E302EE38FC4FD3D8186BB28C1C65F32A37318767CF3956A4FBF65E8EED5CBDF3E675D0F8C9B0856CC897128F8729D19AE7FE1D0CB9AACEB06D6ACFDDDC3CB5D50B50F0C94A8C28258FF7B82854B07F99620B7F21B1F3D7EDBD734E5F7021B212ABE09180A6F1017EA38FFEB6069F9FE0EFCA429DFBFDF60D5FCFF754CD372FF5DD21F4C64FE77DF86F29E3B3C6A14B7A16D6C49A99F5B99D31BD128777D364904EB8D16BA4CA2EE01B701517A8DC878611CE3C14E4705857830EC5D86F6B3F386F7852A5C923876CB10DE2629B8E125D0FF8A0BBC07EC35051B67F78CDF6DC79AAE82BBE7B4C97EBCDE3D0B36CED1DA3D7B77DBC1A62BF3EE79B0F5E2E8EE59ACEDEAFCDC71A4753E4277CEB895C9439A3731AA5A701BA3362B9CC30D7F114010641965F621A49AC2D5443F6D51588AE895EAB963A26269E1487A258966B5FDC6CA0FFCC6C1729966B51AC665936EBEFF37EAE632CDBA353CC65D7081954C42153FBB651F6BA23CBD24EE6F6D242D54F3B69CB5F1B5FA4BA2FA0EE294DAEAD1BC237E39CCDE415C32E4D2E9C1E4955FF7C2D959F94B89707EC7EEAA84607F379160BB766A1632976419E487B760512E225468AE30450E1CA9A7117597C8A6D0CC6ACCE997DC69DD8EBDE95860E792DC24344C280C19FB0BAF56F062494093FE94AE5CB7797213A67F9464882180992EABCDDF909F12D7730ABB2F1435210D04CB2E784597CD256595DDD55381741D908E40DC7D45527487FDD003B0F886CCD1035EC73608BFF77885ECA7B202A803699F88BADB27672E5A45C88F3946D91F7E420C3BFEE3DBFF000111E23030540000, N'6.1.3-40302')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'51b6e047-e01f-491f-b659-ddf951d88814', N'yp@s.com', 0, N'ABj/yQ0NQVwAkCQ5vJTkKBLvwlXPniWn3pHfDXcu2wfXyc8vVYWHRQ7bjErw6eo+oA==', N'865b8008-82f5-4f90-922e-a07b1e99c6f5', NULL, 0, 0, NULL, 1, 0, N'yp@s.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'6de90559-9498-4e62-93c6-9b9312797c42', N'yp@y.com', 0, N'ACOTCjpBfM5SQbocrfr6MsIohJ5pFZ8lVxvGETZqYV9V6lvd2CSBEZWs5NwkiljCUg==', N'f3f8dc66-c0f8-4599-9470-f51f0c01660a', NULL, 0, 0, NULL, 1, 0, N'yp@y.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'ddcf1af2-53ff-475f-acf3-3a43e4e48b34', N'yongpr0@hotmail.com', 0, N'AIo09ZWN+96sHHsr0ccG2EaXZxbrhjHaOSBTRYy3S0aWynlnu6sWxaX/wNLvcydFWA==', N'61b57c47-f7f2-4c18-98f6-aa66fb6d9a1f', NULL, 0, 0, NULL, 1, 0, N'yongpr0@hotmail.com')
SET IDENTITY_INSERT [Training].[Course] ON 

INSERT [Training].[Course] ([Id], [CourseCode], [PackageId], [Name], [cd], [cb], [ud], [ub], [st]) VALUES (1, N'1', 1, N'DSE', NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [Training].[Course] OFF
SET IDENTITY_INSERT [Training].[Guardian] ON 

INSERT [Training].[Guardian] ([Id], [StudentId], [Gender], [Name], [IC], [Edu], [WorkStatus], [Job], [FeildWork], [SectorJob], [Salary], [cb], [cd], [ub], [ud], [st]) VALUES (1, 15, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [Training].[Guardian] ([Id], [StudentId], [Gender], [Name], [IC], [Edu], [WorkStatus], [Job], [FeildWork], [SectorJob], [Salary], [cb], [cd], [ub], [ud], [st]) VALUES (2, 17, N'Female', N'asd', 123, N'asd', N'asd', N'aasd', N'asd', N'asd', 12.0000, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [Training].[Guardian] OFF
SET IDENTITY_INSERT [Training].[Intake] ON 

INSERT [Training].[Intake] ([Id], [YearId], [MonthId], [CourseCode], [cd], [cb], [ud], [ub], [st]) VALUES (1, 5, 4, N'1', NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [Training].[Intake] OFF
SET IDENTITY_INSERT [Training].[Month] ON 

INSERT [Training].[Month] ([Id], [Month], [cd], [cb], [ud], [ub], [st]) VALUES (1, N'1', NULL, NULL, NULL, NULL, NULL)
INSERT [Training].[Month] ([Id], [Month], [cd], [cb], [ud], [ub], [st]) VALUES (2, N'2', NULL, NULL, NULL, NULL, NULL)
INSERT [Training].[Month] ([Id], [Month], [cd], [cb], [ud], [ub], [st]) VALUES (3, N'3', NULL, NULL, NULL, NULL, NULL)
INSERT [Training].[Month] ([Id], [Month], [cd], [cb], [ud], [ub], [st]) VALUES (4, N'4', NULL, NULL, NULL, NULL, NULL)
INSERT [Training].[Month] ([Id], [Month], [cd], [cb], [ud], [ub], [st]) VALUES (5, N'5', NULL, NULL, NULL, NULL, NULL)
INSERT [Training].[Month] ([Id], [Month], [cd], [cb], [ud], [ub], [st]) VALUES (6, N'6', NULL, NULL, NULL, NULL, NULL)
INSERT [Training].[Month] ([Id], [Month], [cd], [cb], [ud], [ub], [st]) VALUES (7, N'7', NULL, NULL, NULL, NULL, NULL)
INSERT [Training].[Month] ([Id], [Month], [cd], [cb], [ud], [ub], [st]) VALUES (8, N'8', NULL, NULL, NULL, NULL, NULL)
INSERT [Training].[Month] ([Id], [Month], [cd], [cb], [ud], [ub], [st]) VALUES (9, N'9', NULL, NULL, NULL, NULL, NULL)
INSERT [Training].[Month] ([Id], [Month], [cd], [cb], [ud], [ub], [st]) VALUES (10, N'10', NULL, NULL, NULL, NULL, NULL)
INSERT [Training].[Month] ([Id], [Month], [cd], [cb], [ud], [ub], [st]) VALUES (11, N'11', NULL, NULL, NULL, NULL, NULL)
INSERT [Training].[Month] ([Id], [Month], [cd], [cb], [ud], [ub], [st]) VALUES (12, N'12', NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [Training].[Month] OFF
SET IDENTITY_INSERT [Training].[Parent] ON 

INSERT [Training].[Parent] ([Id], [StudentId], [FatherIC], [FatherName], [FatherEdu], [FatherWorkStatus], [FatherJob], [FatherFeildWork], [FatherSectorJob], [FatherSalary], [MotherIC], [MotherName], [MotherEdu], [MotherWorkStatus], [MotherJob], [MotherFeildWork], [MotherSectorJob], [MotherSalary], [cd], [cb], [ud], [ub], [st]) VALUES (0, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [Training].[Parent] ([Id], [StudentId], [FatherIC], [FatherName], [FatherEdu], [FatherWorkStatus], [FatherJob], [FatherFeildWork], [FatherSectorJob], [FatherSalary], [MotherIC], [MotherName], [MotherEdu], [MotherWorkStatus], [MotherJob], [MotherFeildWork], [MotherSectorJob], [MotherSalary], [cd], [cb], [ud], [ub], [st]) VALUES (1, 15, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1123, N'asdasdasd', N'asd', N'asd', N'asd', N'asd', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [Training].[Parent] ([Id], [StudentId], [FatherIC], [FatherName], [FatherEdu], [FatherWorkStatus], [FatherJob], [FatherFeildWork], [FatherSectorJob], [FatherSalary], [MotherIC], [MotherName], [MotherEdu], [MotherWorkStatus], [MotherJob], [MotherFeildWork], [MotherSectorJob], [MotherSalary], [cd], [cb], [ud], [ub], [st]) VALUES (2, 17, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [Training].[Parent] OFF
SET IDENTITY_INSERT [Training].[Student] ON 

INSERT [Training].[Student] ([Id], [StudentId], [IntakeId], [SPMResultId], [Insurence], [Name], [Age], [DOB], [IC], [NationalityId], [Gender], [Status], [PhoneNum], [OtherPhoneNum], [EmailAddress], [Religion], [SingleParent], [StudentPicture], [WorkingExp], [HDYKSBIT], [NumSibling], [BirthOrd], [cd], [cb], [ud], [ub], [st]) VALUES (1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1231231234, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [Training].[Student] ([Id], [StudentId], [IntakeId], [SPMResultId], [Insurence], [Name], [Age], [DOB], [IC], [NationalityId], [Gender], [Status], [PhoneNum], [OtherPhoneNum], [EmailAddress], [Religion], [SingleParent], [StudentPicture], [WorkingExp], [HDYKSBIT], [NumSibling], [BirthOrd], [cd], [cb], [ud], [ub], [st]) VALUES (2, N'P1940002', 1, NULL, NULL, NULL, NULL, NULL, 123456, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [Training].[Student] ([Id], [StudentId], [IntakeId], [SPMResultId], [Insurence], [Name], [Age], [DOB], [IC], [NationalityId], [Gender], [Status], [PhoneNum], [OtherPhoneNum], [EmailAddress], [Religion], [SingleParent], [StudentPicture], [WorkingExp], [HDYKSBIT], [NumSibling], [BirthOrd], [cd], [cb], [ud], [ub], [st]) VALUES (3, N'P1940003', 1, NULL, NULL, NULL, NULL, NULL, 123456789, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'No', N'asd', N'asd', N'????????', 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [Training].[Student] ([Id], [StudentId], [IntakeId], [SPMResultId], [Insurence], [Name], [Age], [DOB], [IC], [NationalityId], [Gender], [Status], [PhoneNum], [OtherPhoneNum], [EmailAddress], [Religion], [SingleParent], [StudentPicture], [WorkingExp], [HDYKSBIT], [NumSibling], [BirthOrd], [cd], [cb], [ud], [ub], [st]) VALUES (4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0)
INSERT [Training].[Student] ([Id], [StudentId], [IntakeId], [SPMResultId], [Insurence], [Name], [Age], [DOB], [IC], [NationalityId], [Gender], [Status], [PhoneNum], [OtherPhoneNum], [EmailAddress], [Religion], [SingleParent], [StudentPicture], [WorkingExp], [HDYKSBIT], [NumSibling], [BirthOrd], [cd], [cb], [ud], [ub], [st]) VALUES (5, N'P1940005', 1, NULL, 1, N'asd', 12, CAST(N'2016-12-12' AS Date), 1978546598, NULL, N'Male', N'Active', N'01635968421', NULL, N'shitshit@gmail.com', N'Muslim', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [Training].[Student] ([Id], [StudentId], [IntakeId], [SPMResultId], [Insurence], [Name], [Age], [DOB], [IC], [NationalityId], [Gender], [Status], [PhoneNum], [OtherPhoneNum], [EmailAddress], [Religion], [SingleParent], [StudentPicture], [WorkingExp], [HDYKSBIT], [NumSibling], [BirthOrd], [cd], [cb], [ud], [ub], [st]) VALUES (6, N'P1940006', 1, NULL, NULL, N'qwe', 12, CAST(N'2016-12-12' AS Date), 9685741230, NULL, N'Male', N'InActive', N'0165243987', NULL, NULL, NULL, N'Yes', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [Training].[Student] ([Id], [StudentId], [IntakeId], [SPMResultId], [Insurence], [Name], [Age], [DOB], [IC], [NationalityId], [Gender], [Status], [PhoneNum], [OtherPhoneNum], [EmailAddress], [Religion], [SingleParent], [StudentPicture], [WorkingExp], [HDYKSBIT], [NumSibling], [BirthOrd], [cd], [cb], [ud], [ub], [st]) VALUES (7, N'P1940006', 1, NULL, NULL, N'qwe', 12, CAST(N'2016-12-12' AS Date), 9685741230, NULL, N'Male', N'InActive', N'0165243987', NULL, NULL, NULL, N'Yes', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [Training].[Student] ([Id], [StudentId], [IntakeId], [SPMResultId], [Insurence], [Name], [Age], [DOB], [IC], [NationalityId], [Gender], [Status], [PhoneNum], [OtherPhoneNum], [EmailAddress], [Religion], [SingleParent], [StudentPicture], [WorkingExp], [HDYKSBIT], [NumSibling], [BirthOrd], [cd], [cb], [ud], [ub], [st]) VALUES (8, N'P1940008', 1, NULL, NULL, NULL, NULL, NULL, 1231231234, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [Training].[Student] ([Id], [StudentId], [IntakeId], [SPMResultId], [Insurence], [Name], [Age], [DOB], [IC], [NationalityId], [Gender], [Status], [PhoneNum], [OtherPhoneNum], [EmailAddress], [Religion], [SingleParent], [StudentPicture], [WorkingExp], [HDYKSBIT], [NumSibling], [BirthOrd], [cd], [cb], [ud], [ub], [st]) VALUES (9, N'P1940008', 1, NULL, NULL, NULL, NULL, NULL, 1231231234, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [Training].[Student] ([Id], [StudentId], [IntakeId], [SPMResultId], [Insurence], [Name], [Age], [DOB], [IC], [NationalityId], [Gender], [Status], [PhoneNum], [OtherPhoneNum], [EmailAddress], [Religion], [SingleParent], [StudentPicture], [WorkingExp], [HDYKSBIT], [NumSibling], [BirthOrd], [cd], [cb], [ud], [ub], [st]) VALUES (14, N'P1940014', 1, NULL, NULL, N'asd', 12, NULL, 123123124, NULL, N'Female', N'Active', N'1`231231231', N'123123', N'zsdaW@ddaf.com', N'Christianity ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [Training].[Student] ([Id], [StudentId], [IntakeId], [SPMResultId], [Insurence], [Name], [Age], [DOB], [IC], [NationalityId], [Gender], [Status], [PhoneNum], [OtherPhoneNum], [EmailAddress], [Religion], [SingleParent], [StudentPicture], [WorkingExp], [HDYKSBIT], [NumSibling], [BirthOrd], [cd], [cb], [ud], [ub], [st]) VALUES (15, N'P1940014', 1, NULL, NULL, N'asd', 12, NULL, 123123124, NULL, N'Female', N'Active', N'1`231231231', N'123123', N'zsdaW@ddaf.com', N'Christianity ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [Training].[Student] ([Id], [StudentId], [IntakeId], [SPMResultId], [Insurence], [Name], [Age], [DOB], [IC], [NationalityId], [Gender], [Status], [PhoneNum], [OtherPhoneNum], [EmailAddress], [Religion], [SingleParent], [StudentPicture], [WorkingExp], [HDYKSBIT], [NumSibling], [BirthOrd], [cd], [cb], [ud], [ub], [st]) VALUES (16, N'P1940016', 1, NULL, NULL, N'zxc', 12, NULL, 1234567891, NULL, N'Male', N'InActive', N'123123', N'123', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [Training].[Student] ([Id], [StudentId], [IntakeId], [SPMResultId], [Insurence], [Name], [Age], [DOB], [IC], [NationalityId], [Gender], [Status], [PhoneNum], [OtherPhoneNum], [EmailAddress], [Religion], [SingleParent], [StudentPicture], [WorkingExp], [HDYKSBIT], [NumSibling], [BirthOrd], [cd], [cb], [ud], [ub], [st]) VALUES (17, N'P1940016', 1, NULL, NULL, N'zxc', 12, NULL, 1234567891, NULL, N'Male', N'InActive', N'123123', N'123', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1)
SET IDENTITY_INSERT [Training].[Student] OFF
SET IDENTITY_INSERT [Training].[Year] ON 

INSERT [Training].[Year] ([Id], [Year], [cd], [cb], [ud], [ub], [st]) VALUES (1, N'2015', NULL, NULL, NULL, NULL, NULL)
INSERT [Training].[Year] ([Id], [Year], [cd], [cb], [ud], [ub], [st]) VALUES (2, N'2016', NULL, NULL, NULL, NULL, NULL)
INSERT [Training].[Year] ([Id], [Year], [cd], [cb], [ud], [ub], [st]) VALUES (3, N'2017', NULL, NULL, NULL, NULL, NULL)
INSERT [Training].[Year] ([Id], [Year], [cd], [cb], [ud], [ub], [st]) VALUES (4, N'2018', NULL, NULL, NULL, NULL, NULL)
INSERT [Training].[Year] ([Id], [Year], [cd], [cb], [ud], [ub], [st]) VALUES (5, N'2019', NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [Training].[Year] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [RoleNameIndex]    Script Date: 2017/3/28 下午 01:56:39 ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_UserId]    Script Date: 2017/3/28 下午 01:56:39 ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_UserId]    Script Date: 2017/3/28 下午 01:56:39 ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_RoleId]    Script Date: 2017/3/28 下午 01:56:39 ******/
CREATE NONCLUSTERED INDEX [IX_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_UserId]    Script Date: 2017/3/28 下午 01:56:39 ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserRoles]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UserNameIndex]    Script Date: 2017/3/28 下午 01:56:39 ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [Training].[Address]  WITH CHECK ADD  CONSTRAINT [FK_Address_Student] FOREIGN KEY([StudentId])
REFERENCES [Training].[Student] ([Id])
GO
ALTER TABLE [Training].[Address] CHECK CONSTRAINT [FK_Address_Student]
GO
ALTER TABLE [Training].[Attendance]  WITH CHECK ADD  CONSTRAINT [FK_Attendance_ClassStudent] FOREIGN KEY([ClassStudentId])
REFERENCES [Training].[ClassStudent] ([Id])
GO
ALTER TABLE [Training].[Attendance] CHECK CONSTRAINT [FK_Attendance_ClassStudent]
GO
ALTER TABLE [Training].[ClassStudent]  WITH CHECK ADD  CONSTRAINT [FK_ClassStudent_Course_Module] FOREIGN KEY([Course_ModuleId])
REFERENCES [Training].[Course_Module] ([Id])
GO
ALTER TABLE [Training].[ClassStudent] CHECK CONSTRAINT [FK_ClassStudent_Course_Module]
GO
ALTER TABLE [Training].[ClassStudent]  WITH CHECK ADD  CONSTRAINT [FK_ClassStudent_Student] FOREIGN KEY([StudentId])
REFERENCES [Training].[Student] ([Id])
GO
ALTER TABLE [Training].[ClassStudent] CHECK CONSTRAINT [FK_ClassStudent_Student]
GO
ALTER TABLE [Training].[Course_Module]  WITH CHECK ADD  CONSTRAINT [FK_Course_Module_Course] FOREIGN KEY([CourseId])
REFERENCES [Training].[Course] ([CourseCode])
GO
ALTER TABLE [Training].[Course_Module] CHECK CONSTRAINT [FK_Course_Module_Course]
GO
ALTER TABLE [Training].[Course_Module]  WITH CHECK ADD  CONSTRAINT [FK_Course_Module_Module] FOREIGN KEY([ModuleId])
REFERENCES [Training].[Module] ([ModuleCode])
GO
ALTER TABLE [Training].[Course_Module] CHECK CONSTRAINT [FK_Course_Module_Module]
GO
ALTER TABLE [Training].[Course_Module]  WITH CHECK ADD  CONSTRAINT [FK_Course_Module_Trainer] FOREIGN KEY([TrainerId])
REFERENCES [Training].[Trainer] ([Id])
GO
ALTER TABLE [Training].[Course_Module] CHECK CONSTRAINT [FK_Course_Module_Trainer]
GO
ALTER TABLE [Training].[CourseWork]  WITH CHECK ADD  CONSTRAINT [FK_CourseWork_ClassStudent] FOREIGN KEY([ClassStudentId])
REFERENCES [Training].[ClassStudent] ([Id])
GO
ALTER TABLE [Training].[CourseWork] CHECK CONSTRAINT [FK_CourseWork_ClassStudent]
GO
ALTER TABLE [Training].[CourseWork]  WITH CHECK ADD  CONSTRAINT [FK_CourseWork_Course_Module] FOREIGN KEY([Course_ModuleId])
REFERENCES [Training].[Course_Module] ([Id])
GO
ALTER TABLE [Training].[CourseWork] CHECK CONSTRAINT [FK_CourseWork_Course_Module]
GO
ALTER TABLE [Training].[CourseWork]  WITH CHECK ADD  CONSTRAINT [FK_CourseWork_ModuleStandard] FOREIGN KEY([ModuleStandardId])
REFERENCES [Training].[ModuleStandard] ([Id])
GO
ALTER TABLE [Training].[CourseWork] CHECK CONSTRAINT [FK_CourseWork_ModuleStandard]
GO
ALTER TABLE [Training].[CourseWork]  WITH CHECK ADD  CONSTRAINT [FK_CourseWork_TestType] FOREIGN KEY([TestTypeId])
REFERENCES [Training].[TestType] ([Id])
GO
ALTER TABLE [Training].[CourseWork] CHECK CONSTRAINT [FK_CourseWork_TestType]
GO
ALTER TABLE [Training].[Guardian]  WITH CHECK ADD  CONSTRAINT [FK_Guardian_Student] FOREIGN KEY([StudentId])
REFERENCES [Training].[Student] ([Id])
GO
ALTER TABLE [Training].[Guardian] CHECK CONSTRAINT [FK_Guardian_Student]
GO
ALTER TABLE [Training].[Image]  WITH CHECK ADD  CONSTRAINT [FK_Image_CourseWork] FOREIGN KEY([CourseWorkId])
REFERENCES [Training].[CourseWork] ([Id])
GO
ALTER TABLE [Training].[Image] CHECK CONSTRAINT [FK_Image_CourseWork]
GO
ALTER TABLE [Training].[Intake]  WITH CHECK ADD  CONSTRAINT [FK_Intake_Course] FOREIGN KEY([CourseCode])
REFERENCES [Training].[Course] ([CourseCode])
GO
ALTER TABLE [Training].[Intake] CHECK CONSTRAINT [FK_Intake_Course]
GO
ALTER TABLE [Training].[Intake]  WITH CHECK ADD  CONSTRAINT [FK_Intake_Month] FOREIGN KEY([MonthId])
REFERENCES [Training].[Month] ([Id])
GO
ALTER TABLE [Training].[Intake] CHECK CONSTRAINT [FK_Intake_Month]
GO
ALTER TABLE [Training].[Intake]  WITH CHECK ADD  CONSTRAINT [FK_Intake_Year] FOREIGN KEY([YearId])
REFERENCES [Training].[Year] ([Id])
GO
ALTER TABLE [Training].[Intake] CHECK CONSTRAINT [FK_Intake_Year]
GO
ALTER TABLE [Training].[Invoice]  WITH CHECK ADD  CONSTRAINT [FK_Invoice_Student] FOREIGN KEY([StudentId])
REFERENCES [Training].[Student] ([Id])
GO
ALTER TABLE [Training].[Invoice] CHECK CONSTRAINT [FK_Invoice_Student]
GO
ALTER TABLE [Training].[ModuleStandard]  WITH CHECK ADD  CONSTRAINT [FK_ModuleStandard_Course_Module] FOREIGN KEY([Course_ModuleId])
REFERENCES [Training].[Course_Module] ([Id])
GO
ALTER TABLE [Training].[ModuleStandard] CHECK CONSTRAINT [FK_ModuleStandard_Course_Module]
GO
ALTER TABLE [Training].[ModuleStandard]  WITH CHECK ADD  CONSTRAINT [FK_ModuleStandard_MarkType] FOREIGN KEY([MarkTypeId])
REFERENCES [Training].[MarkType] ([Id])
GO
ALTER TABLE [Training].[ModuleStandard] CHECK CONSTRAINT [FK_ModuleStandard_MarkType]
GO
ALTER TABLE [Training].[Package_Course]  WITH CHECK ADD  CONSTRAINT [FK_Package_Course_Course] FOREIGN KEY([CourseId])
REFERENCES [Training].[Course] ([CourseCode])
GO
ALTER TABLE [Training].[Package_Course] CHECK CONSTRAINT [FK_Package_Course_Course]
GO
ALTER TABLE [Training].[Package_Course]  WITH CHECK ADD  CONSTRAINT [FK_Package_Course_Student] FOREIGN KEY([StudentId])
REFERENCES [Training].[Student] ([Id])
GO
ALTER TABLE [Training].[Package_Course] CHECK CONSTRAINT [FK_Package_Course_Student]
GO
ALTER TABLE [Training].[Parent]  WITH CHECK ADD  CONSTRAINT [FK_Parent_Student] FOREIGN KEY([StudentId])
REFERENCES [Training].[Student] ([Id])
GO
ALTER TABLE [Training].[Parent] CHECK CONSTRAINT [FK_Parent_Student]
GO
ALTER TABLE [Training].[ReportCard]  WITH CHECK ADD  CONSTRAINT [FK_ReportCard_ClassStudent] FOREIGN KEY([ClassStudentId])
REFERENCES [Training].[ClassStudent] ([Id])
GO
ALTER TABLE [Training].[ReportCard] CHECK CONSTRAINT [FK_ReportCard_ClassStudent]
GO
ALTER TABLE [Training].[ReportCard]  WITH CHECK ADD  CONSTRAINT [FK_ReportCard_Course_Module] FOREIGN KEY([Course_ModuleId])
REFERENCES [Training].[Course_Module] ([Id])
GO
ALTER TABLE [Training].[ReportCard] CHECK CONSTRAINT [FK_ReportCard_Course_Module]
GO
ALTER TABLE [Training].[ReportCard]  WITH CHECK ADD  CONSTRAINT [FK_ReportCard_CourseWork] FOREIGN KEY([CourseWorkId])
REFERENCES [Training].[CourseWork] ([Id])
GO
ALTER TABLE [Training].[ReportCard] CHECK CONSTRAINT [FK_ReportCard_CourseWork]
GO
ALTER TABLE [Training].[ReportCard]  WITH CHECK ADD  CONSTRAINT [FK_ReportCard_Intake] FOREIGN KEY([IntakeId])
REFERENCES [Training].[Intake] ([Id])
GO
ALTER TABLE [Training].[ReportCard] CHECK CONSTRAINT [FK_ReportCard_Intake]
GO
ALTER TABLE [Training].[ReportCard]  WITH CHECK ADD  CONSTRAINT [FK_ReportCard_ModuleStandard] FOREIGN KEY([ModuleStandardId])
REFERENCES [Training].[ModuleStandard] ([Id])
GO
ALTER TABLE [Training].[ReportCard] CHECK CONSTRAINT [FK_ReportCard_ModuleStandard]
GO
ALTER TABLE [Training].[ReportCard]  WITH CHECK ADD  CONSTRAINT [FK_ReportCard_Student] FOREIGN KEY([StudentId])
REFERENCES [Training].[Student] ([Id])
GO
ALTER TABLE [Training].[ReportCard] CHECK CONSTRAINT [FK_ReportCard_Student]
GO
ALTER TABLE [Training].[ReportCard]  WITH CHECK ADD  CONSTRAINT [FK_ReportCard_Trainer] FOREIGN KEY([TrainerId])
REFERENCES [Training].[Trainer] ([Id])
GO
ALTER TABLE [Training].[ReportCard] CHECK CONSTRAINT [FK_ReportCard_Trainer]
GO
ALTER TABLE [Training].[Sibling]  WITH CHECK ADD  CONSTRAINT [FK_Sibling_Student] FOREIGN KEY([StudentId])
REFERENCES [Training].[Student] ([Id])
GO
ALTER TABLE [Training].[Sibling] CHECK CONSTRAINT [FK_Sibling_Student]
GO
ALTER TABLE [Training].[SPMResult]  WITH CHECK ADD  CONSTRAINT [FK_SPMResult_Student] FOREIGN KEY([StudentId])
REFERENCES [Training].[Student] ([Id])
GO
ALTER TABLE [Training].[SPMResult] CHECK CONSTRAINT [FK_SPMResult_Student]
GO
ALTER TABLE [Training].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Student_Intake] FOREIGN KEY([IntakeId])
REFERENCES [Training].[Intake] ([Id])
GO
ALTER TABLE [Training].[Student] CHECK CONSTRAINT [FK_Student_Intake]
GO
ALTER TABLE [Training].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Student_Nationality] FOREIGN KEY([NationalityId])
REFERENCES [Training].[Nationality] ([Id])
GO
ALTER TABLE [Training].[Student] CHECK CONSTRAINT [FK_Student_Nationality]
GO
USE [master]
GO
ALTER DATABASE [SISV2] SET  READ_WRITE 
GO
