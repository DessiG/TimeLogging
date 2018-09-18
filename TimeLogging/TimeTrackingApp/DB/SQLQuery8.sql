USE [master]
GO

CREATE DATABASE [TimeTracking] ON  PRIMARY 
( NAME = N'TimeTracking', FILENAME = N'D:\projects\TimeLogging\TimeTrackingApp\DB\TimeTracking.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'TimeTracking_log', FILENAME = N'D:\projects\TimeLogging\TimeTrackingApp\DB\TimeTracking_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [TimeTracking] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TimeTracking].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TimeTracking] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [TimeTracking] SET ANSI_NULLS OFF
GO
ALTER DATABASE [TimeTracking] SET ANSI_PADDING OFF
GO
ALTER DATABASE [TimeTracking] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [TimeTracking] SET ARITHABORT OFF
GO
ALTER DATABASE [TimeTracking] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [TimeTracking] SET AUTO_CREATE_STATISTICS ON
GO

ALTER DATABASE [TimeTracking] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [TimeTracking] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [TimeTracking] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [TimeTracking] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [TimeTracking] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [TimeTracking] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [TimeTracking] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [TimeTracking] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [TimeTracking] SET  DISABLE_BROKER
GO
ALTER DATABASE [TimeTracking] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [TimeTracking] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [TimeTracking] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [TimeTracking] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [TimeTracking] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [TimeTracking] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [TimeTracking] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [TimeTracking] SET  READ_WRITE
GO
ALTER DATABASE [TimeTracking] SET RECOVERY SIMPLE
GO
ALTER DATABASE [TimeTracking] SET  MULTI_USER
GO
ALTER DATABASE [TimeTracking] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [TimeTracking] SET DB_CHAINING OFF
GO
USE [TimeTracking]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_UsersInRoles](
	[UserID] [int] NOT NULL,
	[RoleID] [int] NOT NULL
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Users](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
	[Phone] [nchar](16) NULL,
	[FirstName] [nvarchar](255) NOT NULL,
	[LastName] [nvarchar](255) NOT NULL
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_TimeEntry](
	[TimeEntryId] [int] IDENTITY(1,1) NOT NULL,
	[TimeEntryCreated] [datetime] NOT NULL,
	[TimeEntryDuration] [decimal](18, 0) NOT NULL,
	[TimeEntryDescription] [nvarchar](1000) NULL,
	[TimeEntryDate] [datetime] NOT NULL,
	[TimeEntryUserID] [int] NOT NULL
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Tasks](
	[TaskID] [int] IDENTITY(1,1) NOT NULL,
	[TaskTitle] [nvarchar](255) NOT NULL,
	[TaskDescription] [nvarchar](255) NULL,
	[TaskCreationDate] [datetime] NOT NULL,
	[TaskDisabled] [bit] NOT NULL,
	[TaskEstimateDuration] [decimal](18, 0) NOT NULL,
	[TaskCompletionDate] [date] NOT NULL,
	[TaskCreatorID] [int] NOT NULL,
	[TaskUserID] [int] NOT NULL
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Roles](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](50) NOT NULL,
	[Description] [nchar](10) NULL,
 CONSTRAINT [PK_tbl_Roles] PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Credentials](
	[CredentialID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](256) NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[LastLoginDate] [datetime] NOT NULL,
	[Comment] [ntext] NULL,

 CONSTRAINT [PK_tbl_Memberships] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
