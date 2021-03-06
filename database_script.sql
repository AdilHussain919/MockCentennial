USE [master]
GO
/****** Object:  Database [RegistrationMockup]    Script Date: 1/12/2017 12:13:18 PM ******/
CREATE DATABASE [RegistrationMockup]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'RegistrationMockup', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\RegistrationMockup.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'RegistrationMockup_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\RegistrationMockup_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [RegistrationMockup] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [RegistrationMockup].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [RegistrationMockup] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [RegistrationMockup] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [RegistrationMockup] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [RegistrationMockup] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [RegistrationMockup] SET ARITHABORT OFF 
GO
ALTER DATABASE [RegistrationMockup] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [RegistrationMockup] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [RegistrationMockup] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [RegistrationMockup] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [RegistrationMockup] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [RegistrationMockup] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [RegistrationMockup] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [RegistrationMockup] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [RegistrationMockup] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [RegistrationMockup] SET  DISABLE_BROKER 
GO
ALTER DATABASE [RegistrationMockup] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [RegistrationMockup] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [RegistrationMockup] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [RegistrationMockup] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [RegistrationMockup] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [RegistrationMockup] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [RegistrationMockup] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [RegistrationMockup] SET RECOVERY FULL 
GO
ALTER DATABASE [RegistrationMockup] SET  MULTI_USER 
GO
ALTER DATABASE [RegistrationMockup] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [RegistrationMockup] SET DB_CHAINING OFF 
GO
ALTER DATABASE [RegistrationMockup] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [RegistrationMockup] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [RegistrationMockup] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'RegistrationMockup', N'ON'
GO
ALTER DATABASE [RegistrationMockup] SET QUERY_STORE = OFF
GO
USE [RegistrationMockup]
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [RegistrationMockup]
GO
/****** Object:  Table [dbo].[Registration]    Script Date: 1/12/2017 12:13:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Registration](
	[RegistrationId] [int] IDENTITY(1,1) NOT NULL,
	[DatePaymentMade] [datetime] NULL,
	[DateRefundIssued] [datetime] NULL,
	[DateRegistrationCancelled] [datetime] NULL,
	[TermId] [int] NOT NULL,
	[StudentProgramId] [int] NOT NULL,
	[Invoice] [nvarchar](max) NULL,
 CONSTRAINT [PK_Registration] PRIMARY KEY CLUSTERED 
(
	[RegistrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[StudentProgram]    Script Date: 1/12/2017 12:13:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentProgram](
	[StudentProgramId] [int] IDENTITY(1,1) NOT NULL,
	[StudentId] [int] NOT NULL,
	[ProgramId] [int] NOT NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[CurrentSemester] [smallint] NOT NULL,
 CONSTRAINT [PK_StudentProgram] PRIMARY KEY CLUSTERED 
(
	[StudentProgramId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Term]    Script Date: 1/12/2017 12:13:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Term](
	[TermId] [int] IDENTITY(1,1) NOT NULL,
	[TermStartDate] [date] NOT NULL,
	[TermEndDate] [date] NOT NULL,
	[TermName] [varchar](20) NOT NULL,
 CONSTRAINT [PK_Term] PRIMARY KEY CLUSTERED 
(
	[TermId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  View [dbo].[InvoiceInfo]    Script Date: 1/12/2017 12:13:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[InvoiceInfo]
AS
SELECT        dbo.StudentProgram.StudentId, dbo.Term.TermId, dbo.Registration.RegistrationId, dbo.Registration.Invoice, dbo.Registration.DatePaymentMade, dbo.Registration.DateRefundIssued
FROM            dbo.Registration INNER JOIN
                         dbo.Term ON dbo.Term.TermId = dbo.Registration.TermId INNER JOIN
                         dbo.StudentProgram ON dbo.StudentProgram.StudentProgramId = dbo.Registration.StudentProgramId
WHERE        (dbo.StudentProgram.EndDate IS NULL) AND (dbo.Registration.DateRegistrationCancelled IS NULL)

GO
/****** Object:  Table [dbo].[Campus]    Script Date: 1/12/2017 12:13:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Campus](
	[CampusId] [int] IDENTITY(1,1) NOT NULL,
	[CampusName] [varchar](15) NOT NULL,
	[CampusCode] [varchar](4) NOT NULL,
	[CampusAddress] [varchar](50) NULL,
 CONSTRAINT [PK_Campus] PRIMARY KEY CLUSTERED 
(
	[CampusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Degree]    Script Date: 1/12/2017 12:13:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Degree](
	[DegreeId] [int] IDENTITY(1,1) NOT NULL,
	[DegreeName] [varchar](30) NOT NULL,
	[DegreeLevel] [varchar](2) NOT NULL,
 CONSTRAINT [PK_Degree] PRIMARY KEY CLUSTERED 
(
	[DegreeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Department]    Script Date: 1/12/2017 12:13:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Department](
	[DepartmentId] [int] IDENTITY(1,1) NOT NULL,
	[DepartmentName] [varchar](40) NOT NULL,
	[CampusId] [int] NOT NULL,
 CONSTRAINT [PK_Department] PRIMARY KEY CLUSTERED 
(
	[DepartmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Program]    Script Date: 1/12/2017 12:13:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Program](
	[ProgramId] [int] IDENTITY(1,1) NOT NULL,
	[ProgramCode] [varchar](10) NOT NULL,
	[ProgramName] [varchar](50) NOT NULL,
	[DepartmentId] [int] NOT NULL,
	[DegreeId] [int] NOT NULL,
	[ProgramSemesters] [smallint] NOT NULL,
 CONSTRAINT [PK_Program] PRIMARY KEY CLUSTERED 
(
	[ProgramId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  View [dbo].[ProgramInfo]    Script Date: 1/12/2017 12:13:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ProgramInfo]
AS
SELECT        dbo.Program.ProgramId, dbo.Program.ProgramCode, dbo.Program.ProgramName, dbo.Program.ProgramSemesters, dbo.Degree.DegreeName, dbo.Degree.DegreeLevel, dbo.Department.DepartmentName, 
                         dbo.Campus.CampusName, dbo.Campus.CampusCode, dbo.Campus.CampusAddress, dbo.Campus.CampusId, dbo.Degree.DegreeId, dbo.Department.DepartmentId
FROM            dbo.Program INNER JOIN
                         dbo.Degree ON dbo.Program.DegreeId = dbo.Degree.DegreeId INNER JOIN
                         dbo.Department ON dbo.Department.DepartmentId = dbo.Program.DepartmentId INNER JOIN
                         dbo.Campus ON dbo.Campus.CampusId = dbo.Department.CampusId

GO
/****** Object:  Table [dbo].[ProgramSemester]    Script Date: 1/12/2017 12:13:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProgramSemester](
	[ProgramSemesterId] [int] IDENTITY(1,1) NOT NULL,
	[ProgramSemesterNum] [smallint] NOT NULL,
	[ProgramSemesterName] [varchar](20) NOT NULL,
	[ProgramSemesterAcademic] [bit] NOT NULL,
	[ProgramId] [int] NOT NULL,
 CONSTRAINT [PK_ProgramSemester] PRIMARY KEY CLUSTERED 
(
	[ProgramSemesterId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Student]    Script Date: 1/12/2017 12:13:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[StudentId] [int] NOT NULL,
	[StudentNum] [varchar](10) NOT NULL,
	[StudentLastName] [varchar](20) NOT NULL,
	[StudentFirstMidName] [varchar](20) NOT NULL,
	[StudentEmail] [varchar](50) NOT NULL,
	[StudentHasHolds] [bit] NOT NULL,
	[StudentAcademicStanding] [bit] NOT NULL,
	[StudentCanRegister] [bit] NOT NULL,
	[StudentTranscript] [nvarchar](max) NULL,
	[StudentStartDate] [datetime] NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[StudentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  View [dbo].[RegistrationInfo]    Script Date: 1/12/2017 12:13:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[RegistrationInfo]
AS
SELECT        dbo.Student.StudentId,
                             (SELECT        TermName
                               FROM            dbo.Term
                               WHERE        (CAST(GETDATE() AS date) BETWEEN TermStartDate AND TermEndDate)) AS TermName, dbo.Student.StudentNum, dbo.Student.StudentLastName, dbo.Student.StudentFirstMidName, 
                         dbo.Student.StudentHasHolds, dbo.Student.StudentAcademicStanding, dbo.Student.StudentCanRegister, dbo.Student.StudentStartDate, dbo.ProgramInfo.DegreeName, dbo.ProgramInfo.DegreeLevel, 
                         dbo.ProgramInfo.ProgramName, dbo.ProgramInfo.CampusName, dbo.ProgramInfo.DepartmentName, dbo.ProgramSemester.ProgramSemesterName, dbo.Student.StudentTranscript
FROM            dbo.Student INNER JOIN
                         dbo.StudentProgram ON dbo.Student.StudentId = dbo.StudentProgram.StudentId INNER JOIN
                         dbo.ProgramInfo ON dbo.ProgramInfo.ProgramId = dbo.StudentProgram.ProgramId INNER JOIN
                         dbo.ProgramSemester ON dbo.ProgramInfo.ProgramId = dbo.ProgramSemester.ProgramId AND dbo.StudentProgram.CurrentSemester = dbo.ProgramSemester.ProgramSemesterNum
WHERE        (dbo.StudentProgram.EndDate IS NULL)

GO
/****** Object:  Table [dbo].[Enrollment]    Script Date: 1/12/2017 12:13:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Enrollment](
	[EnrollmentId] [int] IDENTITY(1,1) NOT NULL,
	[StudentId] [int] NOT NULL,
	[SectionId] [int] NOT NULL,
	[GradeNumeric] [decimal](5, 2) NULL,
 CONSTRAINT [PK_Enrollment] PRIMARY KEY CLUSTERED 
(
	[EnrollmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Section]    Script Date: 1/12/2017 12:13:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Section](
	[SectionId] [int] IDENTITY(1,1) NOT NULL,
	[TermCourseId] [int] NOT NULL,
	[SectionNum] [varchar](10) NOT NULL,
 CONSTRAINT [PK_Section] PRIMARY KEY CLUSTERED 
(
	[SectionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TermCourse]    Script Date: 1/12/2017 12:13:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TermCourse](
	[TermCourseId] [int] IDENTITY(1,1) NOT NULL,
	[TermId] [int] NOT NULL,
	[CourseId] [int] NOT NULL,
	[TermCourseIsOffered] [bit] NOT NULL,
	[TermCourseGradeAvg] [decimal](5, 2) NULL,
 CONSTRAINT [PK_TermCourse] PRIMARY KEY CLUSTERED 
(
	[TermCourseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  View [dbo].[EnrollmentInfo]    Script Date: 1/12/2017 12:13:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*insert into section(termcourseid,sectionnum) values(1, '061');
insert into section(termcourseid,sectionnum) values(1, '062');
insert into section(termcourseid,sectionnum) values(1, '085');
insert into section(termcourseid,sectionnum) values(2, '001');
insert into section(termcourseid,sectionnum) values(3, '061');
insert into section(termcourseid,sectionnum) values(4, '062');
insert into section(termcourseid,sectionnum) values(5, '001');
insert into section(termcourseid,sectionnum) values(6, '061');
insert into section(termcourseid,sectionnum) values(6, '062');
insert into section(termcourseid,sectionnum) values(7, '001');
insert into section(termcourseid,sectionnum) values(8, '061');
insert into section(termcourseid,sectionnum) values(9, '062');
insert into section(termcourseid,sectionnum) values(10, '001');
insert into section(termcourseid,sectionnum) values(11, '061');
insert into section(termcourseid,sectionnum) values(11, '062');
insert into section(termcourseid,sectionnum) values(12, '001');
insert into section(termcourseid,sectionnum) values(13, '061');
insert into section(termcourseid,sectionnum) values(13, '062');
insert into section(termcourseid,sectionnum) values(14, '001');
select count(*) from enrollment where studentid=2 and sectionid=2;
select * from enrollment;
delete from enrollment where enrollmentid=5;
insert into enrollment(StudentId,SectionId) values(2,2);
select * from section;
select * from termcourse;
select * from registration;
select * from course where CourseSubject='GNED';
select * from ProgramSemesterCourse;*/
CREATE VIEW [dbo].[EnrollmentInfo]
AS
SELECT        dbo.TermCourse.TermCourseId, dbo.Section.SectionId, dbo.Enrollment.EnrollmentId, dbo.Section.SectionNum, dbo.Enrollment.GradeNumeric, dbo.TermCourse.TermCourseGradeAvg, 
                         dbo.TermCourse.TermCourseIsOffered, dbo.Term.TermId, dbo.Term.TermStartDate, dbo.Term.TermEndDate, dbo.Term.TermName, dbo.Enrollment.StudentId, dbo.TermCourse.CourseId
FROM            dbo.Enrollment INNER JOIN
                         dbo.Section ON dbo.Enrollment.SectionId = dbo.Section.SectionId INNER JOIN
                         dbo.TermCourse ON dbo.TermCourse.TermCourseId = dbo.Section.TermCourseId INNER JOIN
                         dbo.Term ON dbo.Term.TermId = dbo.TermCourse.TermId

GO
/****** Object:  Table [dbo].[Course]    Script Date: 1/12/2017 12:13:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Course](
	[CourseId] [int] IDENTITY(1,1) NOT NULL,
	[CourseCode] [varchar](10) NOT NULL,
	[CourseTitle] [varchar](35) NOT NULL,
	[CourseSubject] [varchar](4) NOT NULL,
	[CourseNum] [varchar](3) NOT NULL,
	[CourseLevel] [varchar](2) NOT NULL,
	[CourseCredits] [decimal](7, 4) NOT NULL,
 CONSTRAINT [PK_Course] PRIMARY KEY CLUSTERED 
(
	[CourseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CoursePrerequisite]    Script Date: 1/12/2017 12:13:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CoursePrerequisite](
	[CoursePrerequisiteId] [int] IDENTITY(1,1) NOT NULL,
	[CourseId] [int] NOT NULL,
	[PrereqCourseId] [int] NOT NULL,
 CONSTRAINT [PK_CoursePrerequisite] PRIMARY KEY CLUSTERED 
(
	[CoursePrerequisiteId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  View [dbo].[CourseInfo]    Script Date: 1/12/2017 12:13:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CourseInfo]
AS
SELECT        Course.CourseId, Course.CourseCode, Course.CourseTitle, Course.CourseSubject, Course.CourseNum, Course.CourseLevel, Course.CourseCredits, isnull
                             ((SELECT        c.CourseId as courseId, c.CourseSubject as courseSubject, c.CourseNum as courseNum
                                 FROM            course c JOIN
                                                              (SELECT        PrereqCourseId
                                                                FROM            CoursePrerequisite
                                                                WHERE        CourseId = Course.CourseId) p ON c.CourseId = p.PrereqCourseId FOR json path), '') 
                         AS Prereqs
/*TermCourse.TermCourseId,TermCourse.TermId,TermCourse.TermCourseIsOffered,TermCourse.TermCourseGradeAvg*/ FROM Course/*join TermCourse on Course.CourseId=TermCourse.CourseId*/ ;

GO
/****** Object:  Table [dbo].[ProgramSemesterCourse]    Script Date: 1/12/2017 12:13:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProgramSemesterCourse](
	[ProgramSemesterCourseId] [int] IDENTITY(1,1) NOT NULL,
	[ProgramSemesterId] [int] NOT NULL,
	[CourseId] [int] NOT NULL,
	[EndDate] [date] NULL,
	[IsAcademic] [bit] NOT NULL,
	[IsMandatory] [bit] NOT NULL,
	[IsTechnicalElective] [bit] NOT NULL,
	[IsGeneralElective] [bit] NOT NULL,
 CONSTRAINT [PK_ProgramCourse] PRIMARY KEY CLUSTERED 
(
	[ProgramSemesterCourseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  View [dbo].[ProgramCourseInfo]    Script Date: 1/12/2017 12:13:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*drop view CourseInfo;
select * from enrollmentinfo;
CourseId,SectionNum,GradeNumeric,TermId,TermStartDate,TermEndDate,TermName,StudentId
;*/
CREATE VIEW [dbo].[ProgramCourseInfo]
AS
SELECT        dbo.ProgramSemester.ProgramSemesterId, dbo.ProgramSemester.ProgramSemesterNum, dbo.ProgramSemester.ProgramSemesterName, dbo.ProgramSemester.ProgramSemesterAcademic, 
                         dbo.ProgramSemesterCourse.ProgramSemesterCourseId, dbo.ProgramSemesterCourse.EndDate, dbo.ProgramSemesterCourse.IsAcademic, dbo.ProgramSemesterCourse.IsMandatory, 
                         dbo.ProgramSemesterCourse.IsTechnicalElective, dbo.ProgramSemesterCourse.IsGeneralElective, dbo.CourseInfo.CourseId, dbo.CourseInfo.CourseCode, dbo.CourseInfo.CourseTitle, 
                         dbo.CourseInfo.CourseSubject, dbo.CourseInfo.CourseNum, dbo.CourseInfo.CourseLevel, dbo.CourseInfo.CourseCredits, dbo.CourseInfo.Prereqs, dbo.ProgramSemester.ProgramId
FROM            dbo.ProgramSemester INNER JOIN
                         dbo.ProgramSemesterCourse ON dbo.ProgramSemester.ProgramSemesterId = dbo.ProgramSemesterCourse.ProgramSemesterId INNER JOIN
                         dbo.CourseInfo ON dbo.CourseInfo.CourseId = dbo.ProgramSemesterCourse.CourseId

GO
/****** Object:  Table [dbo].[Class]    Script Date: 1/12/2017 12:13:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Class](
	[ClassId] [int] IDENTITY(1,1) NOT NULL,
	[SectionId] [int] NOT NULL,
	[InstructorId] [int] NULL,
	[RoomId] [int] NULL,
	[ClassIsLecture] [bit] NULL,
	[ClassStartTime] [int] NULL,
	[ClassEndTime] [int] NULL,
 CONSTRAINT [PK_Class] PRIMARY KEY CLUSTERED 
(
	[ClassId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Instructor]    Script Date: 1/12/2017 12:13:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Instructor](
	[InstructorId] [int] NOT NULL,
	[InstructorEmpNum] [varchar](10) NOT NULL,
	[InstructorLastName] [varchar](20) NOT NULL,
	[InstructorFirstMidName] [varchar](20) NOT NULL,
	[InstructorEmail] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Instructor] PRIMARY KEY CLUSTERED 
(
	[InstructorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Room]    Script Date: 1/12/2017 12:13:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Room](
	[RoomId] [int] IDENTITY(1,1) NOT NULL,
	[RoomCapacity] [smallint] NOT NULL,
	[RoomNum] [varchar](10) NOT NULL,
	[Building] [varchar](10) NOT NULL,
	[CampusCode] [varchar](4) NOT NULL,
 CONSTRAINT [PK_Room] PRIMARY KEY CLUSTERED 
(
	[RoomId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Time]    Script Date: 1/12/2017 12:13:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Time](
	[TimeId] [int] IDENTITY(1,1) NOT NULL,
	[Day] [smallint] NOT NULL,
	[Hour] [smallint] NOT NULL,
	[Minute] [smallint] NOT NULL,
 CONSTRAINT [PK_Time] PRIMARY KEY CLUSTERED 
(
	[TimeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  View [dbo].[ClassInfo]    Script Date: 1/12/2017 12:13:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*create view SectionInfo as
select *
from Section
join Class on section.SectionId=class.SectionId
join Time starttime on starttime.TimeId=Class.ClassStartTime
join Time endtime on endtime.TimeId=Class.ClassEndTime
join Room on room.RoomId=class.RoomId
join Instructor on Instructor.InstructorId=Class.InstructorId
;
select * from programcourseinfo;
drop view CourseInfo;
select * from enrollmentinfo;
CourseId,SectionNum,GradeNumeric,TermId,TermStartDate,TermEndDate,TermName,StudentId
;*/
CREATE VIEW [dbo].[ClassInfo]
AS
SELECT        dbo.Class.ClassId, dbo.Class.SectionId, dbo.Class.ClassIsLecture, starttime.Day AS StartDay, starttime.Hour AS StartHour, starttime.Minute AS StartMinute, endtime.Day AS EndDay, endtime.Hour AS EndHour, 
                         endtime.Minute AS EndMinute, dbo.Instructor.InstructorId, dbo.Instructor.InstructorEmpNum, dbo.Instructor.InstructorLastName, dbo.Instructor.InstructorFirstMidName, dbo.Instructor.InstructorEmail, 
                         dbo.Room.RoomId, dbo.Room.RoomCapacity, dbo.Room.RoomNum, dbo.Room.Building, dbo.Room.CampusCode, starttime.TimeId AS StartTimeId, endtime.TimeId AS EndTimeId
FROM            dbo.Class INNER JOIN
                         dbo.Time AS starttime ON starttime.TimeId = dbo.Class.ClassStartTime INNER JOIN
                         dbo.Time AS endtime ON endtime.TimeId = dbo.Class.ClassEndTime INNER JOIN
                         dbo.Room ON dbo.Room.RoomId = dbo.Class.RoomId INNER JOIN
                         dbo.Instructor ON dbo.Instructor.InstructorId = dbo.Class.InstructorId

