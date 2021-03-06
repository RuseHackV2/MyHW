USE [master]
GO
/****** Object:  Database [MyHW]    Script Date: 7.11.2015 г. 21:11:15 ******/
CREATE DATABASE [MyHW]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MyHW', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\MyHW.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'MyHW_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\MyHW_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [MyHW] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MyHW].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MyHW] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MyHW] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MyHW] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MyHW] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MyHW] SET ARITHABORT OFF 
GO
ALTER DATABASE [MyHW] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MyHW] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MyHW] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MyHW] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MyHW] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MyHW] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MyHW] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MyHW] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MyHW] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MyHW] SET  DISABLE_BROKER 
GO
ALTER DATABASE [MyHW] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MyHW] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MyHW] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MyHW] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MyHW] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MyHW] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MyHW] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MyHW] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [MyHW] SET  MULTI_USER 
GO
ALTER DATABASE [MyHW] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MyHW] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MyHW] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MyHW] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [MyHW] SET DELAYED_DURABILITY = DISABLED 
GO
USE [MyHW]
GO
/****** Object:  Table [dbo].[Comments]    Script Date: 7.11.2015 г. 21:11:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comments](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userId] [int] NOT NULL,
	[comment] [nvarchar](max) NOT NULL,
	[likesCount] [int] NOT NULL,
 CONSTRAINT [PK_Comments] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CommentsFans]    Script Date: 7.11.2015 г. 21:11:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CommentsFans](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[commentId] [int] NOT NULL,
	[fanId] [int] NOT NULL,
 CONSTRAINT [PK_CommentsFans] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Groups]    Script Date: 7.11.2015 г. 21:11:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Groups](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[teacherId] [int] NOT NULL,
	[name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Groups] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[GroupsTasks]    Script Date: 7.11.2015 г. 21:11:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GroupsTasks](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[groupId] [int] NOT NULL,
	[taskId] [int] NOT NULL,
 CONSTRAINT [PK_GroupsTasks] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Homeworks]    Script Date: 7.11.2015 г. 21:11:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Homeworks](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[taskId] [int] NOT NULL,
	[groupId] [int] NOT NULL,
	[submittedFile] [nvarchar](max) NOT NULL,
	[dateSubmitted] [date] NOT NULL,
	[grade] [nvarchar](50) NOT NULL,
	[review] [nvarchar](max) NOT NULL,
	[likesCount] [int] NOT NULL,
 CONSTRAINT [PK_Homeworks] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HomeworksComments]    Script Date: 7.11.2015 г. 21:11:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HomeworksComments](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[homeworkId] [int] NOT NULL,
	[commentId] [int] NOT NULL,
 CONSTRAINT [PK_HomeworksComments] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HomeworksFans]    Script Date: 7.11.2015 г. 21:11:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HomeworksFans](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[homeworkId] [int] NOT NULL,
	[fanId] [int] NOT NULL,
 CONSTRAINT [PK_HomeworksFans] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Students]    Script Date: 7.11.2015 г. 21:11:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Students](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](50) NOT NULL,
	[password] [nvarchar](max) NOT NULL,
	[firstName] [nvarchar](50) NOT NULL,
	[lastName] [nvarchar](max) NOT NULL,
	[avatar] [varbinary](max) NULL,
 CONSTRAINT [PK_Students] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[StudentsGroups]    Script Date: 7.11.2015 г. 21:11:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentsGroups](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[studentId] [int] NOT NULL,
	[groupId] [int] NOT NULL,
 CONSTRAINT [PK_StudentsGroups] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[StudentsHomeworks]    Script Date: 7.11.2015 г. 21:11:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentsHomeworks](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[studentId] [int] NOT NULL,
	[homeworkId] [int] NOT NULL,
 CONSTRAINT [PK_StudentsHomeworks] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Tasks]    Script Date: 7.11.2015 г. 21:11:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tasks](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[problem] [nvarchar](max) NOT NULL,
	[dateCreated] [date] NOT NULL,
	[deadline] [date] NOT NULL,
 CONSTRAINT [PK_Tasks] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Teachers]    Script Date: 7.11.2015 г. 21:11:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Teachers](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](50) NOT NULL,
	[password] [nvarchar](max) NOT NULL,
	[firstName] [nvarchar](50) NOT NULL,
	[lastName] [nvarchar](50) NOT NULL,
	[avatar] [varbinary](max) NULL,
 CONSTRAINT [PK_Teachers] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TeachersGroups]    Script Date: 7.11.2015 г. 21:11:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TeachersGroups](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[teacherId] [int] NOT NULL,
	[groupId] [int] NOT NULL,
 CONSTRAINT [PK_TeachersGroups] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Groups] ON 

INSERT [dbo].[Groups] ([id], [teacherId], [name]) VALUES (1, 1, N'VIII A')
INSERT [dbo].[Groups] ([id], [teacherId], [name]) VALUES (2, 1, N'IX A')
INSERT [dbo].[Groups] ([id], [teacherId], [name]) VALUES (3, 1, N'X A')
INSERT [dbo].[Groups] ([id], [teacherId], [name]) VALUES (4, 1, N'XI A')
INSERT [dbo].[Groups] ([id], [teacherId], [name]) VALUES (5, 1, N'XII A')
SET IDENTITY_INSERT [dbo].[Groups] OFF
SET IDENTITY_INSERT [dbo].[Students] ON 

INSERT [dbo].[Students] ([id], [username], [password], [firstName], [lastName], [avatar]) VALUES (1, N'student1', N'80ddc9ae39b145b3c5ee33fca7233b42', N'Васил', N'Атанасов', NULL)
INSERT [dbo].[Students] ([id], [username], [password], [firstName], [lastName], [avatar]) VALUES (2, N'student2', N'eb9fde983742a4c43103d3a7e8d38112', N'Павел', N'Димитров', NULL)
SET IDENTITY_INSERT [dbo].[Students] OFF
SET IDENTITY_INSERT [dbo].[Teachers] ON 

INSERT [dbo].[Teachers] ([id], [username], [password], [firstName], [lastName], [avatar]) VALUES (1, N'teacher1', N'140b09d977ef565f648609f5aa05b1de', N'Калоян', N'Мънев', NULL)
SET IDENTITY_INSERT [dbo].[Teachers] OFF
SET IDENTITY_INSERT [dbo].[TeachersGroups] ON 

INSERT [dbo].[TeachersGroups] ([id], [teacherId], [groupId]) VALUES (1, 1, 1)
INSERT [dbo].[TeachersGroups] ([id], [teacherId], [groupId]) VALUES (2, 1, 2)
INSERT [dbo].[TeachersGroups] ([id], [teacherId], [groupId]) VALUES (3, 1, 3)
INSERT [dbo].[TeachersGroups] ([id], [teacherId], [groupId]) VALUES (4, 1, 4)
INSERT [dbo].[TeachersGroups] ([id], [teacherId], [groupId]) VALUES (5, 1, 5)
SET IDENTITY_INSERT [dbo].[TeachersGroups] OFF
/****** Object:  Index [IX_GroupsTasks]    Script Date: 7.11.2015 г. 21:11:16 ******/
ALTER TABLE [dbo].[GroupsTasks] ADD  CONSTRAINT [IX_GroupsTasks] UNIQUE NONCLUSTERED 
(
	[taskId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_HomeworksComments]    Script Date: 7.11.2015 г. 21:11:16 ******/
ALTER TABLE [dbo].[HomeworksComments] ADD  CONSTRAINT [IX_HomeworksComments] UNIQUE NONCLUSTERED 
(
	[commentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_StudentsHomeworks]    Script Date: 7.11.2015 г. 21:11:16 ******/
ALTER TABLE [dbo].[StudentsHomeworks] ADD  CONSTRAINT [IX_StudentsHomeworks] UNIQUE NONCLUSTERED 
(
	[homeworkId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_TeachersGroups]    Script Date: 7.11.2015 г. 21:11:16 ******/
ALTER TABLE [dbo].[TeachersGroups] ADD  CONSTRAINT [IX_TeachersGroups] UNIQUE NONCLUSTERED 
(
	[groupId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CommentsFans]  WITH CHECK ADD  CONSTRAINT [FK_CommentsFans_Comments] FOREIGN KEY([commentId])
REFERENCES [dbo].[Comments] ([id])
GO
ALTER TABLE [dbo].[CommentsFans] CHECK CONSTRAINT [FK_CommentsFans_Comments]
GO
ALTER TABLE [dbo].[CommentsFans]  WITH CHECK ADD  CONSTRAINT [FK_CommentsFans_Students] FOREIGN KEY([commentId])
REFERENCES [dbo].[Students] ([id])
GO
ALTER TABLE [dbo].[CommentsFans] CHECK CONSTRAINT [FK_CommentsFans_Students]
GO
ALTER TABLE [dbo].[CommentsFans]  WITH CHECK ADD  CONSTRAINT [FK_CommentsFans_Teachers] FOREIGN KEY([fanId])
REFERENCES [dbo].[Teachers] ([id])
GO
ALTER TABLE [dbo].[CommentsFans] CHECK CONSTRAINT [FK_CommentsFans_Teachers]
GO
ALTER TABLE [dbo].[GroupsTasks]  WITH CHECK ADD  CONSTRAINT [FK_GroupsTasks_Groups] FOREIGN KEY([groupId])
REFERENCES [dbo].[Groups] ([id])
GO
ALTER TABLE [dbo].[GroupsTasks] CHECK CONSTRAINT [FK_GroupsTasks_Groups]
GO
ALTER TABLE [dbo].[GroupsTasks]  WITH CHECK ADD  CONSTRAINT [FK_GroupsTasks_Tasks1] FOREIGN KEY([taskId])
REFERENCES [dbo].[Tasks] ([id])
GO
ALTER TABLE [dbo].[GroupsTasks] CHECK CONSTRAINT [FK_GroupsTasks_Tasks1]
GO
ALTER TABLE [dbo].[Homeworks]  WITH CHECK ADD  CONSTRAINT [FK_Homeworks_Groups] FOREIGN KEY([groupId])
REFERENCES [dbo].[Groups] ([id])
GO
ALTER TABLE [dbo].[Homeworks] CHECK CONSTRAINT [FK_Homeworks_Groups]
GO
ALTER TABLE [dbo].[Homeworks]  WITH CHECK ADD  CONSTRAINT [FK_Homeworks_Tasks] FOREIGN KEY([taskId])
REFERENCES [dbo].[Tasks] ([id])
GO
ALTER TABLE [dbo].[Homeworks] CHECK CONSTRAINT [FK_Homeworks_Tasks]
GO
ALTER TABLE [dbo].[HomeworksComments]  WITH CHECK ADD  CONSTRAINT [FK_HomeworksComments_Comments] FOREIGN KEY([commentId])
REFERENCES [dbo].[Comments] ([id])
GO
ALTER TABLE [dbo].[HomeworksComments] CHECK CONSTRAINT [FK_HomeworksComments_Comments]
GO
ALTER TABLE [dbo].[HomeworksComments]  WITH CHECK ADD  CONSTRAINT [FK_HomeworksComments_Homeworks] FOREIGN KEY([homeworkId])
REFERENCES [dbo].[Homeworks] ([id])
GO
ALTER TABLE [dbo].[HomeworksComments] CHECK CONSTRAINT [FK_HomeworksComments_Homeworks]
GO
ALTER TABLE [dbo].[HomeworksFans]  WITH CHECK ADD  CONSTRAINT [FK_HomeworksFans_Homeworks] FOREIGN KEY([homeworkId])
REFERENCES [dbo].[Homeworks] ([id])
GO
ALTER TABLE [dbo].[HomeworksFans] CHECK CONSTRAINT [FK_HomeworksFans_Homeworks]
GO
ALTER TABLE [dbo].[HomeworksFans]  WITH CHECK ADD  CONSTRAINT [FK_HomeworksFans_Students] FOREIGN KEY([fanId])
REFERENCES [dbo].[Students] ([id])
GO
ALTER TABLE [dbo].[HomeworksFans] CHECK CONSTRAINT [FK_HomeworksFans_Students]
GO
ALTER TABLE [dbo].[HomeworksFans]  WITH CHECK ADD  CONSTRAINT [FK_HomeworksFans_Teachers] FOREIGN KEY([fanId])
REFERENCES [dbo].[Teachers] ([id])
GO
ALTER TABLE [dbo].[HomeworksFans] CHECK CONSTRAINT [FK_HomeworksFans_Teachers]
GO
ALTER TABLE [dbo].[StudentsGroups]  WITH CHECK ADD  CONSTRAINT [FK_StudentsGroups_Groups] FOREIGN KEY([groupId])
REFERENCES [dbo].[Groups] ([id])
GO
ALTER TABLE [dbo].[StudentsGroups] CHECK CONSTRAINT [FK_StudentsGroups_Groups]
GO
ALTER TABLE [dbo].[StudentsGroups]  WITH CHECK ADD  CONSTRAINT [FK_StudentsGroups_Students] FOREIGN KEY([studentId])
REFERENCES [dbo].[Students] ([id])
GO
ALTER TABLE [dbo].[StudentsGroups] CHECK CONSTRAINT [FK_StudentsGroups_Students]
GO
ALTER TABLE [dbo].[StudentsHomeworks]  WITH CHECK ADD  CONSTRAINT [FK_StudentsHomeworks_Homeworks] FOREIGN KEY([homeworkId])
REFERENCES [dbo].[Homeworks] ([id])
GO
ALTER TABLE [dbo].[StudentsHomeworks] CHECK CONSTRAINT [FK_StudentsHomeworks_Homeworks]
GO
ALTER TABLE [dbo].[StudentsHomeworks]  WITH CHECK ADD  CONSTRAINT [FK_StudentsHomeworks_Students] FOREIGN KEY([studentId])
REFERENCES [dbo].[Students] ([id])
GO
ALTER TABLE [dbo].[StudentsHomeworks] CHECK CONSTRAINT [FK_StudentsHomeworks_Students]
GO
ALTER TABLE [dbo].[TeachersGroups]  WITH CHECK ADD  CONSTRAINT [FK_TeachersGroups_Groups] FOREIGN KEY([teacherId])
REFERENCES [dbo].[Groups] ([id])
GO
ALTER TABLE [dbo].[TeachersGroups] CHECK CONSTRAINT [FK_TeachersGroups_Groups]
GO
ALTER TABLE [dbo].[TeachersGroups]  WITH CHECK ADD  CONSTRAINT [FK_TeachersGroups_Teachers] FOREIGN KEY([teacherId])
REFERENCES [dbo].[Teachers] ([id])
GO
ALTER TABLE [dbo].[TeachersGroups] CHECK CONSTRAINT [FK_TeachersGroups_Teachers]
GO
USE [master]
GO
ALTER DATABASE [MyHW] SET  READ_WRITE 
GO
