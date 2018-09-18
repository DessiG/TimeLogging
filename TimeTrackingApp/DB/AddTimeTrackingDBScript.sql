USE [master]
GO
/****** Object:  Database [TimeTracking]    Script Date: 9/17/2018 4:46:03 PM ******/
CREATE DATABASE [TimeTracking] 
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
ALTER DATABASE [TimeTracking] SET QUERY_STORE = OFF
GO
USE [TimeTracking]
GO
/****** Object:  Table [dbo].[tbl_Credentials]    Script Date: 9/17/2018 4:46:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Credentials](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](256) NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[LastLoginDate] [datetime] NOT NULL,
	[Comment] [ntext] NULL,
	[CredentialID] [int] NOT NULL,
 CONSTRAINT [PK_tbl_Credentials] PRIMARY KEY CLUSTERED 
(
	[CredentialID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Roles]    Script Date: 9/17/2018 4:46:03 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Tasks]    Script Date: 9/17/2018 4:46:03 PM ******/
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
	[TaskUserID] [int] NOT NULL,
 CONSTRAINT [PK_tbl_Tasks] PRIMARY KEY CLUSTERED 
(
	[TaskID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_TimeEntry]    Script Date: 9/17/2018 4:46:03 PM ******/
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
	[TimeEntryUserID] [int] NOT NULL,
 CONSTRAINT [PK_tbl_TimeEntry] PRIMARY KEY CLUSTERED 
(
	[TimeEntryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Users]    Script Date: 9/17/2018 4:46:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Users](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
	[Phone] [nchar](16) NULL,
	[FirstName] [nvarchar](255) NOT NULL,
	[LastName] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_tbl_Users] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_UsersInRoles]    Script Date: 9/17/2018 4:46:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_UsersInRoles](
	[UserID] [int] NOT NULL,
	[RoleID] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Index [IX_tbl_Credentials]    Script Date: 9/17/2018 4:46:04 PM ******/
CREATE NONCLUSTERED INDEX [IX_tbl_Credentials] ON [dbo].[tbl_Credentials]
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_tbl_Credentials_1]    Script Date: 9/17/2018 4:46:04 PM ******/
CREATE NONCLUSTERED INDEX [IX_tbl_Credentials_1] ON [dbo].[tbl_Credentials]
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_tbl_UsersInRoles]    Script Date: 9/17/2018 4:46:04 PM ******/
CREATE NONCLUSTERED INDEX [IX_tbl_UsersInRoles] ON [dbo].[tbl_UsersInRoles]
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tbl_Credentials]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Credentials_tbl_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[tbl_Users] ([UserID])
GO
ALTER TABLE [dbo].[tbl_Credentials] CHECK CONSTRAINT [FK_tbl_Credentials_tbl_Users]
GO
ALTER TABLE [dbo].[tbl_Tasks]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Tasks_tbl_Users] FOREIGN KEY([TaskUserID])
REFERENCES [dbo].[tbl_Users] ([UserID])
GO
ALTER TABLE [dbo].[tbl_Tasks] CHECK CONSTRAINT [FK_tbl_Tasks_tbl_Users]
GO
ALTER TABLE [dbo].[tbl_TimeEntry]  WITH CHECK ADD  CONSTRAINT [FK_tbl_TimeEntry_tbl_Users] FOREIGN KEY([TimeEntryUserID])
REFERENCES [dbo].[tbl_Users] ([UserID])
GO
ALTER TABLE [dbo].[tbl_TimeEntry] CHECK CONSTRAINT [FK_tbl_TimeEntry_tbl_Users]
GO
ALTER TABLE [dbo].[tbl_UsersInRoles]  WITH CHECK ADD  CONSTRAINT [FK_tbl_UsersInRoles_tbl_Roles] FOREIGN KEY([RoleID])
REFERENCES [dbo].[tbl_Roles] ([RoleID])
GO
ALTER TABLE [dbo].[tbl_UsersInRoles] CHECK CONSTRAINT [FK_tbl_UsersInRoles_tbl_Roles]
GO
ALTER TABLE [dbo].[tbl_UsersInRoles]  WITH CHECK ADD  CONSTRAINT [FK_tbl_UsersInRoles_tbl_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[tbl_Users] ([UserID])
GO
ALTER TABLE [dbo].[tbl_UsersInRoles] CHECK CONSTRAINT [FK_tbl_UsersInRoles_tbl_Users]
GO
USE [master]
GO
ALTER DATABASE [TimeTracking] SET  READ_WRITE 
GO
