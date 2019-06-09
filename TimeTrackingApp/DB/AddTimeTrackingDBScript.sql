USE [master]
GO
/****** Object:  Database [TimeTracking]    Script Date: 09/06/2019 06:18:51 ******/
CREATE DATABASE [TimeTracking]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TimeTracking', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQL2017\MSSQL\DATA\TimeTracking.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TimeTracking_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQL2017\MSSQL\DATA\TimeTracking_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
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
ALTER DATABASE [TimeTracking] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [TimeTracking] SET  MULTI_USER 
GO
ALTER DATABASE [TimeTracking] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TimeTracking] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TimeTracking] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TimeTracking] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TimeTracking] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'TimeTracking', N'ON'
GO
ALTER DATABASE [TimeTracking] SET QUERY_STORE = OFF
GO
USE [TimeTracking]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [TimeTracking]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 09/06/2019 06:18:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](50) NOT NULL,
	[Description] [nchar](10) NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Task]    Script Date: 09/06/2019 06:18:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Task](
	[TaskID] [int] IDENTITY(1,1) NOT NULL,
	[TaskTitle] [nvarchar](255) NOT NULL,
	[TaskDescription] [nvarchar](255) NULL,
	[TaskCreationDate] [datetime] NOT NULL,
	[TaskDisabled] [bit] NOT NULL,
	[TaskEstimateDuration] [decimal](18, 0) NOT NULL,
	[TaskCompletionDate] [date] NOT NULL,
	[TaskCreatorID] [int] NOT NULL,
	[TaskUserID] [int] NOT NULL,
 CONSTRAINT [PK_Task] PRIMARY KEY CLUSTERED 
(
	[TaskID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TimeEntry]    Script Date: 09/06/2019 06:18:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TimeEntry](
	[TimeEntryId] [int] IDENTITY(1,1) NOT NULL,
	[TimeEntryCreated] [datetime] NOT NULL,
	[TimeEntryDuration] [decimal](18, 0) NOT NULL,
	[TimeEntryDescription] [nvarchar](1000) NULL,
	[TimeEntryDate] [datetime] NOT NULL,
	[TimeEntryUserName] [nvarchar](50) NOT NULL,
	[TimeEntryUserID] [int] NOT NULL,
 CONSTRAINT [PK_TimeEntry] PRIMARY KEY CLUSTERED 
(
	[TimeEntryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 09/06/2019 06:18:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
	[Phone] [nchar](16) NULL,
	[FirstName] [nvarchar](255) NOT NULL,
	[LastName] [nvarchar](255) NULL,
	[Password] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](256) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[LastLoginDate] [datetime] NOT NULL,
	[Comment] [ntext] NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UsersRoles]    Script Date: 09/06/2019 06:18:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UsersRoles](
	[UserID] [int] NOT NULL,
	[RoleID] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Index [IX_UsersRoles]    Script Date: 09/06/2019 06:18:53 ******/
CREATE NONCLUSTERED INDEX [IX_UsersRoles] ON [dbo].[UsersRoles]
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[User] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[User] ADD  DEFAULT (getdate()) FOR [LastLoginDate]
GO
ALTER TABLE [dbo].[Task]  WITH CHECK ADD  CONSTRAINT [FK_Task_User] FOREIGN KEY([TaskUserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Task] CHECK CONSTRAINT [FK_Task_User]
GO
ALTER TABLE [dbo].[TimeEntry]  WITH CHECK ADD  CONSTRAINT [FK_TimeEntry_User] FOREIGN KEY([TimeEntryUserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[TimeEntry] CHECK CONSTRAINT [FK_TimeEntry_User]
GO
ALTER TABLE [dbo].[UsersRoles]  WITH CHECK ADD  CONSTRAINT [FK_UsersRoles_Role] FOREIGN KEY([RoleID])
REFERENCES [dbo].[Role] ([RoleID])
GO
ALTER TABLE [dbo].[UsersRoles] CHECK CONSTRAINT [FK_UsersRoles_Role]
GO
ALTER TABLE [dbo].[UsersRoles]  WITH CHECK ADD  CONSTRAINT [FK_UsersRoles_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[UsersRoles] CHECK CONSTRAINT [FK_UsersRoles_User]
GO
USE [master]
GO
ALTER DATABASE [TimeTracking] SET  READ_WRITE 
GO


USE [TimeTracking]
GO

INSERT INTO [dbo].[User]
           ([UserName]
           ,[Phone]
           ,[FirstName]
           ,[LastName]
           ,[Password]
           ,[Email]
)
     VALUES
           ( 'admin'
           ,null
           ,'admin'
           ,'admin'
           ,'admin'
           ,'admin@admin.com')
GO

USE [TimeTracking]
GO

INSERT INTO [dbo].[TimeEntry]
           ([TimeEntryCreated]
           ,[TimeEntryDuration]
           ,[TimeEntryDescription]
           ,[TimeEntryDate]
           ,[TimeEntryUserName]
           ,[TimeEntryUserID])
     VALUES
           (GETDATE()
           ,8
           ,'test 15'
           ,GETDATE() - 1
           ,'admin'
           ,1)



USE [TimeTracking]
GO

INSERT INTO [dbo].[TimeEntry]
           ([TimeEntryCreated]
           ,[TimeEntryDuration]
           ,[TimeEntryDescription]
           ,[TimeEntryDate]
           ,[TimeEntryUserName]
           ,[TimeEntryUserID])
     VALUES
           (GETDATE()
           ,8
           ,'test 16'
           ,GETDATE()
           ,'admin'
           ,1)



