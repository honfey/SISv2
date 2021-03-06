USE [master]
GO
/****** Object:  Database [SISV2]    Script Date: 2017/4/4 下午 01:33:13 ******/
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
/****** Object:  Schema [Administrator]    Script Date: 2017/4/4 下午 01:33:13 ******/
CREATE SCHEMA [Administrator]
GO
/****** Object:  Schema [Training]    Script Date: 2017/4/4 下午 01:33:13 ******/
CREATE SCHEMA [Training]
GO
/****** Object:  Table [Administrator].[Package]    Script Date: 2017/4/4 下午 01:33:13 ******/
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
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 2017/4/4 下午 01:33:13 ******/
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
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 2017/4/4 下午 01:33:13 ******/
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
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 2017/4/4 下午 01:33:13 ******/
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
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 2017/4/4 下午 01:33:13 ******/
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
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 2017/4/4 下午 01:33:13 ******/
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
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 2017/4/4 下午 01:33:13 ******/
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
/****** Object:  Table [Training].[Address]    Script Date: 2017/4/4 下午 01:33:13 ******/
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
	[cd] [datetime] NULL,
	[cb] [nvarchar](128) NULL,
	[ud] [datetime] NULL,
	[ub] [nvarchar](128) NULL,
	[st] [tinyint] NULL,
 CONSTRAINT [PK_Address] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Training].[Amount]    Script Date: 2017/4/4 下午 01:33:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Training].[Amount](
	[Id] [int] NOT NULL,
	[InvoiceId] [int] NULL,
	[Description] [varchar](50) NULL,
	[Amount] [decimal](18, 2) NULL,
	[GST] [decimal](18, 2) NULL,
	[GSTAmt] [decimal](18, 2) NULL,
	[Total] [decimal](18, 2) NULL,
	[FinalTotal] [decimal](18, 2) NULL,
 CONSTRAINT [PK_Amount] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Training].[Attendance]    Script Date: 2017/4/4 下午 01:33:13 ******/
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
	[cd] [datetime] NULL,
	[cb] [nvarchar](128) NULL,
	[ud] [datetime] NULL,
	[ub] [nvarchar](128) NULL,
	[st] [tinyint] NULL,
 CONSTRAINT [PK_Table1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Training].[ClassStudent]    Script Date: 2017/4/4 下午 01:33:13 ******/
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
	[cd] [datetime] NULL,
	[cb] [nvarchar](128) NULL,
	[ud] [datetime] NULL,
	[ub] [nvarchar](128) NULL,
	[st] [tinyint] NULL,
 CONSTRAINT [PK_ClassStudent] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Training].[Course]    Script Date: 2017/4/4 下午 01:33:13 ******/
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
	[cd] [datetime] NULL,
	[cb] [nvarchar](128) NULL,
	[ud] [datetime] NULL,
	[ub] [nvarchar](128) NULL,
	[st] [tinyint] NULL,
 CONSTRAINT [PK_Course] PRIMARY KEY CLUSTERED 
