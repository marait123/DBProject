USE [master]
GO
/****** Object:  Database [AcademicsDB]    Script Date: 12/20/2019 4:28:11 PM ******/
CREATE DATABASE [AcademicsDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'AcademicsDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MARAITSQL\MSSQL\DATA\AcademicsDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'AcademicsDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MARAITSQL\MSSQL\DATA\AcademicsDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [AcademicsDB] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [AcademicsDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [AcademicsDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [AcademicsDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [AcademicsDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [AcademicsDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [AcademicsDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [AcademicsDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [AcademicsDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [AcademicsDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [AcademicsDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [AcademicsDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [AcademicsDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [AcademicsDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [AcademicsDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [AcademicsDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [AcademicsDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [AcademicsDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [AcademicsDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [AcademicsDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [AcademicsDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [AcademicsDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [AcademicsDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [AcademicsDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [AcademicsDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [AcademicsDB] SET  MULTI_USER 
GO
ALTER DATABASE [AcademicsDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [AcademicsDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [AcademicsDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [AcademicsDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [AcademicsDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [AcademicsDB] SET QUERY_STORE = OFF
GO
USE [AcademicsDB]
GO
/****** Object:  UserDefinedDataType [dbo].[_Name]    Script Date: 12/20/2019 4:28:12 PM ******/
CREATE TYPE [dbo].[_Name] FROM [varchar](100) NOT NULL
GO
/****** Object:  UserDefinedDataType [dbo].[_Paragraph]    Script Date: 12/20/2019 4:28:12 PM ******/
CREATE TYPE [dbo].[_Paragraph] FROM [varchar](1000) NULL
GO
/****** Object:  UserDefinedDataType [dbo].[_Phone]    Script Date: 12/20/2019 4:28:12 PM ******/
CREATE TYPE [dbo].[_Phone] FROM [varchar](50) NULL
GO
/****** Object:  Table [dbo].[_class]    Script Date: 12/20/2019 4:28:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[_class](
	[clName] [dbo].[_Name] NOT NULL,
	[courseID] [dbo].[_Name] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[clName] ASC,
	[courseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[_course]    Script Date: 12/20/2019 4:28:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[_course](
	[courseID] [dbo].[_Name] NOT NULL,
	[cName] [dbo].[_Name] NOT NULL,
	[finalGrade] [float] NULL,
	[startDate] [date] NULL,
	[endDate] [date] NULL,
	[topic] [dbo].[_Name] NOT NULL,
	[MGRID] [dbo].[_Name] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[courseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[_user]    Script Date: 12/20/2019 4:28:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[_user](
	[id] [dbo].[_Name] NOT NULL,
	[fName] [dbo].[_Name] NOT NULL,
	[lName] [dbo].[_Name] NOT NULL,
	[email] [varchar](64) NULL,
	[bDate] [date] NULL,
	[phone] [dbo].[_Phone] NULL,
	[Edu] [dbo].[_Paragraph] NULL,
	[Image] [varbinary](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[assistant]    Script Date: 12/20/2019 4:28:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[assistant](
	[assistID] [dbo].[_Name] NOT NULL,
	[courseID] [dbo].[_Name] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[assistID] ASC,
	[courseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[classDate]    Script Date: 12/20/2019 4:28:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[classDate](
	[className] [dbo].[_Name] NOT NULL,
	[courseID] [dbo].[_Name] NOT NULL,
	[classDay] [varchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[className] ASC,
	[courseID] ASC,
	[classDay] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[evaluation]    Script Date: 12/20/2019 4:28:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[evaluation](
	[evDate] [date] NOT NULL,
	[courseID] [dbo].[_Name] NOT NULL,
	[className] [dbo].[_Name] NOT NULL,
	[studID] [dbo].[_Name] NOT NULL,
	[attended] [varchar](1) NULL,
	[score] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[evDate] ASC,
	[courseID] ASC,
	[className] ASC,
	[studID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[exam]    Script Date: 12/20/2019 4:28:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[exam](
	[exName] [dbo].[_Name] NOT NULL,
	[courseID] [dbo].[_Name] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[exName] ASC,
	[courseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[material]    Script Date: 12/20/2019 4:28:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[material](
	[matName] [dbo].[_Name] NOT NULL,
	[courseID] [dbo].[_Name] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[matName] ASC,
	[courseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[materialBook]    Script Date: 12/20/2019 4:28:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[materialBook](
	[bookName] [dbo].[_Name] NOT NULL,
	[matName] [dbo].[_Name] NOT NULL,
	[courseID] [dbo].[_Name] NOT NULL,
	[bookType] [dbo].[_Name] NOT NULL,
	[bookPDF] [varbinary](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[bookName] ASC,
	[matName] ASC,
	[courseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[question]    Script Date: 12/20/2019 4:28:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[question](
	[courseID] [dbo].[_Name] NOT NULL,
	[exName] [dbo].[_Name] NOT NULL,
	[qNum] [int] NOT NULL,
	[qText] [dbo].[_Paragraph] NULL,
	[isMultiple] [char](1) NULL,
	[correctAnsNum] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[qNum] ASC,
	[courseID] ASC,
	[exName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[questionChoice]    Script Date: 12/20/2019 4:28:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[questionChoice](
	[choiceNum] [int] NOT NULL,
	[courseID] [dbo].[_Name] NOT NULL,
	[exName] [dbo].[_Name] NOT NULL,
	[qNum] [int] NOT NULL,
	[choiceText] [dbo].[_Paragraph] NULL,
PRIMARY KEY CLUSTERED 
(
	[choiceNum] ASC,
	[qNum] ASC,
	[exName] ASC,
	[courseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sheet]    Script Date: 12/20/2019 4:28:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sheet](
	[sheetName] [dbo].[_Name] NOT NULL,
	[matName] [dbo].[_Name] NOT NULL,
	[courseID] [dbo].[_Name] NOT NULL,
	[sheetPDF] [varbinary](max) NULL,
	[dueDate] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[sheetName] ASC,
	[matName] ASC,
	[courseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[student]    Script Date: 12/20/2019 4:28:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[student](
	[id] [dbo].[_Name] NOT NULL,
	[schoolName] [dbo].[_Name] NOT NULL,
	[phone] [dbo].[_Phone] NULL,
	[parentPhone] [dbo].[_Phone] NULL,
	[className] [dbo].[_Name] NOT NULL,
	[courseID] [dbo].[_Name] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StudentUser]    Script Date: 12/20/2019 4:28:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentUser](
	[userID] [dbo].[_Name] NOT NULL,
	[studentID] [dbo].[_Name] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[userID] ASC,
	[studentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[studExamScore]    Script Date: 12/20/2019 4:28:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[studExamScore](
	[studID] [dbo].[_Name] NOT NULL,
	[courseID] [dbo].[_Name] NOT NULL,
	[exName] [dbo].[_Name] NOT NULL,
	[score] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[studID] ASC,
	[courseID] ASC,
	[exName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[_class]  WITH CHECK ADD FOREIGN KEY([courseID])
REFERENCES [dbo].[_course] ([courseID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[_course]  WITH CHECK ADD FOREIGN KEY([MGRID])
REFERENCES [dbo].[_user] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[assistant]  WITH CHECK ADD FOREIGN KEY([assistID])
REFERENCES [dbo].[_user] ([id])
GO
ALTER TABLE [dbo].[assistant]  WITH CHECK ADD FOREIGN KEY([courseID])
REFERENCES [dbo].[_course] ([courseID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[classDate]  WITH CHECK ADD FOREIGN KEY([className], [courseID])
REFERENCES [dbo].[_class] ([clName], [courseID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[evaluation]  WITH CHECK ADD FOREIGN KEY([studID])
REFERENCES [dbo].[student] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[evaluation]  WITH CHECK ADD FOREIGN KEY([className], [courseID])
REFERENCES [dbo].[_class] ([clName], [courseID])
GO
ALTER TABLE [dbo].[exam]  WITH CHECK ADD FOREIGN KEY([courseID])
REFERENCES [dbo].[_course] ([courseID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[material]  WITH CHECK ADD FOREIGN KEY([courseID])
REFERENCES [dbo].[_course] ([courseID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[materialBook]  WITH CHECK ADD FOREIGN KEY([matName], [courseID])
REFERENCES [dbo].[material] ([matName], [courseID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[question]  WITH CHECK ADD FOREIGN KEY([exName], [courseID])
REFERENCES [dbo].[exam] ([exName], [courseID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[questionChoice]  WITH CHECK ADD FOREIGN KEY([qNum], [courseID], [exName])
REFERENCES [dbo].[question] ([qNum], [courseID], [exName])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[sheet]  WITH CHECK ADD FOREIGN KEY([matName], [courseID])
REFERENCES [dbo].[material] ([matName], [courseID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[student]  WITH CHECK ADD FOREIGN KEY([className], [courseID])
REFERENCES [dbo].[_class] ([clName], [courseID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[StudentUser]  WITH CHECK ADD FOREIGN KEY([studentID])
REFERENCES [dbo].[student] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[StudentUser]  WITH CHECK ADD FOREIGN KEY([userID])
REFERENCES [dbo].[_user] ([id])
GO
ALTER TABLE [dbo].[studExamScore]  WITH CHECK ADD FOREIGN KEY([exName], [courseID])
REFERENCES [dbo].[exam] ([exName], [courseID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[classDate]  WITH CHECK ADD CHECK  (([classDay]='saturday' OR [classDay]='Sunday' OR [classDay]='Monday' OR [classDay]='Teusday' OR [classDay]='Wednesday' OR [classDay]='Thursday' OR [classDay]='Friday'))
GO
ALTER TABLE [dbo].[question]  WITH CHECK ADD CHECK  (([isMultiple]='y' OR [isMultiple]='n'))
GO
USE [master]
GO
ALTER DATABASE [AcademicsDB] SET  READ_WRITE 
GO
