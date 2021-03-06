USE [master]
GO
/****** Object:  Database [LiseOtomasyon]    Script Date: 7.7.2016 21:17:43 ******/
CREATE DATABASE [LiseOtomasyon]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'LiseOtomasyon', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\LiseOtomasyon.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'LiseOtomasyon_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\LiseOtomasyon_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [LiseOtomasyon] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [LiseOtomasyon].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [LiseOtomasyon] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [LiseOtomasyon] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [LiseOtomasyon] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [LiseOtomasyon] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [LiseOtomasyon] SET ARITHABORT OFF 
GO
ALTER DATABASE [LiseOtomasyon] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [LiseOtomasyon] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [LiseOtomasyon] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [LiseOtomasyon] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [LiseOtomasyon] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [LiseOtomasyon] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [LiseOtomasyon] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [LiseOtomasyon] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [LiseOtomasyon] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [LiseOtomasyon] SET  DISABLE_BROKER 
GO
ALTER DATABASE [LiseOtomasyon] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [LiseOtomasyon] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [LiseOtomasyon] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [LiseOtomasyon] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [LiseOtomasyon] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [LiseOtomasyon] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [LiseOtomasyon] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [LiseOtomasyon] SET RECOVERY FULL 
GO
ALTER DATABASE [LiseOtomasyon] SET  MULTI_USER 
GO
ALTER DATABASE [LiseOtomasyon] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [LiseOtomasyon] SET DB_CHAINING OFF 
GO
ALTER DATABASE [LiseOtomasyon] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [LiseOtomasyon] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [LiseOtomasyon] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'LiseOtomasyon', N'ON'
GO
USE [LiseOtomasyon]
GO
/****** Object:  Table [dbo].[Ders]    Script Date: 7.7.2016 21:17:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ders](
	[DersID] [int] NOT NULL,
	[DersAdi] [nvarchar](50) NOT NULL,
	[Ders_OgretmenID] [int] NOT NULL,
	[Ders_SubeID] [int] NOT NULL,
 CONSTRAINT [PK_Ders] PRIMARY KEY CLUSTERED 
(
	[DersID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Ogrenci]    Script Date: 7.7.2016 21:17:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ogrenci](
	[OgrenciNo] [int] NOT NULL,
	[Ogrenci_SubeID] [int] NOT NULL,
	[Ad] [nvarchar](50) NOT NULL,
	[Soyad] [nvarchar](50) NOT NULL,
	[Adres] [nvarchar](50) NULL,
	[Telefon] [nvarchar](50) NOT NULL,
	[EMail] [nvarchar](50) NULL,
	[DogumTarihi] [smalldatetime] NOT NULL,
 CONSTRAINT [PK_Ogrenci] PRIMARY KEY CLUSTERED 
(
	[OgrenciNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OgrenciDers]    Script Date: 7.7.2016 21:17:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OgrenciDers](
	[OgrenciNo] [int] NOT NULL,
	[DersID] [int] NOT NULL,
	[Donem] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK_OgrenciDers] PRIMARY KEY CLUSTERED 
(
	[OgrenciNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OgrenciNot]    Script Date: 7.7.2016 21:17:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OgrenciNot](
	[OgrenciNo] [int] NOT NULL,
	[DersID] [int] NOT NULL,
	[Sinav] [int] NOT NULL,
	[Quiz] [int] NOT NULL,
	[Proje] [int] NOT NULL,
	[Ortalama] [decimal](18, 2) NOT NULL,
	[BasariDurumu] [bit] NOT NULL,
 CONSTRAINT [PK_OgrenciNot] PRIMARY KEY CLUSTERED 
(
	[OgrenciNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Ogretmen]    Script Date: 7.7.2016 21:17:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ogretmen](
	[OgretmenID] [int] NOT NULL,
	[Ogretmen_SubeID] [int] NOT NULL,
	[Ad] [nvarchar](50) NOT NULL,
	[Soyad] [nvarchar](50) NOT NULL,
	[Adres] [nvarchar](50) NULL,
	[Telefon] [nvarchar](50) NOT NULL,
	[EMail] [nvarchar](50) NULL,
	[DogumTarihi] [smalldatetime] NOT NULL,
 CONSTRAINT [PK_Ogretmen] PRIMARY KEY CLUSTERED 
(
	[OgretmenID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Sinif]    Script Date: 7.7.2016 21:17:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sinif](
	[SınıfID] [int] NOT NULL,
	[SınıfNo] [int] NOT NULL,
 CONSTRAINT [PK_Sinif] PRIMARY KEY CLUSTERED 
(
	[SınıfID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Sube]    Script Date: 7.7.2016 21:17:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sube](
	[SubeID] [int] NOT NULL,
	[Sube_SınifID] [int] NOT NULL,
	[SubeHarfi] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK_Sube] PRIMARY KEY CLUSTERED 
(
	[SubeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[Ders]  WITH CHECK ADD  CONSTRAINT [FK_Ders_Ogretmen] FOREIGN KEY([Ders_OgretmenID])
REFERENCES [dbo].[Ogretmen] ([OgretmenID])
GO
ALTER TABLE [dbo].[Ders] CHECK CONSTRAINT [FK_Ders_Ogretmen]
GO
ALTER TABLE [dbo].[Ders]  WITH CHECK ADD  CONSTRAINT [FK_Ders_Sube] FOREIGN KEY([Ders_SubeID])
REFERENCES [dbo].[Sube] ([SubeID])
GO
ALTER TABLE [dbo].[Ders] CHECK CONSTRAINT [FK_Ders_Sube]
GO
ALTER TABLE [dbo].[Ogrenci]  WITH CHECK ADD  CONSTRAINT [FK_Ogrenci_Sube] FOREIGN KEY([Ogrenci_SubeID])
REFERENCES [dbo].[Sube] ([SubeID])
GO
ALTER TABLE [dbo].[Ogrenci] CHECK CONSTRAINT [FK_Ogrenci_Sube]
GO
ALTER TABLE [dbo].[OgrenciDers]  WITH CHECK ADD  CONSTRAINT [FK_OgrenciDers_Ders] FOREIGN KEY([DersID])
REFERENCES [dbo].[Ders] ([DersID])
GO
ALTER TABLE [dbo].[OgrenciDers] CHECK CONSTRAINT [FK_OgrenciDers_Ders]
GO
ALTER TABLE [dbo].[OgrenciDers]  WITH CHECK ADD  CONSTRAINT [FK_OgrenciDers_Ogrenci] FOREIGN KEY([OgrenciNo])
REFERENCES [dbo].[Ogrenci] ([OgrenciNo])
GO
ALTER TABLE [dbo].[OgrenciDers] CHECK CONSTRAINT [FK_OgrenciDers_Ogrenci]
GO
ALTER TABLE [dbo].[OgrenciDers]  WITH CHECK ADD  CONSTRAINT [FK_OgrenciDers_Sube] FOREIGN KEY([DersID])
REFERENCES [dbo].[Sube] ([SubeID])
GO
ALTER TABLE [dbo].[OgrenciDers] CHECK CONSTRAINT [FK_OgrenciDers_Sube]
GO
ALTER TABLE [dbo].[OgrenciNot]  WITH CHECK ADD  CONSTRAINT [FK_OgrenciNot_Ders] FOREIGN KEY([DersID])
REFERENCES [dbo].[Ders] ([DersID])
GO
ALTER TABLE [dbo].[OgrenciNot] CHECK CONSTRAINT [FK_OgrenciNot_Ders]
GO
ALTER TABLE [dbo].[OgrenciNot]  WITH CHECK ADD  CONSTRAINT [FK_OgrenciNot_Ogrenci] FOREIGN KEY([OgrenciNo])
REFERENCES [dbo].[Ogrenci] ([OgrenciNo])
GO
ALTER TABLE [dbo].[OgrenciNot] CHECK CONSTRAINT [FK_OgrenciNot_Ogrenci]
GO
ALTER TABLE [dbo].[Ogretmen]  WITH CHECK ADD  CONSTRAINT [FK_Ogretmen_Sube] FOREIGN KEY([Ogretmen_SubeID])
REFERENCES [dbo].[Sube] ([SubeID])
GO
ALTER TABLE [dbo].[Ogretmen] CHECK CONSTRAINT [FK_Ogretmen_Sube]
GO
ALTER TABLE [dbo].[Sube]  WITH CHECK ADD  CONSTRAINT [FK_Sube_Sinif] FOREIGN KEY([Sube_SınifID])
REFERENCES [dbo].[Sinif] ([SınıfID])
GO
ALTER TABLE [dbo].[Sube] CHECK CONSTRAINT [FK_Sube_Sinif]
GO
USE [master]
GO
ALTER DATABASE [LiseOtomasyon] SET  READ_WRITE 
GO