GO
/****** Object:  View [dbo].[SectionInfo]    Script Date: 1/12/2017 12:13:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[SectionInfo]
AS
SELECT        Section.SectionId, Section.SectionNum, TermCourse.TermCourseId, TermCourse.TermId, TermCourse.CourseId, TermCourse.TermCourseIsOffered, TermCourse.TermCourseGradeAvg, isnull
                             ((SELECT        ci.classislecture as isLecture 
, ci.startday as startDay 
, ci.starthour as startHour 
, ci.startminute as startMinute 
, ci.endday as endDay 
, ci.endHour as endHour 
, ci.endMinute as endMinute 
, ci.instructorLastName as instructorLastName 
, ci.instructorFirstMidName as instructorFirstMidName 
, ci.campuscode as campus 
, ci.building as building 
, ci.roomnum as room 
, ci.roomCapacity as roomCapacity 
                                 FROM            classinfo ci
                                 WHERE        ci.SectionId = Section.SectionId FOR json path), '') AS Classes
FROM            Section JOIN
                         TermCourse ON TermCourse.TermCourseId = Section.TermCourseId;

GO
/****** Object:  View [dbo].[TermCourseInfo]    Script Date: 1/12/2017 12:13:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[TermCourseInfo]
AS
SELECT        dbo.TermCourse.TermCourseId, dbo.TermCourse.TermId, dbo.Course.CourseId, dbo.Course.CourseCode, dbo.Course.CourseTitle, dbo.TermCourse.TermCourseIsOffered, 
                         dbo.TermCourse.TermCourseGradeAvg
FROM            dbo.Course INNER JOIN
                         dbo.TermCourse ON dbo.Course.CourseId = dbo.TermCourse.CourseId

GO
/****** Object:  View [dbo].[SectionClasses]    Script Date: 1/12/2017 12:13:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[SectionClasses]
AS
SELECT        dbo.Section.TermCourseId, dbo.Section.SectionId, dbo.Section.SectionNum, dbo.Class.ClassId, dbo.Class.ClassIsLecture, dbo.Class.InstructorId, dbo.Class.RoomId, dbo.Class.ClassStartTime, 
                         dbo.Class.ClassEndTime
FROM            dbo.Section LEFT OUTER JOIN
                         dbo.Class ON dbo.Section.SectionId = dbo.Class.SectionId

GO
/****** Object:  Table [dbo].[Users]    Script Date: 1/12/2017 12:13:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[UserNum] [varchar](10) NOT NULL,
	[UserPassword] [varchar](128) NULL,
	[UserIsStudent] [bit] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Campus] ON 

INSERT [dbo].[Campus] ([CampusId], [CampusName], [CampusCode], [CampusAddress]) VALUES (1, N'Progress', N'PR', N'941 Progress Ave')
INSERT [dbo].[Campus] ([CampusId], [CampusName], [CampusCode], [CampusAddress]) VALUES (2, N'Ashtonbee', N'AS', N'1 Ashtonbee Rd')
INSERT [dbo].[Campus] ([CampusId], [CampusName], [CampusCode], [CampusAddress]) VALUES (5, N'Eglinton', N'EG', N'2 Eglinton West')
INSERT [dbo].[Campus] ([CampusId], [CampusName], [CampusCode], [CampusAddress]) VALUES (6, N'International', N'INT', N'PO Box 123')
INSERT [dbo].[Campus] ([CampusId], [CampusName], [CampusCode], [CampusAddress]) VALUES (7, N'Morningside', N'MO', N'4 Morningside Ave')
INSERT [dbo].[Campus] ([CampusId], [CampusName], [CampusCode], [CampusAddress]) VALUES (8, N'Pickering', N'PI', N'12 Downtown St')
INSERT [dbo].[Campus] ([CampusId], [CampusName], [CampusCode], [CampusAddress]) VALUES (9, N'Story Arts', N'SAC', N'34 Uptown Blvd')
SET IDENTITY_INSERT [dbo].[Campus] OFF
SET IDENTITY_INSERT [dbo].[Class] ON 

INSERT [dbo].[Class] ([ClassId], [SectionId], [InstructorId], [RoomId], [ClassIsLecture], [ClassStartTime], [ClassEndTime]) VALUES (1, 1, 11, 1, 1, 45, 49)
INSERT [dbo].[Class] ([ClassId], [SectionId], [InstructorId], [RoomId], [ClassIsLecture], [ClassStartTime], [ClassEndTime]) VALUES (2, 1, 4, 2, 0, 84, 88)
INSERT [dbo].[Class] ([ClassId], [SectionId], [InstructorId], [RoomId], [ClassIsLecture], [ClassStartTime], [ClassEndTime]) VALUES (3, 2, 4, 2, 1, 20, 24)
INSERT [dbo].[Class] ([ClassId], [SectionId], [InstructorId], [RoomId], [ClassIsLecture], [ClassStartTime], [ClassEndTime]) VALUES (4, 2, 4, 2, 0, 24, 28)
INSERT [dbo].[Class] ([ClassId], [SectionId], [InstructorId], [RoomId], [ClassIsLecture], [ClassStartTime], [ClassEndTime]) VALUES (5, 3, 4, 1, 1, 130, 136)
INSERT [dbo].[Class] ([ClassId], [SectionId], [InstructorId], [RoomId], [ClassIsLecture], [ClassStartTime], [ClassEndTime]) VALUES (6, 4, 4, 1, 1, 2, 6)
INSERT [dbo].[Class] ([ClassId], [SectionId], [InstructorId], [RoomId], [ClassIsLecture], [ClassStartTime], [ClassEndTime]) VALUES (7, 4, 4, 2, 0, 100, 104)
INSERT [dbo].[Class] ([ClassId], [SectionId], [InstructorId], [RoomId], [ClassIsLecture], [ClassStartTime], [ClassEndTime]) VALUES (8, 87, 11, 5, 1, 3, 7)
INSERT [dbo].[Class] ([ClassId], [SectionId], [InstructorId], [RoomId], [ClassIsLecture], [ClassStartTime], [ClassEndTime]) VALUES (10, 48, 4, 4, 1, 51, 55)
INSERT [dbo].[Class] ([ClassId], [SectionId], [InstructorId], [RoomId], [ClassIsLecture], [ClassStartTime], [ClassEndTime]) VALUES (11, 48, 4, 1, 0, 97, 101)
INSERT [dbo].[Class] ([ClassId], [SectionId], [InstructorId], [RoomId], [ClassIsLecture], [ClassStartTime], [ClassEndTime]) VALUES (12, 89, 11, 2, 1, 3, 7)
INSERT [dbo].[Class] ([ClassId], [SectionId], [InstructorId], [RoomId], [ClassIsLecture], [ClassStartTime], [ClassEndTime]) VALUES (13, 89, 11, 4, 0, 123, 127)
INSERT [dbo].[Class] ([ClassId], [SectionId], [InstructorId], [RoomId], [ClassIsLecture], [ClassStartTime], [ClassEndTime]) VALUES (14, 49, 11, 3, 1, 15, 19)
INSERT [dbo].[Class] ([ClassId], [SectionId], [InstructorId], [RoomId], [ClassIsLecture], [ClassStartTime], [ClassEndTime]) VALUES (15, 49, 11, 3, 0, 23, 31)
INSERT [dbo].[Class] ([ClassId], [SectionId], [InstructorId], [RoomId], [ClassIsLecture], [ClassStartTime], [ClassEndTime]) VALUES (16, 50, 4, 6, 1, 67, 73)
INSERT [dbo].[Class] ([ClassId], [SectionId], [InstructorId], [RoomId], [ClassIsLecture], [ClassStartTime], [ClassEndTime]) VALUES (17, 51, 11, 5, 0, 137, 141)
INSERT [dbo].[Class] ([ClassId], [SectionId], [InstructorId], [RoomId], [ClassIsLecture], [ClassStartTime], [ClassEndTime]) VALUES (18, 51, 11, 5, 1, 141, 145)
INSERT [dbo].[Class] ([ClassId], [SectionId], [InstructorId], [RoomId], [ClassIsLecture], [ClassStartTime], [ClassEndTime]) VALUES (19, 52, 4, 2, 1, 105, 109)
INSERT [dbo].[Class] ([ClassId], [SectionId], [InstructorId], [RoomId], [ClassIsLecture], [ClassStartTime], [ClassEndTime]) VALUES (20, 85, 4, 4, 1, 5, 13)
INSERT [dbo].[Class] ([ClassId], [SectionId], [InstructorId], [RoomId], [ClassIsLecture], [ClassStartTime], [ClassEndTime]) VALUES (28, 53, 4, 1, 1, 15, 19)
INSERT [dbo].[Class] ([ClassId], [SectionId], [InstructorId], [RoomId], [ClassIsLecture], [ClassStartTime], [ClassEndTime]) VALUES (29, 54, 4, 1, 1, 125, 133)
INSERT [dbo].[Class] ([ClassId], [SectionId], [InstructorId], [RoomId], [ClassIsLecture], [ClassStartTime], [ClassEndTime]) VALUES (30, 55, 11, 2, 1, 79, 87)
INSERT [dbo].[Class] ([ClassId], [SectionId], [InstructorId], [RoomId], [ClassIsLecture], [ClassStartTime], [ClassEndTime]) VALUES (31, 91, 11, 3, 1, 101, 109)
INSERT [dbo].[Class] ([ClassId], [SectionId], [InstructorId], [RoomId], [ClassIsLecture], [ClassStartTime], [ClassEndTime]) VALUES (32, 57, 4, 4, 1, 19, 23)
INSERT [dbo].[Class] ([ClassId], [SectionId], [InstructorId], [RoomId], [ClassIsLecture], [ClassStartTime], [ClassEndTime]) VALUES (33, 58, 4, 6, 0, 135, 139)
INSERT [dbo].[Class] ([ClassId], [SectionId], [InstructorId], [RoomId], [ClassIsLecture], [ClassStartTime], [ClassEndTime]) VALUES (34, 92, 4, 1, 1, 41, 45)
INSERT [dbo].[Class] ([ClassId], [SectionId], [InstructorId], [RoomId], [ClassIsLecture], [ClassStartTime], [ClassEndTime]) VALUES (35, 59, 11, 5, 1, 113, 121)
INSERT [dbo].[Class] ([ClassId], [SectionId], [InstructorId], [RoomId], [ClassIsLecture], [ClassStartTime], [ClassEndTime]) VALUES (36, 60, 4, 3, 1, 37, 41)
INSERT [dbo].[Class] ([ClassId], [SectionId], [InstructorId], [RoomId], [ClassIsLecture], [ClassStartTime], [ClassEndTime]) VALUES (37, 61, 4, 2, 1, 67, 71)
INSERT [dbo].[Class] ([ClassId], [SectionId], [InstructorId], [RoomId], [ClassIsLecture], [ClassStartTime], [ClassEndTime]) VALUES (38, 62, 11, 2, 1, 63, 67)
INSERT [dbo].[Class] ([ClassId], [SectionId], [InstructorId], [RoomId], [ClassIsLecture], [ClassStartTime], [ClassEndTime]) VALUES (39, 63, 4, 4, 1, 41, 45)
INSERT [dbo].[Class] ([ClassId], [SectionId], [InstructorId], [RoomId], [ClassIsLecture], [ClassStartTime], [ClassEndTime]) VALUES (40, 65, 11, 4, 1, 93, 99)
INSERT [dbo].[Class] ([ClassId], [SectionId], [InstructorId], [RoomId], [ClassIsLecture], [ClassStartTime], [ClassEndTime]) VALUES (41, 66, 1022, 5, 1, 27, 31)
INSERT [dbo].[Class] ([ClassId], [SectionId], [InstructorId], [RoomId], [ClassIsLecture], [ClassStartTime], [ClassEndTime]) VALUES (42, 67, 11, 3, 1, 79, 83)
INSERT [dbo].[Class] ([ClassId], [SectionId], [InstructorId], [RoomId], [ClassIsLecture], [ClassStartTime], [ClassEndTime]) VALUES (43, 68, 4, 3, 1, 101, 107)
INSERT [dbo].[Class] ([ClassId], [SectionId], [InstructorId], [RoomId], [ClassIsLecture], [ClassStartTime], [ClassEndTime]) VALUES (44, 6, 4, 4, 1, 41, 45)
INSERT [dbo].[Class] ([ClassId], [SectionId], [InstructorId], [RoomId], [ClassIsLecture], [ClassStartTime], [ClassEndTime]) VALUES (45, 6, 4, 1, 0, 123, 127)
INSERT [dbo].[Class] ([ClassId], [SectionId], [InstructorId], [RoomId], [ClassIsLecture], [ClassStartTime], [ClassEndTime]) VALUES (46, 36, 11, 1, 1, 11, 19)
INSERT [dbo].[Class] ([ClassId], [SectionId], [InstructorId], [RoomId], [ClassIsLecture], [ClassStartTime], [ClassEndTime]) VALUES (47, 37, 4, 4, 1, 109, 117)
INSERT [dbo].[Class] ([ClassId], [SectionId], [InstructorId], [RoomId], [ClassIsLecture], [ClassStartTime], [ClassEndTime]) VALUES (48, 93, 11, 5, 1, 123, 127)
INSERT [dbo].[Class] ([ClassId], [SectionId], [InstructorId], [RoomId], [ClassIsLecture], [ClassStartTime], [ClassEndTime]) VALUES (49, 93, 4, 3, 0, 15, 19)
INSERT [dbo].[Class] ([ClassId], [SectionId], [InstructorId], [RoomId], [ClassIsLecture], [ClassStartTime], [ClassEndTime]) VALUES (50, 94, 4, 2, 1, 63, 67)
INSERT [dbo].[Class] ([ClassId], [SectionId], [InstructorId], [RoomId], [ClassIsLecture], [ClassStartTime], [ClassEndTime]) VALUES (51, 94, 4, 4, 0, 101, 105)
INSERT [dbo].[Class] ([ClassId], [SectionId], [InstructorId], [RoomId], [ClassIsLecture], [ClassStartTime], [ClassEndTime]) VALUES (52, 95, 1017, 4, 1, 11, 15)
INSERT [dbo].[Class] ([ClassId], [SectionId], [InstructorId], [RoomId], [ClassIsLecture], [ClassStartTime], [ClassEndTime]) VALUES (53, 95, 1022, 6, 0, 93, 97)
INSERT [dbo].[Class] ([ClassId], [SectionId], [InstructorId], [RoomId], [ClassIsLecture], [ClassStartTime], [ClassEndTime]) VALUES (54, 96, 1020, 9, 1, 71, 73)
INSERT [dbo].[Class] ([ClassId], [SectionId], [InstructorId], [RoomId], [ClassIsLecture], [ClassStartTime], [ClassEndTime]) VALUES (55, 43, 1021, 5, 1, 39, 45)
INSERT [dbo].[Class] ([ClassId], [SectionId], [InstructorId], [RoomId], [ClassIsLecture], [ClassStartTime], [ClassEndTime]) VALUES (56, 44, 1016, 7, 1, 109, 117)
INSERT [dbo].[Class] ([ClassId], [SectionId], [InstructorId], [RoomId], [ClassIsLecture], [ClassStartTime], [ClassEndTime]) VALUES (57, 86, 1018, 6, 1, 75, 79)
INSERT [dbo].[Class] ([ClassId], [SectionId], [InstructorId], [RoomId], [ClassIsLecture], [ClassStartTime], [ClassEndTime]) VALUES (58, 97, 1019, 2, 1, 153, 157)
INSERT [dbo].[Class] ([ClassId], [SectionId], [InstructorId], [RoomId], [ClassIsLecture], [ClassStartTime], [ClassEndTime]) VALUES (59, 98, 1018, 5, 1, 37, 42)
INSERT [dbo].[Class] ([ClassId], [SectionId], [InstructorId], [RoomId], [ClassIsLecture], [ClassStartTime], [ClassEndTime]) VALUES (60, 99, 1021, 3, 1, 65, 69)
INSERT [dbo].[Class] ([ClassId], [SectionId], [InstructorId], [RoomId], [ClassIsLecture], [ClassStartTime], [ClassEndTime]) VALUES (61, 100, 1019, 8, 1, 19, 27)
INSERT [dbo].[Class] ([ClassId], [SectionId], [InstructorId], [RoomId], [ClassIsLecture], [ClassStartTime], [ClassEndTime]) VALUES (62, 101, 1016, 2, 1, 3, 7)
INSERT [dbo].[Class] ([ClassId], [SectionId], [InstructorId], [RoomId], [ClassIsLecture], [ClassStartTime], [ClassEndTime]) VALUES (63, 102, 1016, 3, 1, 36, 40)
INSERT [dbo].[Class] ([ClassId], [SectionId], [InstructorId], [RoomId], [ClassIsLecture], [ClassStartTime], [ClassEndTime]) VALUES (64, 102, 1016, 3, 0, 73, 77)
INSERT [dbo].[Class] ([ClassId], [SectionId], [InstructorId], [RoomId], [ClassIsLecture], [ClassStartTime], [ClassEndTime]) VALUES (65, 103, 1017, 2, 1, 135, 139)
INSERT [dbo].[Class] ([ClassId], [SectionId], [InstructorId], [RoomId], [ClassIsLecture], [ClassStartTime], [ClassEndTime]) VALUES (66, 103, 1017, 9, 0, 11, 15)
INSERT [dbo].[Class] ([ClassId], [SectionId], [InstructorId], [RoomId], [ClassIsLecture], [ClassStartTime], [ClassEndTime]) VALUES (67, 104, 1018, 3, 1, 75, 79)
INSERT [dbo].[Class] ([ClassId], [SectionId], [InstructorId], [RoomId], [ClassIsLecture], [ClassStartTime], [ClassEndTime]) VALUES (68, 104, 1018, 2, 0, 109, 113)
INSERT [dbo].[Class] ([ClassId], [SectionId], [InstructorId], [RoomId], [ClassIsLecture], [ClassStartTime], [ClassEndTime]) VALUES (69, 105, 1019, 7, 1, 133, 137)
INSERT [dbo].[Class] ([ClassId], [SectionId], [InstructorId], [RoomId], [ClassIsLecture], [ClassStartTime], [ClassEndTime]) VALUES (70, 105, 1020, 10, 0, 140, 144)
INSERT [dbo].[Class] ([ClassId], [SectionId], [InstructorId], [RoomId], [ClassIsLecture], [ClassStartTime], [ClassEndTime]) VALUES (71, 52, 1021, 4, 0, 9, 13)
INSERT [dbo].[Class] ([ClassId], [SectionId], [InstructorId], [RoomId], [ClassIsLecture], [ClassStartTime], [ClassEndTime]) VALUES (72, 61, 1021, 4, 0, 7, 11)
INSERT [dbo].[Class] ([ClassId], [SectionId], [InstructorId], [RoomId], [ClassIsLecture], [ClassStartTime], [ClassEndTime]) VALUES (73, 66, 1022, 6, 0, 131, 135)
INSERT [dbo].[Class] ([ClassId], [SectionId], [InstructorId], [RoomId], [ClassIsLecture], [ClassStartTime], [ClassEndTime]) VALUES (74, 69, 1016, 4, 1, 78, 86)
INSERT [dbo].[Class] ([ClassId], [SectionId], [InstructorId], [RoomId], [ClassIsLecture], [ClassStartTime], [ClassEndTime]) VALUES (75, 106, 1017, 2, 1, 41, 45)
INSERT [dbo].[Class] ([ClassId], [SectionId], [InstructorId], [RoomId], [ClassIsLecture], [ClassStartTime], [ClassEndTime]) VALUES (76, 106, 1017, 10, 0, 153, 157)
INSERT [dbo].[Class] ([ClassId], [SectionId], [InstructorId], [RoomId], [ClassIsLecture], [ClassStartTime], [ClassEndTime]) VALUES (77, 70, 1020, 5, 1, 109, 113)
INSERT [dbo].[Class] ([ClassId], [SectionId], [InstructorId], [RoomId], [ClassIsLecture], [ClassStartTime], [ClassEndTime]) VALUES (78, 75, 1022, 9, 1, 135, 139)
INSERT [dbo].[Class] ([ClassId], [SectionId], [InstructorId], [RoomId], [ClassIsLecture], [ClassStartTime], [ClassEndTime]) VALUES (79, 107, 1019, 9, 1, 127, 131)
INSERT [dbo].[Class] ([ClassId], [SectionId], [InstructorId], [RoomId], [ClassIsLecture], [ClassStartTime], [ClassEndTime]) VALUES (80, 107, 1019, 10, 0, 44, 48)
INSERT [dbo].[Class] ([ClassId], [SectionId], [InstructorId], [RoomId], [ClassIsLecture], [ClassStartTime], [ClassEndTime]) VALUES (81, 108, 1017, 6, 1, 37, 41)
INSERT [dbo].[Class] ([ClassId], [SectionId], [InstructorId], [RoomId], [ClassIsLecture], [ClassStartTime], [ClassEndTime]) VALUES (82, 109, 1018, 5, 1, 41, 47)
INSERT [dbo].[Class] ([ClassId], [SectionId], [InstructorId], [RoomId], [ClassIsLecture], [ClassStartTime], [ClassEndTime]) VALUES (83, 110, 1021, 10, 1, 67, 71)
INSERT [dbo].[Class] ([ClassId], [SectionId], [InstructorId], [RoomId], [ClassIsLecture], [ClassStartTime], [ClassEndTime]) VALUES (84, 111, 1017, 6, 1, 111, 115)
INSERT [dbo].[Class] ([ClassId], [SectionId], [InstructorId], [RoomId], [ClassIsLecture], [ClassStartTime], [ClassEndTime]) VALUES (85, 112, 1021, 3, 1, 109, 113)
INSERT [dbo].[Class] ([ClassId], [SectionId], [InstructorId], [RoomId], [ClassIsLecture], [ClassStartTime], [ClassEndTime]) VALUES (86, 112, 1021, 2, 0, 26, 30)
INSERT [dbo].[Class] ([ClassId], [SectionId], [InstructorId], [RoomId], [ClassIsLecture], [ClassStartTime], [ClassEndTime]) VALUES (87, 113, 1018, 5, 1, 17, 23)
SET IDENTITY_INSERT [dbo].[Class] OFF
SET IDENTITY_INSERT [dbo].[Course] ON 

INSERT [dbo].[Course] ([CourseId], [CourseCode], [CourseTitle], [CourseSubject], [CourseNum], [CourseLevel], [CourseCredits]) VALUES (1, N'COMP100', N'Programming 1', N'COMP', N'100', N'PS', CAST(4.0000 AS Decimal(7, 4)))
INSERT [dbo].[Course] ([CourseId], [CourseCode], [CourseTitle], [CourseSubject], [CourseNum], [CourseLevel], [CourseCredits]) VALUES (2, N'COMP123', N'Programming 2', N'COMP', N'123', N'PS', CAST(4.0000 AS Decimal(7, 4)))
INSERT [dbo].[Course] ([CourseId], [CourseCode], [CourseTitle], [CourseSubject], [CourseNum], [CourseLevel], [CourseCredits]) VALUES (3, N'COMM170', N'College Communications 2', N'COMM', N'170', N'PS', CAST(3.0000 AS Decimal(7, 4)))
INSERT [dbo].[Course] ([CourseId], [CourseCode], [CourseTitle], [CourseSubject], [CourseNum], [CourseLevel], [CourseCredits]) VALUES (5, N'COMP120', N'Software Engineering Fundamentals', N'COMP', N'120', N'PS', CAST(4.0000 AS Decimal(7, 4)))
INSERT [dbo].[Course] ([CourseId], [CourseCode], [CourseTitle], [CourseSubject], [CourseNum], [CourseLevel], [CourseCredits]) VALUES (6, N'COMP213', N'Web Interface Design', N'COMP', N'213', N'PS', CAST(4.0000 AS Decimal(7, 4)))
INSERT [dbo].[Course] ([CourseId], [CourseCode], [CourseTitle], [CourseSubject], [CourseNum], [CourseLevel], [CourseCredits]) VALUES (7, N'GNED219', N'The Canadian Workplace Experience', N'GNED', N'219', N'PS', CAST(3.0000 AS Decimal(7, 4)))
INSERT [dbo].[Course] ([CourseId], [CourseCode], [CourseTitle], [CourseSubject], [CourseNum], [CourseLevel], [CourseCredits]) VALUES (8, N'MATH175', N'Functions and Number Systems', N'MATH', N'175', N'PS', CAST(3.0000 AS Decimal(7, 4)))
INSERT [dbo].[Course] ([CourseId], [CourseCode], [CourseTitle], [CourseSubject], [CourseNum], [CourseLevel], [CourseCredits]) VALUES (11, N'COMP122', N'Introduction to Database Concepts', N'COMP', N'122', N'PS', CAST(4.0000 AS Decimal(7, 4)))
INSERT [dbo].[Course] ([CourseId], [CourseCode], [CourseTitle], [CourseSubject], [CourseNum], [CourseLevel], [CourseCredits]) VALUES (12, N'COMP125', N'Client-Side Web Development', N'COMP', N'125', N'PS', CAST(4.0000 AS Decimal(7, 4)))
INSERT [dbo].[Course] ([CourseId], [CourseCode], [CourseTitle], [CourseSubject], [CourseNum], [CourseLevel], [CourseCredits]) VALUES (14, N'COMP225', N'Software Eng Methodologies 1', N'COMP', N'225', N'PS', CAST(4.0000 AS Decimal(7, 4)))
INSERT [dbo].[Course] ([CourseId], [CourseCode], [CourseTitle], [CourseSubject], [CourseNum], [CourseLevel], [CourseCredits]) VALUES (15, N'COMP301', N'Unix/Linux Operating Systems', N'COMP', N'301', N'PS', CAST(4.0000 AS Decimal(7, 4)))
INSERT [dbo].[Course] ([CourseId], [CourseCode], [CourseTitle], [CourseSubject], [CourseNum], [CourseLevel], [CourseCredits]) VALUES (16, N'MATH185', N'Discrete Mathematics', N'MATH', N'185', N'PS', CAST(3.0000 AS Decimal(7, 4)))
INSERT [dbo].[Course] ([CourseId], [CourseCode], [CourseTitle], [CourseSubject], [CourseNum], [CourseLevel], [CourseCredits]) VALUES (17, N'COMP214', N'Advanced Database Concepts', N'COMP', N'214', N'PS', CAST(4.0000 AS Decimal(7, 4)))
INSERT [dbo].[Course] ([CourseId], [CourseCode], [CourseTitle], [CourseSubject], [CourseNum], [CourseLevel], [CourseCredits]) VALUES (18, N'COMP228', N'Java Programming', N'COMP', N'228', N'PS', CAST(4.0000 AS Decimal(7, 4)))
INSERT [dbo].[Course] ([CourseId], [CourseCode], [CourseTitle], [CourseSubject], [CourseNum], [CourseLevel], [CourseCredits]) VALUES (19, N'COMP229', N'Web Application Development', N'COMP', N'229', N'PS', CAST(4.0000 AS Decimal(7, 4)))
INSERT [dbo].[Course] ([CourseId], [CourseCode], [CourseTitle], [CourseSubject], [CourseNum], [CourseLevel], [CourseCredits]) VALUES (21, N'COMP246', N'Object Oriented Software Eng', N'COMP', N'246', N'PS', CAST(4.0000 AS Decimal(7, 4)))
INSERT [dbo].[Course] ([CourseId], [CourseCode], [CourseTitle], [CourseSubject], [CourseNum], [CourseLevel], [CourseCredits]) VALUES (22, N'COOP222', N'Co-op Work Term 1', N'COOP', N'222', N'PS', CAST(10.0000 AS Decimal(7, 4)))
INSERT [dbo].[Course] ([CourseId], [CourseCode], [CourseTitle], [CourseSubject], [CourseNum], [CourseLevel], [CourseCredits]) VALUES (23, N'ENGL253', N'Adv. Business Communications', N'ENGL', N'253', N'PS', CAST(3.0000 AS Decimal(7, 4)))
INSERT [dbo].[Course] ([CourseId], [CourseCode], [CourseTitle], [CourseSubject], [CourseNum], [CourseLevel], [CourseCredits]) VALUES (24, N'GNED500', N'Global Citizenship', N'GNED', N'500', N'PS', CAST(3.0000 AS Decimal(7, 4)))
INSERT [dbo].[Course] ([CourseId], [CourseCode], [CourseTitle], [CourseSubject], [CourseNum], [CourseLevel], [CourseCredits]) VALUES (25, N'CNET124', N'Fundamentals Computer Networks', N'CNET', N'124', N'PS', CAST(4.0000 AS Decimal(7, 4)))
INSERT [dbo].[Course] ([CourseId], [CourseCode], [CourseTitle], [CourseSubject], [CourseNum], [CourseLevel], [CourseCredits]) VALUES (26, N'CNET329', N'Business and ICT', N'CNET', N'329', N'PS', CAST(3.0000 AS Decimal(7, 4)))
INSERT [dbo].[Course] ([CourseId], [CourseCode], [CourseTitle], [CourseSubject], [CourseNum], [CourseLevel], [CourseCredits]) VALUES (27, N'COMP212', N'Programming 3', N'COMP', N'212', N'PS', CAST(4.0000 AS Decimal(7, 4)))
INSERT [dbo].[Course] ([CourseId], [CourseCode], [CourseTitle], [CourseSubject], [CourseNum], [CourseLevel], [CourseCredits]) VALUES (29, N'COMP311', N'Software Testing and QA', N'COMP', N'311', N'PS', CAST(4.0000 AS Decimal(7, 4)))
INSERT [dbo].[Course] ([CourseId], [CourseCode], [CourseTitle], [CourseSubject], [CourseNum], [CourseLevel], [CourseCredits]) VALUES (30, N'MATH210', N'Linear Algebra and Statistics', N'MATH', N'210', N'PS', CAST(4.0000 AS Decimal(7, 4)))
INSERT [dbo].[Course] ([CourseId], [CourseCode], [CourseTitle], [CourseSubject], [CourseNum], [CourseLevel], [CourseCredits]) VALUES (31, N'COMP387', N'Clinical Workflow and IT Solutions', N'COMP', N'387', N'PS', CAST(4.0000 AS Decimal(7, 4)))
INSERT [dbo].[Course] ([CourseId], [CourseCode], [CourseTitle], [CourseSubject], [CourseNum], [CourseLevel], [CourseCredits]) VALUES (32, N'COMP397', N'Web Game Programming', N'COMP', N'397', N'PS', CAST(4.0000 AS Decimal(7, 4)))
INSERT [dbo].[Course] ([CourseId], [CourseCode], [CourseTitle], [CourseSubject], [CourseNum], [CourseLevel], [CourseCredits]) VALUES (33, N'CNET307', N'IT Project Management', N'CNET', N'307', N'PS', CAST(3.0000 AS Decimal(7, 4)))
INSERT [dbo].[Course] ([CourseId], [CourseCode], [CourseTitle], [CourseSubject], [CourseNum], [CourseLevel], [CourseCredits]) VALUES (34, N'COMP231', N'Software Development Project 1', N'COMP', N'231', N'PS', CAST(4.0000 AS Decimal(7, 4)))
INSERT [dbo].[Course] ([CourseId], [CourseCode], [CourseTitle], [CourseSubject], [CourseNum], [CourseLevel], [CourseCredits]) VALUES (35, N'COMP303', N'Java EE Programming', N'COMP', N'303', N'PS', CAST(4.0000 AS Decimal(7, 4)))
INSERT [dbo].[Course] ([CourseId], [CourseCode], [CourseTitle], [CourseSubject], [CourseNum], [CourseLevel], [CourseCredits]) VALUES (36, N'COMP308', N'Emerging Technologies', N'COMP', N'308', N'PS', CAST(4.0000 AS Decimal(7, 4)))
INSERT [dbo].[Course] ([CourseId], [CourseCode], [CourseTitle], [CourseSubject], [CourseNum], [CourseLevel], [CourseCredits]) VALUES (37, N'COMP321', N'Systems Integration', N'COMP', N'321', N'PS', CAST(4.0000 AS Decimal(7, 4)))
INSERT [dbo].[Course] ([CourseId], [CourseCode], [CourseTitle], [CourseSubject], [CourseNum], [CourseLevel], [CourseCredits]) VALUES (38, N'COMP305', N'Game Programming 1', N'COMP', N'305', N'PS', CAST(4.0000 AS Decimal(7, 4)))
INSERT [dbo].[Course] ([CourseId], [CourseCode], [CourseTitle], [CourseSubject], [CourseNum], [CourseLevel], [CourseCredits]) VALUES (39, N'COMP317', N'Software QA and Test Management', N'COMP', N'317', N'PS', CAST(4.0000 AS Decimal(7, 4)))
INSERT [dbo].[Course] ([CourseId], [CourseCode], [CourseTitle], [CourseSubject], [CourseNum], [CourseLevel], [CourseCredits]) VALUES (40, N'COMP381', N'Tools, Algorithms and Methods', N'COMP', N'381', N'PS', CAST(4.0000 AS Decimal(7, 4)))
INSERT [dbo].[Course] ([CourseId], [CourseCode], [CourseTitle], [CourseSubject], [CourseNum], [CourseLevel], [CourseCredits]) VALUES (41, N'COMP382', N'Computer Tech in Medical Imaging', N'COMP', N'382', N'PS', CAST(4.0000 AS Decimal(7, 4)))
INSERT [dbo].[Course] ([CourseId], [CourseCode], [CourseTitle], [CourseSubject], [CourseNum], [CourseLevel], [CourseCredits]) VALUES (43, N'COMP383', N'Data Security and Privacy Policies', N'COMP', N'383', N'PS', CAST(4.0000 AS Decimal(7, 4)))
INSERT [dbo].[Course] ([CourseId], [CourseCode], [CourseTitle], [CourseSubject], [CourseNum], [CourseLevel], [CourseCredits]) VALUES (44, N'COMP384', N'Telehealth', N'COMP', N'384', N'PS', CAST(4.0000 AS Decimal(7, 4)))
INSERT [dbo].[Course] ([CourseId], [CourseCode], [CourseTitle], [CourseSubject], [CourseNum], [CourseLevel], [CourseCredits]) VALUES (45, N'COMP392', N'Advanced Graphics', N'COMP', N'392', N'PS', CAST(4.0000 AS Decimal(7, 4)))
INSERT [dbo].[Course] ([CourseId], [CourseCode], [CourseTitle], [CourseSubject], [CourseNum], [CourseLevel], [CourseCredits]) VALUES (46, N'COMP396', N'Game Programming 2', N'COMP', N'396', N'PS', CAST(4.0000 AS Decimal(7, 4)))
INSERT [dbo].[Course] ([CourseId], [CourseCode], [CourseTitle], [CourseSubject], [CourseNum], [CourseLevel], [CourseCredits]) VALUES (47, N'COMP304', N'Wireless Programming', N'COMP', N'304', N'PS', CAST(4.0000 AS Decimal(7, 4)))
INSERT [dbo].[Course] ([CourseId], [CourseCode], [CourseTitle], [CourseSubject], [CourseNum], [CourseLevel], [CourseCredits]) VALUES (48, N'COMP306', N'API Engineering and Cloud Computing', N'COMP', N'306', N'PS', CAST(4.0000 AS Decimal(7, 4)))
INSERT [dbo].[Course] ([CourseId], [CourseCode], [CourseTitle], [CourseSubject], [CourseNum], [CourseLevel], [CourseCredits]) VALUES (49, N'COMP307', N'Software Security', N'COMP', N'307', N'PS', CAST(4.0000 AS Decimal(7, 4)))
INSERT [dbo].[Course] ([CourseId], [CourseCode], [CourseTitle], [CourseSubject], [CourseNum], [CourseLevel], [CourseCredits]) VALUES (50, N'COMP309', N'Data Warehousing and Data Mining', N'COMP', N'309', N'PS', CAST(4.0000 AS Decimal(7, 4)))
INSERT [dbo].[Course] ([CourseId], [CourseCode], [CourseTitle], [CourseSubject], [CourseNum], [CourseLevel], [CourseCredits]) VALUES (51, N'COMP313', N'Software Development Project 2', N'COMP', N'313', N'PS', CAST(4.0000 AS Decimal(7, 4)))
INSERT [dbo].[Course] ([CourseId], [CourseCode], [CourseTitle], [CourseSubject], [CourseNum], [CourseLevel], [CourseCredits]) VALUES (52, N'GNED106', N'Consumer Psychology', N'GNED', N'106', N'PS', CAST(3.0000 AS Decimal(7, 4)))
INSERT [dbo].[Course] ([CourseId], [CourseCode], [CourseTitle], [CourseSubject], [CourseNum], [CourseLevel], [CourseCredits]) VALUES (53, N'GNED130', N'Principles of Sociology', N'GNED', N'130', N'PS', CAST(3.0000 AS Decimal(7, 4)))
INSERT [dbo].[Course] ([CourseId], [CourseCode], [CourseTitle], [CourseSubject], [CourseNum], [CourseLevel], [CourseCredits]) VALUES (54, N'GNED400', N'Inclusive Leadership Practices', N'GNED', N'400', N'PS', CAST(3.0000 AS Decimal(7, 4)))
INSERT [dbo].[Course] ([CourseId], [CourseCode], [CourseTitle], [CourseSubject], [CourseNum], [CourseLevel], [CourseCredits]) VALUES (55, N'GCTC001', N'Community/Working Life 1', N'GCTC', N'001', N'PS', CAST(3.0000 AS Decimal(7, 4)))
INSERT [dbo].[Course] ([CourseId], [CourseCode], [CourseTitle], [CourseSubject], [CourseNum], [CourseLevel], [CourseCredits]) VALUES (56, N'COOP221', N'Employment Preplacement 1', N'COOP', N'221', N'PS', CAST(1.0000 AS Decimal(7, 4)))
INSERT [dbo].[Course] ([CourseId], [CourseCode], [CourseTitle], [CourseSubject], [CourseNum], [CourseLevel], [CourseCredits]) VALUES (57, N'COOP331', N'Co-Op Work Placement 2', N'COOP', N'331', N'PS', CAST(10.0000 AS Decimal(7, 4)))
INSERT [dbo].[Course] ([CourseId], [CourseCode], [CourseTitle], [CourseSubject], [CourseNum], [CourseLevel], [CourseCredits]) VALUES (58, N'COOP332', N'Co-op Work Placement 3', N'COOP', N'332', N'PS', CAST(10.0000 AS Decimal(7, 4)))
INSERT [dbo].[Course] ([CourseId], [CourseCode], [CourseTitle], [CourseSubject], [CourseNum], [CourseLevel], [CourseCredits]) VALUES (59, N'AMEG212', N'Ethics in Technology and Environmnt', N'AMEG', N'212', N'PS', CAST(2.0000 AS Decimal(7, 4)))
INSERT [dbo].[Course] ([CourseId], [CourseCode], [CourseTitle], [CourseSubject], [CourseNum], [CourseLevel], [CourseCredits]) VALUES (60, N'CNET101', N'PC Hardware', N'CNET', N'101', N'PS', CAST(4.0000 AS Decimal(7, 4)))
INSERT [dbo].[Course] ([CourseId], [CourseCode], [CourseTitle], [CourseSubject], [CourseNum], [CourseLevel], [CourseCredits]) VALUES (61, N'CNET102', N'PC Operating Systems', N'CNET', N'102', N'PS', CAST(4.0000 AS Decimal(7, 4)))
INSERT [dbo].[Course] ([CourseId], [CourseCode], [CourseTitle], [CourseSubject], [CourseNum], [CourseLevel], [CourseCredits]) VALUES (62, N'CNET104', N'Technical Writing with MS Office', N'CNET', N'104', N'PS', CAST(4.0000 AS Decimal(7, 4)))
INSERT [dbo].[Course] ([CourseId], [CourseCode], [CourseTitle], [CourseSubject], [CourseNum], [CourseLevel], [CourseCredits]) VALUES (63, N'CNET204', N'Introduction to Web Design', N'CNET', N'204', N'PS', CAST(4.0000 AS Decimal(7, 4)))
INSERT [dbo].[Course] ([CourseId], [CourseCode], [CourseTitle], [CourseSubject], [CourseNum], [CourseLevel], [CourseCredits]) VALUES (64, N'COMM160', N'College Communications 1', N'COMM', N'160', N'PS', CAST(4.0000 AS Decimal(7, 4)))
INSERT [dbo].[Course] ([CourseId], [CourseCode], [CourseTitle], [CourseSubject], [CourseNum], [CourseLevel], [CourseCredits]) VALUES (67, N'MATH149', N'Mathematics for Computer Systems 1', N'MATH', N'149', N'PS', CAST(4.0000 AS Decimal(7, 4)))
INSERT [dbo].[Course] ([CourseId], [CourseCode], [CourseTitle], [CourseSubject], [CourseNum], [CourseLevel], [CourseCredits]) VALUES (68, N'CNET126', N'Electricity for Computer Systems', N'CNET', N'126', N'PS', CAST(4.0000 AS Decimal(7, 4)))
INSERT [dbo].[Course] ([CourseId], [CourseCode], [CourseTitle], [CourseSubject], [CourseNum], [CourseLevel], [CourseCredits]) VALUES (69, N'CNET205', N'Customer Skills', N'CNET', N'205', N'PS', CAST(4.0000 AS Decimal(7, 4)))
INSERT [dbo].[Course] ([CourseId], [CourseCode], [CourseTitle], [CourseSubject], [CourseNum], [CourseLevel], [CourseCredits]) VALUES (70, N'CNET206', N'Introduction to Unix/Linux', N'CNET', N'206', N'PS', CAST(4.0000 AS Decimal(7, 4)))
INSERT [dbo].[Course] ([CourseId], [CourseCode], [CourseTitle], [CourseSubject], [CourseNum], [CourseLevel], [CourseCredits]) VALUES (71, N'CNET224', N'Data Communications', N'CNET', N'224', N'PS', CAST(4.0000 AS Decimal(7, 4)))
INSERT [dbo].[Course] ([CourseId], [CourseCode], [CourseTitle], [CourseSubject], [CourseNum], [CourseLevel], [CourseCredits]) VALUES (72, N'MATH169', N'Mathematics for Computer Systems 2', N'MATH', N'169', N'PS', CAST(4.0000 AS Decimal(7, 4)))
INSERT [dbo].[Course] ([CourseId], [CourseCode], [CourseTitle], [CourseSubject], [CourseNum], [CourseLevel], [CourseCredits]) VALUES (73, N'CNET201', N'Fundamentals of Routing Switching', N'CNET', N'201', N'PS', CAST(4.0000 AS Decimal(7, 4)))
INSERT [dbo].[Course] ([CourseId], [CourseCode], [CourseTitle], [CourseSubject], [CourseNum], [CourseLevel], [CourseCredits]) VALUES (74, N'CNET202', N'Windows Server Operating System', N'CNET', N'202', N'PS', CAST(4.0000 AS Decimal(7, 4)))
INSERT [dbo].[Course] ([CourseId], [CourseCode], [CourseTitle], [CourseSubject], [CourseNum], [CourseLevel], [CourseCredits]) VALUES (75, N'CNET219', N'The Physical Layer', N'CNET', N'219', N'PS', CAST(4.0000 AS Decimal(7, 4)))
INSERT [dbo].[Course] ([CourseId], [CourseCode], [CourseTitle], [CourseSubject], [CourseNum], [CourseLevel], [CourseCredits]) VALUES (76, N'CNET225', N'Introduction to Telephony', N'CNET', N'225', N'PS', CAST(4.0000 AS Decimal(7, 4)))
INSERT [dbo].[Course] ([CourseId], [CourseCode], [CourseTitle], [CourseSubject], [CourseNum], [CourseLevel], [CourseCredits]) VALUES (77, N'ENGL250', N'Report Writing in a Technical Env', N'ENGL', N'250', N'PS', CAST(4.0000 AS Decimal(7, 4)))
INSERT [dbo].[Course] ([CourseId], [CourseCode], [CourseTitle], [CourseSubject], [CourseNum], [CourseLevel], [CourseCredits]) VALUES (78, N'MATH269', N'Statistics for Computer Systems', N'MATH', N'269', N'PS', CAST(4.0000 AS Decimal(7, 4)))
INSERT [dbo].[Course] ([CourseId], [CourseCode], [CourseTitle], [CourseSubject], [CourseNum], [CourseLevel], [CourseCredits]) VALUES (79, N'CNET221', N'Network Security', N'CNET', N'221', N'PS', CAST(4.0000 AS Decimal(7, 4)))
INSERT [dbo].[Course] ([CourseId], [CourseCode], [CourseTitle], [CourseSubject], [CourseNum], [CourseLevel], [CourseCredits]) VALUES (80, N'CNET222', N'Network Services', N'CNET', N'222', N'PS', CAST(4.0000 AS Decimal(7, 4)))
INSERT [dbo].[Course] ([CourseId], [CourseCode], [CourseTitle], [CourseSubject], [CourseNum], [CourseLevel], [CourseCredits]) VALUES (81, N'CNET227', N'Technician Project', N'CNET', N'227', N'PS', CAST(4.0000 AS Decimal(7, 4)))
INSERT [dbo].[Course] ([CourseId], [CourseCode], [CourseTitle], [CourseSubject], [CourseNum], [CourseLevel], [CourseCredits]) VALUES (82, N'CNET239', N'Computer Forensics', N'CNET', N'239', N'PS', CAST(4.0000 AS Decimal(7, 4)))
INSERT [dbo].[Course] ([CourseId], [CourseCode], [CourseTitle], [CourseSubject], [CourseNum], [CourseLevel], [CourseCredits]) VALUES (83, N'CNET311', N'Routing and Switching', N'CNET', N'311', N'PS', CAST(4.0000 AS Decimal(7, 4)))
INSERT [dbo].[Course] ([CourseId], [CourseCode], [CourseTitle], [CourseSubject], [CourseNum], [CourseLevel], [CourseCredits]) VALUES (84, N'EMPS101', N'Employment Skills', N'EMPS', N'101', N'PS', CAST(4.0000 AS Decimal(7, 4)))
INSERT [dbo].[Course] ([CourseId], [CourseCode], [CourseTitle], [CourseSubject], [CourseNum], [CourseLevel], [CourseCredits]) VALUES (85, N'ACCT123', N'Financial Accounting Concepts', N'ACCT', N'123', N'PS', CAST(4.0000 AS Decimal(7, 4)))
INSERT [dbo].[Course] ([CourseId], [CourseCode], [CourseTitle], [CourseSubject], [CourseNum], [CourseLevel], [CourseCredits]) VALUES (86, N'BUSN119', N'Fundamentals of Business', N'BUSN', N'119', N'PS', CAST(4.0000 AS Decimal(7, 4)))
INSERT [dbo].[Course] ([CourseId], [CourseCode], [CourseTitle], [CourseSubject], [CourseNum], [CourseLevel], [CourseCredits]) VALUES (87, N'COMP126', N'Applied Business Software 2', N'COMP', N'126', N'PS', CAST(4.0000 AS Decimal(7, 4)))
INSERT [dbo].[Course] ([CourseId], [CourseCode], [CourseTitle], [CourseSubject], [CourseNum], [CourseLevel], [CourseCredits]) VALUES (88, N'MATH128', N'Mathematics of Finance I - E', N'MATH', N'128', N'PS', CAST(4.0000 AS Decimal(7, 4)))
INSERT [dbo].[Course] ([CourseId], [CourseCode], [CourseTitle], [CourseSubject], [CourseNum], [CourseLevel], [CourseCredits]) VALUES (91, N'MKTG116', N'Marketing', N'MKTG', N'116', N'PS', CAST(4.0000 AS Decimal(7, 4)))
INSERT [dbo].[Course] ([CourseId], [CourseCode], [CourseTitle], [CourseSubject], [CourseNum], [CourseLevel], [CourseCredits]) VALUES (92, N'BUSN122', N'Customer Service & Relationship', N'BUSN', N'122', N'PS', CAST(4.0000 AS Decimal(7, 4)))
INSERT [dbo].[Course] ([CourseId], [CourseCode], [CourseTitle], [CourseSubject], [CourseNum], [CourseLevel], [CourseCredits]) VALUES (93, N'INTL220', N'International Business Concepts', N'INTL', N'220', N'PS', CAST(4.0000 AS Decimal(7, 4)))
INSERT [dbo].[Course] ([CourseId], [CourseCode], [CourseTitle], [CourseSubject], [CourseNum], [CourseLevel], [CourseCredits]) VALUES (94, N'OMGT129', N'Intro Supply Chain and Business Ops', N'OMGT', N'129', N'PS', CAST(4.0000 AS Decimal(7, 4)))
INSERT [dbo].[Course] ([CourseId], [CourseCode], [CourseTitle], [CourseSubject], [CourseNum], [CourseLevel], [CourseCredits]) VALUES (95, N'BUSN333', N'Business Culture and Practices', N'BUSN', N'333', N'PS', CAST(4.0000 AS Decimal(7, 4)))
INSERT [dbo].[Course] ([CourseId], [CourseCode], [CourseTitle], [CourseSubject], [CourseNum], [CourseLevel], [CourseCredits]) VALUES (96, N'HRMT301', N'Human Resources Management', N'HRMT', N'301', N'PS', CAST(4.0000 AS Decimal(7, 4)))
INSERT [dbo].[Course] ([CourseId], [CourseCode], [CourseTitle], [CourseSubject], [CourseNum], [CourseLevel], [CourseCredits]) VALUES (97, N'BUSN331', N'Business Law', N'BUSN', N'331', N'PS', CAST(4.0000 AS Decimal(7, 4)))
INSERT [dbo].[Course] ([CourseId], [CourseCode], [CourseTitle], [CourseSubject], [CourseNum], [CourseLevel], [CourseCredits]) VALUES (98, N'HRMT300', N'Organizational Behaviour', N'HRMT', N'300', N'PS', CAST(4.0000 AS Decimal(7, 4)))
INSERT [dbo].[Course] ([CourseId], [CourseCode], [CourseTitle], [CourseSubject], [CourseNum], [CourseLevel], [CourseCredits]) VALUES (99, N'CYCP104', N'Psychology and Child Development', N'CYCP', N'104', N'PS', CAST(4.0000 AS Decimal(7, 4)))
INSERT [dbo].[Course] ([CourseId], [CourseCode], [CourseTitle], [CourseSubject], [CourseNum], [CourseLevel], [CourseCredits]) VALUES (100, N'CYCP112', N'Foundations in Child and Youth Care', N'CYCP', N'112', N'PS', CAST(4.0000 AS Decimal(7, 4)))
INSERT [dbo].[Course] ([CourseId], [CourseCode], [CourseTitle], [CourseSubject], [CourseNum], [CourseLevel], [CourseCredits]) VALUES (101, N'CYCP116', N'Child & Adolescent Mental Health 2', N'CYCP', N'116', N'PS', CAST(4.0000 AS Decimal(7, 4)))
INSERT [dbo].[Course] ([CourseId], [CourseCode], [CourseTitle], [CourseSubject], [CourseNum], [CourseLevel], [CourseCredits]) VALUES (102, N'CYCP118', N'Psychology Adolescent Development', N'CYCP', N'118', N'PS', CAST(4.0000 AS Decimal(7, 4)))
INSERT [dbo].[Course] ([CourseId], [CourseCode], [CourseTitle], [CourseSubject], [CourseNum], [CourseLevel], [CourseCredits]) VALUES (103, N'CYCP201', N'Counselling Theories and Practice', N'CYCP', N'201', N'PS', CAST(4.0000 AS Decimal(7, 4)))
INSERT [dbo].[Course] ([CourseId], [CourseCode], [CourseTitle], [CourseSubject], [CourseNum], [CourseLevel], [CourseCredits]) VALUES (104, N'CYCP210', N'Child & Adolescent Mental Health 3', N'CYCP', N'210', N'PS', CAST(4.0000 AS Decimal(7, 4)))
INSERT [dbo].[Course] ([CourseId], [CourseCode], [CourseTitle], [CourseSubject], [CourseNum], [CourseLevel], [CourseCredits]) VALUES (105, N'CYCP212', N'Advocacy and Childrens Rights', N'CYCP', N'212', N'PS', CAST(4.0000 AS Decimal(7, 4)))
INSERT [dbo].[Course] ([CourseId], [CourseCode], [CourseTitle], [CourseSubject], [CourseNum], [CourseLevel], [CourseCredits]) VALUES (106, N'CYCP211', N'Introduction to the Family', N'CYCP', N'211', N'PS', CAST(4.0000 AS Decimal(7, 4)))
INSERT [dbo].[Course] ([CourseId], [CourseCode], [CourseTitle], [CourseSubject], [CourseNum], [CourseLevel], [CourseCredits]) VALUES (107, N'CYCP214', N'Working with Traumatized Children', N'CYCP', N'214', N'PS', CAST(4.0000 AS Decimal(7, 4)))
INSERT [dbo].[Course] ([CourseId], [CourseCode], [CourseTitle], [CourseSubject], [CourseNum], [CourseLevel], [CourseCredits]) VALUES (108, N'CYCP215', N'Professional Recording', N'CYCP', N'215', N'PS', CAST(4.0000 AS Decimal(7, 4)))
INSERT [dbo].[Course] ([CourseId], [CourseCode], [CourseTitle], [CourseSubject], [CourseNum], [CourseLevel], [CourseCredits]) VALUES (109, N'CYCP303', N'Child Abuse', N'CYCP', N'303', N'PS', CAST(4.0000 AS Decimal(7, 4)))
INSERT [dbo].[Course] ([CourseId], [CourseCode], [CourseTitle], [CourseSubject], [CourseNum], [CourseLevel], [CourseCredits]) VALUES (110, N'CYCP304', N'Advanced Counselling Skills', N'CYCP', N'304', N'PS', CAST(4.0000 AS Decimal(7, 4)))
GO
INSERT [dbo].[Course] ([CourseId], [CourseCode], [CourseTitle], [CourseSubject], [CourseNum], [CourseLevel], [CourseCredits]) VALUES (111, N'CYCP312', N'Crisis Theory & Interventions', N'CYCP', N'312', N'PS', CAST(4.0000 AS Decimal(7, 4)))
INSERT [dbo].[Course] ([CourseId], [CourseCode], [CourseTitle], [CourseSubject], [CourseNum], [CourseLevel], [CourseCredits]) VALUES (112, N'CYCP313', N'Working with Families', N'CYCP', N'313', N'PS', CAST(4.0000 AS Decimal(7, 4)))
SET IDENTITY_INSERT [dbo].[Course] OFF
SET IDENTITY_INSERT [dbo].[CoursePrerequisite] ON 

INSERT [dbo].[CoursePrerequisite] ([CoursePrerequisiteId], [CourseId], [PrereqCourseId]) VALUES (1, 2, 1)
INSERT [dbo].[CoursePrerequisite] ([CoursePrerequisiteId], [CourseId], [PrereqCourseId]) VALUES (14, 18, 1)
INSERT [dbo].[CoursePrerequisite] ([CoursePrerequisiteId], [CourseId], [PrereqCourseId]) VALUES (15, 18, 2)
INSERT [dbo].[CoursePrerequisite] ([CoursePrerequisiteId], [CourseId], [PrereqCourseId]) VALUES (2, 27, 2)
INSERT [dbo].[CoursePrerequisite] ([CoursePrerequisiteId], [CourseId], [PrereqCourseId]) VALUES (9, 35, 18)
INSERT [dbo].[CoursePrerequisite] ([CoursePrerequisiteId], [CourseId], [PrereqCourseId]) VALUES (78, 37, 3)
SET IDENTITY_INSERT [dbo].[CoursePrerequisite] OFF
SET IDENTITY_INSERT [dbo].[Degree] ON 

INSERT [dbo].[Degree] ([DegreeId], [DegreeName], [DegreeLevel]) VALUES (1, N'Advanced Diploma', N'PS')
INSERT [dbo].[Degree] ([DegreeId], [DegreeName], [DegreeLevel]) VALUES (2, N'Apprenticeship', N'PS')
INSERT [dbo].[Degree] ([DegreeId], [DegreeName], [DegreeLevel]) VALUES (3, N'Bachelor', N'PS')
INSERT [dbo].[Degree] ([DegreeId], [DegreeName], [DegreeLevel]) VALUES (4, N'Certificate', N'PS')
INSERT [dbo].[Degree] ([DegreeId], [DegreeName], [DegreeLevel]) VALUES (5, N'College Preparation', N'SS')
INSERT [dbo].[Degree] ([DegreeId], [DegreeName], [DegreeLevel]) VALUES (6, N'Degree', N'PS')
INSERT [dbo].[Degree] ([DegreeId], [DegreeName], [DegreeLevel]) VALUES (7, N'Diploma', N'PS')
INSERT [dbo].[Degree] ([DegreeId], [DegreeName], [DegreeLevel]) VALUES (8, N'Graduate Certificate', N'PG')
SET IDENTITY_INSERT [dbo].[Degree] OFF
SET IDENTITY_INSERT [dbo].[Department] ON 

INSERT [dbo].[Department] ([DepartmentId], [DepartmentName], [CampusId]) VALUES (1, N'Engineering Technology & Applied Science', 1)
INSERT [dbo].[Department] ([DepartmentId], [DepartmentName], [CampusId]) VALUES (2, N'Advancement', 5)
INSERT [dbo].[Department] ([DepartmentId], [DepartmentName], [CampusId]) VALUES (3, N'Business', 1)
INSERT [dbo].[Department] ([DepartmentId], [DepartmentName], [CampusId]) VALUES (5, N'Communications, Media, Arts and Design', 9)
INSERT [dbo].[Department] ([DepartmentId], [DepartmentName], [CampusId]) VALUES (6, N'Community and Health Studies', 7)
INSERT [dbo].[Department] ([DepartmentId], [DepartmentName], [CampusId]) VALUES (7, N'Hospitality, Tourism and Culinary Arts', 2)
INSERT [dbo].[Department] ([DepartmentId], [DepartmentName], [CampusId]) VALUES (8, N'Transportation', 8)
SET IDENTITY_INSERT [dbo].[Department] OFF
SET IDENTITY_INSERT [dbo].[Enrollment] ON 

INSERT [dbo].[Enrollment] ([EnrollmentId], [StudentId], [SectionId], [GradeNumeric]) VALUES (47, 1023, 95, CAST(89.00 AS Decimal(5, 2)))
INSERT [dbo].[Enrollment] ([EnrollmentId], [StudentId], [SectionId], [GradeNumeric]) VALUES (48, 1023, 96, CAST(50.00 AS Decimal(5, 2)))
INSERT [dbo].[Enrollment] ([EnrollmentId], [StudentId], [SectionId], [GradeNumeric]) VALUES (49, 1023, 86, CAST(87.00 AS Decimal(5, 2)))
INSERT [dbo].[Enrollment] ([EnrollmentId], [StudentId], [SectionId], [GradeNumeric]) VALUES (50, 1023, 98, CAST(90.00 AS Decimal(5, 2)))
INSERT [dbo].[Enrollment] ([EnrollmentId], [StudentId], [SectionId], [GradeNumeric]) VALUES (51, 1023, 100, CAST(66.00 AS Decimal(5, 2)))
INSERT [dbo].[Enrollment] ([EnrollmentId], [StudentId], [SectionId], [GradeNumeric]) VALUES (52, 1023, 101, CAST(84.00 AS Decimal(5, 2)))
INSERT [dbo].[Enrollment] ([EnrollmentId], [StudentId], [SectionId], [GradeNumeric]) VALUES (53, 1023, 99, CAST(93.00 AS Decimal(5, 2)))
INSERT [dbo].[Enrollment] ([EnrollmentId], [StudentId], [SectionId], [GradeNumeric]) VALUES (57, 1023, 111, NULL)
INSERT [dbo].[Enrollment] ([EnrollmentId], [StudentId], [SectionId], [GradeNumeric]) VALUES (58, 1023, 110, NULL)
INSERT [dbo].[Enrollment] ([EnrollmentId], [StudentId], [SectionId], [GradeNumeric]) VALUES (59, 1023, 109, NULL)
SET IDENTITY_INSERT [dbo].[Enrollment] OFF
INSERT [dbo].[Instructor] ([InstructorId], [InstructorEmpNum], [InstructorLastName], [InstructorFirstMidName], [InstructorEmail]) VALUES (4, N'600000000', N'Clinton', N'Cathy', N'cchi')
INSERT [dbo].[Instructor] ([InstructorId], [InstructorEmpNum], [InstructorLastName], [InstructorFirstMidName], [InstructorEmail]) VALUES (11, N'b', N'Smith', N'Sam', N'ssmith')
INSERT [dbo].[Instructor] ([InstructorId], [InstructorEmpNum], [InstructorLastName], [InstructorFirstMidName], [InstructorEmail]) VALUES (1016, N'600000001', N'Athens', N'Adele', N'aadele')
INSERT [dbo].[Instructor] ([InstructorId], [InstructorEmpNum], [InstructorLastName], [InstructorFirstMidName], [InstructorEmail]) VALUES (1017, N'600000002', N'Bees', N'Beyonce', N'bbees')
INSERT [dbo].[Instructor] ([InstructorId], [InstructorEmpNum], [InstructorLastName], [InstructorFirstMidName], [InstructorEmail]) VALUES (1018, N'600000003', N'Dove', N'Dorin', N'ddove')
INSERT [dbo].[Instructor] ([InstructorId], [InstructorEmpNum], [InstructorLastName], [InstructorFirstMidName], [InstructorEmail]) VALUES (1019, N'600000004', N'Edberg', N'Ellen', N'eedberg')
INSERT [dbo].[Instructor] ([InstructorId], [InstructorEmpNum], [InstructorLastName], [InstructorFirstMidName], [InstructorEmail]) VALUES (1020, N'600000005', N'Foo', N'Frankie', N'ffoo')
INSERT [dbo].[Instructor] ([InstructorId], [InstructorEmpNum], [InstructorLastName], [InstructorFirstMidName], [InstructorEmail]) VALUES (1021, N'600000006', N'Guci', N'Gretta', N'gguci')
INSERT [dbo].[Instructor] ([InstructorId], [InstructorEmpNum], [InstructorLastName], [InstructorFirstMidName], [InstructorEmail]) VALUES (1022, N'600000007', N'Humming', N'Han', N'hhumming')
SET IDENTITY_INSERT [dbo].[Program] ON 

INSERT [dbo].[Program] ([ProgramId], [ProgramCode], [ProgramName], [DepartmentId], [DegreeId], [ProgramSemesters]) VALUES (1, N'3419', N'Software Engineering Technology (Co-op)', 1, 1, 9)
INSERT [dbo].[Program] ([ProgramId], [ProgramCode], [ProgramName], [DepartmentId], [DegreeId], [ProgramSemesters]) VALUES (2, N'3489', N'Computer Systems Technology - Networking', 1, 1, 6)
INSERT [dbo].[Program] ([ProgramId], [ProgramCode], [ProgramName], [DepartmentId], [DegreeId], [ProgramSemesters]) VALUES (3, N'2803', N'Business', 3, 7, 4)
INSERT [dbo].[Program] ([ProgramId], [ProgramCode], [ProgramName], [DepartmentId], [DegreeId], [ProgramSemesters]) VALUES (4, N'1205', N'Child and Youth Care', 6, 4, 4)
INSERT [dbo].[Program] ([ProgramId], [ProgramCode], [ProgramName], [DepartmentId], [DegreeId], [ProgramSemesters]) VALUES (6, N'4861', N'Software Engineering Technology Interactive Gaming', 1, 1, 6)
INSERT [dbo].[Program] ([ProgramId], [ProgramCode], [ProgramName], [DepartmentId], [DegreeId], [ProgramSemesters]) VALUES (7, N'5473', N'Health Informatics Technology (Fast-Track)', 1, 6, 2)
SET IDENTITY_INSERT [dbo].[Program] OFF
SET IDENTITY_INSERT [dbo].[ProgramSemester] ON 

INSERT [dbo].[ProgramSemester] ([ProgramSemesterId], [ProgramSemesterNum], [ProgramSemesterName], [ProgramSemesterAcademic], [ProgramId]) VALUES (1, 1, N'Semester 1', 1, 1)
INSERT [dbo].[ProgramSemester] ([ProgramSemesterId], [ProgramSemesterNum], [ProgramSemesterName], [ProgramSemesterAcademic], [ProgramId]) VALUES (2, 2, N'Semester 2', 1, 1)
INSERT [dbo].[ProgramSemester] ([ProgramSemesterId], [ProgramSemesterNum], [ProgramSemesterName], [ProgramSemesterAcademic], [ProgramId]) VALUES (3, 3, N'Semester 3', 1, 1)
INSERT [dbo].[ProgramSemester] ([ProgramSemesterId], [ProgramSemesterNum], [ProgramSemesterName], [ProgramSemesterAcademic], [ProgramId]) VALUES (4, 4, N'Co-op term 1', 0, 1)
INSERT [dbo].[ProgramSemester] ([ProgramSemesterId], [ProgramSemesterNum], [ProgramSemesterName], [ProgramSemesterAcademic], [ProgramId]) VALUES (5, 5, N'Semester 4', 1, 1)
INSERT [dbo].[ProgramSemester] ([ProgramSemesterId], [ProgramSemesterNum], [ProgramSemesterName], [ProgramSemesterAcademic], [ProgramId]) VALUES (6, 6, N'Co-op term 2', 0, 1)
INSERT [dbo].[ProgramSemester] ([ProgramSemesterId], [ProgramSemesterNum], [ProgramSemesterName], [ProgramSemesterAcademic], [ProgramId]) VALUES (7, 7, N'Semester 5', 1, 1)
INSERT [dbo].[ProgramSemester] ([ProgramSemesterId], [ProgramSemesterNum], [ProgramSemesterName], [ProgramSemesterAcademic], [ProgramId]) VALUES (8, 8, N'Co-op term 3', 0, 1)
INSERT [dbo].[ProgramSemester] ([ProgramSemesterId], [ProgramSemesterNum], [ProgramSemesterName], [ProgramSemesterAcademic], [ProgramId]) VALUES (9, 9, N'Semester 6', 1, 1)
INSERT [dbo].[ProgramSemester] ([ProgramSemesterId], [ProgramSemesterNum], [ProgramSemesterName], [ProgramSemesterAcademic], [ProgramId]) VALUES (10, 1, N'Semester 1', 1, 2)
INSERT [dbo].[ProgramSemester] ([ProgramSemesterId], [ProgramSemesterNum], [ProgramSemesterName], [ProgramSemesterAcademic], [ProgramId]) VALUES (11, 2, N'Semester 2', 1, 2)
INSERT [dbo].[ProgramSemester] ([ProgramSemesterId], [ProgramSemesterNum], [ProgramSemesterName], [ProgramSemesterAcademic], [ProgramId]) VALUES (12, 3, N'Semester 3', 1, 2)
INSERT [dbo].[ProgramSemester] ([ProgramSemesterId], [ProgramSemesterNum], [ProgramSemesterName], [ProgramSemesterAcademic], [ProgramId]) VALUES (13, 4, N'Semester 4', 1, 2)
INSERT [dbo].[ProgramSemester] ([ProgramSemesterId], [ProgramSemesterNum], [ProgramSemesterName], [ProgramSemesterAcademic], [ProgramId]) VALUES (14, 5, N'Semester 5', 1, 2)
INSERT [dbo].[ProgramSemester] ([ProgramSemesterId], [ProgramSemesterNum], [ProgramSemesterName], [ProgramSemesterAcademic], [ProgramId]) VALUES (15, 6, N'Semester 6', 1, 2)
INSERT [dbo].[ProgramSemester] ([ProgramSemesterId], [ProgramSemesterNum], [ProgramSemesterName], [ProgramSemesterAcademic], [ProgramId]) VALUES (16, 1, N'Semester 1', 1, 3)
INSERT [dbo].[ProgramSemester] ([ProgramSemesterId], [ProgramSemesterNum], [ProgramSemesterName], [ProgramSemesterAcademic], [ProgramId]) VALUES (17, 2, N'Semester 2', 1, 3)
INSERT [dbo].[ProgramSemester] ([ProgramSemesterId], [ProgramSemesterNum], [ProgramSemesterName], [ProgramSemesterAcademic], [ProgramId]) VALUES (18, 3, N'Semester 3', 1, 3)
INSERT [dbo].[ProgramSemester] ([ProgramSemesterId], [ProgramSemesterNum], [ProgramSemesterName], [ProgramSemesterAcademic], [ProgramId]) VALUES (19, 4, N'Semester 4', 1, 3)
INSERT [dbo].[ProgramSemester] ([ProgramSemesterId], [ProgramSemesterNum], [ProgramSemesterName], [ProgramSemesterAcademic], [ProgramId]) VALUES (20, 1, N'Semester 1', 1, 4)
INSERT [dbo].[ProgramSemester] ([ProgramSemesterId], [ProgramSemesterNum], [ProgramSemesterName], [ProgramSemesterAcademic], [ProgramId]) VALUES (21, 2, N'Semester 2', 1, 4)
INSERT [dbo].[ProgramSemester] ([ProgramSemesterId], [ProgramSemesterNum], [ProgramSemesterName], [ProgramSemesterAcademic], [ProgramId]) VALUES (22, 3, N'Semester 3', 1, 4)
INSERT [dbo].[ProgramSemester] ([ProgramSemesterId], [ProgramSemesterNum], [ProgramSemesterName], [ProgramSemesterAcademic], [ProgramId]) VALUES (23, 4, N'Semester 4', 1, 4)
INSERT [dbo].[ProgramSemester] ([ProgramSemesterId], [ProgramSemesterNum], [ProgramSemesterName], [ProgramSemesterAcademic], [ProgramId]) VALUES (24, 1, N'Semester 1', 1, 6)
INSERT [dbo].[ProgramSemester] ([ProgramSemesterId], [ProgramSemesterNum], [ProgramSemesterName], [ProgramSemesterAcademic], [ProgramId]) VALUES (25, 2, N'Semester 2', 1, 6)
INSERT [dbo].[ProgramSemester] ([ProgramSemesterId], [ProgramSemesterNum], [ProgramSemesterName], [ProgramSemesterAcademic], [ProgramId]) VALUES (26, 3, N'Semester 3', 1, 6)
INSERT [dbo].[ProgramSemester] ([ProgramSemesterId], [ProgramSemesterNum], [ProgramSemesterName], [ProgramSemesterAcademic], [ProgramId]) VALUES (27, 4, N'Semester 4', 1, 6)
INSERT [dbo].[ProgramSemester] ([ProgramSemesterId], [ProgramSemesterNum], [ProgramSemesterName], [ProgramSemesterAcademic], [ProgramId]) VALUES (28, 5, N'Semester 5', 1, 6)
INSERT [dbo].[ProgramSemester] ([ProgramSemesterId], [ProgramSemesterNum], [ProgramSemesterName], [ProgramSemesterAcademic], [ProgramId]) VALUES (29, 6, N'Semester 6', 1, 6)
INSERT [dbo].[ProgramSemester] ([ProgramSemesterId], [ProgramSemesterNum], [ProgramSemesterName], [ProgramSemesterAcademic], [ProgramId]) VALUES (30, 1, N'Semester 1', 1, 7)
INSERT [dbo].[ProgramSemester] ([ProgramSemesterId], [ProgramSemesterNum], [ProgramSemesterName], [ProgramSemesterAcademic], [ProgramId]) VALUES (31, 2, N'Semester 2', 1, 7)
SET IDENTITY_INSERT [dbo].[ProgramSemester] OFF
SET IDENTITY_INSERT [dbo].[ProgramSemesterCourse] ON 

INSERT [dbo].[ProgramSemesterCourse] ([ProgramSemesterCourseId], [ProgramSemesterId], [CourseId], [EndDate], [IsAcademic], [IsMandatory], [IsTechnicalElective], [IsGeneralElective]) VALUES (1, 1, 3, NULL, 1, 1, 0, 0)
INSERT [dbo].[ProgramSemesterCourse] ([ProgramSemesterCourseId], [ProgramSemesterId], [CourseId], [EndDate], [IsAcademic], [IsMandatory], [IsTechnicalElective], [IsGeneralElective]) VALUES (2, 1, 1, NULL, 1, 1, 0, 0)
INSERT [dbo].[ProgramSemesterCourse] ([ProgramSemesterCourseId], [ProgramSemesterId], [CourseId], [EndDate], [IsAcademic], [IsMandatory], [IsTechnicalElective], [IsGeneralElective]) VALUES (3, 1, 5, NULL, 1, 1, 0, 0)
INSERT [dbo].[ProgramSemesterCourse] ([ProgramSemesterCourseId], [ProgramSemesterId], [CourseId], [EndDate], [IsAcademic], [IsMandatory], [IsTechnicalElective], [IsGeneralElective]) VALUES (4, 1, 6, NULL, 1, 1, 0, 0)
INSERT [dbo].[ProgramSemesterCourse] ([ProgramSemesterCourseId], [ProgramSemesterId], [CourseId], [EndDate], [IsAcademic], [IsMandatory], [IsTechnicalElective], [IsGeneralElective]) VALUES (5, 1, 7, NULL, 1, 1, 0, 0)
INSERT [dbo].[ProgramSemesterCourse] ([ProgramSemesterCourseId], [ProgramSemesterId], [CourseId], [EndDate], [IsAcademic], [IsMandatory], [IsTechnicalElective], [IsGeneralElective]) VALUES (6, 1, 8, NULL, 1, 1, 0, 0)
INSERT [dbo].[ProgramSemesterCourse] ([ProgramSemesterCourseId], [ProgramSemesterId], [CourseId], [EndDate], [IsAcademic], [IsMandatory], [IsTechnicalElective], [IsGeneralElective]) VALUES (7, 2, 11, NULL, 1, 1, 0, 0)
INSERT [dbo].[ProgramSemesterCourse] ([ProgramSemesterCourseId], [ProgramSemesterId], [CourseId], [EndDate], [IsAcademic], [IsMandatory], [IsTechnicalElective], [IsGeneralElective]) VALUES (8, 2, 2, NULL, 1, 1, 0, 0)
INSERT [dbo].[ProgramSemesterCourse] ([ProgramSemesterCourseId], [ProgramSemesterId], [CourseId], [EndDate], [IsAcademic], [IsMandatory], [IsTechnicalElective], [IsGeneralElective]) VALUES (9, 2, 12, NULL, 1, 1, 0, 0)
INSERT [dbo].[ProgramSemesterCourse] ([ProgramSemesterCourseId], [ProgramSemesterId], [CourseId], [EndDate], [IsAcademic], [IsMandatory], [IsTechnicalElective], [IsGeneralElective]) VALUES (10, 2, 14, NULL, 1, 1, 0, 0)
INSERT [dbo].[ProgramSemesterCourse] ([ProgramSemesterCourseId], [ProgramSemesterId], [CourseId], [EndDate], [IsAcademic], [IsMandatory], [IsTechnicalElective], [IsGeneralElective]) VALUES (11, 2, 15, NULL, 1, 1, 0, 0)
INSERT [dbo].[ProgramSemesterCourse] ([ProgramSemesterCourseId], [ProgramSemesterId], [CourseId], [EndDate], [IsAcademic], [IsMandatory], [IsTechnicalElective], [IsGeneralElective]) VALUES (12, 2, 16, NULL, 1, 1, 0, 0)
INSERT [dbo].[ProgramSemesterCourse] ([ProgramSemesterCourseId], [ProgramSemesterId], [CourseId], [EndDate], [IsAcademic], [IsMandatory], [IsTechnicalElective], [IsGeneralElective]) VALUES (13, 3, 17, NULL, 1, 1, 0, 0)
INSERT [dbo].[ProgramSemesterCourse] ([ProgramSemesterCourseId], [ProgramSemesterId], [CourseId], [EndDate], [IsAcademic], [IsMandatory], [IsTechnicalElective], [IsGeneralElective]) VALUES (14, 3, 18, NULL, 1, 1, 0, 0)
INSERT [dbo].[ProgramSemesterCourse] ([ProgramSemesterCourseId], [ProgramSemesterId], [CourseId], [EndDate], [IsAcademic], [IsMandatory], [IsTechnicalElective], [IsGeneralElective]) VALUES (15, 3, 19, NULL, 1, 1, 0, 0)
INSERT [dbo].[ProgramSemesterCourse] ([ProgramSemesterCourseId], [ProgramSemesterId], [CourseId], [EndDate], [IsAcademic], [IsMandatory], [IsTechnicalElective], [IsGeneralElective]) VALUES (16, 3, 21, NULL, 1, 1, 0, 0)
INSERT [dbo].[ProgramSemesterCourse] ([ProgramSemesterCourseId], [ProgramSemesterId], [CourseId], [EndDate], [IsAcademic], [IsMandatory], [IsTechnicalElective], [IsGeneralElective]) VALUES (17, 3, 23, NULL, 1, 1, 0, 0)
INSERT [dbo].[ProgramSemesterCourse] ([ProgramSemesterCourseId], [ProgramSemesterId], [CourseId], [EndDate], [IsAcademic], [IsMandatory], [IsTechnicalElective], [IsGeneralElective]) VALUES (18, 3, 24, NULL, 1, 1, 0, 0)
INSERT [dbo].[ProgramSemesterCourse] ([ProgramSemesterCourseId], [ProgramSemesterId], [CourseId], [EndDate], [IsAcademic], [IsMandatory], [IsTechnicalElective], [IsGeneralElective]) VALUES (19, 4, 22, NULL, 0, 1, 0, 0)
INSERT [dbo].[ProgramSemesterCourse] ([ProgramSemesterCourseId], [ProgramSemesterId], [CourseId], [EndDate], [IsAcademic], [IsMandatory], [IsTechnicalElective], [IsGeneralElective]) VALUES (20, 5, 25, NULL, 1, 1, 0, 0)
INSERT [dbo].[ProgramSemesterCourse] ([ProgramSemesterCourseId], [ProgramSemesterId], [CourseId], [EndDate], [IsAcademic], [IsMandatory], [IsTechnicalElective], [IsGeneralElective]) VALUES (21, 5, 26, NULL, 1, 1, 0, 0)
INSERT [dbo].[ProgramSemesterCourse] ([ProgramSemesterCourseId], [ProgramSemesterId], [CourseId], [EndDate], [IsAcademic], [IsMandatory], [IsTechnicalElective], [IsGeneralElective]) VALUES (22, 5, 27, NULL, 1, 1, 0, 0)
INSERT [dbo].[ProgramSemesterCourse] ([ProgramSemesterCourseId], [ProgramSemesterId], [CourseId], [EndDate], [IsAcademic], [IsMandatory], [IsTechnicalElective], [IsGeneralElective]) VALUES (23, 5, 29, NULL, 1, 1, 0, 0)
INSERT [dbo].[ProgramSemesterCourse] ([ProgramSemesterCourseId], [ProgramSemesterId], [CourseId], [EndDate], [IsAcademic], [IsMandatory], [IsTechnicalElective], [IsGeneralElective]) VALUES (24, 5, 30, NULL, 1, 1, 0, 0)
INSERT [dbo].[ProgramSemesterCourse] ([ProgramSemesterCourseId], [ProgramSemesterId], [CourseId], [EndDate], [IsAcademic], [IsMandatory], [IsTechnicalElective], [IsGeneralElective]) VALUES (25, 5, 31, NULL, 1, 0, 1, 0)
INSERT [dbo].[ProgramSemesterCourse] ([ProgramSemesterCourseId], [ProgramSemesterId], [CourseId], [EndDate], [IsAcademic], [IsMandatory], [IsTechnicalElective], [IsGeneralElective]) VALUES (26, 5, 32, NULL, 1, 0, 1, 0)
INSERT [dbo].[ProgramSemesterCourse] ([ProgramSemesterCourseId], [ProgramSemesterId], [CourseId], [EndDate], [IsAcademic], [IsMandatory], [IsTechnicalElective], [IsGeneralElective]) VALUES (27, 6, 57, NULL, 0, 1, 0, 0)
INSERT [dbo].[ProgramSemesterCourse] ([ProgramSemesterCourseId], [ProgramSemesterId], [CourseId], [EndDate], [IsAcademic], [IsMandatory], [IsTechnicalElective], [IsGeneralElective]) VALUES (28, 7, 33, NULL, 1, 1, 0, 0)
INSERT [dbo].[ProgramSemesterCourse] ([ProgramSemesterCourseId], [ProgramSemesterId], [CourseId], [EndDate], [IsAcademic], [IsMandatory], [IsTechnicalElective], [IsGeneralElective]) VALUES (29, 7, 34, NULL, 1, 1, 0, 0)
INSERT [dbo].[ProgramSemesterCourse] ([ProgramSemesterCourseId], [ProgramSemesterId], [CourseId], [EndDate], [IsAcademic], [IsMandatory], [IsTechnicalElective], [IsGeneralElective]) VALUES (30, 7, 35, NULL, 1, 1, 0, 0)
INSERT [dbo].[ProgramSemesterCourse] ([ProgramSemesterCourseId], [ProgramSemesterId], [CourseId], [EndDate], [IsAcademic], [IsMandatory], [IsTechnicalElective], [IsGeneralElective]) VALUES (31, 7, 36, NULL, 1, 1, 0, 0)
INSERT [dbo].[ProgramSemesterCourse] ([ProgramSemesterCourseId], [ProgramSemesterId], [CourseId], [EndDate], [IsAcademic], [IsMandatory], [IsTechnicalElective], [IsGeneralElective]) VALUES (32, 7, 37, NULL, 1, 1, 0, 0)
INSERT [dbo].[ProgramSemesterCourse] ([ProgramSemesterCourseId], [ProgramSemesterId], [CourseId], [EndDate], [IsAcademic], [IsMandatory], [IsTechnicalElective], [IsGeneralElective]) VALUES (33, 7, 38, NULL, 1, 0, 1, 0)
INSERT [dbo].[ProgramSemesterCourse] ([ProgramSemesterCourseId], [ProgramSemesterId], [CourseId], [EndDate], [IsAcademic], [IsMandatory], [IsTechnicalElective], [IsGeneralElective]) VALUES (34, 7, 39, NULL, 1, 0, 1, 0)
INSERT [dbo].[ProgramSemesterCourse] ([ProgramSemesterCourseId], [ProgramSemesterId], [CourseId], [EndDate], [IsAcademic], [IsMandatory], [IsTechnicalElective], [IsGeneralElective]) VALUES (35, 7, 40, NULL, 1, 0, 1, 0)
INSERT [dbo].[ProgramSemesterCourse] ([ProgramSemesterCourseId], [ProgramSemesterId], [CourseId], [EndDate], [IsAcademic], [IsMandatory], [IsTechnicalElective], [IsGeneralElective]) VALUES (36, 7, 41, NULL, 1, 0, 1, 0)
INSERT [dbo].[ProgramSemesterCourse] ([ProgramSemesterCourseId], [ProgramSemesterId], [CourseId], [EndDate], [IsAcademic], [IsMandatory], [IsTechnicalElective], [IsGeneralElective]) VALUES (37, 7, 43, NULL, 1, 0, 1, 0)
INSERT [dbo].[ProgramSemesterCourse] ([ProgramSemesterCourseId], [ProgramSemesterId], [CourseId], [EndDate], [IsAcademic], [IsMandatory], [IsTechnicalElective], [IsGeneralElective]) VALUES (38, 7, 44, NULL, 1, 0, 1, 0)
INSERT [dbo].[ProgramSemesterCourse] ([ProgramSemesterCourseId], [ProgramSemesterId], [CourseId], [EndDate], [IsAcademic], [IsMandatory], [IsTechnicalElective], [IsGeneralElective]) VALUES (39, 7, 45, NULL, 1, 0, 1, 0)
INSERT [dbo].[ProgramSemesterCourse] ([ProgramSemesterCourseId], [ProgramSemesterId], [CourseId], [EndDate], [IsAcademic], [IsMandatory], [IsTechnicalElective], [IsGeneralElective]) VALUES (40, 7, 46, NULL, 1, 0, 1, 0)
INSERT [dbo].[ProgramSemesterCourse] ([ProgramSemesterCourseId], [ProgramSemesterId], [CourseId], [EndDate], [IsAcademic], [IsMandatory], [IsTechnicalElective], [IsGeneralElective]) VALUES (41, 8, 58, NULL, 0, 1, 0, 0)
INSERT [dbo].[ProgramSemesterCourse] ([ProgramSemesterCourseId], [ProgramSemesterId], [CourseId], [EndDate], [IsAcademic], [IsMandatory], [IsTechnicalElective], [IsGeneralElective]) VALUES (42, 9, 47, NULL, 1, 1, 0, 0)
INSERT [dbo].[ProgramSemesterCourse] ([ProgramSemesterCourseId], [ProgramSemesterId], [CourseId], [EndDate], [IsAcademic], [IsMandatory], [IsTechnicalElective], [IsGeneralElective]) VALUES (43, 9, 48, NULL, 1, 1, 0, 0)
INSERT [dbo].[ProgramSemesterCourse] ([ProgramSemesterCourseId], [ProgramSemesterId], [CourseId], [EndDate], [IsAcademic], [IsMandatory], [IsTechnicalElective], [IsGeneralElective]) VALUES (44, 9, 49, NULL, 1, 1, 0, 0)
INSERT [dbo].[ProgramSemesterCourse] ([ProgramSemesterCourseId], [ProgramSemesterId], [CourseId], [EndDate], [IsAcademic], [IsMandatory], [IsTechnicalElective], [IsGeneralElective]) VALUES (45, 9, 50, NULL, 1, 1, 0, 0)
INSERT [dbo].[ProgramSemesterCourse] ([ProgramSemesterCourseId], [ProgramSemesterId], [CourseId], [EndDate], [IsAcademic], [IsMandatory], [IsTechnicalElective], [IsGeneralElective]) VALUES (46, 9, 51, NULL, 1, 1, 0, 0)
INSERT [dbo].[ProgramSemesterCourse] ([ProgramSemesterCourseId], [ProgramSemesterId], [CourseId], [EndDate], [IsAcademic], [IsMandatory], [IsTechnicalElective], [IsGeneralElective]) VALUES (47, 9, 52, NULL, 1, 0, 0, 1)
INSERT [dbo].[ProgramSemesterCourse] ([ProgramSemesterCourseId], [ProgramSemesterId], [CourseId], [EndDate], [IsAcademic], [IsMandatory], [IsTechnicalElective], [IsGeneralElective]) VALUES (48, 9, 53, NULL, 1, 0, 0, 1)
INSERT [dbo].[ProgramSemesterCourse] ([ProgramSemesterCourseId], [ProgramSemesterId], [CourseId], [EndDate], [IsAcademic], [IsMandatory], [IsTechnicalElective], [IsGeneralElective]) VALUES (49, 9, 54, NULL, 1, 0, 0, 1)
INSERT [dbo].[ProgramSemesterCourse] ([ProgramSemesterCourseId], [ProgramSemesterId], [CourseId], [EndDate], [IsAcademic], [IsMandatory], [IsTechnicalElective], [IsGeneralElective]) VALUES (51, 10, 3, NULL, 1, 1, 0, 0)
INSERT [dbo].[ProgramSemesterCourse] ([ProgramSemesterCourseId], [ProgramSemesterId], [CourseId], [EndDate], [IsAcademic], [IsMandatory], [IsTechnicalElective], [IsGeneralElective]) VALUES (52, 10, 1, NULL, 1, 1, 0, 0)
INSERT [dbo].[ProgramSemesterCourse] ([ProgramSemesterCourseId], [ProgramSemesterId], [CourseId], [EndDate], [IsAcademic], [IsMandatory], [IsTechnicalElective], [IsGeneralElective]) VALUES (53, 10, 5, NULL, 1, 1, 0, 0)
INSERT [dbo].[ProgramSemesterCourse] ([ProgramSemesterCourseId], [ProgramSemesterId], [CourseId], [EndDate], [IsAcademic], [IsMandatory], [IsTechnicalElective], [IsGeneralElective]) VALUES (54, 10, 6, NULL, 1, 1, 0, 0)
INSERT [dbo].[ProgramSemesterCourse] ([ProgramSemesterCourseId], [ProgramSemesterId], [CourseId], [EndDate], [IsAcademic], [IsMandatory], [IsTechnicalElective], [IsGeneralElective]) VALUES (55, 10, 7, NULL, 1, 1, 0, 0)
INSERT [dbo].[ProgramSemesterCourse] ([ProgramSemesterCourseId], [ProgramSemesterId], [CourseId], [EndDate], [IsAcademic], [IsMandatory], [IsTechnicalElective], [IsGeneralElective]) VALUES (56, 10, 8, NULL, 1, 1, 0, 0)
INSERT [dbo].[ProgramSemesterCourse] ([ProgramSemesterCourseId], [ProgramSemesterId], [CourseId], [EndDate], [IsAcademic], [IsMandatory], [IsTechnicalElective], [IsGeneralElective]) VALUES (57, 11, 11, NULL, 1, 1, 0, 0)
INSERT [dbo].[ProgramSemesterCourse] ([ProgramSemesterCourseId], [ProgramSemesterId], [CourseId], [EndDate], [IsAcademic], [IsMandatory], [IsTechnicalElective], [IsGeneralElective]) VALUES (58, 11, 2, NULL, 1, 1, 0, 0)
INSERT [dbo].[ProgramSemesterCourse] ([ProgramSemesterCourseId], [ProgramSemesterId], [CourseId], [EndDate], [IsAcademic], [IsMandatory], [IsTechnicalElective], [IsGeneralElective]) VALUES (59, 11, 12, NULL, 1, 1, 0, 0)
INSERT [dbo].[ProgramSemesterCourse] ([ProgramSemesterCourseId], [ProgramSemesterId], [CourseId], [EndDate], [IsAcademic], [IsMandatory], [IsTechnicalElective], [IsGeneralElective]) VALUES (60, 11, 14, NULL, 1, 1, 0, 0)
INSERT [dbo].[ProgramSemesterCourse] ([ProgramSemesterCourseId], [ProgramSemesterId], [CourseId], [EndDate], [IsAcademic], [IsMandatory], [IsTechnicalElective], [IsGeneralElective]) VALUES (61, 11, 15, NULL, 1, 1, 0, 0)
INSERT [dbo].[ProgramSemesterCourse] ([ProgramSemesterCourseId], [ProgramSemesterId], [CourseId], [EndDate], [IsAcademic], [IsMandatory], [IsTechnicalElective], [IsGeneralElective]) VALUES (62, 11, 16, NULL, 1, 1, 0, 0)
INSERT [dbo].[ProgramSemesterCourse] ([ProgramSemesterCourseId], [ProgramSemesterId], [CourseId], [EndDate], [IsAcademic], [IsMandatory], [IsTechnicalElective], [IsGeneralElective]) VALUES (63, 12, 17, NULL, 1, 1, 0, 0)
INSERT [dbo].[ProgramSemesterCourse] ([ProgramSemesterCourseId], [ProgramSemesterId], [CourseId], [EndDate], [IsAcademic], [IsMandatory], [IsTechnicalElective], [IsGeneralElective]) VALUES (64, 12, 18, NULL, 1, 1, 0, 0)
INSERT [dbo].[ProgramSemesterCourse] ([ProgramSemesterCourseId], [ProgramSemesterId], [CourseId], [EndDate], [IsAcademic], [IsMandatory], [IsTechnicalElective], [IsGeneralElective]) VALUES (65, 12, 19, NULL, 1, 1, 0, 0)
INSERT [dbo].[ProgramSemesterCourse] ([ProgramSemesterCourseId], [ProgramSemesterId], [CourseId], [EndDate], [IsAcademic], [IsMandatory], [IsTechnicalElective], [IsGeneralElective]) VALUES (66, 12, 21, NULL, 1, 1, 0, 0)
INSERT [dbo].[ProgramSemesterCourse] ([ProgramSemesterCourseId], [ProgramSemesterId], [CourseId], [EndDate], [IsAcademic], [IsMandatory], [IsTechnicalElective], [IsGeneralElective]) VALUES (67, 12, 23, NULL, 1, 1, 0, 0)
INSERT [dbo].[ProgramSemesterCourse] ([ProgramSemesterCourseId], [ProgramSemesterId], [CourseId], [EndDate], [IsAcademic], [IsMandatory], [IsTechnicalElective], [IsGeneralElective]) VALUES (68, 12, 24, NULL, 1, 1, 0, 0)
INSERT [dbo].[ProgramSemesterCourse] ([ProgramSemesterCourseId], [ProgramSemesterId], [CourseId], [EndDate], [IsAcademic], [IsMandatory], [IsTechnicalElective], [IsGeneralElective]) VALUES (69, 13, 25, NULL, 1, 1, 0, 0)
INSERT [dbo].[ProgramSemesterCourse] ([ProgramSemesterCourseId], [ProgramSemesterId], [CourseId], [EndDate], [IsAcademic], [IsMandatory], [IsTechnicalElective], [IsGeneralElective]) VALUES (70, 13, 26, NULL, 1, 1, 0, 0)
INSERT [dbo].[ProgramSemesterCourse] ([ProgramSemesterCourseId], [ProgramSemesterId], [CourseId], [EndDate], [IsAcademic], [IsMandatory], [IsTechnicalElective], [IsGeneralElective]) VALUES (71, 13, 27, NULL, 1, 1, 0, 0)
INSERT [dbo].[ProgramSemesterCourse] ([ProgramSemesterCourseId], [ProgramSemesterId], [CourseId], [EndDate], [IsAcademic], [IsMandatory], [IsTechnicalElective], [IsGeneralElective]) VALUES (72, 13, 29, NULL, 1, 1, 0, 0)
INSERT [dbo].[ProgramSemesterCourse] ([ProgramSemesterCourseId], [ProgramSemesterId], [CourseId], [EndDate], [IsAcademic], [IsMandatory], [IsTechnicalElective], [IsGeneralElective]) VALUES (73, 13, 30, NULL, 1, 1, 0, 0)
INSERT [dbo].[ProgramSemesterCourse] ([ProgramSemesterCourseId], [ProgramSemesterId], [CourseId], [EndDate], [IsAcademic], [IsMandatory], [IsTechnicalElective], [IsGeneralElective]) VALUES (74, 13, 31, NULL, 1, 0, 1, 0)
INSERT [dbo].[ProgramSemesterCourse] ([ProgramSemesterCourseId], [ProgramSemesterId], [CourseId], [EndDate], [IsAcademic], [IsMandatory], [IsTechnicalElective], [IsGeneralElective]) VALUES (75, 13, 32, NULL, 1, 0, 1, 0)
INSERT [dbo].[ProgramSemesterCourse] ([ProgramSemesterCourseId], [ProgramSemesterId], [CourseId], [EndDate], [IsAcademic], [IsMandatory], [IsTechnicalElective], [IsGeneralElective]) VALUES (76, 14, 33, NULL, 1, 1, 0, 0)
INSERT [dbo].[ProgramSemesterCourse] ([ProgramSemesterCourseId], [ProgramSemesterId], [CourseId], [EndDate], [IsAcademic], [IsMandatory], [IsTechnicalElective], [IsGeneralElective]) VALUES (77, 14, 34, NULL, 1, 1, 0, 0)
INSERT [dbo].[ProgramSemesterCourse] ([ProgramSemesterCourseId], [ProgramSemesterId], [CourseId], [EndDate], [IsAcademic], [IsMandatory], [IsTechnicalElective], [IsGeneralElective]) VALUES (78, 14, 35, NULL, 1, 1, 0, 0)
INSERT [dbo].[ProgramSemesterCourse] ([ProgramSemesterCourseId], [ProgramSemesterId], [CourseId], [EndDate], [IsAcademic], [IsMandatory], [IsTechnicalElective], [IsGeneralElective]) VALUES (79, 14, 36, NULL, 1, 1, 0, 0)
INSERT [dbo].[ProgramSemesterCourse] ([ProgramSemesterCourseId], [ProgramSemesterId], [CourseId], [EndDate], [IsAcademic], [IsMandatory], [IsTechnicalElective], [IsGeneralElective]) VALUES (80, 14, 37, NULL, 1, 1, 0, 0)
INSERT [dbo].[ProgramSemesterCourse] ([ProgramSemesterCourseId], [ProgramSemesterId], [CourseId], [EndDate], [IsAcademic], [IsMandatory], [IsTechnicalElective], [IsGeneralElective]) VALUES (81, 14, 38, NULL, 1, 0, 1, 0)
INSERT [dbo].[ProgramSemesterCourse] ([ProgramSemesterCourseId], [ProgramSemesterId], [CourseId], [EndDate], [IsAcademic], [IsMandatory], [IsTechnicalElective], [IsGeneralElective]) VALUES (82, 14, 39, NULL, 1, 0, 1, 0)
INSERT [dbo].[ProgramSemesterCourse] ([ProgramSemesterCourseId], [ProgramSemesterId], [CourseId], [EndDate], [IsAcademic], [IsMandatory], [IsTechnicalElective], [IsGeneralElective]) VALUES (83, 14, 40, NULL, 1, 0, 1, 0)
INSERT [dbo].[ProgramSemesterCourse] ([ProgramSemesterCourseId], [ProgramSemesterId], [CourseId], [EndDate], [IsAcademic], [IsMandatory], [IsTechnicalElective], [IsGeneralElective]) VALUES (84, 14, 41, NULL, 1, 0, 1, 0)
INSERT [dbo].[ProgramSemesterCourse] ([ProgramSemesterCourseId], [ProgramSemesterId], [CourseId], [EndDate], [IsAcademic], [IsMandatory], [IsTechnicalElective], [IsGeneralElective]) VALUES (85, 14, 43, NULL, 1, 0, 1, 0)
INSERT [dbo].[ProgramSemesterCourse] ([ProgramSemesterCourseId], [ProgramSemesterId], [CourseId], [EndDate], [IsAcademic], [IsMandatory], [IsTechnicalElective], [IsGeneralElective]) VALUES (86, 14, 44, NULL, 1, 0, 1, 0)
INSERT [dbo].[ProgramSemesterCourse] ([ProgramSemesterCourseId], [ProgramSemesterId], [CourseId], [EndDate], [IsAcademic], [IsMandatory], [IsTechnicalElective], [IsGeneralElective]) VALUES (87, 14, 45, NULL, 1, 0, 1, 0)
INSERT [dbo].[ProgramSemesterCourse] ([ProgramSemesterCourseId], [ProgramSemesterId], [CourseId], [EndDate], [IsAcademic], [IsMandatory], [IsTechnicalElective], [IsGeneralElective]) VALUES (88, 14, 46, NULL, 1, 0, 1, 0)
INSERT [dbo].[ProgramSemesterCourse] ([ProgramSemesterCourseId], [ProgramSemesterId], [CourseId], [EndDate], [IsAcademic], [IsMandatory], [IsTechnicalElective], [IsGeneralElective]) VALUES (89, 15, 47, NULL, 1, 1, 0, 0)
INSERT [dbo].[ProgramSemesterCourse] ([ProgramSemesterCourseId], [ProgramSemesterId], [CourseId], [EndDate], [IsAcademic], [IsMandatory], [IsTechnicalElective], [IsGeneralElective]) VALUES (90, 15, 48, NULL, 1, 1, 0, 0)
INSERT [dbo].[ProgramSemesterCourse] ([ProgramSemesterCourseId], [ProgramSemesterId], [CourseId], [EndDate], [IsAcademic], [IsMandatory], [IsTechnicalElective], [IsGeneralElective]) VALUES (91, 15, 49, NULL, 1, 1, 0, 0)
INSERT [dbo].[ProgramSemesterCourse] ([ProgramSemesterCourseId], [ProgramSemesterId], [CourseId], [EndDate], [IsAcademic], [IsMandatory], [IsTechnicalElective], [IsGeneralElective]) VALUES (92, 15, 50, NULL, 1, 1, 0, 0)
INSERT [dbo].[ProgramSemesterCourse] ([ProgramSemesterCourseId], [ProgramSemesterId], [CourseId], [EndDate], [IsAcademic], [IsMandatory], [IsTechnicalElective], [IsGeneralElective]) VALUES (93, 15, 51, NULL, 1, 1, 0, 0)
INSERT [dbo].[ProgramSemesterCourse] ([ProgramSemesterCourseId], [ProgramSemesterId], [CourseId], [EndDate], [IsAcademic], [IsMandatory], [IsTechnicalElective], [IsGeneralElective]) VALUES (94, 15, 52, NULL, 1, 0, 0, 1)
INSERT [dbo].[ProgramSemesterCourse] ([ProgramSemesterCourseId], [ProgramSemesterId], [CourseId], [EndDate], [IsAcademic], [IsMandatory], [IsTechnicalElective], [IsGeneralElective]) VALUES (95, 15, 53, NULL, 1, 0, 0, 1)
INSERT [dbo].[ProgramSemesterCourse] ([ProgramSemesterCourseId], [ProgramSemesterId], [CourseId], [EndDate], [IsAcademic], [IsMandatory], [IsTechnicalElective], [IsGeneralElective]) VALUES (96, 15, 54, NULL, 1, 0, 0, 1)
INSERT [dbo].[ProgramSemesterCourse] ([ProgramSemesterCourseId], [ProgramSemesterId], [CourseId], [EndDate], [IsAcademic], [IsMandatory], [IsTechnicalElective], [IsGeneralElective]) VALUES (97, 16, 85, NULL, 1, 1, 0, 0)
INSERT [dbo].[ProgramSemesterCourse] ([ProgramSemesterCourseId], [ProgramSemesterId], [CourseId], [EndDate], [IsAcademic], [IsMandatory], [IsTechnicalElective], [IsGeneralElective]) VALUES (98, 16, 86, NULL, 1, 1, 0, 0)
INSERT [dbo].[ProgramSemesterCourse] ([ProgramSemesterCourseId], [ProgramSemesterId], [CourseId], [EndDate], [IsAcademic], [IsMandatory], [IsTechnicalElective], [IsGeneralElective]) VALUES (99, 16, 87, NULL, 1, 1, 0, 0)
INSERT [dbo].[ProgramSemesterCourse] ([ProgramSemesterCourseId], [ProgramSemesterId], [CourseId], [EndDate], [IsAcademic], [IsMandatory], [IsTechnicalElective], [IsGeneralElective]) VALUES (100, 16, 88, NULL, 1, 1, 0, 0)
GO
INSERT [dbo].[ProgramSemesterCourse] ([ProgramSemesterCourseId], [ProgramSemesterId], [CourseId], [EndDate], [IsAcademic], [IsMandatory], [IsTechnicalElective], [IsGeneralElective]) VALUES (101, 16, 91, NULL, 1, 1, 0, 0)
INSERT [dbo].[ProgramSemesterCourse] ([ProgramSemesterCourseId], [ProgramSemesterId], [CourseId], [EndDate], [IsAcademic], [IsMandatory], [IsTechnicalElective], [IsGeneralElective]) VALUES (102, 17, 92, NULL, 1, 1, 0, 0)
INSERT [dbo].[ProgramSemesterCourse] ([ProgramSemesterCourseId], [ProgramSemesterId], [CourseId], [EndDate], [IsAcademic], [IsMandatory], [IsTechnicalElective], [IsGeneralElective]) VALUES (103, 17, 93, NULL, 1, 1, 0, 0)
INSERT [dbo].[ProgramSemesterCourse] ([ProgramSemesterCourseId], [ProgramSemesterId], [CourseId], [EndDate], [IsAcademic], [IsMandatory], [IsTechnicalElective], [IsGeneralElective]) VALUES (104, 17, 94, NULL, 1, 1, 0, 0)
INSERT [dbo].[ProgramSemesterCourse] ([ProgramSemesterCourseId], [ProgramSemesterId], [CourseId], [EndDate], [IsAcademic], [IsMandatory], [IsTechnicalElective], [IsGeneralElective]) VALUES (105, 18, 95, NULL, 1, 1, 0, 0)
INSERT [dbo].[ProgramSemesterCourse] ([ProgramSemesterCourseId], [ProgramSemesterId], [CourseId], [EndDate], [IsAcademic], [IsMandatory], [IsTechnicalElective], [IsGeneralElective]) VALUES (106, 18, 96, NULL, 1, 1, 0, 0)
INSERT [dbo].[ProgramSemesterCourse] ([ProgramSemesterCourseId], [ProgramSemesterId], [CourseId], [EndDate], [IsAcademic], [IsMandatory], [IsTechnicalElective], [IsGeneralElective]) VALUES (107, 19, 97, NULL, 1, 1, 0, 0)
INSERT [dbo].[ProgramSemesterCourse] ([ProgramSemesterCourseId], [ProgramSemesterId], [CourseId], [EndDate], [IsAcademic], [IsMandatory], [IsTechnicalElective], [IsGeneralElective]) VALUES (108, 19, 98, NULL, 1, 1, 0, 0)
INSERT [dbo].[ProgramSemesterCourse] ([ProgramSemesterCourseId], [ProgramSemesterId], [CourseId], [EndDate], [IsAcademic], [IsMandatory], [IsTechnicalElective], [IsGeneralElective]) VALUES (109, 17, 99, NULL, 1, 1, 0, 0)
INSERT [dbo].[ProgramSemesterCourse] ([ProgramSemesterCourseId], [ProgramSemesterId], [CourseId], [EndDate], [IsAcademic], [IsMandatory], [IsTechnicalElective], [IsGeneralElective]) VALUES (110, 18, 100, NULL, 1, 1, 0, 0)
INSERT [dbo].[ProgramSemesterCourse] ([ProgramSemesterCourseId], [ProgramSemesterId], [CourseId], [EndDate], [IsAcademic], [IsMandatory], [IsTechnicalElective], [IsGeneralElective]) VALUES (111, 19, 101, NULL, 1, 1, 0, 0)
INSERT [dbo].[ProgramSemesterCourse] ([ProgramSemesterCourseId], [ProgramSemesterId], [CourseId], [EndDate], [IsAcademic], [IsMandatory], [IsTechnicalElective], [IsGeneralElective]) VALUES (112, 19, 102, NULL, 1, 1, 0, 0)
INSERT [dbo].[ProgramSemesterCourse] ([ProgramSemesterCourseId], [ProgramSemesterId], [CourseId], [EndDate], [IsAcademic], [IsMandatory], [IsTechnicalElective], [IsGeneralElective]) VALUES (113, 18, 24, NULL, 1, 0, 0, 1)
INSERT [dbo].[ProgramSemesterCourse] ([ProgramSemesterCourseId], [ProgramSemesterId], [CourseId], [EndDate], [IsAcademic], [IsMandatory], [IsTechnicalElective], [IsGeneralElective]) VALUES (114, 20, 99, NULL, 1, 1, 0, 0)
INSERT [dbo].[ProgramSemesterCourse] ([ProgramSemesterCourseId], [ProgramSemesterId], [CourseId], [EndDate], [IsAcademic], [IsMandatory], [IsTechnicalElective], [IsGeneralElective]) VALUES (115, 20, 100, NULL, 1, 1, 0, 0)
INSERT [dbo].[ProgramSemesterCourse] ([ProgramSemesterCourseId], [ProgramSemesterId], [CourseId], [EndDate], [IsAcademic], [IsMandatory], [IsTechnicalElective], [IsGeneralElective]) VALUES (116, 20, 101, NULL, 1, 1, 0, 0)
INSERT [dbo].[ProgramSemesterCourse] ([ProgramSemesterCourseId], [ProgramSemesterId], [CourseId], [EndDate], [IsAcademic], [IsMandatory], [IsTechnicalElective], [IsGeneralElective]) VALUES (117, 21, 102, NULL, 1, 1, 0, 0)
INSERT [dbo].[ProgramSemesterCourse] ([ProgramSemesterCourseId], [ProgramSemesterId], [CourseId], [EndDate], [IsAcademic], [IsMandatory], [IsTechnicalElective], [IsGeneralElective]) VALUES (118, 21, 103, NULL, 1, 1, 0, 0)
INSERT [dbo].[ProgramSemesterCourse] ([ProgramSemesterCourseId], [ProgramSemesterId], [CourseId], [EndDate], [IsAcademic], [IsMandatory], [IsTechnicalElective], [IsGeneralElective]) VALUES (119, 21, 104, NULL, 1, 1, 0, 0)
INSERT [dbo].[ProgramSemesterCourse] ([ProgramSemesterCourseId], [ProgramSemesterId], [CourseId], [EndDate], [IsAcademic], [IsMandatory], [IsTechnicalElective], [IsGeneralElective]) VALUES (120, 21, 105, NULL, 1, 1, 0, 0)
INSERT [dbo].[ProgramSemesterCourse] ([ProgramSemesterCourseId], [ProgramSemesterId], [CourseId], [EndDate], [IsAcademic], [IsMandatory], [IsTechnicalElective], [IsGeneralElective]) VALUES (121, 22, 106, NULL, 1, 1, 0, 0)
INSERT [dbo].[ProgramSemesterCourse] ([ProgramSemesterCourseId], [ProgramSemesterId], [CourseId], [EndDate], [IsAcademic], [IsMandatory], [IsTechnicalElective], [IsGeneralElective]) VALUES (122, 22, 107, NULL, 1, 1, 0, 0)
INSERT [dbo].[ProgramSemesterCourse] ([ProgramSemesterCourseId], [ProgramSemesterId], [CourseId], [EndDate], [IsAcademic], [IsMandatory], [IsTechnicalElective], [IsGeneralElective]) VALUES (123, 22, 108, NULL, 1, 1, 0, 0)
INSERT [dbo].[ProgramSemesterCourse] ([ProgramSemesterCourseId], [ProgramSemesterId], [CourseId], [EndDate], [IsAcademic], [IsMandatory], [IsTechnicalElective], [IsGeneralElective]) VALUES (124, 23, 109, NULL, 1, 1, 0, 0)
INSERT [dbo].[ProgramSemesterCourse] ([ProgramSemesterCourseId], [ProgramSemesterId], [CourseId], [EndDate], [IsAcademic], [IsMandatory], [IsTechnicalElective], [IsGeneralElective]) VALUES (125, 23, 110, NULL, 1, 1, 0, 0)
INSERT [dbo].[ProgramSemesterCourse] ([ProgramSemesterCourseId], [ProgramSemesterId], [CourseId], [EndDate], [IsAcademic], [IsMandatory], [IsTechnicalElective], [IsGeneralElective]) VALUES (126, 23, 111, NULL, 1, 1, 0, 0)
INSERT [dbo].[ProgramSemesterCourse] ([ProgramSemesterCourseId], [ProgramSemesterId], [CourseId], [EndDate], [IsAcademic], [IsMandatory], [IsTechnicalElective], [IsGeneralElective]) VALUES (127, 23, 112, NULL, 1, 1, 0, 0)
INSERT [dbo].[ProgramSemesterCourse] ([ProgramSemesterCourseId], [ProgramSemesterId], [CourseId], [EndDate], [IsAcademic], [IsMandatory], [IsTechnicalElective], [IsGeneralElective]) VALUES (128, 20, 24, NULL, 1, 0, 0, 1)
INSERT [dbo].[ProgramSemesterCourse] ([ProgramSemesterCourseId], [ProgramSemesterId], [CourseId], [EndDate], [IsAcademic], [IsMandatory], [IsTechnicalElective], [IsGeneralElective]) VALUES (129, 24, 1, NULL, 1, 1, 0, 0)
INSERT [dbo].[ProgramSemesterCourse] ([ProgramSemesterCourseId], [ProgramSemesterId], [CourseId], [EndDate], [IsAcademic], [IsMandatory], [IsTechnicalElective], [IsGeneralElective]) VALUES (130, 24, 3, NULL, 1, 1, 0, 0)
INSERT [dbo].[ProgramSemesterCourse] ([ProgramSemesterCourseId], [ProgramSemesterId], [CourseId], [EndDate], [IsAcademic], [IsMandatory], [IsTechnicalElective], [IsGeneralElective]) VALUES (131, 24, 5, NULL, 1, 1, 0, 0)
INSERT [dbo].[ProgramSemesterCourse] ([ProgramSemesterCourseId], [ProgramSemesterId], [CourseId], [EndDate], [IsAcademic], [IsMandatory], [IsTechnicalElective], [IsGeneralElective]) VALUES (132, 24, 7, NULL, 1, 1, 0, 0)
INSERT [dbo].[ProgramSemesterCourse] ([ProgramSemesterCourseId], [ProgramSemesterId], [CourseId], [EndDate], [IsAcademic], [IsMandatory], [IsTechnicalElective], [IsGeneralElective]) VALUES (133, 24, 8, NULL, 1, 1, 0, 0)
INSERT [dbo].[ProgramSemesterCourse] ([ProgramSemesterCourseId], [ProgramSemesterId], [CourseId], [EndDate], [IsAcademic], [IsMandatory], [IsTechnicalElective], [IsGeneralElective]) VALUES (134, 25, 2, NULL, 1, 1, 0, 0)
INSERT [dbo].[ProgramSemesterCourse] ([ProgramSemesterCourseId], [ProgramSemesterId], [CourseId], [EndDate], [IsAcademic], [IsMandatory], [IsTechnicalElective], [IsGeneralElective]) VALUES (135, 25, 11, NULL, 1, 1, 0, 0)
INSERT [dbo].[ProgramSemesterCourse] ([ProgramSemesterCourseId], [ProgramSemesterId], [CourseId], [EndDate], [IsAcademic], [IsMandatory], [IsTechnicalElective], [IsGeneralElective]) VALUES (136, 25, 12, NULL, 1, 1, 0, 0)
INSERT [dbo].[ProgramSemesterCourse] ([ProgramSemesterCourseId], [ProgramSemesterId], [CourseId], [EndDate], [IsAcademic], [IsMandatory], [IsTechnicalElective], [IsGeneralElective]) VALUES (137, 25, 16, NULL, 1, 1, 0, 0)
INSERT [dbo].[ProgramSemesterCourse] ([ProgramSemesterCourseId], [ProgramSemesterId], [CourseId], [EndDate], [IsAcademic], [IsMandatory], [IsTechnicalElective], [IsGeneralElective]) VALUES (138, 25, 18, NULL, 1, 1, 0, 0)
INSERT [dbo].[ProgramSemesterCourse] ([ProgramSemesterCourseId], [ProgramSemesterId], [CourseId], [EndDate], [IsAcademic], [IsMandatory], [IsTechnicalElective], [IsGeneralElective]) VALUES (139, 26, 19, NULL, 1, 1, 0, 0)
INSERT [dbo].[ProgramSemesterCourse] ([ProgramSemesterCourseId], [ProgramSemesterId], [CourseId], [EndDate], [IsAcademic], [IsMandatory], [IsTechnicalElective], [IsGeneralElective]) VALUES (140, 26, 21, NULL, 1, 1, 0, 0)
INSERT [dbo].[ProgramSemesterCourse] ([ProgramSemesterCourseId], [ProgramSemesterId], [CourseId], [EndDate], [IsAcademic], [IsMandatory], [IsTechnicalElective], [IsGeneralElective]) VALUES (141, 26, 23, NULL, 1, 1, 0, 0)
INSERT [dbo].[ProgramSemesterCourse] ([ProgramSemesterCourseId], [ProgramSemesterId], [CourseId], [EndDate], [IsAcademic], [IsMandatory], [IsTechnicalElective], [IsGeneralElective]) VALUES (142, 26, 26, NULL, 1, 1, 0, 0)
INSERT [dbo].[ProgramSemesterCourse] ([ProgramSemesterCourseId], [ProgramSemesterId], [CourseId], [EndDate], [IsAcademic], [IsMandatory], [IsTechnicalElective], [IsGeneralElective]) VALUES (143, 27, 27, NULL, 1, 1, 0, 0)
INSERT [dbo].[ProgramSemesterCourse] ([ProgramSemesterCourseId], [ProgramSemesterId], [CourseId], [EndDate], [IsAcademic], [IsMandatory], [IsTechnicalElective], [IsGeneralElective]) VALUES (144, 27, 29, NULL, 1, 1, 0, 0)
INSERT [dbo].[ProgramSemesterCourse] ([ProgramSemesterCourseId], [ProgramSemesterId], [CourseId], [EndDate], [IsAcademic], [IsMandatory], [IsTechnicalElective], [IsGeneralElective]) VALUES (145, 27, 30, NULL, 1, 1, 0, 0)
INSERT [dbo].[ProgramSemesterCourse] ([ProgramSemesterCourseId], [ProgramSemesterId], [CourseId], [EndDate], [IsAcademic], [IsMandatory], [IsTechnicalElective], [IsGeneralElective]) VALUES (146, 27, 31, NULL, 1, 1, 0, 0)
INSERT [dbo].[ProgramSemesterCourse] ([ProgramSemesterCourseId], [ProgramSemesterId], [CourseId], [EndDate], [IsAcademic], [IsMandatory], [IsTechnicalElective], [IsGeneralElective]) VALUES (147, 28, 32, NULL, 1, 1, 0, 0)
INSERT [dbo].[ProgramSemesterCourse] ([ProgramSemesterCourseId], [ProgramSemesterId], [CourseId], [EndDate], [IsAcademic], [IsMandatory], [IsTechnicalElective], [IsGeneralElective]) VALUES (148, 28, 34, NULL, 1, 1, 0, 0)
INSERT [dbo].[ProgramSemesterCourse] ([ProgramSemesterCourseId], [ProgramSemesterId], [CourseId], [EndDate], [IsAcademic], [IsMandatory], [IsTechnicalElective], [IsGeneralElective]) VALUES (149, 28, 35, NULL, 1, 1, 0, 0)
INSERT [dbo].[ProgramSemesterCourse] ([ProgramSemesterCourseId], [ProgramSemesterId], [CourseId], [EndDate], [IsAcademic], [IsMandatory], [IsTechnicalElective], [IsGeneralElective]) VALUES (150, 29, 36, NULL, 1, 1, 0, 0)
INSERT [dbo].[ProgramSemesterCourse] ([ProgramSemesterCourseId], [ProgramSemesterId], [CourseId], [EndDate], [IsAcademic], [IsMandatory], [IsTechnicalElective], [IsGeneralElective]) VALUES (151, 29, 37, NULL, 1, 1, 0, 0)
INSERT [dbo].[ProgramSemesterCourse] ([ProgramSemesterCourseId], [ProgramSemesterId], [CourseId], [EndDate], [IsAcademic], [IsMandatory], [IsTechnicalElective], [IsGeneralElective]) VALUES (152, 29, 38, NULL, 1, 1, 0, 0)
INSERT [dbo].[ProgramSemesterCourse] ([ProgramSemesterCourseId], [ProgramSemesterId], [CourseId], [EndDate], [IsAcademic], [IsMandatory], [IsTechnicalElective], [IsGeneralElective]) VALUES (153, 29, 39, NULL, 1, 1, 0, 0)
INSERT [dbo].[ProgramSemesterCourse] ([ProgramSemesterCourseId], [ProgramSemesterId], [CourseId], [EndDate], [IsAcademic], [IsMandatory], [IsTechnicalElective], [IsGeneralElective]) VALUES (154, 29, 40, NULL, 1, 1, 0, 0)
INSERT [dbo].[ProgramSemesterCourse] ([ProgramSemesterCourseId], [ProgramSemesterId], [CourseId], [EndDate], [IsAcademic], [IsMandatory], [IsTechnicalElective], [IsGeneralElective]) VALUES (155, 28, 24, NULL, 1, 0, 0, 1)
INSERT [dbo].[ProgramSemesterCourse] ([ProgramSemesterCourseId], [ProgramSemesterId], [CourseId], [EndDate], [IsAcademic], [IsMandatory], [IsTechnicalElective], [IsGeneralElective]) VALUES (156, 30, 1, NULL, 1, 1, 0, 0)
INSERT [dbo].[ProgramSemesterCourse] ([ProgramSemesterCourseId], [ProgramSemesterId], [CourseId], [EndDate], [IsAcademic], [IsMandatory], [IsTechnicalElective], [IsGeneralElective]) VALUES (157, 30, 16, NULL, 1, 1, 0, 0)
INSERT [dbo].[ProgramSemesterCourse] ([ProgramSemesterCourseId], [ProgramSemesterId], [CourseId], [EndDate], [IsAcademic], [IsMandatory], [IsTechnicalElective], [IsGeneralElective]) VALUES (158, 30, 26, NULL, 1, 1, 0, 0)
INSERT [dbo].[ProgramSemesterCourse] ([ProgramSemesterCourseId], [ProgramSemesterId], [CourseId], [EndDate], [IsAcademic], [IsMandatory], [IsTechnicalElective], [IsGeneralElective]) VALUES (159, 30, 27, NULL, 1, 1, 0, 0)
INSERT [dbo].[ProgramSemesterCourse] ([ProgramSemesterCourseId], [ProgramSemesterId], [CourseId], [EndDate], [IsAcademic], [IsMandatory], [IsTechnicalElective], [IsGeneralElective]) VALUES (160, 30, 29, NULL, 1, 1, 0, 0)
INSERT [dbo].[ProgramSemesterCourse] ([ProgramSemesterCourseId], [ProgramSemesterId], [CourseId], [EndDate], [IsAcademic], [IsMandatory], [IsTechnicalElective], [IsGeneralElective]) VALUES (161, 30, 30, NULL, 1, 1, 0, 0)
INSERT [dbo].[ProgramSemesterCourse] ([ProgramSemesterCourseId], [ProgramSemesterId], [CourseId], [EndDate], [IsAcademic], [IsMandatory], [IsTechnicalElective], [IsGeneralElective]) VALUES (162, 30, 31, NULL, 1, 1, 0, 0)
INSERT [dbo].[ProgramSemesterCourse] ([ProgramSemesterCourseId], [ProgramSemesterId], [CourseId], [EndDate], [IsAcademic], [IsMandatory], [IsTechnicalElective], [IsGeneralElective]) VALUES (163, 31, 32, NULL, 1, 1, 0, 0)
INSERT [dbo].[ProgramSemesterCourse] ([ProgramSemesterCourseId], [ProgramSemesterId], [CourseId], [EndDate], [IsAcademic], [IsMandatory], [IsTechnicalElective], [IsGeneralElective]) VALUES (164, 31, 34, NULL, 1, 1, 0, 0)
INSERT [dbo].[ProgramSemesterCourse] ([ProgramSemesterCourseId], [ProgramSemesterId], [CourseId], [EndDate], [IsAcademic], [IsMandatory], [IsTechnicalElective], [IsGeneralElective]) VALUES (165, 31, 36, NULL, 1, 1, 0, 0)
INSERT [dbo].[ProgramSemesterCourse] ([ProgramSemesterCourseId], [ProgramSemesterId], [CourseId], [EndDate], [IsAcademic], [IsMandatory], [IsTechnicalElective], [IsGeneralElective]) VALUES (166, 31, 37, NULL, 1, 1, 0, 0)
INSERT [dbo].[ProgramSemesterCourse] ([ProgramSemesterCourseId], [ProgramSemesterId], [CourseId], [EndDate], [IsAcademic], [IsMandatory], [IsTechnicalElective], [IsGeneralElective]) VALUES (167, 31, 38, NULL, 1, 1, 0, 0)
INSERT [dbo].[ProgramSemesterCourse] ([ProgramSemesterCourseId], [ProgramSemesterId], [CourseId], [EndDate], [IsAcademic], [IsMandatory], [IsTechnicalElective], [IsGeneralElective]) VALUES (168, 31, 39, NULL, 1, 1, 0, 0)
INSERT [dbo].[ProgramSemesterCourse] ([ProgramSemesterCourseId], [ProgramSemesterId], [CourseId], [EndDate], [IsAcademic], [IsMandatory], [IsTechnicalElective], [IsGeneralElective]) VALUES (169, 31, 40, NULL, 1, 1, 0, 0)
INSERT [dbo].[ProgramSemesterCourse] ([ProgramSemesterCourseId], [ProgramSemesterId], [CourseId], [EndDate], [IsAcademic], [IsMandatory], [IsTechnicalElective], [IsGeneralElective]) VALUES (170, 28, 46, NULL, 1, 1, 0, 0)
INSERT [dbo].[ProgramSemesterCourse] ([ProgramSemesterCourseId], [ProgramSemesterId], [CourseId], [EndDate], [IsAcademic], [IsMandatory], [IsTechnicalElective], [IsGeneralElective]) VALUES (171, 30, 24, NULL, 1, 0, 0, 1)
SET IDENTITY_INSERT [dbo].[ProgramSemesterCourse] OFF
SET IDENTITY_INSERT [dbo].[Registration] ON 

INSERT [dbo].[Registration] ([RegistrationId], [DatePaymentMade], [DateRefundIssued], [DateRegistrationCancelled], [TermId], [StudentProgramId], [Invoice]) VALUES (28, NULL, NULL, NULL, 3, 19, N'{"isFullTime":false,"registrationFee":100.0,"tuition":[{"courseCode":"COMP100","fee":800.0},{"courseCode":"COMM170","fee":600.0},{"courseCode":"GNED500","fee":600.0}],"total":2100.0}')
INSERT [dbo].[Registration] ([RegistrationId], [DatePaymentMade], [DateRefundIssued], [DateRegistrationCancelled], [TermId], [StudentProgramId], [Invoice]) VALUES (29, NULL, NULL, NULL, 4, 19, N'{"isFullTime":true,"registrationFee":200.0,"tuition":[{"courseCode":"COMP123","fee":800.0},{"courseCode":"GNED219","fee":600.0},{"courseCode":"COMP125","fee":800.0},{"courseCode":"COMP229","fee":800.0}],"total":3200.0}')
INSERT [dbo].[Registration] ([RegistrationId], [DatePaymentMade], [DateRefundIssued], [DateRegistrationCancelled], [TermId], [StudentProgramId], [Invoice]) VALUES (30, NULL, NULL, CAST(N'2017-01-12T11:44:28.223' AS DateTime), 13, 19, N'{"isFullTime":false,"registrationFee":100.0,"tuition":[],"total":100.0}')
INSERT [dbo].[Registration] ([RegistrationId], [DatePaymentMade], [DateRefundIssued], [DateRegistrationCancelled], [TermId], [StudentProgramId], [Invoice]) VALUES (31, NULL, NULL, NULL, 13, 20, N'{"isFullTime":false,"registrationFee":100.0,"tuition":[{"courseCode":"MATH128","fee":800.0},{"courseCode":"INTL220","fee":800.0},{"courseCode":"BUSN331","fee":800.0}],"total":2500.0}')
SET IDENTITY_INSERT [dbo].[Registration] OFF
SET IDENTITY_INSERT [dbo].[Room] ON 

INSERT [dbo].[Room] ([RoomId], [RoomCapacity], [RoomNum], [Building], [CampusCode]) VALUES (1, 40, N'3-13', N'A', N'PR')
INSERT [dbo].[Room] ([RoomId], [RoomCapacity], [RoomNum], [Building], [CampusCode]) VALUES (2, 40, N'3-17', N'A', N'PR')
INSERT [dbo].[Room] ([RoomId], [RoomCapacity], [RoomNum], [Building], [CampusCode]) VALUES (3, 40, N'3-11', N'A', N'PR')
INSERT [dbo].[Room] ([RoomId], [RoomCapacity], [RoomNum], [Building], [CampusCode]) VALUES (4, 40, N'3-15', N'A', N'PR')
INSERT [dbo].[Room] ([RoomId], [RoomCapacity], [RoomNum], [Building], [CampusCode]) VALUES (5, 60, N'3-21', N'B', N'PR')
INSERT [dbo].[Room] ([RoomId], [RoomCapacity], [RoomNum], [Building], [CampusCode]) VALUES (6, 45, N'3-15', N'B', N'PR')
INSERT [dbo].[Room] ([RoomId], [RoomCapacity], [RoomNum], [Building], [CampusCode]) VALUES (7, 40, N'1-21', N'C', N'PR')
INSERT [dbo].[Room] ([RoomId], [RoomCapacity], [RoomNum], [Building], [CampusCode]) VALUES (8, 45, N'1-23', N'C', N'PR')
INSERT [dbo].[Room] ([RoomId], [RoomCapacity], [RoomNum], [Building], [CampusCode]) VALUES (9, 50, N'2-17', N'L', N'PR')
INSERT [dbo].[Room] ([RoomId], [RoomCapacity], [RoomNum], [Building], [CampusCode]) VALUES (10, 45, N'1-10', N'E', N'PR')
SET IDENTITY_INSERT [dbo].[Room] OFF
SET IDENTITY_INSERT [dbo].[Section] ON 

INSERT [dbo].[Section] ([SectionId], [TermCourseId], [SectionNum]) VALUES (1, 1, N'061')
INSERT [dbo].[Section] ([SectionId], [TermCourseId], [SectionNum]) VALUES (2, 1, N'062')
INSERT [dbo].[Section] ([SectionId], [TermCourseId], [SectionNum]) VALUES (3, 1, N'085')
INSERT [dbo].[Section] ([SectionId], [TermCourseId], [SectionNum]) VALUES (4, 2, N'001')
INSERT [dbo].[Section] ([SectionId], [TermCourseId], [SectionNum]) VALUES (5, 3, N'061')
INSERT [dbo].[Section] ([SectionId], [TermCourseId], [SectionNum]) VALUES (6, 4, N'062')
INSERT [dbo].[Section] ([SectionId], [TermCourseId], [SectionNum]) VALUES (7, 5, N'001')
INSERT [dbo].[Section] ([SectionId], [TermCourseId], [SectionNum]) VALUES (8, 6, N'061')
INSERT [dbo].[Section] ([SectionId], [TermCourseId], [SectionNum]) VALUES (9, 6, N'062')
INSERT [dbo].[Section] ([SectionId], [TermCourseId], [SectionNum]) VALUES (10, 7, N'001')
INSERT [dbo].[Section] ([SectionId], [TermCourseId], [SectionNum]) VALUES (11, 8, N'061')
INSERT [dbo].[Section] ([SectionId], [TermCourseId], [SectionNum]) VALUES (12, 9, N'062')
INSERT [dbo].[Section] ([SectionId], [TermCourseId], [SectionNum]) VALUES (13, 10, N'001')
INSERT [dbo].[Section] ([SectionId], [TermCourseId], [SectionNum]) VALUES (14, 11, N'061')
INSERT [dbo].[Section] ([SectionId], [TermCourseId], [SectionNum]) VALUES (15, 11, N'062')
INSERT [dbo].[Section] ([SectionId], [TermCourseId], [SectionNum]) VALUES (16, 12, N'001')
INSERT [dbo].[Section] ([SectionId], [TermCourseId], [SectionNum]) VALUES (17, 13, N'061')
INSERT [dbo].[Section] ([SectionId], [TermCourseId], [SectionNum]) VALUES (18, 13, N'062')
INSERT [dbo].[Section] ([SectionId], [TermCourseId], [SectionNum]) VALUES (19, 14, N'001')
INSERT [dbo].[Section] ([SectionId], [TermCourseId], [SectionNum]) VALUES (20, 15, N'001')
INSERT [dbo].[Section] ([SectionId], [TermCourseId], [SectionNum]) VALUES (21, 16, N'061')
INSERT [dbo].[Section] ([SectionId], [TermCourseId], [SectionNum]) VALUES (22, 17, N'001')
INSERT [dbo].[Section] ([SectionId], [TermCourseId], [SectionNum]) VALUES (23, 18, N'001')
INSERT [dbo].[Section] ([SectionId], [TermCourseId], [SectionNum]) VALUES (24, 19, N'001')
INSERT [dbo].[Section] ([SectionId], [TermCourseId], [SectionNum]) VALUES (25, 20, N'001')
INSERT [dbo].[Section] ([SectionId], [TermCourseId], [SectionNum]) VALUES (26, 21, N'001')
INSERT [dbo].[Section] ([SectionId], [TermCourseId], [SectionNum]) VALUES (27, 22, N'001')
INSERT [dbo].[Section] ([SectionId], [TermCourseId], [SectionNum]) VALUES (28, 23, N'001')
INSERT [dbo].[Section] ([SectionId], [TermCourseId], [SectionNum]) VALUES (29, 24, N'001')
INSERT [dbo].[Section] ([SectionId], [TermCourseId], [SectionNum]) VALUES (30, 25, N'001')
INSERT [dbo].[Section] ([SectionId], [TermCourseId], [SectionNum]) VALUES (31, 25, N'002')
INSERT [dbo].[Section] ([SectionId], [TermCourseId], [SectionNum]) VALUES (32, 26, N'001')
INSERT [dbo].[Section] ([SectionId], [TermCourseId], [SectionNum]) VALUES (33, 27, N'001')
INSERT [dbo].[Section] ([SectionId], [TermCourseId], [SectionNum]) VALUES (34, 28, N'061')
INSERT [dbo].[Section] ([SectionId], [TermCourseId], [SectionNum]) VALUES (35, 29, N'001')
INSERT [dbo].[Section] ([SectionId], [TermCourseId], [SectionNum]) VALUES (36, 30, N'001')
INSERT [dbo].[Section] ([SectionId], [TermCourseId], [SectionNum]) VALUES (37, 31, N'001')
INSERT [dbo].[Section] ([SectionId], [TermCourseId], [SectionNum]) VALUES (38, 32, N'001')
INSERT [dbo].[Section] ([SectionId], [TermCourseId], [SectionNum]) VALUES (39, 33, N'001')
INSERT [dbo].[Section] ([SectionId], [TermCourseId], [SectionNum]) VALUES (40, 34, N'001')
INSERT [dbo].[Section] ([SectionId], [TermCourseId], [SectionNum]) VALUES (41, 35, N'001')
INSERT [dbo].[Section] ([SectionId], [TermCourseId], [SectionNum]) VALUES (42, 36, N'001')
INSERT [dbo].[Section] ([SectionId], [TermCourseId], [SectionNum]) VALUES (43, 37, N'001')
INSERT [dbo].[Section] ([SectionId], [TermCourseId], [SectionNum]) VALUES (44, 38, N'001')
INSERT [dbo].[Section] ([SectionId], [TermCourseId], [SectionNum]) VALUES (45, 39, N'001')
INSERT [dbo].[Section] ([SectionId], [TermCourseId], [SectionNum]) VALUES (46, 40, N'001')
INSERT [dbo].[Section] ([SectionId], [TermCourseId], [SectionNum]) VALUES (47, 41, N'001')
INSERT [dbo].[Section] ([SectionId], [TermCourseId], [SectionNum]) VALUES (48, 42, N'001')
INSERT [dbo].[Section] ([SectionId], [TermCourseId], [SectionNum]) VALUES (49, 43, N'001')
INSERT [dbo].[Section] ([SectionId], [TermCourseId], [SectionNum]) VALUES (50, 44, N'001')
INSERT [dbo].[Section] ([SectionId], [TermCourseId], [SectionNum]) VALUES (51, 45, N'001')
INSERT [dbo].[Section] ([SectionId], [TermCourseId], [SectionNum]) VALUES (52, 46, N'001')
INSERT [dbo].[Section] ([SectionId], [TermCourseId], [SectionNum]) VALUES (53, 47, N'001')
INSERT [dbo].[Section] ([SectionId], [TermCourseId], [SectionNum]) VALUES (54, 48, N'001')
INSERT [dbo].[Section] ([SectionId], [TermCourseId], [SectionNum]) VALUES (55, 49, N'001')
INSERT [dbo].[Section] ([SectionId], [TermCourseId], [SectionNum]) VALUES (57, 51, N'001')
INSERT [dbo].[Section] ([SectionId], [TermCourseId], [SectionNum]) VALUES (58, 52, N'001')
INSERT [dbo].[Section] ([SectionId], [TermCourseId], [SectionNum]) VALUES (59, 53, N'001')
INSERT [dbo].[Section] ([SectionId], [TermCourseId], [SectionNum]) VALUES (60, 54, N'001')
INSERT [dbo].[Section] ([SectionId], [TermCourseId], [SectionNum]) VALUES (61, 55, N'001')
INSERT [dbo].[Section] ([SectionId], [TermCourseId], [SectionNum]) VALUES (62, 56, N'001')
INSERT [dbo].[Section] ([SectionId], [TermCourseId], [SectionNum]) VALUES (63, 57, N'001')
INSERT [dbo].[Section] ([SectionId], [TermCourseId], [SectionNum]) VALUES (64, 58, N'001')
INSERT [dbo].[Section] ([SectionId], [TermCourseId], [SectionNum]) VALUES (65, 59, N'001')
INSERT [dbo].[Section] ([SectionId], [TermCourseId], [SectionNum]) VALUES (66, 60, N'001')
INSERT [dbo].[Section] ([SectionId], [TermCourseId], [SectionNum]) VALUES (67, 61, N'001')
INSERT [dbo].[Section] ([SectionId], [TermCourseId], [SectionNum]) VALUES (68, 62, N'001')
INSERT [dbo].[Section] ([SectionId], [TermCourseId], [SectionNum]) VALUES (69, 63, N'001')
INSERT [dbo].[Section] ([SectionId], [TermCourseId], [SectionNum]) VALUES (70, 64, N'001')
INSERT [dbo].[Section] ([SectionId], [TermCourseId], [SectionNum]) VALUES (71, 65, N'001')
INSERT [dbo].[Section] ([SectionId], [TermCourseId], [SectionNum]) VALUES (72, 66, N'001')
INSERT [dbo].[Section] ([SectionId], [TermCourseId], [SectionNum]) VALUES (73, 67, N'001')
INSERT [dbo].[Section] ([SectionId], [TermCourseId], [SectionNum]) VALUES (74, 68, N'001')
INSERT [dbo].[Section] ([SectionId], [TermCourseId], [SectionNum]) VALUES (75, 69, N'001')
INSERT [dbo].[Section] ([SectionId], [TermCourseId], [SectionNum]) VALUES (76, 70, N'001')
INSERT [dbo].[Section] ([SectionId], [TermCourseId], [SectionNum]) VALUES (77, 71, N'001')
INSERT [dbo].[Section] ([SectionId], [TermCourseId], [SectionNum]) VALUES (78, 72, N'001')
INSERT [dbo].[Section] ([SectionId], [TermCourseId], [SectionNum]) VALUES (79, 73, N'001')
INSERT [dbo].[Section] ([SectionId], [TermCourseId], [SectionNum]) VALUES (80, 74, N'001')
INSERT [dbo].[Section] ([SectionId], [TermCourseId], [SectionNum]) VALUES (82, 76, N'001')
INSERT [dbo].[Section] ([SectionId], [TermCourseId], [SectionNum]) VALUES (83, 77, N'001')
INSERT [dbo].[Section] ([SectionId], [TermCourseId], [SectionNum]) VALUES (85, 79, N'001')
INSERT [dbo].[Section] ([SectionId], [TermCourseId], [SectionNum]) VALUES (86, 38, N'002')
INSERT [dbo].[Section] ([SectionId], [TermCourseId], [SectionNum]) VALUES (87, 79, N'060')
INSERT [dbo].[Section] ([SectionId], [TermCourseId], [SectionNum]) VALUES (89, 42, N'002')
INSERT [dbo].[Section] ([SectionId], [TermCourseId], [SectionNum]) VALUES (91, 50, N'061')
INSERT [dbo].[Section] ([SectionId], [TermCourseId], [SectionNum]) VALUES (92, 53, N'002')
INSERT [dbo].[Section] ([SectionId], [TermCourseId], [SectionNum]) VALUES (93, 1080, N'061')
INSERT [dbo].[Section] ([SectionId], [TermCourseId], [SectionNum]) VALUES (94, 1081, N'001')
INSERT [dbo].[Section] ([SectionId], [TermCourseId], [SectionNum]) VALUES (95, 172, N'061')
INSERT [dbo].[Section] ([SectionId], [TermCourseId], [SectionNum]) VALUES (96, 170, N'001')
INSERT [dbo].[Section] ([SectionId], [TermCourseId], [SectionNum]) VALUES (97, 187, N'001')
INSERT [dbo].[Section] ([SectionId], [TermCourseId], [SectionNum]) VALUES (98, 1082, N'001')
INSERT [dbo].[Section] ([SectionId], [TermCourseId], [SectionNum]) VALUES (99, 182, N'001')
INSERT [dbo].[Section] ([SectionId], [TermCourseId], [SectionNum]) VALUES (100, 186, N'085')
INSERT [dbo].[Section] ([SectionId], [TermCourseId], [SectionNum]) VALUES (101, 183, N'001')
INSERT [dbo].[Section] ([SectionId], [TermCourseId], [SectionNum]) VALUES (102, 45, N'002')
INSERT [dbo].[Section] ([SectionId], [TermCourseId], [SectionNum]) VALUES (103, 45, N'003')
INSERT [dbo].[Section] ([SectionId], [TermCourseId], [SectionNum]) VALUES (104, 46, N'002')
GO
INSERT [dbo].[Section] ([SectionId], [TermCourseId], [SectionNum]) VALUES (105, 46, N'003')
INSERT [dbo].[Section] ([SectionId], [TermCourseId], [SectionNum]) VALUES (106, 63, N'002')
INSERT [dbo].[Section] ([SectionId], [TermCourseId], [SectionNum]) VALUES (107, 1083, N'001')
INSERT [dbo].[Section] ([SectionId], [TermCourseId], [SectionNum]) VALUES (108, 1084, N'001')
INSERT [dbo].[Section] ([SectionId], [TermCourseId], [SectionNum]) VALUES (109, 1088, N'060')
INSERT [dbo].[Section] ([SectionId], [TermCourseId], [SectionNum]) VALUES (110, 1091, N'001')
INSERT [dbo].[Section] ([SectionId], [TermCourseId], [SectionNum]) VALUES (111, 1094, N'001')
INSERT [dbo].[Section] ([SectionId], [TermCourseId], [SectionNum]) VALUES (112, 1102, N'001')
INSERT [dbo].[Section] ([SectionId], [TermCourseId], [SectionNum]) VALUES (113, 1112, N'001')
SET IDENTITY_INSERT [dbo].[Section] OFF
INSERT [dbo].[Student] ([StudentId], [StudentNum], [StudentLastName], [StudentFirstMidName], [StudentEmail], [StudentHasHolds], [StudentAcademicStanding], [StudentCanRegister], [StudentTranscript], [StudentStartDate]) VALUES (1023, N'333333333', N'Adams', N'Amy', N'aadams', 0, 1, 1, N'{"studentNumber":"333333333","studentName":"Amy Adams","history":[{"degreeSought":"Diploma","degreeDate":null,"campus":"Progress","department":"Business","program":"Business","records":[{"level":"PS","institution":{"totals":{"attemptHours":25.0,"passedHours":25.0,"earnedHours":25.0,"gpaHours":25.0,"qualityPoints":89.0,"gpa":3.56},"terms":[{"term":"2013 Fall","academicStanding":"In good academic standing.","courses":[{"subject":"COMP","course":"100","level":"PS","title":"Programming 1","gradeNumeric":89.0,"gradeLetter":"A","creditHours":4.0,"qualityPoints":16.0,"r":null},{"subject":"COMM","course":"170","level":"PS","title":"College Communications 2","gradeNumeric":50.0,"gradeLetter":"D-","creditHours":3.0,"qualityPoints":3.0,"r":null},{"subject":"GNED","course":"500","level":"PS","title":"Global Citizenship","gradeNumeric":87.0,"gradeLetter":"A","creditHours":3.0,"qualityPoints":12.0,"r":null}],"currentTerm":{"totals":{"attemptHours":10.0,"passedHours":10.0,"earnedHours":10.0,"gpaHours":10.0,"qualityPoints":31.0,"gpa":3.1}},"cumulative":{"totals":{"attemptHours":10.0,"passedHours":10.0,"earnedHours":10.0,"gpaHours":10.0,"qualityPoints":31.0,"gpa":3.1}}},{"term":"2014 Winter","academicStanding":"In good academic standing.","courses":[{"subject":"COMP","course":"123","level":"PS","title":"Programming 2","gradeNumeric":90.0,"gradeLetter":"A+","creditHours":4.0,"qualityPoints":18.0,"r":null},{"subject":"GNED","course":"219","level":"PS","title":"The Canadian Workplace Experience","gradeNumeric":66.0,"gradeLetter":"C","creditHours":3.0,"qualityPoints":6.0,"r":null},{"subject":"COMP","course":"125","level":"PS","title":"Client-Side Web Development","gradeNumeric":84.0,"gradeLetter":"A-","creditHours":4.0,"qualityPoints":16.0,"r":null},{"subject":"COMP","course":"229","level":"PS","title":"Web Application Development","gradeNumeric":93.0,"gradeLetter":"A+","creditHours":4.0,"qualityPoints":18.0,"r":null}],"currentTerm":{"totals":{"attemptHours":15.0,"passedHours":15.0,"earnedHours":15.0,"gpaHours":15.0,"qualityPoints":58.0,"gpa":3.8666666666666667}},"cumulative":{"totals":{"attemptHours":25.0,"passedHours":25.0,"earnedHours":25.0,"gpaHours":25.0,"qualityPoints":89.0,"gpa":3.56}}},{"term":"2017 Winter","academicStanding":null,"courses":[{"subject":"MATH","course":"128","level":"PS","title":"Mathematics of Finance I - E","gradeNumeric":null,"gradeLetter":null,"creditHours":4.0,"qualityPoints":null,"r":null},{"subject":"INTL","course":"220","level":"PS","title":"International Business Concepts","gradeNumeric":null,"gradeLetter":null,"creditHours":4.0,"qualityPoints":null,"r":null},{"subject":"BUSN","course":"331","level":"PS","title":"Business Law","gradeNumeric":null,"gradeLetter":null,"creditHours":4.0,"qualityPoints":null,"r":null}],"currentTerm":null,"cumulative":null}]},"transfer":{"totals":{"attemptHours":3.0,"passedHours":3.0,"earnedHours":3.0,"gpaHours":0.0,"qualityPoints":0.0,"gpa":0.0},"schools":[{"school":"York University","courses":[{"subject":"MATH","course":"175","level":"PS","title":"Functions and Number Systems","gradeNumeric":null,"gradeLetter":"A","creditHours":3.0,"qualityPoints":0.0,"r":""}]}]}}]}]}', CAST(N'2013-08-20T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[StudentProgram] ON 

INSERT [dbo].[StudentProgram] ([StudentProgramId], [StudentId], [ProgramId], [StartDate], [EndDate], [CurrentSemester]) VALUES (19, 1023, 1, CAST(N'2017-01-12T11:02:36.053' AS DateTime), CAST(N'2017-01-12T11:44:28.223' AS DateTime), 1)
INSERT [dbo].[StudentProgram] ([StudentProgramId], [StudentId], [ProgramId], [StartDate], [EndDate], [CurrentSemester]) VALUES (20, 1023, 3, CAST(N'2017-01-12T11:44:28.223' AS DateTime), NULL, 1)
SET IDENTITY_INSERT [dbo].[StudentProgram] OFF
SET IDENTITY_INSERT [dbo].[Term] ON 

INSERT [dbo].[Term] ([TermId], [TermStartDate], [TermEndDate], [TermName]) VALUES (1, CAST(N'2013-01-01' AS Date), CAST(N'2013-04-30' AS Date), N'2013 Winter')
INSERT [dbo].[Term] ([TermId], [TermStartDate], [TermEndDate], [TermName]) VALUES (2, CAST(N'2013-05-01' AS Date), CAST(N'2013-08-31' AS Date), N'2013 Summer')
INSERT [dbo].[Term] ([TermId], [TermStartDate], [TermEndDate], [TermName]) VALUES (3, CAST(N'2013-09-01' AS Date), CAST(N'2013-12-31' AS Date), N'2013 Fall')
INSERT [dbo].[Term] ([TermId], [TermStartDate], [TermEndDate], [TermName]) VALUES (4, CAST(N'2014-01-01' AS Date), CAST(N'2014-04-30' AS Date), N'2014 Winter')
INSERT [dbo].[Term] ([TermId], [TermStartDate], [TermEndDate], [TermName]) VALUES (5, CAST(N'2014-05-01' AS Date), CAST(N'2014-08-31' AS Date), N'2014 Summer')
INSERT [dbo].[Term] ([TermId], [TermStartDate], [TermEndDate], [TermName]) VALUES (6, CAST(N'2014-09-01' AS Date), CAST(N'2014-12-31' AS Date), N'2014 Fall')
INSERT [dbo].[Term] ([TermId], [TermStartDate], [TermEndDate], [TermName]) VALUES (7, CAST(N'2015-01-01' AS Date), CAST(N'2015-04-30' AS Date), N'2015 Winter')
INSERT [dbo].[Term] ([TermId], [TermStartDate], [TermEndDate], [TermName]) VALUES (8, CAST(N'2015-05-01' AS Date), CAST(N'2015-08-31' AS Date), N'2015 Summer')
INSERT [dbo].[Term] ([TermId], [TermStartDate], [TermEndDate], [TermName]) VALUES (9, CAST(N'2015-09-01' AS Date), CAST(N'2015-12-31' AS Date), N'2015 Fall')
INSERT [dbo].[Term] ([TermId], [TermStartDate], [TermEndDate], [TermName]) VALUES (10, CAST(N'2016-01-01' AS Date), CAST(N'2016-04-30' AS Date), N'2016 Winter')
INSERT [dbo].[Term] ([TermId], [TermStartDate], [TermEndDate], [TermName]) VALUES (11, CAST(N'2016-05-01' AS Date), CAST(N'2016-08-31' AS Date), N'2016 Summer')
INSERT [dbo].[Term] ([TermId], [TermStartDate], [TermEndDate], [TermName]) VALUES (12, CAST(N'2016-09-01' AS Date), CAST(N'2016-12-31' AS Date), N'2016 Fall')
INSERT [dbo].[Term] ([TermId], [TermStartDate], [TermEndDate], [TermName]) VALUES (13, CAST(N'2017-01-01' AS Date), CAST(N'2017-04-30' AS Date), N'2017 Winter')
INSERT [dbo].[Term] ([TermId], [TermStartDate], [TermEndDate], [TermName]) VALUES (14, CAST(N'2017-05-01' AS Date), CAST(N'2017-08-31' AS Date), N'2017 Summer')
INSERT [dbo].[Term] ([TermId], [TermStartDate], [TermEndDate], [TermName]) VALUES (15, CAST(N'2017-09-01' AS Date), CAST(N'2017-12-31' AS Date), N'2017 Fall')
SET IDENTITY_INSERT [dbo].[Term] OFF
SET IDENTITY_INSERT [dbo].[TermCourse] ON 

INSERT [dbo].[TermCourse] ([TermCourseId], [TermId], [CourseId], [TermCourseIsOffered], [TermCourseGradeAvg]) VALUES (1, 1, 2, 1, NULL)
INSERT [dbo].[TermCourse] ([TermCourseId], [TermId], [CourseId], [TermCourseIsOffered], [TermCourseGradeAvg]) VALUES (2, 1, 3, 1, NULL)
INSERT [dbo].[TermCourse] ([TermCourseId], [TermId], [CourseId], [TermCourseIsOffered], [TermCourseGradeAvg]) VALUES (3, 1, 5, 1, NULL)
INSERT [dbo].[TermCourse] ([TermCourseId], [TermId], [CourseId], [TermCourseIsOffered], [TermCourseGradeAvg]) VALUES (4, 1, 6, 1, NULL)
INSERT [dbo].[TermCourse] ([TermCourseId], [TermId], [CourseId], [TermCourseIsOffered], [TermCourseGradeAvg]) VALUES (5, 1, 7, 1, NULL)
INSERT [dbo].[TermCourse] ([TermCourseId], [TermId], [CourseId], [TermCourseIsOffered], [TermCourseGradeAvg]) VALUES (6, 1, 8, 1, NULL)
INSERT [dbo].[TermCourse] ([TermCourseId], [TermId], [CourseId], [TermCourseIsOffered], [TermCourseGradeAvg]) VALUES (7, 1, 11, 1, NULL)
INSERT [dbo].[TermCourse] ([TermCourseId], [TermId], [CourseId], [TermCourseIsOffered], [TermCourseGradeAvg]) VALUES (8, 1, 12, 1, NULL)
INSERT [dbo].[TermCourse] ([TermCourseId], [TermId], [CourseId], [TermCourseIsOffered], [TermCourseGradeAvg]) VALUES (9, 1, 14, 1, NULL)
INSERT [dbo].[TermCourse] ([TermCourseId], [TermId], [CourseId], [TermCourseIsOffered], [TermCourseGradeAvg]) VALUES (10, 1, 15, 1, NULL)
INSERT [dbo].[TermCourse] ([TermCourseId], [TermId], [CourseId], [TermCourseIsOffered], [TermCourseGradeAvg]) VALUES (11, 1, 16, 1, NULL)
INSERT [dbo].[TermCourse] ([TermCourseId], [TermId], [CourseId], [TermCourseIsOffered], [TermCourseGradeAvg]) VALUES (12, 1, 17, 1, NULL)
INSERT [dbo].[TermCourse] ([TermCourseId], [TermId], [CourseId], [TermCourseIsOffered], [TermCourseGradeAvg]) VALUES (13, 1, 18, 1, NULL)
INSERT [dbo].[TermCourse] ([TermCourseId], [TermId], [CourseId], [TermCourseIsOffered], [TermCourseGradeAvg]) VALUES (14, 1, 19, 1, NULL)
INSERT [dbo].[TermCourse] ([TermCourseId], [TermId], [CourseId], [TermCourseIsOffered], [TermCourseGradeAvg]) VALUES (15, 1, 21, 1, NULL)
INSERT [dbo].[TermCourse] ([TermCourseId], [TermId], [CourseId], [TermCourseIsOffered], [TermCourseGradeAvg]) VALUES (16, 1, 22, 1, NULL)
INSERT [dbo].[TermCourse] ([TermCourseId], [TermId], [CourseId], [TermCourseIsOffered], [TermCourseGradeAvg]) VALUES (17, 1, 23, 1, NULL)
INSERT [dbo].[TermCourse] ([TermCourseId], [TermId], [CourseId], [TermCourseIsOffered], [TermCourseGradeAvg]) VALUES (18, 1, 24, 1, NULL)
INSERT [dbo].[TermCourse] ([TermCourseId], [TermId], [CourseId], [TermCourseIsOffered], [TermCourseGradeAvg]) VALUES (19, 1, 25, 1, NULL)
INSERT [dbo].[TermCourse] ([TermCourseId], [TermId], [CourseId], [TermCourseIsOffered], [TermCourseGradeAvg]) VALUES (20, 1, 31, 1, NULL)
INSERT [dbo].[TermCourse] ([TermCourseId], [TermId], [CourseId], [TermCourseIsOffered], [TermCourseGradeAvg]) VALUES (21, 1, 32, 1, NULL)
INSERT [dbo].[TermCourse] ([TermCourseId], [TermId], [CourseId], [TermCourseIsOffered], [TermCourseGradeAvg]) VALUES (22, 1, 34, 1, NULL)
INSERT [dbo].[TermCourse] ([TermCourseId], [TermId], [CourseId], [TermCourseIsOffered], [TermCourseGradeAvg]) VALUES (23, 1, 38, 1, NULL)
INSERT [dbo].[TermCourse] ([TermCourseId], [TermId], [CourseId], [TermCourseIsOffered], [TermCourseGradeAvg]) VALUES (24, 1, 44, 1, NULL)
INSERT [dbo].[TermCourse] ([TermCourseId], [TermId], [CourseId], [TermCourseIsOffered], [TermCourseGradeAvg]) VALUES (25, 1, 45, 1, NULL)
INSERT [dbo].[TermCourse] ([TermCourseId], [TermId], [CourseId], [TermCourseIsOffered], [TermCourseGradeAvg]) VALUES (26, 1, 52, 1, NULL)
INSERT [dbo].[TermCourse] ([TermCourseId], [TermId], [CourseId], [TermCourseIsOffered], [TermCourseGradeAvg]) VALUES (27, 1, 53, 1, NULL)
INSERT [dbo].[TermCourse] ([TermCourseId], [TermId], [CourseId], [TermCourseIsOffered], [TermCourseGradeAvg]) VALUES (28, 1, 54, 1, NULL)
INSERT [dbo].[TermCourse] ([TermCourseId], [TermId], [CourseId], [TermCourseIsOffered], [TermCourseGradeAvg]) VALUES (29, 2, 2, 1, NULL)
INSERT [dbo].[TermCourse] ([TermCourseId], [TermId], [CourseId], [TermCourseIsOffered], [TermCourseGradeAvg]) VALUES (30, 2, 5, 1, NULL)
INSERT [dbo].[TermCourse] ([TermCourseId], [TermId], [CourseId], [TermCourseIsOffered], [TermCourseGradeAvg]) VALUES (31, 2, 11, 1, NULL)
INSERT [dbo].[TermCourse] ([TermCourseId], [TermId], [CourseId], [TermCourseIsOffered], [TermCourseGradeAvg]) VALUES (32, 2, 17, 1, NULL)
INSERT [dbo].[TermCourse] ([TermCourseId], [TermId], [CourseId], [TermCourseIsOffered], [TermCourseGradeAvg]) VALUES (33, 2, 18, 1, NULL)
INSERT [dbo].[TermCourse] ([TermCourseId], [TermId], [CourseId], [TermCourseIsOffered], [TermCourseGradeAvg]) VALUES (34, 2, 19, 1, NULL)
INSERT [dbo].[TermCourse] ([TermCourseId], [TermId], [CourseId], [TermCourseIsOffered], [TermCourseGradeAvg]) VALUES (35, 2, 21, 1, NULL)
INSERT [dbo].[TermCourse] ([TermCourseId], [TermId], [CourseId], [TermCourseIsOffered], [TermCourseGradeAvg]) VALUES (36, 2, 33, 1, NULL)
INSERT [dbo].[TermCourse] ([TermCourseId], [TermId], [CourseId], [TermCourseIsOffered], [TermCourseGradeAvg]) VALUES (37, 3, 23, 1, NULL)
INSERT [dbo].[TermCourse] ([TermCourseId], [TermId], [CourseId], [TermCourseIsOffered], [TermCourseGradeAvg]) VALUES (38, 3, 24, 1, NULL)
INSERT [dbo].[TermCourse] ([TermCourseId], [TermId], [CourseId], [TermCourseIsOffered], [TermCourseGradeAvg]) VALUES (39, 3, 26, 1, NULL)
INSERT [dbo].[TermCourse] ([TermCourseId], [TermId], [CourseId], [TermCourseIsOffered], [TermCourseGradeAvg]) VALUES (40, 3, 27, 1, NULL)
INSERT [dbo].[TermCourse] ([TermCourseId], [TermId], [CourseId], [TermCourseIsOffered], [TermCourseGradeAvg]) VALUES (41, 3, 29, 1, NULL)
INSERT [dbo].[TermCourse] ([TermCourseId], [TermId], [CourseId], [TermCourseIsOffered], [TermCourseGradeAvg]) VALUES (42, 13, 1, 1, NULL)
INSERT [dbo].[TermCourse] ([TermCourseId], [TermId], [CourseId], [TermCourseIsOffered], [TermCourseGradeAvg]) VALUES (43, 13, 2, 1, NULL)
INSERT [dbo].[TermCourse] ([TermCourseId], [TermId], [CourseId], [TermCourseIsOffered], [TermCourseGradeAvg]) VALUES (44, 13, 3, 1, NULL)
INSERT [dbo].[TermCourse] ([TermCourseId], [TermId], [CourseId], [TermCourseIsOffered], [TermCourseGradeAvg]) VALUES (45, 13, 5, 1, NULL)
INSERT [dbo].[TermCourse] ([TermCourseId], [TermId], [CourseId], [TermCourseIsOffered], [TermCourseGradeAvg]) VALUES (46, 13, 6, 1, NULL)
INSERT [dbo].[TermCourse] ([TermCourseId], [TermId], [CourseId], [TermCourseIsOffered], [TermCourseGradeAvg]) VALUES (47, 13, 7, 1, NULL)
INSERT [dbo].[TermCourse] ([TermCourseId], [TermId], [CourseId], [TermCourseIsOffered], [TermCourseGradeAvg]) VALUES (48, 13, 8, 1, NULL)
INSERT [dbo].[TermCourse] ([TermCourseId], [TermId], [CourseId], [TermCourseIsOffered], [TermCourseGradeAvg]) VALUES (49, 13, 11, 1, NULL)
INSERT [dbo].[TermCourse] ([TermCourseId], [TermId], [CourseId], [TermCourseIsOffered], [TermCourseGradeAvg]) VALUES (50, 13, 12, 1, NULL)
INSERT [dbo].[TermCourse] ([TermCourseId], [TermId], [CourseId], [TermCourseIsOffered], [TermCourseGradeAvg]) VALUES (51, 13, 14, 1, NULL)
INSERT [dbo].[TermCourse] ([TermCourseId], [TermId], [CourseId], [TermCourseIsOffered], [TermCourseGradeAvg]) VALUES (52, 13, 15, 1, NULL)
INSERT [dbo].[TermCourse] ([TermCourseId], [TermId], [CourseId], [TermCourseIsOffered], [TermCourseGradeAvg]) VALUES (53, 13, 16, 1, NULL)
INSERT [dbo].[TermCourse] ([TermCourseId], [TermId], [CourseId], [TermCourseIsOffered], [TermCourseGradeAvg]) VALUES (54, 13, 17, 1, NULL)
INSERT [dbo].[TermCourse] ([TermCourseId], [TermId], [CourseId], [TermCourseIsOffered], [TermCourseGradeAvg]) VALUES (55, 13, 18, 1, NULL)
INSERT [dbo].[TermCourse] ([TermCourseId], [TermId], [CourseId], [TermCourseIsOffered], [TermCourseGradeAvg]) VALUES (56, 13, 19, 1, NULL)
INSERT [dbo].[TermCourse] ([TermCourseId], [TermId], [CourseId], [TermCourseIsOffered], [TermCourseGradeAvg]) VALUES (57, 13, 21, 1, NULL)
INSERT [dbo].[TermCourse] ([TermCourseId], [TermId], [CourseId], [TermCourseIsOffered], [TermCourseGradeAvg]) VALUES (58, 13, 22, 1, NULL)
INSERT [dbo].[TermCourse] ([TermCourseId], [TermId], [CourseId], [TermCourseIsOffered], [TermCourseGradeAvg]) VALUES (59, 13, 23, 1, NULL)
INSERT [dbo].[TermCourse] ([TermCourseId], [TermId], [CourseId], [TermCourseIsOffered], [TermCourseGradeAvg]) VALUES (60, 13, 24, 1, NULL)
INSERT [dbo].[TermCourse] ([TermCourseId], [TermId], [CourseId], [TermCourseIsOffered], [TermCourseGradeAvg]) VALUES (61, 13, 25, 1, NULL)
INSERT [dbo].[TermCourse] ([TermCourseId], [TermId], [CourseId], [TermCourseIsOffered], [TermCourseGradeAvg]) VALUES (62, 13, 31, 1, NULL)
INSERT [dbo].[TermCourse] ([TermCourseId], [TermId], [CourseId], [TermCourseIsOffered], [TermCourseGradeAvg]) VALUES (63, 13, 32, 1, NULL)
INSERT [dbo].[TermCourse] ([TermCourseId], [TermId], [CourseId], [TermCourseIsOffered], [TermCourseGradeAvg]) VALUES (64, 13, 34, 1, NULL)
INSERT [dbo].[TermCourse] ([TermCourseId], [TermId], [CourseId], [TermCourseIsOffered], [TermCourseGradeAvg]) VALUES (65, 13, 38, 1, NULL)
INSERT [dbo].[TermCourse] ([TermCourseId], [TermId], [CourseId], [TermCourseIsOffered], [TermCourseGradeAvg]) VALUES (66, 13, 44, 1, NULL)
INSERT [dbo].[TermCourse] ([TermCourseId], [TermId], [CourseId], [TermCourseIsOffered], [TermCourseGradeAvg]) VALUES (67, 13, 45, 1, NULL)
INSERT [dbo].[TermCourse] ([TermCourseId], [TermId], [CourseId], [TermCourseIsOffered], [TermCourseGradeAvg]) VALUES (68, 13, 52, 1, NULL)
INSERT [dbo].[TermCourse] ([TermCourseId], [TermId], [CourseId], [TermCourseIsOffered], [TermCourseGradeAvg]) VALUES (69, 13, 53, 1, NULL)
INSERT [dbo].[TermCourse] ([TermCourseId], [TermId], [CourseId], [TermCourseIsOffered], [TermCourseGradeAvg]) VALUES (70, 13, 54, 1, NULL)
INSERT [dbo].[TermCourse] ([TermCourseId], [TermId], [CourseId], [TermCourseIsOffered], [TermCourseGradeAvg]) VALUES (71, 13, 57, 1, NULL)
INSERT [dbo].[TermCourse] ([TermCourseId], [TermId], [CourseId], [TermCourseIsOffered], [TermCourseGradeAvg]) VALUES (72, 13, 35, 1, NULL)
INSERT [dbo].[TermCourse] ([TermCourseId], [TermId], [CourseId], [TermCourseIsOffered], [TermCourseGradeAvg]) VALUES (73, 13, 36, 1, NULL)
INSERT [dbo].[TermCourse] ([TermCourseId], [TermId], [CourseId], [TermCourseIsOffered], [TermCourseGradeAvg]) VALUES (74, 13, 37, 1, NULL)
INSERT [dbo].[TermCourse] ([TermCourseId], [TermId], [CourseId], [TermCourseIsOffered], [TermCourseGradeAvg]) VALUES (76, 13, 47, 1, NULL)
INSERT [dbo].[TermCourse] ([TermCourseId], [TermId], [CourseId], [TermCourseIsOffered], [TermCourseGradeAvg]) VALUES (77, 13, 48, 1, NULL)
INSERT [dbo].[TermCourse] ([TermCourseId], [TermId], [CourseId], [TermCourseIsOffered], [TermCourseGradeAvg]) VALUES (78, 13, 29, 1, NULL)
INSERT [dbo].[TermCourse] ([TermCourseId], [TermId], [CourseId], [TermCourseIsOffered], [TermCourseGradeAvg]) VALUES (79, 13, 50, 1, NULL)
INSERT [dbo].[TermCourse] ([TermCourseId], [TermId], [CourseId], [TermCourseIsOffered], [TermCourseGradeAvg]) VALUES (147, 2, 1, 1, NULL)
INSERT [dbo].[TermCourse] ([TermCourseId], [TermId], [CourseId], [TermCourseIsOffered], [TermCourseGradeAvg]) VALUES (148, 3, 56, 1, NULL)
INSERT [dbo].[TermCourse] ([TermCourseId], [TermId], [CourseId], [TermCourseIsOffered], [TermCourseGradeAvg]) VALUES (149, 3, 55, 1, NULL)
INSERT [dbo].[TermCourse] ([TermCourseId], [TermId], [CourseId], [TermCourseIsOffered], [TermCourseGradeAvg]) VALUES (150, 3, 54, 1, NULL)
INSERT [dbo].[TermCourse] ([TermCourseId], [TermId], [CourseId], [TermCourseIsOffered], [TermCourseGradeAvg]) VALUES (151, 3, 50, 1, NULL)
INSERT [dbo].[TermCourse] ([TermCourseId], [TermId], [CourseId], [TermCourseIsOffered], [TermCourseGradeAvg]) VALUES (152, 3, 49, 1, NULL)
INSERT [dbo].[TermCourse] ([TermCourseId], [TermId], [CourseId], [TermCourseIsOffered], [TermCourseGradeAvg]) VALUES (153, 3, 44, 1, NULL)
INSERT [dbo].[TermCourse] ([TermCourseId], [TermId], [CourseId], [TermCourseIsOffered], [TermCourseGradeAvg]) VALUES (154, 3, 43, 1, NULL)
INSERT [dbo].[TermCourse] ([TermCourseId], [TermId], [CourseId], [TermCourseIsOffered], [TermCourseGradeAvg]) VALUES (155, 3, 41, 1, NULL)
INSERT [dbo].[TermCourse] ([TermCourseId], [TermId], [CourseId], [TermCourseIsOffered], [TermCourseGradeAvg]) VALUES (156, 3, 40, 1, NULL)
INSERT [dbo].[TermCourse] ([TermCourseId], [TermId], [CourseId], [TermCourseIsOffered], [TermCourseGradeAvg]) VALUES (157, 3, 38, 1, NULL)
INSERT [dbo].[TermCourse] ([TermCourseId], [TermId], [CourseId], [TermCourseIsOffered], [TermCourseGradeAvg]) VALUES (158, 3, 37, 1, NULL)
INSERT [dbo].[TermCourse] ([TermCourseId], [TermId], [CourseId], [TermCourseIsOffered], [TermCourseGradeAvg]) VALUES (159, 3, 30, 1, NULL)
INSERT [dbo].[TermCourse] ([TermCourseId], [TermId], [CourseId], [TermCourseIsOffered], [TermCourseGradeAvg]) VALUES (160, 3, 25, 1, NULL)
INSERT [dbo].[TermCourse] ([TermCourseId], [TermId], [CourseId], [TermCourseIsOffered], [TermCourseGradeAvg]) VALUES (161, 3, 22, 1, NULL)
INSERT [dbo].[TermCourse] ([TermCourseId], [TermId], [CourseId], [TermCourseIsOffered], [TermCourseGradeAvg]) VALUES (162, 3, 21, 1, NULL)
INSERT [dbo].[TermCourse] ([TermCourseId], [TermId], [CourseId], [TermCourseIsOffered], [TermCourseGradeAvg]) VALUES (163, 3, 16, 1, NULL)
INSERT [dbo].[TermCourse] ([TermCourseId], [TermId], [CourseId], [TermCourseIsOffered], [TermCourseGradeAvg]) VALUES (164, 3, 14, 1, NULL)
INSERT [dbo].[TermCourse] ([TermCourseId], [TermId], [CourseId], [TermCourseIsOffered], [TermCourseGradeAvg]) VALUES (165, 3, 12, 1, NULL)
INSERT [dbo].[TermCourse] ([TermCourseId], [TermId], [CourseId], [TermCourseIsOffered], [TermCourseGradeAvg]) VALUES (166, 3, 11, 1, NULL)
INSERT [dbo].[TermCourse] ([TermCourseId], [TermId], [CourseId], [TermCourseIsOffered], [TermCourseGradeAvg]) VALUES (167, 3, 8, 1, NULL)
GO
INSERT [dbo].[TermCourse] ([TermCourseId], [TermId], [CourseId], [TermCourseIsOffered], [TermCourseGradeAvg]) VALUES (168, 3, 7, 1, NULL)
INSERT [dbo].[TermCourse] ([TermCourseId], [TermId], [CourseId], [TermCourseIsOffered], [TermCourseGradeAvg]) VALUES (169, 3, 6, 1, NULL)
INSERT [dbo].[TermCourse] ([TermCourseId], [TermId], [CourseId], [TermCourseIsOffered], [TermCourseGradeAvg]) VALUES (170, 3, 3, 1, NULL)
INSERT [dbo].[TermCourse] ([TermCourseId], [TermId], [CourseId], [TermCourseIsOffered], [TermCourseGradeAvg]) VALUES (171, 3, 2, 1, NULL)
INSERT [dbo].[TermCourse] ([TermCourseId], [TermId], [CourseId], [TermCourseIsOffered], [TermCourseGradeAvg]) VALUES (172, 3, 1, 1, NULL)
INSERT [dbo].[TermCourse] ([TermCourseId], [TermId], [CourseId], [TermCourseIsOffered], [TermCourseGradeAvg]) VALUES (173, 4, 55, 1, NULL)
INSERT [dbo].[TermCourse] ([TermCourseId], [TermId], [CourseId], [TermCourseIsOffered], [TermCourseGradeAvg]) VALUES (174, 4, 54, 1, NULL)
INSERT [dbo].[TermCourse] ([TermCourseId], [TermId], [CourseId], [TermCourseIsOffered], [TermCourseGradeAvg]) VALUES (175, 4, 53, 1, NULL)
INSERT [dbo].[TermCourse] ([TermCourseId], [TermId], [CourseId], [TermCourseIsOffered], [TermCourseGradeAvg]) VALUES (176, 4, 47, 1, NULL)
INSERT [dbo].[TermCourse] ([TermCourseId], [TermId], [CourseId], [TermCourseIsOffered], [TermCourseGradeAvg]) VALUES (177, 4, 39, 1, NULL)
INSERT [dbo].[TermCourse] ([TermCourseId], [TermId], [CourseId], [TermCourseIsOffered], [TermCourseGradeAvg]) VALUES (178, 4, 38, 1, NULL)
INSERT [dbo].[TermCourse] ([TermCourseId], [TermId], [CourseId], [TermCourseIsOffered], [TermCourseGradeAvg]) VALUES (179, 4, 31, 1, NULL)
INSERT [dbo].[TermCourse] ([TermCourseId], [TermId], [CourseId], [TermCourseIsOffered], [TermCourseGradeAvg]) VALUES (180, 4, 30, 1, NULL)
INSERT [dbo].[TermCourse] ([TermCourseId], [TermId], [CourseId], [TermCourseIsOffered], [TermCourseGradeAvg]) VALUES (181, 4, 25, 1, NULL)
INSERT [dbo].[TermCourse] ([TermCourseId], [TermId], [CourseId], [TermCourseIsOffered], [TermCourseGradeAvg]) VALUES (182, 4, 19, 1, NULL)
INSERT [dbo].[TermCourse] ([TermCourseId], [TermId], [CourseId], [TermCourseIsOffered], [TermCourseGradeAvg]) VALUES (183, 4, 12, 1, NULL)
INSERT [dbo].[TermCourse] ([TermCourseId], [TermId], [CourseId], [TermCourseIsOffered], [TermCourseGradeAvg]) VALUES (184, 4, 11, 1, NULL)
INSERT [dbo].[TermCourse] ([TermCourseId], [TermId], [CourseId], [TermCourseIsOffered], [TermCourseGradeAvg]) VALUES (185, 4, 8, 1, NULL)
INSERT [dbo].[TermCourse] ([TermCourseId], [TermId], [CourseId], [TermCourseIsOffered], [TermCourseGradeAvg]) VALUES (186, 4, 7, 1, NULL)
INSERT [dbo].[TermCourse] ([TermCourseId], [TermId], [CourseId], [TermCourseIsOffered], [TermCourseGradeAvg]) VALUES (187, 4, 1, 1, NULL)
INSERT [dbo].[TermCourse] ([TermCourseId], [TermId], [CourseId], [TermCourseIsOffered], [TermCourseGradeAvg]) VALUES (188, 5, 6, 1, NULL)
INSERT [dbo].[TermCourse] ([TermCourseId], [TermId], [CourseId], [TermCourseIsOffered], [TermCourseGradeAvg]) VALUES (189, 5, 3, 1, NULL)
INSERT [dbo].[TermCourse] ([TermCourseId], [TermId], [CourseId], [TermCourseIsOffered], [TermCourseGradeAvg]) VALUES (190, 12, 16, 1, NULL)
INSERT [dbo].[TermCourse] ([TermCourseId], [TermId], [CourseId], [TermCourseIsOffered], [TermCourseGradeAvg]) VALUES (191, 12, 27, 1, NULL)
INSERT [dbo].[TermCourse] ([TermCourseId], [TermId], [CourseId], [TermCourseIsOffered], [TermCourseGradeAvg]) VALUES (1080, 2, 12, 1, NULL)
INSERT [dbo].[TermCourse] ([TermCourseId], [TermId], [CourseId], [TermCourseIsOffered], [TermCourseGradeAvg]) VALUES (1081, 2, 15, 1, NULL)
INSERT [dbo].[TermCourse] ([TermCourseId], [TermId], [CourseId], [TermCourseIsOffered], [TermCourseGradeAvg]) VALUES (1082, 4, 2, 1, NULL)
INSERT [dbo].[TermCourse] ([TermCourseId], [TermId], [CourseId], [TermCourseIsOffered], [TermCourseGradeAvg]) VALUES (1083, 13, 112, 1, NULL)
INSERT [dbo].[TermCourse] ([TermCourseId], [TermId], [CourseId], [TermCourseIsOffered], [TermCourseGradeAvg]) VALUES (1084, 13, 107, 1, NULL)
INSERT [dbo].[TermCourse] ([TermCourseId], [TermId], [CourseId], [TermCourseIsOffered], [TermCourseGradeAvg]) VALUES (1085, 13, 104, 1, NULL)
INSERT [dbo].[TermCourse] ([TermCourseId], [TermId], [CourseId], [TermCourseIsOffered], [TermCourseGradeAvg]) VALUES (1086, 13, 102, 1, NULL)
INSERT [dbo].[TermCourse] ([TermCourseId], [TermId], [CourseId], [TermCourseIsOffered], [TermCourseGradeAvg]) VALUES (1087, 13, 101, 1, NULL)
INSERT [dbo].[TermCourse] ([TermCourseId], [TermId], [CourseId], [TermCourseIsOffered], [TermCourseGradeAvg]) VALUES (1088, 13, 97, 1, NULL)
INSERT [dbo].[TermCourse] ([TermCourseId], [TermId], [CourseId], [TermCourseIsOffered], [TermCourseGradeAvg]) VALUES (1089, 13, 96, 1, NULL)
INSERT [dbo].[TermCourse] ([TermCourseId], [TermId], [CourseId], [TermCourseIsOffered], [TermCourseGradeAvg]) VALUES (1090, 13, 94, 1, NULL)
INSERT [dbo].[TermCourse] ([TermCourseId], [TermId], [CourseId], [TermCourseIsOffered], [TermCourseGradeAvg]) VALUES (1091, 13, 93, 1, NULL)
INSERT [dbo].[TermCourse] ([TermCourseId], [TermId], [CourseId], [TermCourseIsOffered], [TermCourseGradeAvg]) VALUES (1092, 13, 92, 1, NULL)
INSERT [dbo].[TermCourse] ([TermCourseId], [TermId], [CourseId], [TermCourseIsOffered], [TermCourseGradeAvg]) VALUES (1093, 13, 91, 1, NULL)
INSERT [dbo].[TermCourse] ([TermCourseId], [TermId], [CourseId], [TermCourseIsOffered], [TermCourseGradeAvg]) VALUES (1094, 13, 88, 1, NULL)
INSERT [dbo].[TermCourse] ([TermCourseId], [TermId], [CourseId], [TermCourseIsOffered], [TermCourseGradeAvg]) VALUES (1095, 13, 87, 1, NULL)
INSERT [dbo].[TermCourse] ([TermCourseId], [TermId], [CourseId], [TermCourseIsOffered], [TermCourseGradeAvg]) VALUES (1096, 13, 86, 1, NULL)
INSERT [dbo].[TermCourse] ([TermCourseId], [TermId], [CourseId], [TermCourseIsOffered], [TermCourseGradeAvg]) VALUES (1097, 13, 85, 1, NULL)
INSERT [dbo].[TermCourse] ([TermCourseId], [TermId], [CourseId], [TermCourseIsOffered], [TermCourseGradeAvg]) VALUES (1098, 13, 83, 1, NULL)
INSERT [dbo].[TermCourse] ([TermCourseId], [TermId], [CourseId], [TermCourseIsOffered], [TermCourseGradeAvg]) VALUES (1099, 13, 82, 1, NULL)
INSERT [dbo].[TermCourse] ([TermCourseId], [TermId], [CourseId], [TermCourseIsOffered], [TermCourseGradeAvg]) VALUES (1100, 13, 81, 1, NULL)
INSERT [dbo].[TermCourse] ([TermCourseId], [TermId], [CourseId], [TermCourseIsOffered], [TermCourseGradeAvg]) VALUES (1101, 13, 78, 1, NULL)
INSERT [dbo].[TermCourse] ([TermCourseId], [TermId], [CourseId], [TermCourseIsOffered], [TermCourseGradeAvg]) VALUES (1102, 13, 76, 1, NULL)
INSERT [dbo].[TermCourse] ([TermCourseId], [TermId], [CourseId], [TermCourseIsOffered], [TermCourseGradeAvg]) VALUES (1103, 13, 75, 1, NULL)
INSERT [dbo].[TermCourse] ([TermCourseId], [TermId], [CourseId], [TermCourseIsOffered], [TermCourseGradeAvg]) VALUES (1104, 13, 74, 1, NULL)
INSERT [dbo].[TermCourse] ([TermCourseId], [TermId], [CourseId], [TermCourseIsOffered], [TermCourseGradeAvg]) VALUES (1105, 13, 72, 1, NULL)
INSERT [dbo].[TermCourse] ([TermCourseId], [TermId], [CourseId], [TermCourseIsOffered], [TermCourseGradeAvg]) VALUES (1106, 13, 69, 1, NULL)
INSERT [dbo].[TermCourse] ([TermCourseId], [TermId], [CourseId], [TermCourseIsOffered], [TermCourseGradeAvg]) VALUES (1107, 13, 68, 1, NULL)
INSERT [dbo].[TermCourse] ([TermCourseId], [TermId], [CourseId], [TermCourseIsOffered], [TermCourseGradeAvg]) VALUES (1108, 13, 67, 1, NULL)
INSERT [dbo].[TermCourse] ([TermCourseId], [TermId], [CourseId], [TermCourseIsOffered], [TermCourseGradeAvg]) VALUES (1109, 13, 64, 1, NULL)
INSERT [dbo].[TermCourse] ([TermCourseId], [TermId], [CourseId], [TermCourseIsOffered], [TermCourseGradeAvg]) VALUES (1110, 13, 63, 1, NULL)
INSERT [dbo].[TermCourse] ([TermCourseId], [TermId], [CourseId], [TermCourseIsOffered], [TermCourseGradeAvg]) VALUES (1111, 13, 62, 1, NULL)
INSERT [dbo].[TermCourse] ([TermCourseId], [TermId], [CourseId], [TermCourseIsOffered], [TermCourseGradeAvg]) VALUES (1112, 13, 61, 1, NULL)
INSERT [dbo].[TermCourse] ([TermCourseId], [TermId], [CourseId], [TermCourseIsOffered], [TermCourseGradeAvg]) VALUES (1113, 13, 60, 1, NULL)
INSERT [dbo].[TermCourse] ([TermCourseId], [TermId], [CourseId], [TermCourseIsOffered], [TermCourseGradeAvg]) VALUES (1114, 13, 59, 1, NULL)
SET IDENTITY_INSERT [dbo].[TermCourse] OFF
SET IDENTITY_INSERT [dbo].[Time] ON 

INSERT [dbo].[Time] ([TimeId], [Day], [Hour], [Minute]) VALUES (1, 0, 0, 0)
INSERT [dbo].[Time] ([TimeId], [Day], [Hour], [Minute]) VALUES (2, 1, 8, 0)
INSERT [dbo].[Time] ([TimeId], [Day], [Hour], [Minute]) VALUES (3, 1, 8, 30)
INSERT [dbo].[Time] ([TimeId], [Day], [Hour], [Minute]) VALUES (4, 1, 9, 0)
INSERT [dbo].[Time] ([TimeId], [Day], [Hour], [Minute]) VALUES (5, 1, 9, 30)
INSERT [dbo].[Time] ([TimeId], [Day], [Hour], [Minute]) VALUES (6, 1, 10, 0)
INSERT [dbo].[Time] ([TimeId], [Day], [Hour], [Minute]) VALUES (7, 1, 10, 30)
INSERT [dbo].[Time] ([TimeId], [Day], [Hour], [Minute]) VALUES (8, 1, 11, 0)
INSERT [dbo].[Time] ([TimeId], [Day], [Hour], [Minute]) VALUES (9, 1, 11, 30)
INSERT [dbo].[Time] ([TimeId], [Day], [Hour], [Minute]) VALUES (10, 1, 12, 0)
INSERT [dbo].[Time] ([TimeId], [Day], [Hour], [Minute]) VALUES (11, 1, 12, 30)
INSERT [dbo].[Time] ([TimeId], [Day], [Hour], [Minute]) VALUES (12, 1, 13, 0)
INSERT [dbo].[Time] ([TimeId], [Day], [Hour], [Minute]) VALUES (13, 1, 13, 30)
INSERT [dbo].[Time] ([TimeId], [Day], [Hour], [Minute]) VALUES (14, 1, 14, 0)
INSERT [dbo].[Time] ([TimeId], [Day], [Hour], [Minute]) VALUES (15, 1, 14, 30)
INSERT [dbo].[Time] ([TimeId], [Day], [Hour], [Minute]) VALUES (16, 1, 15, 0)
INSERT [dbo].[Time] ([TimeId], [Day], [Hour], [Minute]) VALUES (17, 1, 15, 30)
INSERT [dbo].[Time] ([TimeId], [Day], [Hour], [Minute]) VALUES (18, 1, 16, 0)
INSERT [dbo].[Time] ([TimeId], [Day], [Hour], [Minute]) VALUES (19, 1, 16, 30)
INSERT [dbo].[Time] ([TimeId], [Day], [Hour], [Minute]) VALUES (20, 1, 17, 0)
INSERT [dbo].[Time] ([TimeId], [Day], [Hour], [Minute]) VALUES (21, 1, 17, 30)
INSERT [dbo].[Time] ([TimeId], [Day], [Hour], [Minute]) VALUES (22, 1, 18, 0)
INSERT [dbo].[Time] ([TimeId], [Day], [Hour], [Minute]) VALUES (23, 1, 18, 30)
INSERT [dbo].[Time] ([TimeId], [Day], [Hour], [Minute]) VALUES (24, 1, 19, 0)
INSERT [dbo].[Time] ([TimeId], [Day], [Hour], [Minute]) VALUES (25, 1, 19, 30)
INSERT [dbo].[Time] ([TimeId], [Day], [Hour], [Minute]) VALUES (26, 1, 20, 0)
INSERT [dbo].[Time] ([TimeId], [Day], [Hour], [Minute]) VALUES (27, 1, 20, 30)
INSERT [dbo].[Time] ([TimeId], [Day], [Hour], [Minute]) VALUES (28, 1, 21, 0)
INSERT [dbo].[Time] ([TimeId], [Day], [Hour], [Minute]) VALUES (29, 1, 21, 30)
INSERT [dbo].[Time] ([TimeId], [Day], [Hour], [Minute]) VALUES (30, 1, 22, 0)
INSERT [dbo].[Time] ([TimeId], [Day], [Hour], [Minute]) VALUES (31, 1, 22, 30)
INSERT [dbo].[Time] ([TimeId], [Day], [Hour], [Minute]) VALUES (32, 2, 8, 0)
INSERT [dbo].[Time] ([TimeId], [Day], [Hour], [Minute]) VALUES (33, 2, 8, 30)
INSERT [dbo].[Time] ([TimeId], [Day], [Hour], [Minute]) VALUES (34, 2, 9, 0)
INSERT [dbo].[Time] ([TimeId], [Day], [Hour], [Minute]) VALUES (35, 2, 9, 30)
INSERT [dbo].[Time] ([TimeId], [Day], [Hour], [Minute]) VALUES (36, 2, 10, 0)
INSERT [dbo].[Time] ([TimeId], [Day], [Hour], [Minute]) VALUES (37, 2, 10, 30)
INSERT [dbo].[Time] ([TimeId], [Day], [Hour], [Minute]) VALUES (38, 2, 11, 0)
INSERT [dbo].[Time] ([TimeId], [Day], [Hour], [Minute]) VALUES (39, 2, 11, 30)
INSERT [dbo].[Time] ([TimeId], [Day], [Hour], [Minute]) VALUES (40, 2, 12, 0)
INSERT [dbo].[Time] ([TimeId], [Day], [Hour], [Minute]) VALUES (41, 2, 12, 30)
INSERT [dbo].[Time] ([TimeId], [Day], [Hour], [Minute]) VALUES (42, 2, 13, 0)
INSERT [dbo].[Time] ([TimeId], [Day], [Hour], [Minute]) VALUES (43, 2, 13, 30)
INSERT [dbo].[Time] ([TimeId], [Day], [Hour], [Minute]) VALUES (44, 2, 14, 0)
INSERT [dbo].[Time] ([TimeId], [Day], [Hour], [Minute]) VALUES (45, 2, 14, 30)
INSERT [dbo].[Time] ([TimeId], [Day], [Hour], [Minute]) VALUES (46, 2, 15, 0)
INSERT [dbo].[Time] ([TimeId], [Day], [Hour], [Minute]) VALUES (47, 2, 15, 30)
INSERT [dbo].[Time] ([TimeId], [Day], [Hour], [Minute]) VALUES (48, 2, 16, 0)
INSERT [dbo].[Time] ([TimeId], [Day], [Hour], [Minute]) VALUES (49, 2, 16, 30)
INSERT [dbo].[Time] ([TimeId], [Day], [Hour], [Minute]) VALUES (50, 2, 17, 0)
INSERT [dbo].[Time] ([TimeId], [Day], [Hour], [Minute]) VALUES (51, 2, 17, 30)
INSERT [dbo].[Time] ([TimeId], [Day], [Hour], [Minute]) VALUES (52, 2, 18, 0)
INSERT [dbo].[Time] ([TimeId], [Day], [Hour], [Minute]) VALUES (53, 2, 18, 30)
INSERT [dbo].[Time] ([TimeId], [Day], [Hour], [Minute]) VALUES (54, 2, 19, 0)
INSERT [dbo].[Time] ([TimeId], [Day], [Hour], [Minute]) VALUES (55, 2, 19, 30)
INSERT [dbo].[Time] ([TimeId], [Day], [Hour], [Minute]) VALUES (56, 2, 20, 0)
INSERT [dbo].[Time] ([TimeId], [Day], [Hour], [Minute]) VALUES (57, 2, 20, 30)
INSERT [dbo].[Time] ([TimeId], [Day], [Hour], [Minute]) VALUES (58, 2, 21, 0)
INSERT [dbo].[Time] ([TimeId], [Day], [Hour], [Minute]) VALUES (59, 2, 21, 30)
INSERT [dbo].[Time] ([TimeId], [Day], [Hour], [Minute]) VALUES (60, 2, 22, 0)
INSERT [dbo].[Time] ([TimeId], [Day], [Hour], [Minute]) VALUES (61, 2, 22, 30)
INSERT [dbo].[Time] ([TimeId], [Day], [Hour], [Minute]) VALUES (62, 3, 8, 0)
INSERT [dbo].[Time] ([TimeId], [Day], [Hour], [Minute]) VALUES (63, 3, 8, 30)
INSERT [dbo].[Time] ([TimeId], [Day], [Hour], [Minute]) VALUES (64, 3, 9, 0)
INSERT [dbo].[Time] ([TimeId], [Day], [Hour], [Minute]) VALUES (65, 3, 9, 30)
INSERT [dbo].[Time] ([TimeId], [Day], [Hour], [Minute]) VALUES (66, 3, 10, 0)
INSERT [dbo].[Time] ([TimeId], [Day], [Hour], [Minute]) VALUES (67, 3, 10, 30)
INSERT [dbo].[Time] ([TimeId], [Day], [Hour], [Minute]) VALUES (68, 3, 11, 0)
INSERT [dbo].[Time] ([TimeId], [Day], [Hour], [Minute]) VALUES (69, 3, 11, 30)
INSERT [dbo].[Time] ([TimeId], [Day], [Hour], [Minute]) VALUES (70, 3, 12, 0)
INSERT [dbo].[Time] ([TimeId], [Day], [Hour], [Minute]) VALUES (71, 3, 12, 30)
INSERT [dbo].[Time] ([TimeId], [Day], [Hour], [Minute]) VALUES (72, 3, 13, 0)
INSERT [dbo].[Time] ([TimeId], [Day], [Hour], [Minute]) VALUES (73, 3, 13, 30)
INSERT [dbo].[Time] ([TimeId], [Day], [Hour], [Minute]) VALUES (74, 3, 14, 0)
INSERT [dbo].[Time] ([TimeId], [Day], [Hour], [Minute]) VALUES (75, 3, 14, 30)
INSERT [dbo].[Time] ([TimeId], [Day], [Hour], [Minute]) VALUES (76, 3, 15, 0)
INSERT [dbo].[Time] ([TimeId], [Day], [Hour], [Minute]) VALUES (77, 3, 15, 30)
INSERT [dbo].[Time] ([TimeId], [Day], [Hour], [Minute]) VALUES (78, 3, 16, 0)
INSERT [dbo].[Time] ([TimeId], [Day], [Hour], [Minute]) VALUES (79, 3, 16, 30)
INSERT [dbo].[Time] ([TimeId], [Day], [Hour], [Minute]) VALUES (80, 3, 17, 0)
INSERT [dbo].[Time] ([TimeId], [Day], [Hour], [Minute]) VALUES (81, 3, 17, 30)
INSERT [dbo].[Time] ([TimeId], [Day], [Hour], [Minute]) VALUES (82, 3, 18, 0)
INSERT [dbo].[Time] ([TimeId], [Day], [Hour], [Minute]) VALUES (83, 3, 18, 30)
INSERT [dbo].[Time] ([TimeId], [Day], [Hour], [Minute]) VALUES (84, 3, 19, 0)
INSERT [dbo].[Time] ([TimeId], [Day], [Hour], [Minute]) VALUES (85, 3, 19, 30)
INSERT [dbo].[Time] ([TimeId], [Day], [Hour], [Minute]) VALUES (86, 3, 20, 0)
INSERT [dbo].[Time] ([TimeId], [Day], [Hour], [Minute]) VALUES (87, 3, 20, 30)
INSERT [dbo].[Time] ([TimeId], [Day], [Hour], [Minute]) VALUES (88, 3, 21, 0)
INSERT [dbo].[Time] ([TimeId], [Day], [Hour], [Minute]) VALUES (89, 3, 21, 30)
INSERT [dbo].[Time] ([TimeId], [Day], [Hour], [Minute]) VALUES (90, 3, 22, 0)
INSERT [dbo].[Time] ([TimeId], [Day], [Hour], [Minute]) VALUES (91, 3, 22, 30)
INSERT [dbo].[Time] ([TimeId], [Day], [Hour], [Minute]) VALUES (92, 4, 8, 0)
INSERT [dbo].[Time] ([TimeId], [Day], [Hour], [Minute]) VALUES (93, 4, 8, 30)
INSERT [dbo].[Time] ([TimeId], [Day], [Hour], [Minute]) VALUES (94, 4, 9, 0)
INSERT [dbo].[Time] ([TimeId], [Day], [Hour], [Minute]) VALUES (95, 4, 9, 30)
INSERT [dbo].[Time] ([TimeId], [Day], [Hour], [Minute]) VALUES (96, 4, 10, 0)
INSERT [dbo].[Time] ([TimeId], [Day], [Hour], [Minute]) VALUES (97, 4, 10, 30)
INSERT [dbo].[Time] ([TimeId], [Day], [Hour], [Minute]) VALUES (98, 4, 11, 0)
INSERT [dbo].[Time] ([TimeId], [Day], [Hour], [Minute]) VALUES (99, 4, 11, 30)
GO
INSERT [dbo].[Time] ([TimeId], [Day], [Hour], [Minute]) VALUES (100, 4, 12, 0)
INSERT [dbo].[Time] ([TimeId], [Day], [Hour], [Minute]) VALUES (101, 4, 12, 30)
INSERT [dbo].[Time] ([TimeId], [Day], [Hour], [Minute]) VALUES (102, 4, 13, 0)
INSERT [dbo].[Time] ([TimeId], [Day], [Hour], [Minute]) VALUES (103, 4, 13, 30)
INSERT [dbo].[Time] ([TimeId], [Day], [Hour], [Minute]) VALUES (104, 4, 14, 0)
INSERT [dbo].[Time] ([TimeId], [Day], [Hour], [Minute]) VALUES (105, 4, 14, 30)
INSERT [dbo].[Time] ([TimeId], [Day], [Hour], [Minute]) VALUES (106, 4, 15, 0)
INSERT [dbo].[Time] ([TimeId], [Day], [Hour], [Minute]) VALUES (107, 4, 15, 30)
INSERT [dbo].[Time] ([TimeId], [Day], [Hour], [Minute]) VALUES (108, 4, 16, 0)
INSERT [dbo].[Time] ([TimeId], [Day], [Hour], [Minute]) VALUES (109, 4, 16, 30)
INSERT [dbo].[Time] ([TimeId], [Day], [Hour], [Minute]) VALUES (110, 4, 17, 0)
INSERT [dbo].[Time] ([TimeId], [Day], [Hour], [Minute]) VALUES (111, 4, 17, 30)
INSERT [dbo].[Time] ([TimeId], [Day], [Hour], [Minute]) VALUES (112, 4, 18, 0)
INSERT [dbo].[Time] ([TimeId], [Day], [Hour], [Minute]) VALUES (113, 4, 18, 30)
INSERT [dbo].[Time] ([TimeId], [Day], [Hour], [Minute]) VALUES (114, 4, 19, 0)
INSERT [dbo].[Time] ([TimeId], [Day], [Hour], [Minute]) VALUES (115, 4, 19, 30)
INSERT [dbo].[Time] ([TimeId], [Day], [Hour], [Minute]) VALUES (116, 4, 20, 0)
INSERT [dbo].[Time] ([TimeId], [Day], [Hour], [Minute]) VALUES (117, 4, 20, 30)
INSERT [dbo].[Time] ([TimeId], [Day], [Hour], [Minute]) VALUES (118, 4, 21, 0)
INSERT [dbo].[Time] ([TimeId], [Day], [Hour], [Minute]) VALUES (119, 4, 21, 30)
INSERT [dbo].[Time] ([TimeId], [Day], [Hour], [Minute]) VALUES (120, 4, 22, 0)
INSERT [dbo].[Time] ([TimeId], [Day], [Hour], [Minute]) VALUES (121, 4, 22, 30)
INSERT [dbo].[Time] ([TimeId], [Day], [Hour], [Minute]) VALUES (122, 5, 8, 0)
INSERT [dbo].[Time] ([TimeId], [Day], [Hour], [Minute]) VALUES (123, 5, 8, 30)
INSERT [dbo].[Time] ([TimeId], [Day], [Hour], [Minute]) VALUES (124, 5, 9, 0)
INSERT [dbo].[Time] ([TimeId], [Day], [Hour], [Minute]) VALUES (125, 5, 9, 30)
INSERT [dbo].[Time] ([TimeId], [Day], [Hour], [Minute]) VALUES (126, 5, 10, 0)
INSERT [dbo].[Time] ([TimeId], [Day], [Hour], [Minute]) VALUES (127, 5, 10, 30)
INSERT [dbo].[Time] ([TimeId], [Day], [Hour], [Minute]) VALUES (128, 5, 11, 0)
INSERT [dbo].[Time] ([TimeId], [Day], [Hour], [Minute]) VALUES (129, 5, 11, 30)
INSERT [dbo].[Time] ([TimeId], [Day], [Hour], [Minute]) VALUES (130, 5, 12, 0)
INSERT [dbo].[Time] ([TimeId], [Day], [Hour], [Minute]) VALUES (131, 5, 12, 30)
INSERT [dbo].[Time] ([TimeId], [Day], [Hour], [Minute]) VALUES (132, 5, 13, 0)
INSERT [dbo].[Time] ([TimeId], [Day], [Hour], [Minute]) VALUES (133, 5, 13, 30)
INSERT [dbo].[Time] ([TimeId], [Day], [Hour], [Minute]) VALUES (134, 5, 14, 0)
INSERT [dbo].[Time] ([TimeId], [Day], [Hour], [Minute]) VALUES (135, 5, 14, 30)
INSERT [dbo].[Time] ([TimeId], [Day], [Hour], [Minute]) VALUES (136, 5, 15, 0)
INSERT [dbo].[Time] ([TimeId], [Day], [Hour], [Minute]) VALUES (137, 5, 15, 30)
INSERT [dbo].[Time] ([TimeId], [Day], [Hour], [Minute]) VALUES (138, 5, 16, 0)
INSERT [dbo].[Time] ([TimeId], [Day], [Hour], [Minute]) VALUES (139, 5, 16, 30)
INSERT [dbo].[Time] ([TimeId], [Day], [Hour], [Minute]) VALUES (140, 5, 17, 0)
INSERT [dbo].[Time] ([TimeId], [Day], [Hour], [Minute]) VALUES (141, 5, 17, 30)
INSERT [dbo].[Time] ([TimeId], [Day], [Hour], [Minute]) VALUES (142, 5, 18, 0)
INSERT [dbo].[Time] ([TimeId], [Day], [Hour], [Minute]) VALUES (143, 5, 18, 30)
INSERT [dbo].[Time] ([TimeId], [Day], [Hour], [Minute]) VALUES (144, 5, 19, 0)
INSERT [dbo].[Time] ([TimeId], [Day], [Hour], [Minute]) VALUES (145, 5, 19, 30)
INSERT [dbo].[Time] ([TimeId], [Day], [Hour], [Minute]) VALUES (146, 5, 20, 0)
INSERT [dbo].[Time] ([TimeId], [Day], [Hour], [Minute]) VALUES (147, 5, 20, 30)
INSERT [dbo].[Time] ([TimeId], [Day], [Hour], [Minute]) VALUES (148, 5, 21, 0)
INSERT [dbo].[Time] ([TimeId], [Day], [Hour], [Minute]) VALUES (149, 5, 21, 30)
INSERT [dbo].[Time] ([TimeId], [Day], [Hour], [Minute]) VALUES (150, 5, 22, 0)
INSERT [dbo].[Time] ([TimeId], [Day], [Hour], [Minute]) VALUES (151, 5, 22, 30)
INSERT [dbo].[Time] ([TimeId], [Day], [Hour], [Minute]) VALUES (152, 6, 8, 0)
INSERT [dbo].[Time] ([TimeId], [Day], [Hour], [Minute]) VALUES (153, 6, 8, 30)
INSERT [dbo].[Time] ([TimeId], [Day], [Hour], [Minute]) VALUES (154, 6, 9, 0)
INSERT [dbo].[Time] ([TimeId], [Day], [Hour], [Minute]) VALUES (155, 6, 9, 30)
INSERT [dbo].[Time] ([TimeId], [Day], [Hour], [Minute]) VALUES (156, 6, 10, 0)
INSERT [dbo].[Time] ([TimeId], [Day], [Hour], [Minute]) VALUES (157, 6, 10, 30)
INSERT [dbo].[Time] ([TimeId], [Day], [Hour], [Minute]) VALUES (158, 6, 11, 0)
INSERT [dbo].[Time] ([TimeId], [Day], [Hour], [Minute]) VALUES (159, 6, 11, 30)
INSERT [dbo].[Time] ([TimeId], [Day], [Hour], [Minute]) VALUES (160, 6, 12, 0)
INSERT [dbo].[Time] ([TimeId], [Day], [Hour], [Minute]) VALUES (161, 6, 12, 30)
INSERT [dbo].[Time] ([TimeId], [Day], [Hour], [Minute]) VALUES (162, 6, 13, 0)
INSERT [dbo].[Time] ([TimeId], [Day], [Hour], [Minute]) VALUES (163, 6, 13, 30)
INSERT [dbo].[Time] ([TimeId], [Day], [Hour], [Minute]) VALUES (164, 6, 14, 0)
INSERT [dbo].[Time] ([TimeId], [Day], [Hour], [Minute]) VALUES (165, 6, 14, 30)
INSERT [dbo].[Time] ([TimeId], [Day], [Hour], [Minute]) VALUES (166, 6, 15, 0)
INSERT [dbo].[Time] ([TimeId], [Day], [Hour], [Minute]) VALUES (167, 6, 15, 30)
INSERT [dbo].[Time] ([TimeId], [Day], [Hour], [Minute]) VALUES (168, 6, 16, 0)
INSERT [dbo].[Time] ([TimeId], [Day], [Hour], [Minute]) VALUES (169, 6, 16, 30)
INSERT [dbo].[Time] ([TimeId], [Day], [Hour], [Minute]) VALUES (170, 6, 17, 0)
INSERT [dbo].[Time] ([TimeId], [Day], [Hour], [Minute]) VALUES (171, 6, 17, 30)
INSERT [dbo].[Time] ([TimeId], [Day], [Hour], [Minute]) VALUES (172, 6, 18, 0)
INSERT [dbo].[Time] ([TimeId], [Day], [Hour], [Minute]) VALUES (173, 6, 18, 30)
INSERT [dbo].[Time] ([TimeId], [Day], [Hour], [Minute]) VALUES (174, 6, 19, 0)
INSERT [dbo].[Time] ([TimeId], [Day], [Hour], [Minute]) VALUES (175, 6, 19, 30)
INSERT [dbo].[Time] ([TimeId], [Day], [Hour], [Minute]) VALUES (176, 6, 20, 0)
INSERT [dbo].[Time] ([TimeId], [Day], [Hour], [Minute]) VALUES (177, 6, 20, 30)
INSERT [dbo].[Time] ([TimeId], [Day], [Hour], [Minute]) VALUES (178, 6, 21, 0)
INSERT [dbo].[Time] ([TimeId], [Day], [Hour], [Minute]) VALUES (179, 6, 21, 30)
INSERT [dbo].[Time] ([TimeId], [Day], [Hour], [Minute]) VALUES (180, 6, 22, 0)
INSERT [dbo].[Time] ([TimeId], [Day], [Hour], [Minute]) VALUES (181, 6, 22, 30)
SET IDENTITY_INSERT [dbo].[Time] OFF
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([UserId], [UserNum], [UserPassword], [UserIsStudent]) VALUES (4, N'600000000', N'password', 0)
INSERT [dbo].[Users] ([UserId], [UserNum], [UserPassword], [UserIsStudent]) VALUES (11, N'b', N'b', 0)
INSERT [dbo].[Users] ([UserId], [UserNum], [UserPassword], [UserIsStudent]) VALUES (1016, N'600000001', N'password', 0)
INSERT [dbo].[Users] ([UserId], [UserNum], [UserPassword], [UserIsStudent]) VALUES (1017, N'600000002', N'password', 0)
INSERT [dbo].[Users] ([UserId], [UserNum], [UserPassword], [UserIsStudent]) VALUES (1018, N'600000003', N'password', 0)
INSERT [dbo].[Users] ([UserId], [UserNum], [UserPassword], [UserIsStudent]) VALUES (1019, N'600000004', N'password', 0)
INSERT [dbo].[Users] ([UserId], [UserNum], [UserPassword], [UserIsStudent]) VALUES (1020, N'600000005', N'password', 0)
INSERT [dbo].[Users] ([UserId], [UserNum], [UserPassword], [UserIsStudent]) VALUES (1021, N'600000006', N'password', 0)
INSERT [dbo].[Users] ([UserId], [UserNum], [UserPassword], [UserIsStudent]) VALUES (1022, N'600000007', N'password', 0)
INSERT [dbo].[Users] ([UserId], [UserNum], [UserPassword], [UserIsStudent]) VALUES (1023, N'333333333', N'password', 1)
SET IDENTITY_INSERT [dbo].[Users] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [Unique_CampusCode]    Script Date: 1/12/2017 12:13:18 PM ******/
ALTER TABLE [dbo].[Campus] ADD  CONSTRAINT [Unique_CampusCode] UNIQUE NONCLUSTERED 
(
	[CampusCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [Unique_CourseCode]    Script Date: 1/12/2017 12:13:18 PM ******/
ALTER TABLE [dbo].[Course] ADD  CONSTRAINT [Unique_CourseCode] UNIQUE NONCLUSTERED 
(
	[CourseCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [Unique_CourseId_PrereqCourseId]    Script Date: 1/12/2017 12:13:18 PM ******/
ALTER TABLE [dbo].[CoursePrerequisite] ADD  CONSTRAINT [Unique_CourseId_PrereqCourseId] UNIQUE NONCLUSTERED 
(
	[CourseId] ASC,
	[PrereqCourseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [Unique_StudentId_SectionId]    Script Date: 1/12/2017 12:13:18 PM ******/
ALTER TABLE [dbo].[Enrollment] ADD  CONSTRAINT [Unique_StudentId_SectionId] UNIQUE NONCLUSTERED 
(
	[StudentId] ASC,
	[SectionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [Unique_TermId_StudentProgramId]    Script Date: 1/12/2017 12:13:18 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [Unique_TermId_StudentProgramId] ON [dbo].[Registration]
(
	[StudentProgramId] ASC,
	[TermId] ASC
)
WHERE ([DateRegistrationCancelled] IS NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [Unique_TermId_CourseId]    Script Date: 1/12/2017 12:13:18 PM ******/
ALTER TABLE [dbo].[TermCourse] ADD  CONSTRAINT [Unique_TermId_CourseId] UNIQUE NONCLUSTERED 
(
	[TermId] ASC,
	[CourseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [Unique_Day_Hour_Minute]    Script Date: 1/12/2017 12:13:18 PM ******/
ALTER TABLE [dbo].[Time] ADD  CONSTRAINT [Unique_Day_Hour_Minute] UNIQUE NONCLUSTERED 
(
	[Day] ASC,
	[Hour] ASC,
	[Minute] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [Unique_UserNum]    Script Date: 1/12/2017 12:13:18 PM ******/
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [Unique_UserNum] UNIQUE NONCLUSTERED 
(
	[UserNum] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Class]  WITH CHECK ADD  CONSTRAINT [FK_Class_Instructor] FOREIGN KEY([InstructorId])
REFERENCES [dbo].[Instructor] ([InstructorId])
GO
ALTER TABLE [dbo].[Class] CHECK CONSTRAINT [FK_Class_Instructor]
GO
ALTER TABLE [dbo].[Class]  WITH CHECK ADD  CONSTRAINT [FK_Class_Room] FOREIGN KEY([RoomId])
REFERENCES [dbo].[Room] ([RoomId])
GO
ALTER TABLE [dbo].[Class] CHECK CONSTRAINT [FK_Class_Room]
GO
ALTER TABLE [dbo].[Class]  WITH CHECK ADD  CONSTRAINT [FK_Class_Section] FOREIGN KEY([SectionId])
REFERENCES [dbo].[Section] ([SectionId])
GO
ALTER TABLE [dbo].[Class] CHECK CONSTRAINT [FK_Class_Section]
GO
ALTER TABLE [dbo].[Class]  WITH CHECK ADD  CONSTRAINT [FK_Class_Time] FOREIGN KEY([ClassStartTime])
REFERENCES [dbo].[Time] ([TimeId])
GO
ALTER TABLE [dbo].[Class] CHECK CONSTRAINT [FK_Class_Time]
GO
ALTER TABLE [dbo].[Class]  WITH CHECK ADD  CONSTRAINT [FK_Class_Time1] FOREIGN KEY([ClassEndTime])
REFERENCES [dbo].[Time] ([TimeId])
GO
ALTER TABLE [dbo].[Class] CHECK CONSTRAINT [FK_Class_Time1]
GO
ALTER TABLE [dbo].[CoursePrerequisite]  WITH CHECK ADD  CONSTRAINT [FK_CoursePrerequisite_Course] FOREIGN KEY([CourseId])
REFERENCES [dbo].[Course] ([CourseId])
GO
ALTER TABLE [dbo].[CoursePrerequisite] CHECK CONSTRAINT [FK_CoursePrerequisite_Course]
GO
ALTER TABLE [dbo].[CoursePrerequisite]  WITH CHECK ADD  CONSTRAINT [FK_CoursePrerequisite_Course1] FOREIGN KEY([PrereqCourseId])
REFERENCES [dbo].[Course] ([CourseId])
GO
ALTER TABLE [dbo].[CoursePrerequisite] CHECK CONSTRAINT [FK_CoursePrerequisite_Course1]
GO
ALTER TABLE [dbo].[Department]  WITH CHECK ADD  CONSTRAINT [FK_Department_Campus] FOREIGN KEY([CampusId])
REFERENCES [dbo].[Campus] ([CampusId])
GO
ALTER TABLE [dbo].[Department] CHECK CONSTRAINT [FK_Department_Campus]
GO
ALTER TABLE [dbo].[Enrollment]  WITH CHECK ADD  CONSTRAINT [FK_Enrollment_Section] FOREIGN KEY([SectionId])
REFERENCES [dbo].[Section] ([SectionId])
GO
ALTER TABLE [dbo].[Enrollment] CHECK CONSTRAINT [FK_Enrollment_Section]
GO
ALTER TABLE [dbo].[Enrollment]  WITH CHECK ADD  CONSTRAINT [FK_Enrollment_Student] FOREIGN KEY([StudentId])
REFERENCES [dbo].[Student] ([StudentId])
GO
ALTER TABLE [dbo].[Enrollment] CHECK CONSTRAINT [FK_Enrollment_Student]
GO
ALTER TABLE [dbo].[Instructor]  WITH CHECK ADD  CONSTRAINT [FK_Instructor_Users] FOREIGN KEY([InstructorId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[Instructor] CHECK CONSTRAINT [FK_Instructor_Users]
GO
ALTER TABLE [dbo].[Program]  WITH CHECK ADD  CONSTRAINT [FK_Program_Degree] FOREIGN KEY([DegreeId])
REFERENCES [dbo].[Degree] ([DegreeId])
GO
ALTER TABLE [dbo].[Program] CHECK CONSTRAINT [FK_Program_Degree]
GO
ALTER TABLE [dbo].[Program]  WITH CHECK ADD  CONSTRAINT [FK_Program_Department] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Department] ([DepartmentId])
GO
ALTER TABLE [dbo].[Program] CHECK CONSTRAINT [FK_Program_Department]
GO
ALTER TABLE [dbo].[ProgramSemester]  WITH CHECK ADD  CONSTRAINT [FK_ProgramSemester_Program] FOREIGN KEY([ProgramId])
REFERENCES [dbo].[Program] ([ProgramId])
GO
ALTER TABLE [dbo].[ProgramSemester] CHECK CONSTRAINT [FK_ProgramSemester_Program]
GO
ALTER TABLE [dbo].[ProgramSemesterCourse]  WITH CHECK ADD  CONSTRAINT [FK_ProgramSemesterCourse_Course] FOREIGN KEY([CourseId])
REFERENCES [dbo].[Course] ([CourseId])
GO
ALTER TABLE [dbo].[ProgramSemesterCourse] CHECK CONSTRAINT [FK_ProgramSemesterCourse_Course]
GO
ALTER TABLE [dbo].[ProgramSemesterCourse]  WITH CHECK ADD  CONSTRAINT [FK_ProgramSemesterCourse_ProgramSemester] FOREIGN KEY([ProgramSemesterId])
REFERENCES [dbo].[ProgramSemester] ([ProgramSemesterId])
GO
ALTER TABLE [dbo].[ProgramSemesterCourse] CHECK CONSTRAINT [FK_ProgramSemesterCourse_ProgramSemester]
GO
ALTER TABLE [dbo].[Registration]  WITH CHECK ADD  CONSTRAINT [FK_Registration_StudentProgram] FOREIGN KEY([StudentProgramId])
REFERENCES [dbo].[StudentProgram] ([StudentProgramId])
GO
ALTER TABLE [dbo].[Registration] CHECK CONSTRAINT [FK_Registration_StudentProgram]
GO
ALTER TABLE [dbo].[Registration]  WITH CHECK ADD  CONSTRAINT [FK_Registration_Term] FOREIGN KEY([TermId])
REFERENCES [dbo].[Term] ([TermId])
GO
ALTER TABLE [dbo].[Registration] CHECK CONSTRAINT [FK_Registration_Term]
GO
ALTER TABLE [dbo].[Section]  WITH CHECK ADD  CONSTRAINT [FK_Section_TermCourse] FOREIGN KEY([TermCourseId])
REFERENCES [dbo].[TermCourse] ([TermCourseId])
GO
ALTER TABLE [dbo].[Section] CHECK CONSTRAINT [FK_Section_TermCourse]
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Student_Users] FOREIGN KEY([StudentId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [FK_Student_Users]
GO
ALTER TABLE [dbo].[StudentProgram]  WITH CHECK ADD  CONSTRAINT [FK_StudentProgram_Program] FOREIGN KEY([ProgramId])
REFERENCES [dbo].[Program] ([ProgramId])
GO
ALTER TABLE [dbo].[StudentProgram] CHECK CONSTRAINT [FK_StudentProgram_Program]
GO
ALTER TABLE [dbo].[StudentProgram]  WITH CHECK ADD  CONSTRAINT [FK_StudentProgram_Student] FOREIGN KEY([StudentId])
REFERENCES [dbo].[Student] ([StudentId])
GO
ALTER TABLE [dbo].[StudentProgram] CHECK CONSTRAINT [FK_StudentProgram_Student]
GO
ALTER TABLE [dbo].[TermCourse]  WITH CHECK ADD  CONSTRAINT [FK_TermCourse_Course] FOREIGN KEY([CourseId])
REFERENCES [dbo].[Course] ([CourseId])
GO
ALTER TABLE [dbo].[TermCourse] CHECK CONSTRAINT [FK_TermCourse_Course]
GO
ALTER TABLE [dbo].[TermCourse]  WITH CHECK ADD  CONSTRAINT [FK_TermCourse_Term] FOREIGN KEY([TermId])
REFERENCES [dbo].[Term] ([TermId])
GO
ALTER TABLE [dbo].[TermCourse] CHECK CONSTRAINT [FK_TermCourse_Term]
GO
ALTER TABLE [dbo].[Course]  WITH CHECK ADD  CONSTRAINT [chk_courselevel] CHECK  (([CourseLevel]='PG' OR [CourseLevel]='PS' OR [CourseLevel]='SS'))
GO
ALTER TABLE [dbo].[Course] CHECK CONSTRAINT [chk_courselevel]
GO
ALTER TABLE [dbo].[Degree]  WITH CHECK ADD  CONSTRAINT [chk_degreelevel] CHECK  (([DegreeLevel]='PG' OR [DegreeLevel]='PS' OR [DegreeLevel]='SS'))
GO
ALTER TABLE [dbo].[Degree] CHECK CONSTRAINT [chk_degreelevel]
GO
/****** Object:  StoredProcedure [dbo].[DoAddEnrollment]    Script Date: 1/12/2017 12:13:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Name
-- Create date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[DoAddEnrollment] 

	@StudentId int 
	, @SectionId int
	, @RegistrationId int
	, @StudentTranscript nvarchar(max)
	, @Invoice nvarchar(max)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    insert into Enrollment(StudentId,SectionId) values(@StudentId,@SectionId);

	update Registration set Invoice=@Invoice where RegistrationId=@RegistrationId;

	update Student set StudentTranscript=@StudentTranscript where StudentId=@StudentId;
END

GO
/****** Object:  StoredProcedure [dbo].[DoDeleteEnrollment]    Script Date: 1/12/2017 12:13:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Name
-- Create date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[DoDeleteEnrollment] 
	-- Add the parameters for the stored procedure here
	@EnrollmentId int 
	, @StudentId int
	, @RegistrationId int
	, @StudentTranscript nvarchar(max)
	, @Invoice nvarchar(max)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    update Student set StudentTranscript=@StudentTranscript where StudentId = @StudentId;
	
	update Registration set Invoice=@Invoice where RegistrationId = @RegistrationId;
	
	delete from Enrollment where EnrollmentId = @EnrollmentId;

END

GO
/****** Object:  StoredProcedure [dbo].[DoProgramTransfer]    Script Date: 1/12/2017 12:13:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Name
-- Create date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[DoProgramTransfer] 
	-- Add the parameters for the stored procedure here
	@StudentId int
	, @TermId int
	, @newProgramId int
	, @newCurrentSemester smallint
	, @StudentTranscript nvarchar(max)
	, @oldInvoice nvarchar(max) = null
	
	, @isSuccessful bit output
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	BEGIN TRANSACTION;
	BEGIN TRY

		declare @oldEnrollments table(EnrollmentId int not null);
		insert into @oldEnrollments
		select EnrollmentId 
		from EnrollmentInfo 
		where StudentId=@StudentId and TermId=@TermId;

		declare @oldRegistrationId int;
		select @oldRegistrationId = RegistrationId 
		from InvoiceInfo
		where StudentId=@StudentId and TermId=@TermId;

		declare @oldStudentProgramId int;
		select @oldStudentProgramId = StudentProgramId 
		from StudentProgram 
		where studentid=@StudentId and EndDate is null;
	
		delete from enrollment where EnrollmentId in (select EnrollmentId from @oldEnrollments);
    
		update student set StudentTranscript=@StudentTranscript where studentid=@StudentId;

		IF @oldInvoice is null
			update registration set DateRegistrationCancelled=getdate() where registrationid = @oldRegistrationId;
		ELSE
			update registration set invoice=@oldInvoice,DateRegistrationCancelled=getdate() where registrationid = @oldRegistrationId;

		update studentprogram set enddate=getdate() where studentprogramid=@oldStudentProgramId;

		insert into studentprogram(StudentId,ProgramId,StartDate,CurrentSemester) values(@StudentId,@newProgramId,getdate(),@newCurrentSemester);
		declare @newStudentProgramId int = SCOPE_IDENTITY();

		insert into registration(TermId, StudentProgramId) values(@TermId, @newStudentProgramId);


	END TRY
	BEGIN CATCH
		IF @@TRANCOUNT > 0
			ROLLBACK TRANSACTION;
	END CATCH;

	
	IF @@TRANCOUNT > 0
		BEGIN
		COMMIT TRANSACTION;
		set @isSuccessful = 1;
		END
	ELSE
		BEGIN
		set @isSuccessful = 0;
		END;


END

GO
/****** Object:  StoredProcedure [dbo].[EnrollmentOptions]    Script Date: 1/12/2017 12:13:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Name
-- Create date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[EnrollmentOptions] 
	@StudentId int, 
	@TermId int,
	@StudentTranscript nvarchar(max) output,
	@TermName varchar(20) output
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	declare @currentSections table(SectionId int not null);
	insert into @currentSections
	select EnrollmentInfo.SectionId from EnrollmentInfo 
	where StudentId=@StudentId and TermId=@TermId
	;

	declare @offeredSections table(
	SectionId int not null,
	SectionNum varchar(10),
	TermCourseId int,
	CourseId int,
	Classes varchar(max));
	insert into @offeredSections
	select SectionId,SectionNum,TermCourseId,CourseId,Classes 
	from sectioninfo 
	where TermId=@TermId and TermCourseIsOffered=1
	;

	declare @ProgramId int;
	set @ProgramId = (select top(1) ProgramId from StudentProgram where StudentId=@StudentId and EndDate is null);

    select c.ProgramSemesterNum, c.CourseCode, s.SectionNum
	, c.ProgramSemesterId, c.ProgramSemesterName
	, c.IsAcademic, c.IsMandatory, c.IsTechnicalElective, c.IsGeneralElective
	, c.CourseId, c.CourseTitle, c.CourseCredits, c.Prereqs
	, s.TermCourseId, s.SectionId, s.Classes
	, (case
	when s.CourseId is null then CONVERT(bit, 0)
	else CONVERT(bit, 1)
	end) as CourseIsOffered
	, (case
	when cs.SectionId is null then CONVERT(bit, 0)
	else CONVERT(bit, 1)
	end) as SectionIsSelected
	from programcourseinfo c 
	left outer join @offeredSections s on c.courseid=s.CourseId
	left outer join @currentSections cs on s.SectionId=cs.SectionId
	where
	c.ProgramId=@ProgramId
	and c.EndDate is null
	order by 1, 2, 3
	;

	set @StudentTranscript = ISNULL((select studenttranscript from Student where StudentId=@StudentId), '');
	set @TermName = (select TermName from term where termid=@TermId);
END

GO
/****** Object:  StoredProcedure [dbo].[GetDataForAddEnrollment]    Script Date: 1/12/2017 12:13:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Name
-- Create date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[GetDataForAddEnrollment] 
	-- Add the parameters for the stored procedure here
	@StudentId int
	, @SectionId int

	, @StudentTranscript nvarchar(max) output
	, @DegreeName varchar(30) output
	, @CourseLevel varchar(2) output
	, @TermName varchar(20) output
	, @CourseSubject varchar(4) output
	, @CourseNum varchar(3) output
	, @CourseTitle varchar(35) output
	, @CourseCredits decimal output
	, @RegistrationId int output
	, @Invoice nvarchar(max) output
	, @CourseCode varchar(10) output
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    select 
	@StudentTranscript = st.StudentTranscript
	, @DegreeName = d.DegreeName
	, @CourseLevel = c.CourseLevel
	, @TermName = t.TermName
	, @CourseSubject = c.CourseSubject
	, @CourseNum = c.CourseNum
	, @CourseTitle = c.CourseTitle
	, @CourseCredits = c.CourseCredits
	, @RegistrationId = r.RegistrationId
	, @Invoice = r.Invoice
	, @CourseCode = c.CourseCode
	from TermCourse tc  
	join Section s on (tc.TermCourseId=s.TermCourseId and s.SectionId=@SectionId)
	join Course c on c.CourseId=tc.CourseId
	join Term t on t.TermId=tc.TermId
	join Registration r on (t.TermId=r.TermId and r.DateRegistrationCancelled is null)
	join StudentProgram sp on (sp.StudentProgramId=r.StudentProgramId and sp.EndDate is null)
	join Student st on (st.StudentId=sp.StudentId and st.StudentId=@StudentId)
	join Program p on p.ProgramId=sp.ProgramId
	join Degree d on d.DegreeId=p.DegreeId;
END

GO
/****** Object:  StoredProcedure [dbo].[GetDataForDeleteEnrollment]    Script Date: 1/12/2017 12:13:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Name
-- Create date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[GetDataForDeleteEnrollment] 
	
	@EnrollmentId int
	
	, @StudentId int output
	, @StudentTranscript nvarchar(max) output
	, @DegreeName varchar(30) output
	, @CourseLevel varchar(2) output
	, @TermName varchar(20) output
	, @CourseSubject varchar(4) output
	, @CourseNum varchar(3) output
	, @RegistrationId int output
	, @Invoice nvarchar(max) output
	, @CourseCode varchar(10) output
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	select 
	@StudentId = s.StudentId
	, @StudentTranscript = s.StudentTranscript
	, @DegreeName = p.DegreeName
	, @CourseLevel = c.CourseLevel
	, @TermName = e.TermName
	, @CourseSubject = c.CourseSubject
	, @CourseNum = c.CourseNum
	, @RegistrationId = r.RegistrationId
	, @Invoice = r.Invoice
	, @CourseCode = c.CourseCode
	from EnrollmentInfo e 
	join Student s on s.StudentId=e.StudentId
	join StudentProgram sp on (s.StudentId=sp.StudentId and sp.EndDate is null)
	join Registration r on (sp.StudentProgramId=r.StudentProgramId and r.TermId=e.TermId and r.DateRegistrationCancelled is null) 
	join Course c on c.CourseId=e.CourseId
	join ProgramInfo p on p.ProgramId=sp.ProgramId
	where e.EnrollmentId = @EnrollmentId
	;
    
END

GO
/****** Object:  StoredProcedure [dbo].[ProgramTransferInfo]    Script Date: 1/12/2017 12:13:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Name
-- Create date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[ProgramTransferInfo] 
	-- Add the parameters for the stored procedure here
	@StudentId int
	, @TermId int
	, @newProgramId int

	, @TermName varchar(20) output
	, @StudentTranscript nvarchar(max) output
	, @oldProgramId int output
	, @oldDegreeName varchar(30) output
	, @oldInvoice nvarchar(max) = '' output
	, @newDegreeName varchar(30) output
	, @newCampusName varchar(15) output
	, @newDepartmentName varchar(40) output
	, @newProgramName varchar(50) output
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	declare @oldStudentProgramId int;

	select CourseSubject, CourseNum, CourseLevel
	from EnrollmentInfo join Course on Course.CourseId=EnrollmentInfo.CourseId
	where StudentId=@StudentId and TermId=@TermId;

	select @TermName = TermName 
	from term 
	where termid=@TermId;

	select @StudentTranscript = isnull(studenttranscript, '') 
	from student 
	where studentid=@StudentId;

    select @oldProgramId = ProgramId, @oldStudentProgramId = StudentProgramId 
	from StudentProgram 
	where studentid=@StudentId and EndDate is null;

	select @oldDegreeName = DegreeName 
	from ProgramInfo 
	where ProgramId=@oldProgramId;

	select @oldInvoice = isnull(Invoice, '') 
	from Registration 
	where StudentProgramId=@oldStudentProgramId and TermId=@TermId and DateRegistrationCancelled is null;

	select @newDegreeName=DegreeName,@newCampusName=CampusName,@newDepartmentName=DepartmentName,@newProgramName=ProgramName 
	from ProgramInfo 
	where ProgramId=@newProgramId;

END

GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Class"
            Begin Extent = 
               Top = 53
               Left = 304
               Bottom = 245
               Right = 474
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "starttime"
            Begin Extent = 
               Top = 24
               Left = 37
               Bottom = 154
               Right = 207
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "endtime"
            Begin Extent = 
               Top = 178
               Left = 29
               Bottom = 308
               Right = 199
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Room"
            Begin Extent = 
               Top = 157
               Left = 519
               Bottom = 306
               Right = 689
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Instructor"
            Begin Extent = 
               Top = 21
               Left = 705
               Bottom = 172
               Right = 920
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 1875
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ClassInfo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ClassInfo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ClassInfo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'CourseInfo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'CourseInfo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Enrollment"
            Begin Extent = 
               Top = 19
               Left = 97
               Bottom = 187
               Right = 267
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Section"
            Begin Extent = 
               Top = 31
               Left = 345
               Bottom = 175
               Right = 515
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "TermCourse"
            Begin Extent = 
               Top = 34
               Left = 580
               Bottom = 197
               Right = 786
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Term"
            Begin Extent = 
               Top = 37
               Left = 860
               Bottom = 199
               Right = 1030
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'EnrollmentInfo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'EnrollmentInfo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Registration"
            Begin Extent = 
               Top = 33
               Left = 310
               Bottom = 230
               Right = 538
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Term"
            Begin Extent = 
               Top = 33
               Left = 33
               Bottom = 163
               Right = 203
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "StudentProgram"
            Begin Extent = 
               Top = 41
               Left = 622
               Bottom = 212
               Right = 808
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'InvoiceInfo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'InvoiceInfo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "ProgramSemester"
            Begin Extent = 
               Top = 21
               Left = 56
               Bottom = 175
               Right = 292
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ProgramSemesterCourse"
            Begin Extent = 
               Top = 19
               Left = 343
               Bottom = 226
               Right = 573
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CourseInfo"
            Begin Extent = 
               Top = 28
               Left = 619
               Bottom = 232
               Right = 789
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ProgramCourseInfo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ProgramCourseInfo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Program"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 226
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Degree"
            Begin Extent = 
               Top = 6
               Left = 264
               Bottom = 119
               Right = 434
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Department"
            Begin Extent = 
               Top = 120
               Left = 264
               Bottom = 233
               Right = 448
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Campus"
            Begin Extent = 
               Top = 138
               Left = 38
               Bottom = 268
               Right = 213
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 2775
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ProgramInfo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ProgramInfo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Student"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 268
            End
            DisplayFlags = 280
            TopColumn = 6
         End
         Begin Table = "StudentProgram"
            Begin Extent = 
               Top = 16
               Left = 333
               Bottom = 146
               Right = 519
            End
            DisplayFlags = 280
            TopColumn = 2
         End
         Begin Table = "ProgramInfo"
            Begin Extent = 
               Top = 23
               Left = 701
               Bottom = 153
               Right = 889
            End
            DisplayFlags = 280
            TopColumn = 4
         End
         Begin Table = "ProgramSemester"
            Begin Extent = 
               Top = 175
               Left = 35
               Bottom = 305
               Right = 271
            End
            DisplayFlags = 280
            TopColumn = 1
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 2310
         Alias = 2040
         Table = 1170
         Output = 1380
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'RegistrationInfo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'RegistrationInfo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Section"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 140
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Class"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 205
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'SectionClasses'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'SectionClasses'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'SectionInfo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'SectionInfo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Course"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 190
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "TermCourse"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 176
               Right = 452
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'TermCourseInfo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'TermCourseInfo'
GO
USE [master]
GO
ALTER DATABASE [RegistrationMockup] SET  READ_WRITE 
GO