(
	[CourseCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Training].[Course_Module]    Script Date: 2017/4/4 下午 01:33:13 ******/
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
	[cd] [datetime] NULL,
	[cb] [nvarchar](128) NULL,
	[ud] [datetime] NULL,
	[ub] [nvarchar](128) NULL,
	[st] [tinyint] NULL,
 CONSTRAINT [PK_Course_Module] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Training].[CourseWork]    Script Date: 2017/4/4 下午 01:33:13 ******/
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
	[cd] [datetime] NULL,
	[cb] [nvarchar](128) NULL,
	[ud] [datetime] NULL,
	[ub] [nvarchar](128) NULL,
	[st] [tinyint] NULL,
 CONSTRAINT [PK_Class_Test_ModuleStandard] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Training].[Guardian]    Script Date: 2017/4/4 下午 01:33:13 ******/
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
	[cb] [datetime] NULL,
	[cd] [nvarchar](128) NULL,
	[ub] [datetime] NULL,
	[ud] [nvarchar](128) NULL,
	[st] [tinyint] NULL,
 CONSTRAINT [PK_Guardian] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Training].[Image]    Script Date: 2017/4/4 下午 01:33:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Training].[Image](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FileName] [nvarchar](500) NULL,
	[CourseWorkId] [int] NULL,
	[cd] [datetime] NULL,
	[cb] [nvarchar](128) NULL,
	[ud] [datetime] NULL,
	[ub] [nvarchar](128) NULL,
	[st] [tinyint] NULL,
 CONSTRAINT [PK_Image] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Training].[Intake]    Script Date: 2017/4/4 下午 01:33:13 ******/
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
	[cd] [datetime] NULL,
	[cb] [nvarchar](128) NULL,
	[ud] [datetime] NULL,
	[ub] [nvarchar](128) NULL,
	[st] [tinyint] NULL,
 CONSTRAINT [PK_Intake] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Training].[Invoice]    Script Date: 2017/4/4 下午 01:33:13 ******/
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
	[Color] [nvarchar](50) NULL,
	[cd] [datetime] NULL,
	[cb] [nvarchar](128) NULL,
	[ud] [datetime] NULL,
	[ub] [nvarchar](128) NULL,
	[st] [tinyint] NULL,
 CONSTRAINT [PK_Invoice] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Training].[MarkType]    Script Date: 2017/4/4 下午 01:33:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Training].[MarkType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[cd] [datetime] NULL,
	[cb] [nvarchar](128) NULL,
	[ud] [datetime] NULL,
	[ub] [nvarchar](128) NULL,
	[st] [tinyint] NULL,
 CONSTRAINT [PK_MarkType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Training].[Module]    Script Date: 2017/4/4 下午 01:33:13 ******/
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
	[cd] [datetime] NULL,
	[cb] [nvarchar](128) NULL,
	[ud] [datetime] NULL,
	[ub] [nvarchar](128) NULL,
	[st] [tinyint] NULL,
 CONSTRAINT [PK_Module] PRIMARY KEY CLUSTERED 
(
	[ModuleCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Training].[ModuleStandard]    Script Date: 2017/4/4 下午 01:33:13 ******/
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
	[cd] [datetime] NULL,
	[cb] [nvarchar](128) NULL,
	[ud] [datetime] NULL,
	[ub] [nvarchar](128) NULL,
	[st] [tinyint] NULL,
 CONSTRAINT [PK_ModuleStandard] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Training].[Month]    Script Date: 2017/4/4 下午 01:33:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Training].[Month](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Month] [varchar](4) NULL,
	[cd] [datetime] NULL,
	[cb] [nvarchar](128) NULL,
	[ud] [datetime] NULL,
	[ub] [nvarchar](128) NULL,
	[st] [tinyint] NULL,
 CONSTRAINT [PK_Month] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Training].[Nationality]    Script Date: 2017/4/4 下午 01:33:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Training].[Nationality](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[cd] [datetime] NULL,
	[cb] [nvarchar](128) NULL,
	[ud] [datetime] NULL,
	[ub] [nvarchar](128) NULL,
	[st] [tinyint] NULL,
 CONSTRAINT [PK_Nationality] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Training].[Package_Course]    Script Date: 2017/4/4 下午 01:33:13 ******/
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
	[cd] [datetime] NULL,
	[cb] [nvarchar](128) NULL,
	[ud] [datetime] NULL,
	[ub] [nvarchar](128) NULL,
	[st] [tinyint] NULL,
 CONSTRAINT [PK_Package_Course_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Training].[Parent]    Script Date: 2017/4/4 下午 01:33:13 ******/
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
	[cd] [datetime] NULL,
	[cb] [nvarchar](128) NULL,
	[ud] [datetime] NULL,
	[ub] [nvarchar](128) NULL,
	[st] [tinyint] NULL,
 CONSTRAINT [PK_Parent] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Training].[ReportCard]    Script Date: 2017/4/4 下午 01:33:13 ******/
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
	[cd] [datetime] NULL,
	[cb] [nvarchar](128) NULL,
	[ud] [datetime] NULL,
	[ub] [nvarchar](128) NULL,
	[st] [tinyint] NULL,
 CONSTRAINT [PK_ReportCard] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Training].[Sibling]    Script Date: 2017/4/4 下午 01:33:13 ******/
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
	[cd] [datetime] NULL,
	[cb] [nvarchar](128) NULL,
	[ud] [datetime] NULL,
	[ub] [nvarchar](128) NULL,
	[st] [tinyint] NULL,
 CONSTRAINT [PK_Sibling] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Training].[SPMResult]    Script Date: 2017/4/4 下午 01:33:13 ******/
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
	[cd] [datetime] NULL,
	[cb] [nvarchar](128) NULL,
	[ud] [datetime] NULL,
	[ub] [nvarchar](128) NULL,
	[st] [tinyint] NULL,
 CONSTRAINT [PK_SPMResult] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Training].[Student]    Script Date: 2017/4/4 下午 01:33:13 ******/
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
	[cd] [datetime] NULL,
	[cb] [nvarchar](128) NULL,
	[ud] [datetime] NULL,
	[ub] [nvarchar](128) NULL,
	[st] [tinyint] NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Training].[Subject]    Script Date: 2017/4/4 下午 01:33:13 ******/
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
	[cd] [datetime] NULL,
	[cb] [nvarchar](128) NULL,
	[ud] [datetime] NULL,
	[ub] [nvarchar](128) NULL,
	[st] [tinyint] NULL,
 CONSTRAINT [PK_Subject] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Training].[TestType]    Script Date: 2017/4/4 下午 01:33:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Training].[TestType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[cd] [datetime] NULL,
	[cb] [nvarchar](128) NULL,
	[ud] [datetime] NULL,
	[ub] [nvarchar](128) NULL,
	[st] [tinyint] NULL,
 CONSTRAINT [PK_TestType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Training].[Trainer]    Script Date: 2017/4/4 下午 01:33:13 ******/
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
	[cd] [datetime] NULL,
	[cb] [nvarchar](128) NULL,
	[ud] [datetime] NULL,
	[ub] [nvarchar](128) NULL,
	[st] [tinyint] NULL,
 CONSTRAINT [PK_Trainer] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Training].[Year]    Script Date: 2017/4/4 下午 01:33:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Training].[Year](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Year] [varchar](50) NULL,
	[cd] [datetime] NULL,
	[cb] [nvarchar](128) NULL,
	[ud] [datetime] NULL,
	[ub] [nvarchar](128) NULL,
	[st] [tinyint] NULL,
 CONSTRAINT [PK_Year] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [RoleNameIndex]    Script Date: 2017/4/4 下午 01:33:13 ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_UserId]    Script Date: 2017/4/4 下午 01:33:13 ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_UserId]    Script Date: 2017/4/4 下午 01:33:13 ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_RoleId]    Script Date: 2017/4/4 下午 01:33:13 ******/
CREATE NONCLUSTERED INDEX [IX_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_UserId]    Script Date: 2017/4/4 下午 01:33:13 ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserRoles]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UserNameIndex]    Script Date: 2017/4/4 下午 01:33:13 ******/
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
ALTER TABLE [Training].[Amount]  WITH CHECK ADD  CONSTRAINT [FK_Amount_Invoice] FOREIGN KEY([InvoiceId])
REFERENCES [Training].[Invoice] ([Id])
GO
ALTER TABLE [Training].[Amount] CHECK CONSTRAINT [FK_Amount_Invoice]
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
