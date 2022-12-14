USE [master]
GO
/****** Object:  Database [CrayonKids]    Script Date: 2022/08/16 10:50:16 ******/
CREATE DATABASE [CrayonKids]
 CONTAINMENT = NONE
 
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CrayonKids].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CrayonKids] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CrayonKids] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CrayonKids] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CrayonKids] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CrayonKids] SET ARITHABORT OFF 
GO
ALTER DATABASE [CrayonKids] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [CrayonKids] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CrayonKids] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CrayonKids] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CrayonKids] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CrayonKids] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CrayonKids] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CrayonKids] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CrayonKids] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CrayonKids] SET  ENABLE_BROKER 
GO
ALTER DATABASE [CrayonKids] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CrayonKids] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CrayonKids] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CrayonKids] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CrayonKids] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CrayonKids] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [CrayonKids] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CrayonKids] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [CrayonKids] SET  MULTI_USER 
GO
ALTER DATABASE [CrayonKids] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CrayonKids] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CrayonKids] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CrayonKids] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [CrayonKids] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [CrayonKids] SET QUERY_STORE = OFF
GO
USE [CrayonKids]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 2022/08/16 10:50:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Allergy]    Script Date: 2022/08/16 10:50:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Allergy](
	[Allergy_ID] [int] NOT NULL,
	[Allergy_Details] [varchar](20) NULL,
	[Allergy_Date] [date] NULL,
 CONSTRAINT [PK_Allergy] PRIMARY KEY CLUSTERED 
(
	[Allergy_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Application]    Script Date: 2022/08/16 10:50:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Application](
	[Application_ID] [int] NOT NULL,
	[Parent_Guardian_ID] [int] NULL,
	[Student_ID] [int] NULL,
	[Application_Status_ID] [int] NULL,
	[Application_Date] [date] NULL,
 CONSTRAINT [PK_Application] PRIMARY KEY CLUSTERED 
(
	[Application_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Application_Status]    Script Date: 2022/08/16 10:50:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Application_Status](
	[Application_Status_ID] [int] NOT NULL,
	[Application_ID] [int] NULL,
	[Accepted] [varchar](20) NULL,
	[Rejected] [varchar](20) NULL,
	[Pending] [varchar](20) NULL,
 CONSTRAINT [PK_Application_Status] PRIMARY KEY CLUSTERED 
(
	[Application_Status_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Appointment_Booking]    Script Date: 2022/08/16 10:50:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Appointment_Booking](
	[Appointment_Booking_ID] [int] NOT NULL,
	[Appointment_Booking_Details] [varchar](20) NULL,
	[Booking_Status_ID] [int] NULL,
	[Appointment_Booking_Date] [date] NULL,
 CONSTRAINT [PK_Appointment_Booking] PRIMARY KEY CLUSTERED 
(
	[Appointment_Booking_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Assessment]    Script Date: 2022/08/16 10:50:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Assessment](
	[Assessment_ID] [int] NOT NULL,
	[Report_Card_Template_ID] [int] NULL,
	[Assessment_Details] [varchar](200) NULL,
 CONSTRAINT [PK_Assessment] PRIMARY KEY CLUSTERED 
(
	[Assessment_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Booking_Status]    Script Date: 2022/08/16 10:50:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Booking_Status](
	[Booking_Status_ID] [int] NOT NULL,
	[Accepted] [varchar](20) NULL,
	[Rejected] [varchar](20) NULL,
	[Pending] [varchar](20) NULL,
 CONSTRAINT [PK_Booking_Status] PRIMARY KEY CLUSTERED 
(
	[Booking_Status_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[City]    Script Date: 2022/08/16 10:50:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[City](
	[City_ID] [int] NOT NULL,
	[City_Details] [varchar](50) NULL,
	[Province_ID] [int] NULL,
 CONSTRAINT [PK_City] PRIMARY KEY CLUSTERED 
(
	[City_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Class]    Script Date: 2022/08/16 10:50:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Class](
	[Class_ID] [int] NOT NULL,
	[Class_Name] [varchar](20) NULL,
	[Class_Capacity] [varchar](20) NULL,
 CONSTRAINT [PK_Class] PRIMARY KEY CLUSTERED 
(
	[Class_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Class_Class_Type]    Script Date: 2022/08/16 10:50:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Class_Class_Type](
	[Class_ID] [int] NOT NULL,
	[Class_Type_ID] [int] NOT NULL,
 CONSTRAINT [PK__Class_Cl__B077B71534DCB7B6] PRIMARY KEY CLUSTERED 
(
	[Class_ID] ASC,
	[Class_Type_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Class_Type]    Script Date: 2022/08/16 10:50:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Class_Type](
	[Class_Type_ID] [int] IDENTITY(1,1) NOT NULL,
	[Grade] [int] NULL,
 CONSTRAINT [PK_Class_Type] PRIMARY KEY CLUSTERED 
(
	[Class_Type_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Class_Type_Employee]    Script Date: 2022/08/16 10:50:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Class_Type_Employee](
	[Class_Type_ID] [int] NOT NULL,
	[Employee_ID] [int] NOT NULL,
 CONSTRAINT [PK__Class_Ty__098A3769FFE27824] PRIMARY KEY CLUSTERED 
(
	[Class_Type_ID] ASC,
	[Employee_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Complaint]    Script Date: 2022/08/16 10:50:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Complaint](
	[Complaint_ID] [int] NOT NULL,
	[Complaint_details] [varchar](500) NULL,
 CONSTRAINT [PK_Complaint] PRIMARY KEY CLUSTERED 
(
	[Complaint_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DateTable]    Script Date: 2022/08/16 10:50:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DateTable](
	[Date_ID] [int] NOT NULL,
	[Date_details] [varchar](50) NULL,
	[Year] [date] NULL,
	[Month] [date] NULL,
 CONSTRAINT [PK__DateTabl__1F9B72AB718C8542] PRIMARY KEY CLUSTERED 
(
	[Date_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Emergency]    Script Date: 2022/08/16 10:50:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Emergency](
	[Emergency_ID] [int] NOT NULL,
	[Emergency_Details] [varchar](20) NULL,
	[Emergency_Date] [date] NULL,
 CONSTRAINT [PK_Emergency] PRIMARY KEY CLUSTERED 
(
	[Emergency_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 2022/08/16 10:50:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[Employee_ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[Surname] [varchar](50) NULL,
	[Birth_Date] [date] NULL,
	[Hire_Date] [date] NULL,
	[Contact_No] [int] NOT NULL,
	[Email_Address] [varchar](20) NULL,
	[Street_Address] [varchar](50) NULL,
	[Address_2] [varchar](50) NULL,
	[Province] [varchar](50) NULL,
	[City] [varchar](50) NULL,
	[Postal_Code] [varchar](50) NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[Employee_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee_Type]    Script Date: 2022/08/16 10:50:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee_Type](
	[Employee_Type_ID] [int] NOT NULL,
	[Teacher] [varchar](50) NULL,
	[Cook] [varchar](50) NULL,
	[Gardener] [varchar](50) NULL,
	[Administrator] [varchar](50) NULL,
	[Principal] [varchar](50) NULL,
 CONSTRAINT [PK_Employee_Type] PRIMARY KEY CLUSTERED 
(
	[Employee_Type_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employment_Status]    Script Date: 2022/08/16 10:50:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employment_Status](
	[Employment_Status_ID] [int] NOT NULL,
	[Active] [varchar](20) NULL,
	[Inactive] [varchar](20) NULL,
 CONSTRAINT [PK_Employment_Status] PRIMARY KEY CLUSTERED 
(
	[Employment_Status_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Equipment]    Script Date: 2022/08/16 10:50:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Equipment](
	[Equipment_ID] [int] IDENTITY(1,1) NOT NULL,
	[Equipment_Item_Name] [varchar](20) NULL,
	[Equipment_Purchase_Date] [date] NULL,
	[Equipment_Type_ID] [int] NULL,
 CONSTRAINT [PK_Equipment] PRIMARY KEY CLUSTERED 
(
	[Equipment_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Equipment_Type]    Script Date: 2022/08/16 10:50:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Equipment_Type](
	[Equipment_Type_ID] [int] NOT NULL,
	[Equipment_Type_Description] [varchar](50) NULL,
 CONSTRAINT [PK_Equipment_Type] PRIMARY KEY CLUSTERED 
(
	[Equipment_Type_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Homework]    Script Date: 2022/08/16 10:50:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Homework](
	[Homework_ID] [int] NOT NULL,
	[Report_Card_Template_ID] [int] NULL,
	[Homework_Details] [varchar](200) NULL,
 CONSTRAINT [PK_Homework] PRIMARY KEY CLUSTERED 
(
	[Homework_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Marking_Scale]    Script Date: 2022/08/16 10:50:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Marking_Scale](
	[Marking_Scale_ID] [int] NOT NULL,
	[Report_Card_Template_ID] [int] NULL,
	[Marking_Scale_Details] [varchar](20) NULL,
 CONSTRAINT [PK_Marking_Scale] PRIMARY KEY CLUSTERED 
(
	[Marking_Scale_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Menu]    Script Date: 2022/08/16 10:50:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menu](
	[Menu_ID] [int] NOT NULL,
	[MenuDescription] [varchar](20) NULL,
 CONSTRAINT [PK_Menu] PRIMARY KEY CLUSTERED 
(
	[Menu_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Menu_Item]    Script Date: 2022/08/16 10:50:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menu_Item](
	[Menu_Item_ID] [int] IDENTITY(1,1) NOT NULL,
	[Menu_Item_Description] [varchar](20) NULL,
	[Menu_Items_Purchased] [int] NULL,
	[Menu_Item_Purchase_Date] [date] NULL,
 CONSTRAINT [PK_Menu_Item] PRIMARY KEY CLUSTERED 
(
	[Menu_Item_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Menu_Item_Menu]    Script Date: 2022/08/16 10:50:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menu_Item_Menu](
	[Menu_ID] [int] NOT NULL,
	[Menu_Item_ID] [int] NOT NULL,
 CONSTRAINT [PK__Menu_Ite__ADC4EA8EAB7A3781] PRIMARY KEY CLUSTERED 
(
	[Menu_ID] ASC,
	[Menu_Item_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order_Line]    Script Date: 2022/08/16 10:50:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order_Line](
	[Supplier_Order_ID] [int] NOT NULL,
	[Order_Type_ID] [int] NOT NULL,
	[Stationery_ID] [int] NOT NULL,
	[Cleaning_Material_Item_ID] [int] NOT NULL,
	[Equipment_ID] [int] NOT NULL,
	[Order_Line_Item] [varchar](50) NULL,
 CONSTRAINT [PK__Order_Li__152A654CD26619D0] PRIMARY KEY CLUSTERED 
(
	[Supplier_Order_ID] ASC,
	[Order_Type_ID] ASC,
	[Stationery_ID] ASC,
	[Cleaning_Material_Item_ID] ASC,
	[Equipment_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Parent_Feedback]    Script Date: 2022/08/16 10:50:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Parent_Feedback](
	[Parent_Feedback_ID] [int] NOT NULL,
	[Parent_Guardian_ID] [int] NULL,
	[Parent_Feedback_Details] [varchar](20) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Parent_Guardian]    Script Date: 2022/08/16 10:50:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Parent_Guardian](
	[Parent_Guardian_ID] [int] IDENTITY(1,1) NOT NULL,
	[Parent_Name] [varchar](50) NULL,
	[Parent_Surname] [varchar](50) NULL,
	[Parent_Contact_No] [varchar](20) NULL,
	[Parent_Email_Address] [varchar](50) NULL,
 CONSTRAINT [PK_Parent_Guardian] PRIMARY KEY CLUSTERED 
(
	[Parent_Guardian_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Parent_Guardian_Menu_Item]    Script Date: 2022/08/16 10:50:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Parent_Guardian_Menu_Item](
	[Parent_Guardian_ID] [int] NOT NULL,
	[Menu_Item_ID] [int] NOT NULL,
 CONSTRAINT [PK__Parent_G__417D319375A9EF42] PRIMARY KEY CLUSTERED 
(
	[Parent_Guardian_ID] ASC,
	[Menu_Item_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Progress_Category]    Script Date: 2022/08/16 10:50:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Progress_Category](
	[Progress_Category_ID] [int] NOT NULL,
	[Marking_Scale_ID] [int] NULL,
	[Progress_Category_Details] [varchar](20) NULL,
 CONSTRAINT [PK_Progress_Category] PRIMARY KEY CLUSTERED 
(
	[Progress_Category_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Province]    Script Date: 2022/08/16 10:50:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Province](
	[Province_ID] [int] NOT NULL,
	[Province_Details] [varchar](50) NULL,
 CONSTRAINT [PK_Province] PRIMARY KEY CLUSTERED 
(
	[Province_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReportCard]    Script Date: 2022/08/16 10:50:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReportCard](
	[Report_Card_ID] [int] NOT NULL,
	[Report_Card_Details] [varchar](200) NULL,
	[Student_ID] [int] NULL,
 CONSTRAINT [PK_ReportCard] PRIMARY KEY CLUSTERED 
(
	[Report_Card_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReportCard_Template]    Script Date: 2022/08/16 10:50:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReportCard_Template](
	[Report_Card_Template_ID] [int] NOT NULL,
	[Report_Card_ID] [int] NULL,
	[Report_Card_Grade] [int] NULL,
 CONSTRAINT [PK_ReportCard_Template] PRIMARY KEY CLUSTERED 
(
	[Report_Card_Template_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Schedule]    Script Date: 2022/08/16 10:50:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Schedule](
	[Schedule_ID] [int] NOT NULL,
	[School_ID] [int] NULL,
	[Schedule_details] [varchar](200) NULL,
	[Event_date] [date] NULL,
 CONSTRAINT [PK_Schedule] PRIMARY KEY CLUSTERED 
(
	[Schedule_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[School]    Script Date: 2022/08/16 10:50:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[School](
	[School_ID] [int] NOT NULL,
	[School_Name] [varchar](50) NULL,
	[School_Location] [varchar](50) NULL,
	[School_Info_Details] [varchar](50) NULL,
 CONSTRAINT [PK_School] PRIMARY KEY CLUSTERED 
(
	[School_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[School_Fees_Status]    Script Date: 2022/08/16 10:50:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[School_Fees_Status](
	[School_Fees_Status_ID] [int] NOT NULL,
	[School_Fees_Status_Description] [varchar](50) NULL,
	[Parent_Guardian_ID] [int] NULL,
 CONSTRAINT [PK_School_Fees_Status] PRIMARY KEY CLUSTERED 
(
	[School_Fees_Status_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[School_Term]    Script Date: 2022/08/16 10:50:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[School_Term](
	[School_Term_ID] [int] NOT NULL,
	[Schedule_ID] [int] NULL,
	[Student_ID] [int] NULL,
	[Report_Card_ID] [int] NULL,
	[Term_details] [varchar](500) NULL,
 CONSTRAINT [PK_School_Term] PRIMARY KEY CLUSTERED 
(
	[School_Term_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Student]    Script Date: 2022/08/16 10:50:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[Student_ID] [int] IDENTITY(1,1) NOT NULL,
	[Parent_Guardian_ID] [int] NULL,
	[Student_Name] [varchar](50) NULL,
	[Student_Surname] [varchar](50) NULL,
	[Student_Grade] [int] NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[Student_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Student_Allergy]    Script Date: 2022/08/16 10:50:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student_Allergy](
	[Student_ID] [int] NOT NULL,
	[Allergy_ID] [int] NOT NULL,
 CONSTRAINT [PK__Student___C771B64585DEEB8A] PRIMARY KEY CLUSTERED 
(
	[Student_ID] ASC,
	[Allergy_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Student_Class]    Script Date: 2022/08/16 10:50:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student_Class](
	[Student_ID] [int] NOT NULL,
	[Class_ID] [int] NOT NULL,
 CONSTRAINT [PK__Student___C9FD99F976B759C9] PRIMARY KEY CLUSTERED 
(
	[Student_ID] ASC,
	[Class_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Student_Emergency]    Script Date: 2022/08/16 10:50:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student_Emergency](
	[Student_ID] [int] NOT NULL,
	[Emergency_ID] [int] NOT NULL,
 CONSTRAINT [PK__Student___D6E6AB5C6D5B9E66] PRIMARY KEY CLUSTERED 
(
	[Student_ID] ASC,
	[Emergency_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Subcategory]    Script Date: 2022/08/16 10:50:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subcategory](
	[Subcategory_ID] [int] NOT NULL,
	[Progress_Category_ID] [int] NULL,
	[Subcategory_Details] [varchar](20) NULL,
 CONSTRAINT [PK_Subcategory] PRIMARY KEY CLUSTERED 
(
	[Subcategory_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Supplier]    Script Date: 2022/08/16 10:50:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Supplier](
	[Supplier_ID] [int] NOT NULL,
	[Supplier_Name] [varchar](20) NULL,
	[Supplier_Email_Address] [varchar](20) NULL,
	[Supplier_Contact_No] [varchar](20) NULL,
	[Supplier_Address] [varchar](20) NULL,
 CONSTRAINT [PK_Supplier] PRIMARY KEY CLUSTERED 
(
	[Supplier_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Supplier_Order]    Script Date: 2022/08/16 10:50:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Supplier_Order](
	[Supplier_Order_ID] [int] NOT NULL,
	[School_ID] [int] NULL,
	[Employee_ID] [int] NULL,
	[Supplier_ID] [int] NULL,
	[Supplier_Order_Details] [varchar](50) NULL,
 CONSTRAINT [PK_Supplier_Order] PRIMARY KEY CLUSTERED 
(
	[Supplier_Order_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Test]    Script Date: 2022/08/16 10:50:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Test](
	[Test_ID] [int] NOT NULL,
	[Report_Card_Template_ID] [int] NULL,
	[Test_Details] [varchar](200) NULL,
 CONSTRAINT [PK_Test] PRIMARY KEY CLUSTERED 
(
	[Test_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Timeslot]    Script Date: 2022/08/16 10:50:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Timeslot](
	[Timeslot_ID] [int] NOT NULL,
	[Timeslot_details] [varchar](50) NULL,
 CONSTRAINT [PK_Timeslot] PRIMARY KEY CLUSTERED 
(
	[Timeslot_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Timeslot_Schedule_Date]    Script Date: 2022/08/16 10:50:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Timeslot_Schedule_Date](
	[TimeSlot_ID] [int] NOT NULL,
	[Schedule_ID] [int] NOT NULL,
	[Date_ID] [int] NOT NULL,
 CONSTRAINT [PK__Timeslot__9B9990FDF10D07E0] PRIMARY KEY CLUSTERED 
(
	[TimeSlot_ID] ASC,
	[Schedule_ID] ASC,
	[Date_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Title]    Script Date: 2022/08/16 10:50:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Title](
	[Title_ID] [int] NOT NULL,
	[Mr] [varchar](2) NULL,
	[Mrs] [varchar](3) NULL,
	[Ms] [varchar](3) NULL,
	[Dr] [varchar](3) NULL,
 CONSTRAINT [PK_Title] PRIMARY KEY CLUSTERED 
(
	[Title_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User_Tbl]    Script Date: 2022/08/16 10:50:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User_Tbl](
	[User_Tbl_ID] [int] NOT NULL,
	[User_Type_ID] [int] NULL,
	[Username] [varchar](50) NULL,
	[Password] [nvarchar](50) NULL,
 CONSTRAINT [PK_User_Tbl] PRIMARY KEY CLUSTERED 
(
	[User_Tbl_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User_Type]    Script Date: 2022/08/16 10:50:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User_Type](
	[User_Type_ID] [int] NOT NULL,
	[User_Type] [varchar](50) NULL,
 CONSTRAINT [PK_User_Type] PRIMARY KEY CLUSTERED 
(
	[User_Type_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Zip_Code]    Script Date: 2022/08/16 10:50:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Zip_Code](
	[Zip_Code_ID] [int] NOT NULL,
	[Zip_Code_Details] [varchar](50) NULL,
 CONSTRAINT [PK_Zip_Code] PRIMARY KEY CLUSTERED 
(
	[Zip_Code_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220725142510_InitialCcreate', N'5.0.17')
GO
SET IDENTITY_INSERT [dbo].[Class_Type] ON 

INSERT [dbo].[Class_Type] ([Class_Type_ID], [Grade]) VALUES (1, 3)
INSERT [dbo].[Class_Type] ([Class_Type_ID], [Grade]) VALUES (3, 6)
INSERT [dbo].[Class_Type] ([Class_Type_ID], [Grade]) VALUES (4, 0)
INSERT [dbo].[Class_Type] ([Class_Type_ID], [Grade]) VALUES (5, 0)
SET IDENTITY_INSERT [dbo].[Class_Type] OFF
GO
SET IDENTITY_INSERT [dbo].[Employee] ON 

INSERT [dbo].[Employee] ([Employee_ID], [Name], [Surname], [Birth_Date], [Hire_Date], [Contact_No], [Email_Address], [Street_Address], [Address_2], [Province], [City], [Postal_Code]) VALUES (2, N'robinho', N'sedof', CAST(N'2022-08-03' AS Date), CAST(N'2022-08-10' AS Date), 799248290, N'uefa@email.com', N'36238 elim', N'', N'Gauteng', N'Pretoria', N'8472')
INSERT [dbo].[Employee] ([Employee_ID], [Name], [Surname], [Birth_Date], [Hire_Date], [Contact_No], [Email_Address], [Street_Address], [Address_2], [Province], [City], [Postal_Code]) VALUES (3, N'right', N'givo', CAST(N'2022-08-01' AS Date), CAST(N'2022-08-15' AS Date), 736438291, N'right@email.com', N'1223 back street', N'', N'Gauteng', N'Durban', N'0595')
INSERT [dbo].[Employee] ([Employee_ID], [Name], [Surname], [Birth_Date], [Hire_Date], [Contact_No], [Email_Address], [Street_Address], [Address_2], [Province], [City], [Postal_Code]) VALUES (4, N'stove', N'raper', CAST(N'2020-02-12' AS Date), CAST(N'2022-08-15' AS Date), 467299102, N'stove@gmail.com', N'23372 hyper', N'', N'Free State', N'Bloemfontein', N'9389')
INSERT [dbo].[Employee] ([Employee_ID], [Name], [Surname], [Birth_Date], [Hire_Date], [Contact_No], [Email_Address], [Street_Address], [Address_2], [Province], [City], [Postal_Code]) VALUES (5, N'frank', N'dery', CAST(N'2022-08-01' AS Date), CAST(N'2022-08-16' AS Date), 847291034, N'frank@email.com', N'1234 drank', N'', N'Western Cape', N'Cape Town', N'4637')
SET IDENTITY_INSERT [dbo].[Employee] OFF
GO
SET IDENTITY_INSERT [dbo].[Menu_Item] ON 

INSERT [dbo].[Menu_Item] ([Menu_Item_ID], [Menu_Item_Description], [Menu_Items_Purchased], [Menu_Item_Purchase_Date]) VALUES (1, N'ssddsdd', 10, CAST(N'2022-08-14' AS Date))
INSERT [dbo].[Menu_Item] ([Menu_Item_ID], [Menu_Item_Description], [Menu_Items_Purchased], [Menu_Item_Purchase_Date]) VALUES (2, N'coke', 20, CAST(N'2022-08-15' AS Date))
INSERT [dbo].[Menu_Item] ([Menu_Item_ID], [Menu_Item_Description], [Menu_Items_Purchased], [Menu_Item_Purchase_Date]) VALUES (3, N'Chips', 5, CAST(N'2022-08-15' AS Date))
SET IDENTITY_INSERT [dbo].[Menu_Item] OFF
GO
SET IDENTITY_INSERT [dbo].[Parent_Guardian] ON 

INSERT [dbo].[Parent_Guardian] ([Parent_Guardian_ID], [Parent_Name], [Parent_Surname], [Parent_Contact_No], [Parent_Email_Address]) VALUES (1, N'john', N'GREG', N'0737282834', N'SGDD@GMAIL.COM')
INSERT [dbo].[Parent_Guardian] ([Parent_Guardian_ID], [Parent_Name], [Parent_Surname], [Parent_Contact_No], [Parent_Email_Address]) VALUES (2, N'GUY', N'GREG', N'0790110114', N'guy@email.com')
INSERT [dbo].[Parent_Guardian] ([Parent_Guardian_ID], [Parent_Name], [Parent_Surname], [Parent_Contact_No], [Parent_Email_Address]) VALUES (4, N'halaand', N'green', N'0782837345', N'alfie@email.com')
INSERT [dbo].[Parent_Guardian] ([Parent_Guardian_ID], [Parent_Name], [Parent_Surname], [Parent_Contact_No], [Parent_Email_Address]) VALUES (7, N'Hassan', N'Hay', N'0829750642', N'Hassan@email.com')
SET IDENTITY_INSERT [dbo].[Parent_Guardian] OFF
GO
SET IDENTITY_INSERT [dbo].[Student] ON 

INSERT [dbo].[Student] ([Student_ID], [Parent_Guardian_ID], [Student_Name], [Student_Surname], [Student_Grade]) VALUES (1, 1, N'blue', N'green', 2)
INSERT [dbo].[Student] ([Student_ID], [Parent_Guardian_ID], [Student_Name], [Student_Surname], [Student_Grade]) VALUES (3, 1, N'david', N'mabuzo', 3)
INSERT [dbo].[Student] ([Student_ID], [Parent_Guardian_ID], [Student_Name], [Student_Surname], [Student_Grade]) VALUES (4, 1, N'Matri', N'givo', 4)
INSERT [dbo].[Student] ([Student_ID], [Parent_Guardian_ID], [Student_Name], [Student_Surname], [Student_Grade]) VALUES (5, 1, N'halaand', N'Mabaso', 5)
SET IDENTITY_INSERT [dbo].[Student] OFF
GO
/****** Object:  Index [IX_Application_Application_Status_ID]    Script Date: 2022/08/16 10:50:18 ******/
CREATE NONCLUSTERED INDEX [IX_Application_Application_Status_ID] ON [dbo].[Application]
(
	[Application_Status_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Application_Parent_Guardian_ID]    Script Date: 2022/08/16 10:50:18 ******/
CREATE NONCLUSTERED INDEX [IX_Application_Parent_Guardian_ID] ON [dbo].[Application]
(
	[Parent_Guardian_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Application_Student_ID]    Script Date: 2022/08/16 10:50:18 ******/
CREATE NONCLUSTERED INDEX [IX_Application_Student_ID] ON [dbo].[Application]
(
	[Student_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Appointment_Booking_Booking_Status_ID]    Script Date: 2022/08/16 10:50:18 ******/
CREATE NONCLUSTERED INDEX [IX_Appointment_Booking_Booking_Status_ID] ON [dbo].[Appointment_Booking]
(
	[Booking_Status_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Assessment_Report_Card_Template_ID]    Script Date: 2022/08/16 10:50:18 ******/
CREATE NONCLUSTERED INDEX [IX_Assessment_Report_Card_Template_ID] ON [dbo].[Assessment]
(
	[Report_Card_Template_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_City_Province_ID]    Script Date: 2022/08/16 10:50:18 ******/
CREATE NONCLUSTERED INDEX [IX_City_Province_ID] ON [dbo].[City]
(
	[Province_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Equipment_Equipment_Type_ID]    Script Date: 2022/08/16 10:50:18 ******/
CREATE NONCLUSTERED INDEX [IX_Equipment_Equipment_Type_ID] ON [dbo].[Equipment]
(
	[Equipment_Type_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Homework_Report_Card_Template_ID]    Script Date: 2022/08/16 10:50:18 ******/
CREATE NONCLUSTERED INDEX [IX_Homework_Report_Card_Template_ID] ON [dbo].[Homework]
(
	[Report_Card_Template_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Marking_Scale_Report_Card_Template_ID]    Script Date: 2022/08/16 10:50:18 ******/
CREATE NONCLUSTERED INDEX [IX_Marking_Scale_Report_Card_Template_ID] ON [dbo].[Marking_Scale]
(
	[Report_Card_Template_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Parent_Feedback_Parent_Guardian_ID]    Script Date: 2022/08/16 10:50:18 ******/
CREATE NONCLUSTERED INDEX [IX_Parent_Feedback_Parent_Guardian_ID] ON [dbo].[Parent_Feedback]
(
	[Parent_Guardian_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Progress_Category_Marking_Scale_ID]    Script Date: 2022/08/16 10:50:18 ******/
CREATE NONCLUSTERED INDEX [IX_Progress_Category_Marking_Scale_ID] ON [dbo].[Progress_Category]
(
	[Marking_Scale_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ReportCard_Student_ID]    Script Date: 2022/08/16 10:50:18 ******/
CREATE NONCLUSTERED INDEX [IX_ReportCard_Student_ID] ON [dbo].[ReportCard]
(
	[Student_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ReportCard_Template_Report_Card_ID]    Script Date: 2022/08/16 10:50:18 ******/
CREATE NONCLUSTERED INDEX [IX_ReportCard_Template_Report_Card_ID] ON [dbo].[ReportCard_Template]
(
	[Report_Card_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Schedule_School_ID]    Script Date: 2022/08/16 10:50:18 ******/
CREATE NONCLUSTERED INDEX [IX_Schedule_School_ID] ON [dbo].[Schedule]
(
	[School_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_School_Fees_Status_Parent_Guardian_ID]    Script Date: 2022/08/16 10:50:18 ******/
CREATE NONCLUSTERED INDEX [IX_School_Fees_Status_Parent_Guardian_ID] ON [dbo].[School_Fees_Status]
(
	[Parent_Guardian_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_School_Term_Report_Card_ID]    Script Date: 2022/08/16 10:50:18 ******/
CREATE NONCLUSTERED INDEX [IX_School_Term_Report_Card_ID] ON [dbo].[School_Term]
(
	[Report_Card_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_School_Term_Schedule_ID]    Script Date: 2022/08/16 10:50:18 ******/
CREATE NONCLUSTERED INDEX [IX_School_Term_Schedule_ID] ON [dbo].[School_Term]
(
	[Schedule_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_School_Term_Student_ID]    Script Date: 2022/08/16 10:50:18 ******/
CREATE NONCLUSTERED INDEX [IX_School_Term_Student_ID] ON [dbo].[School_Term]
(
	[Student_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Student_Parent_Guardian_ID]    Script Date: 2022/08/16 10:50:18 ******/
CREATE NONCLUSTERED INDEX [IX_Student_Parent_Guardian_ID] ON [dbo].[Student]
(
	[Parent_Guardian_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Subcategory_Progress_Category_ID]    Script Date: 2022/08/16 10:50:18 ******/
CREATE NONCLUSTERED INDEX [IX_Subcategory_Progress_Category_ID] ON [dbo].[Subcategory]
(
	[Progress_Category_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Supplier_Order_Employee_ID]    Script Date: 2022/08/16 10:50:18 ******/
CREATE NONCLUSTERED INDEX [IX_Supplier_Order_Employee_ID] ON [dbo].[Supplier_Order]
(
	[Employee_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Supplier_Order_School_ID]    Script Date: 2022/08/16 10:50:18 ******/
CREATE NONCLUSTERED INDEX [IX_Supplier_Order_School_ID] ON [dbo].[Supplier_Order]
(
	[School_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Supplier_Order_Supplier_ID]    Script Date: 2022/08/16 10:50:18 ******/
CREATE NONCLUSTERED INDEX [IX_Supplier_Order_Supplier_ID] ON [dbo].[Supplier_Order]
(
	[Supplier_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Test_Report_Card_Template_ID]    Script Date: 2022/08/16 10:50:18 ******/
CREATE NONCLUSTERED INDEX [IX_Test_Report_Card_Template_ID] ON [dbo].[Test]
(
	[Report_Card_Template_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_User_Tbl_User_Type_ID]    Script Date: 2022/08/16 10:50:18 ******/
CREATE NONCLUSTERED INDEX [IX_User_Tbl_User_Type_ID] ON [dbo].[User_Tbl]
(
	[User_Type_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Application]  WITH CHECK ADD  CONSTRAINT [FK__Applicati__Appli__282DF8C2] FOREIGN KEY([Application_Status_ID])
REFERENCES [dbo].[Application_Status] ([Application_Status_ID])
GO
ALTER TABLE [dbo].[Application] CHECK CONSTRAINT [FK__Applicati__Appli__282DF8C2]
GO
ALTER TABLE [dbo].[Application]  WITH CHECK ADD  CONSTRAINT [FK__Applicati__Paren__2645B050] FOREIGN KEY([Parent_Guardian_ID])
REFERENCES [dbo].[Parent_Guardian] ([Parent_Guardian_ID])
GO
ALTER TABLE [dbo].[Application] CHECK CONSTRAINT [FK__Applicati__Paren__2645B050]
GO
ALTER TABLE [dbo].[Application]  WITH CHECK ADD  CONSTRAINT [FK__Applicati__Stude__2739D489] FOREIGN KEY([Student_ID])
REFERENCES [dbo].[Student] ([Student_ID])
GO
ALTER TABLE [dbo].[Application] CHECK CONSTRAINT [FK__Applicati__Stude__2739D489]
GO
ALTER TABLE [dbo].[Appointment_Booking]  WITH CHECK ADD  CONSTRAINT [FK__Appointme__Booki__0F624AF8] FOREIGN KEY([Booking_Status_ID])
REFERENCES [dbo].[Booking_Status] ([Booking_Status_ID])
GO
ALTER TABLE [dbo].[Appointment_Booking] CHECK CONSTRAINT [FK__Appointme__Booki__0F624AF8]
GO
ALTER TABLE [dbo].[Assessment]  WITH CHECK ADD  CONSTRAINT [FK__Assessmen__Repor__68487DD7] FOREIGN KEY([Report_Card_Template_ID])
REFERENCES [dbo].[ReportCard_Template] ([Report_Card_Template_ID])
GO
ALTER TABLE [dbo].[Assessment] CHECK CONSTRAINT [FK__Assessmen__Repor__68487DD7]
GO
ALTER TABLE [dbo].[City]  WITH CHECK ADD  CONSTRAINT [FK__City__Province_I__2CF2ADDF] FOREIGN KEY([Province_ID])
REFERENCES [dbo].[Province] ([Province_ID])
GO
ALTER TABLE [dbo].[City] CHECK CONSTRAINT [FK__City__Province_I__2CF2ADDF]
GO
ALTER TABLE [dbo].[Equipment]  WITH CHECK ADD  CONSTRAINT [FK__Equipment__Equip__1AD3FDA4] FOREIGN KEY([Equipment_Type_ID])
REFERENCES [dbo].[Equipment_Type] ([Equipment_Type_ID])
GO
ALTER TABLE [dbo].[Equipment] CHECK CONSTRAINT [FK__Equipment__Equip__1AD3FDA4]
GO
ALTER TABLE [dbo].[Homework]  WITH CHECK ADD  CONSTRAINT [FK__Homework__Report__6B24EA82] FOREIGN KEY([Report_Card_Template_ID])
REFERENCES [dbo].[ReportCard_Template] ([Report_Card_Template_ID])
GO
ALTER TABLE [dbo].[Homework] CHECK CONSTRAINT [FK__Homework__Report__6B24EA82]
GO
ALTER TABLE [dbo].[Marking_Scale]  WITH CHECK ADD  CONSTRAINT [FK__Marking_S__Repor__6E01572D] FOREIGN KEY([Report_Card_Template_ID])
REFERENCES [dbo].[ReportCard_Template] ([Report_Card_Template_ID])
GO
ALTER TABLE [dbo].[Marking_Scale] CHECK CONSTRAINT [FK__Marking_S__Repor__6E01572D]
GO
ALTER TABLE [dbo].[Parent_Feedback]  WITH CHECK ADD  CONSTRAINT [FK__Parent_Fe__Paren__403A8C7D] FOREIGN KEY([Parent_Guardian_ID])
REFERENCES [dbo].[Parent_Guardian] ([Parent_Guardian_ID])
GO
ALTER TABLE [dbo].[Parent_Feedback] CHECK CONSTRAINT [FK__Parent_Fe__Paren__403A8C7D]
GO
ALTER TABLE [dbo].[Progress_Category]  WITH CHECK ADD  CONSTRAINT [FK__Progress___Marki__70DDC3D8] FOREIGN KEY([Marking_Scale_ID])
REFERENCES [dbo].[Marking_Scale] ([Marking_Scale_ID])
GO
ALTER TABLE [dbo].[Progress_Category] CHECK CONSTRAINT [FK__Progress___Marki__70DDC3D8]
GO
ALTER TABLE [dbo].[ReportCard]  WITH CHECK ADD  CONSTRAINT [FK__ReportCar__Stude__5AEE82B9] FOREIGN KEY([Student_ID])
REFERENCES [dbo].[Student] ([Student_ID])
GO
ALTER TABLE [dbo].[ReportCard] CHECK CONSTRAINT [FK__ReportCar__Stude__5AEE82B9]
GO
ALTER TABLE [dbo].[ReportCard_Template]  WITH CHECK ADD  CONSTRAINT [FK__ReportCar__Repor__628FA481] FOREIGN KEY([Report_Card_ID])
REFERENCES [dbo].[ReportCard] ([Report_Card_ID])
GO
ALTER TABLE [dbo].[ReportCard_Template] CHECK CONSTRAINT [FK__ReportCar__Repor__628FA481]
GO
ALTER TABLE [dbo].[Schedule]  WITH CHECK ADD  CONSTRAINT [FK__Schedule__School__5812160E] FOREIGN KEY([School_ID])
REFERENCES [dbo].[School] ([School_ID])
GO
ALTER TABLE [dbo].[Schedule] CHECK CONSTRAINT [FK__Schedule__School__5812160E]
GO
ALTER TABLE [dbo].[School_Fees_Status]  WITH CHECK ADD  CONSTRAINT [FK__School_Fe__Paren__123EB7A3] FOREIGN KEY([Parent_Guardian_ID])
REFERENCES [dbo].[Parent_Guardian] ([Parent_Guardian_ID])
GO
ALTER TABLE [dbo].[School_Fees_Status] CHECK CONSTRAINT [FK__School_Fe__Paren__123EB7A3]
GO
ALTER TABLE [dbo].[School_Term]  WITH CHECK ADD  CONSTRAINT [FK__School_Te__Repor__5FB337D6] FOREIGN KEY([Report_Card_ID])
REFERENCES [dbo].[ReportCard] ([Report_Card_ID])
GO
ALTER TABLE [dbo].[School_Term] CHECK CONSTRAINT [FK__School_Te__Repor__5FB337D6]
GO
ALTER TABLE [dbo].[School_Term]  WITH CHECK ADD  CONSTRAINT [FK__School_Te__Sched__5DCAEF64] FOREIGN KEY([Schedule_ID])
REFERENCES [dbo].[Schedule] ([Schedule_ID])
GO
ALTER TABLE [dbo].[School_Term] CHECK CONSTRAINT [FK__School_Te__Sched__5DCAEF64]
GO
ALTER TABLE [dbo].[School_Term]  WITH CHECK ADD  CONSTRAINT [FK__School_Te__Stude__5EBF139D] FOREIGN KEY([Student_ID])
REFERENCES [dbo].[Student] ([Student_ID])
GO
ALTER TABLE [dbo].[School_Term] CHECK CONSTRAINT [FK__School_Te__Stude__5EBF139D]
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK__Student__Parent___4316F928] FOREIGN KEY([Parent_Guardian_ID])
REFERENCES [dbo].[Parent_Guardian] ([Parent_Guardian_ID])
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [FK__Student__Parent___4316F928]
GO
ALTER TABLE [dbo].[Subcategory]  WITH CHECK ADD  CONSTRAINT [FK__Subcatego__Progr__73BA3083] FOREIGN KEY([Progress_Category_ID])
REFERENCES [dbo].[Progress_Category] ([Progress_Category_ID])
GO
ALTER TABLE [dbo].[Subcategory] CHECK CONSTRAINT [FK__Subcatego__Progr__73BA3083]
GO
ALTER TABLE [dbo].[Supplier_Order]  WITH CHECK ADD  CONSTRAINT [FK__Supplier___Emplo__208CD6FA] FOREIGN KEY([Employee_ID])
REFERENCES [dbo].[Employee] ([Employee_ID])
GO
ALTER TABLE [dbo].[Supplier_Order] CHECK CONSTRAINT [FK__Supplier___Emplo__208CD6FA]
GO
ALTER TABLE [dbo].[Supplier_Order]  WITH CHECK ADD  CONSTRAINT [FK__Supplier___Schoo__1F98B2C1] FOREIGN KEY([School_ID])
REFERENCES [dbo].[School] ([School_ID])
GO
ALTER TABLE [dbo].[Supplier_Order] CHECK CONSTRAINT [FK__Supplier___Schoo__1F98B2C1]
GO
ALTER TABLE [dbo].[Supplier_Order]  WITH CHECK ADD  CONSTRAINT [FK__Supplier___Suppl__2180FB33] FOREIGN KEY([Supplier_ID])
REFERENCES [dbo].[Supplier] ([Supplier_ID])
GO
ALTER TABLE [dbo].[Supplier_Order] CHECK CONSTRAINT [FK__Supplier___Suppl__2180FB33]
GO
ALTER TABLE [dbo].[Test]  WITH CHECK ADD  CONSTRAINT [FK__Test__Report_Car__656C112C] FOREIGN KEY([Report_Card_Template_ID])
REFERENCES [dbo].[ReportCard_Template] ([Report_Card_Template_ID])
GO
ALTER TABLE [dbo].[Test] CHECK CONSTRAINT [FK__Test__Report_Car__656C112C]
GO
ALTER TABLE [dbo].[User_Tbl]  WITH CHECK ADD  CONSTRAINT [FK__User_Tbl__User_T__4F7CD00D] FOREIGN KEY([User_Type_ID])
REFERENCES [dbo].[User_Type] ([User_Type_ID])
GO
ALTER TABLE [dbo].[User_Tbl] CHECK CONSTRAINT [FK__User_Tbl__User_T__4F7CD00D]
GO
USE [master]
GO
ALTER DATABASE [CrayonKids] SET  READ_WRITE 
GO
