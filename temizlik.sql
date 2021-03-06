USE [master]
GO
/****** Object:  Database [temizliksektoru]    Script Date: 9.9.2017 20:42:37 ******/
CREATE DATABASE [temizliksektoru]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'temizliksektoru', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\temizliksektoru.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'temizliksektoru_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\temizliksektoru_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [temizliksektoru] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [temizliksektoru].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [temizliksektoru] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [temizliksektoru] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [temizliksektoru] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [temizliksektoru] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [temizliksektoru] SET ARITHABORT OFF 
GO
ALTER DATABASE [temizliksektoru] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [temizliksektoru] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [temizliksektoru] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [temizliksektoru] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [temizliksektoru] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [temizliksektoru] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [temizliksektoru] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [temizliksektoru] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [temizliksektoru] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [temizliksektoru] SET  DISABLE_BROKER 
GO
ALTER DATABASE [temizliksektoru] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [temizliksektoru] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [temizliksektoru] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [temizliksektoru] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [temizliksektoru] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [temizliksektoru] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [temizliksektoru] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [temizliksektoru] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [temizliksektoru] SET  MULTI_USER 
GO
ALTER DATABASE [temizliksektoru] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [temizliksektoru] SET DB_CHAINING OFF 
GO
ALTER DATABASE [temizliksektoru] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [temizliksektoru] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [temizliksektoru] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'temizliksektoru', N'ON'
GO
ALTER DATABASE [temizliksektoru] SET QUERY_STORE = OFF
GO
USE [temizliksektoru]
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
USE [temizliksektoru]
GO
/****** Object:  User [user3FE6E78582]    Script Date: 9.9.2017 20:43:00 ******/
CREATE USER [user3FE6E78582] FOR LOGIN [user3FE6E78582] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Anketler]    Script Date: 9.9.2017 20:43:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Anketler](
	[AnketId] [int] IDENTITY(1,1) NOT NULL,
	[ip] [nvarchar](50) NULL,
	[KurumId] [int] NULL,
	[OgrencininAdi] [nvarchar](150) NULL,
	[OgrencininSinifi] [nvarchar](150) NULL,
	[EnSevdiginizOgretmenveBransi] [int] NULL,
	[EnSevdiginizOgretmenvNedeni] [nvarchar](250) NULL,
	[EnSevdiginizYonetici] [int] NULL,
	[EnSevdiginizYoneticiNedeni] [nvarchar](250) NULL,
	[Tarih] [datetime] NULL,
	[Yil] [int] NULL,
	[Ay] [int] NULL,
 CONSTRAINT [PK_Anketler] PRIMARY KEY CLUSTERED 
(
	[AnketId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KurumEgitimciler]    Script Date: 9.9.2017 20:43:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KurumEgitimciler](
	[EgitimciId] [int] IDENTITY(1,1) NOT NULL,
	[KurumId] [int] NOT NULL,
	[Resim] [nvarchar](50) NULL,
	[Tip] [int] NOT NULL,
	[Aciklama] [nvarchar](250) NULL,
 CONSTRAINT [PK_KurumEgitimciler] PRIMARY KEY CLUSTERED 
(
	[EgitimciId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Kurumlar]    Script Date: 9.9.2017 20:43:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kurumlar](
	[KurumId] [int] IDENTITY(1,1) NOT NULL,
	[KategoriId] [int] NULL,
	[AltKategoriId] [int] NULL,
	[ilId] [int] NULL,
	[ilceId] [int] NULL,
	[KurumAdi] [nvarchar](150) NULL,
	[Slug] [nvarchar](150) NULL,
	[UploadYolu] [nvarchar](150) NULL,
	[Resim] [nvarchar](50) NULL,
	[KurumMuduru] [nvarchar](150) NULL,
	[MudurYardimcilari] [nvarchar](250) NULL,
	[Aktiviteler] [nvarchar](250) NULL,
	[Aciklama] [nvarchar](max) NULL,
	[KurulusTarih] [nvarchar](50) NULL,
	[WebSitesi] [nvarchar](100) NULL,
	[Tel] [nvarchar](50) NULL,
	[Fax] [nvarchar](50) NULL,
	[Harita] [nvarchar](max) NULL,
	[Video] [nvarchar](max) NULL,
	[Email] [nvarchar](100) NULL,
	[Adres] [nvarchar](250) NULL,
	[Durum] [bit] NOT NULL,
	[Subeler] [nvarchar](250) NULL,
	[Kurucusu] [nvarchar](250) NULL,
	[Egitimciler] [nvarchar](500) NULL,
	[Panoroma] [nvarchar](max) NULL,
	[TicSicNo] [nvarchar](250) NULL,
	[KaliteBelgeNo] [nvarchar](250) NULL,
	[FiyatAraligi] [nvarchar](250) NULL,
	[TeslimSuresi] [nvarchar](250) NULL,
	[GarantiSuresi] [nvarchar](250) NULL,
	[MakineCesitleri] [nvarchar](500) NULL,
	[MakineOzellikleri] [nvarchar](500) NULL,
	[DigerMakinalar] [nvarchar](500) NULL,
	[BagliDernek] [nvarchar](500) NULL,
	[YaptigiHizmetler] [nvarchar](500) NULL,
	[Referanslar] [nvarchar](500) NULL,
	[ServisBolgeleri] [nvarchar](500) NULL,
	[Sponsorlar] [nvarchar](500) NULL,
	[D3Boyutlu] [nvarchar](500) NULL,
 CONSTRAINT [PK_Kurumlar] PRIMARY KEY CLUSTERED 
(
	[KurumId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[VW_Anketler]    Script Date: 9.9.2017 20:43:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[VW_Anketler]
AS
SELECT        dbo.Anketler.AnketId, dbo.Anketler.ip, dbo.Anketler.KurumId, dbo.Anketler.OgrencininAdi, dbo.Anketler.OgrencininSinifi, dbo.Anketler.EnSevdiginizOgretmenveBransi, dbo.Anketler.EnSevdiginizOgretmenvNedeni, 
                         dbo.Anketler.EnSevdiginizYonetici, dbo.Anketler.EnSevdiginizYoneticiNedeni, dbo.Anketler.Tarih, dbo.Anketler.Yil, dbo.Anketler.Ay, dbo.Kurumlar.KategoriId, dbo.Kurumlar.AltKategoriId, dbo.Kurumlar.ilId, dbo.Kurumlar.ilceId, 
                         dbo.Kurumlar.KurumAdi, dbo.Kurumlar.UploadYolu, dbo.Kurumlar.Resim, dbo.Kurumlar.KurumMuduru, dbo.Kurumlar.MudurYardimcilari, dbo.Kurumlar.Aktiviteler, dbo.Kurumlar.Aciklama, dbo.Kurumlar.KurulusTarih, 
                         dbo.Kurumlar.WebSitesi, dbo.Kurumlar.Tel, dbo.Kurumlar.Fax, dbo.Kurumlar.Harita, dbo.Kurumlar.Video, dbo.Kurumlar.Email, dbo.Kurumlar.Adres, dbo.Kurumlar.Subeler, dbo.Kurumlar.Kurucusu, dbo.Kurumlar.Egitimciler, 
                         dbo.Kurumlar.Panoroma, KurumEgitimciler_1.Aciklama AS EnSevdiginizEgitimciAdiSoyadi, dbo.KurumEgitimciler.Aciklama AS EnSevdiginizYoneticiAdiSoyadi, 
                         KurumEgitimciler_1.Resim AS EnSevdiginizEgitimciAdiSoyadiResim, dbo.KurumEgitimciler.Resim AS EnSevdiginizYoneticiAdiSoyadiResim
FROM            dbo.Anketler LEFT OUTER JOIN
                         dbo.KurumEgitimciler ON dbo.Anketler.EnSevdiginizYonetici = dbo.KurumEgitimciler.EgitimciId LEFT OUTER JOIN
                         dbo.KurumEgitimciler AS KurumEgitimciler_1 ON dbo.Anketler.EnSevdiginizOgretmenveBransi = KurumEgitimciler_1.EgitimciId LEFT OUTER JOIN
                         dbo.Kurumlar ON dbo.Anketler.KurumId = dbo.Kurumlar.KurumId


GO
/****** Object:  View [dbo].[VW_Eniyikurum]    Script Date: 9.9.2017 20:43:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*En iyi kurum*/
CREATE VIEW [dbo].[VW_Eniyikurum]
AS
SELECT        TOP (100) PERCENT KurumId, KurumAdi, COUNT(KurumId) AS sayi
FROM            dbo.VW_Anketler
GROUP BY KurumId, KurumAdi
ORDER BY sayi DESC


GO
/****** Object:  View [dbo].[VW_EniyiEgitimci]    Script Date: 9.9.2017 20:43:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*En iyi eğitimci*/
CREATE VIEW [dbo].[VW_EniyiEgitimci]
AS
SELECT        TOP (100) PERCENT EnSevdiginizEgitimciAdiSoyadi, KurumAdi, COUNT(KurumId) AS sayi
FROM            dbo.VW_Anketler
GROUP BY EnSevdiginizEgitimciAdiSoyadi, KurumAdi
ORDER BY sayi DESC


GO
/****** Object:  View [dbo].[VW_EniyiYonetici]    Script Date: 9.9.2017 20:43:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*En iyi yönetici*/
CREATE VIEW [dbo].[VW_EniyiYonetici]
AS
SELECT        TOP (100) PERCENT EnSevdiginizYoneticiAdiSoyadi, KurumAdi, COUNT(KurumId) AS sayi
FROM            dbo.VW_Anketler
GROUP BY EnSevdiginizYoneticiAdiSoyadi, KurumAdi
ORDER BY sayi DESC


GO
/****** Object:  Table [dbo].[Adminler]    Script Date: 9.9.2017 20:43:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Adminler](
	[AdminId] [int] IDENTITY(1,1) NOT NULL,
	[AdSoyad] [nvarchar](50) NOT NULL,
	[Mail] [nvarchar](50) NOT NULL,
	[Sifre] [nvarchar](100) NOT NULL,
	[Aktif] [bit] NOT NULL,
	[Owner] [bit] NOT NULL,
 CONSTRAINT [PK_Admin] PRIMARY KEY CLUSTERED 
(
	[AdminId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AdminRolIliski]    Script Date: 9.9.2017 20:43:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AdminRolIliski](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RolId] [int] NULL,
	[AdminId] [int] NULL,
 CONSTRAINT [PK_AdminRolIliski] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AdminRolleri]    Script Date: 9.9.2017 20:43:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AdminRolleri](
	[RolId] [int] IDENTITY(1,1) NOT NULL,
	[RolAdi] [nvarchar](50) NULL,
 CONSTRAINT [PK_AdminRol] PRIMARY KEY CLUSTERED 
(
	[RolId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AltKategoriler]    Script Date: 9.9.2017 20:43:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AltKategoriler](
	[AltKategoriId] [int] IDENTITY(1,1) NOT NULL,
	[AltKategoriAdi] [nvarchar](100) NOT NULL,
	[Ikon] [nvarchar](100) NULL,
	[Slug] [nvarchar](100) NOT NULL,
	[Url] [nvarchar](200) NULL,
	[Aktif] [bit] NOT NULL,
	[Area] [bit] NOT NULL,
	[Depart] [bit] NOT NULL,
	[KategoriId] [int] NOT NULL,
	[Sira] [int] NOT NULL,
 CONSTRAINT [PK_AltKategoriler_1] PRIMARY KEY CLUSTERED 
(
	[AltKategoriId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Bulten]    Script Date: 9.9.2017 20:43:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bulten](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Mail] [nvarchar](100) NOT NULL,
	[Ip] [nvarchar](100) NOT NULL,
	[Tarih] [datetime] NOT NULL,
 CONSTRAINT [PK_Bulten] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cozumler]    Script Date: 9.9.2017 20:43:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cozumler](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Ad] [nvarchar](100) NOT NULL,
	[Slug] [nvarchar](100) NOT NULL,
	[Detay] [nvarchar](max) NULL,
	[Url] [nvarchar](100) NULL,
	[Aktif] [bit] NOT NULL,
	[KategoriId] [tinyint] NOT NULL,
 CONSTRAINT [PK_Cozumler] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DosyaYoneticisi]    Script Date: 9.9.2017 20:43:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DosyaYoneticisi](
	[DosyaId] [int] IDENTITY(1,1) NOT NULL,
	[DosyaAdi] [nvarchar](50) NOT NULL,
	[Url] [nvarchar](100) NOT NULL,
	[Ikon] [nvarchar](50) NULL,
	[Boyut] [nvarchar](50) NULL,
	[Uzanti] [nvarchar](20) NULL,
	[Tarih] [datetime] NOT NULL,
 CONSTRAINT [PK_DosyaYoneticisi] PRIMARY KEY CLUSTERED 
(
	[DosyaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ELMAH_Error]    Script Date: 9.9.2017 20:43:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ELMAH_Error](
	[ErrorId] [uniqueidentifier] NOT NULL,
	[Application] [nvarchar](60) NOT NULL,
	[Host] [nvarchar](50) NOT NULL,
	[Type] [nvarchar](100) NOT NULL,
	[Source] [nvarchar](60) NOT NULL,
	[Message] [nvarchar](500) NOT NULL,
	[User] [nvarchar](50) NOT NULL,
	[StatusCode] [int] NOT NULL,
	[TimeUtc] [datetime] NOT NULL,
	[Sequence] [int] IDENTITY(1,1) NOT NULL,
	[AllXml] [ntext] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Galeri]    Script Date: 9.9.2017 20:43:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Galeri](
	[GaleriId] [int] IDENTITY(1,1) NOT NULL,
	[GaleriAdi] [nvarchar](100) NOT NULL,
	[GaleriYolu] [nvarchar](100) NOT NULL,
	[Aktif] [bit] NOT NULL,
 CONSTRAINT [PK_Galeriler] PRIMARY KEY CLUSTERED 
(
	[GaleriId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GaleriResim]    Script Date: 9.9.2017 20:43:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GaleriResim](
	[ResimId] [int] IDENTITY(1,1) NOT NULL,
	[GaleriId] [int] NOT NULL,
	[Resim] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_GaleriResim] PRIMARY KEY CLUSTERED 
(
	[ResimId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HaberKategorileri]    Script Date: 9.9.2017 20:43:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HaberKategorileri](
	[KategoriId] [int] IDENTITY(1,1) NOT NULL,
	[Ad] [nvarchar](100) NOT NULL,
	[Slug] [nvarchar](100) NOT NULL,
	[Url] [nvarchar](200) NULL,
	[Aktif] [bit] NOT NULL,
 CONSTRAINT [PK_HaberKategorileri] PRIMARY KEY CLUSTERED 
(
	[KategoriId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Haberler]    Script Date: 9.9.2017 20:43:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Haberler](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Ad] [nvarchar](500) NOT NULL,
	[Resim] [nvarchar](500) NULL,
	[Slug] [nvarchar](500) NOT NULL,
	[Detay] [nvarchar](max) NULL,
	[Aktif] [bit] NOT NULL,
	[KategoriId] [int] NOT NULL,
	[GaleriId] [int] NULL,
	[Tarih] [datetime] NOT NULL,
	[Hit] [int] NOT NULL,
 CONSTRAINT [PK_Haberler] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HaberlerResim]    Script Date: 9.9.2017 20:43:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HaberlerResim](
	[ResimId] [int] IDENTITY(1,1) NOT NULL,
	[HaberlerId] [int] NOT NULL,
	[Resim] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_HaberlerResim] PRIMARY KEY CLUSTERED 
(
	[ResimId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ilceler]    Script Date: 9.9.2017 20:43:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ilceler](
	[ilceId] [int] IDENTITY(1,1) NOT NULL,
	[ilId] [int] NOT NULL,
	[ilceAdi] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Counties] PRIMARY KEY CLUSTERED 
(
	[ilceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[iletisim]    Script Date: 9.9.2017 20:43:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[iletisim](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Telefon] [nvarchar](100) NOT NULL,
	[Faks] [nvarchar](100) NULL,
	[Mail] [nvarchar](100) NOT NULL,
	[Harita] [nvarchar](max) NULL,
	[Adres] [nvarchar](max) NULL,
	[Mailler] [nvarchar](500) NOT NULL,
	[DestekMailler] [nvarchar](500) NULL,
	[SmtpPort] [int] NOT NULL,
	[SmtpMail] [nvarchar](100) NOT NULL,
	[SmtpAdres] [nvarchar](100) NOT NULL,
	[Sifre] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_iletisim] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[iller]    Script Date: 9.9.2017 20:43:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[iller](
	[ilId] [int] IDENTITY(1,1) NOT NULL,
	[UlkeId] [int] NOT NULL,
	[ilAdi] [nvarchar](100) NOT NULL,
	[PlakaNo] [nvarchar](2) NOT NULL,
	[TelKodu] [nvarchar](7) NOT NULL,
 CONSTRAINT [PK_Cities] PRIMARY KEY CLUSTERED 
(
	[ilId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Kategoriler]    Script Date: 9.9.2017 20:43:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kategoriler](
	[KategoriId] [int] IDENTITY(1,1) NOT NULL,
	[KategoriAdi] [nvarchar](100) NOT NULL,
	[Ikon] [nvarchar](100) NULL,
	[Slug] [nvarchar](100) NOT NULL,
	[Url] [nvarchar](200) NULL,
	[Aktif] [bit] NOT NULL,
	[Area] [bit] NOT NULL,
	[Depart] [bit] NOT NULL,
	[Sira] [int] NOT NULL,
 CONSTRAINT [PK_Kategoriler_1] PRIMARY KEY CLUSTERED 
(
	[KategoriId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KurumResim]    Script Date: 9.9.2017 20:43:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KurumResim](
	[ResimId] [int] IDENTITY(1,1) NOT NULL,
	[KurumId] [int] NOT NULL,
	[Resim] [nvarchar](50) NULL,
	[ResimTipi] [int] NOT NULL,
	[Aciklama] [nvarchar](250) NULL,
 CONSTRAINT [PK_KurumResim] PRIMARY KEY CLUSTERED 
(
	[ResimId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Markalar]    Script Date: 9.9.2017 20:43:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Markalar](
	[MarkaId] [int] IDENTITY(1,1) NOT NULL,
	[MarkaAdi] [nvarchar](100) NOT NULL,
	[Aciklama] [nvarchar](max) NULL,
	[Resim] [nvarchar](50) NULL,
	[Slug] [nvarchar](50) NULL,
	[Aktif] [bit] NOT NULL,
	[Area] [bit] NOT NULL,
	[Depart] [bit] NOT NULL,
	[Sira] [int] NULL,
 CONSTRAINT [PK_Markalar] PRIMARY KEY CLUSTERED 
(
	[MarkaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MetaTag]    Script Date: 9.9.2017 20:43:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MetaTag](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](200) NOT NULL,
	[Description] [nvarchar](500) NOT NULL,
	[Keywords] [nvarchar](500) NOT NULL,
	[Facebook] [nvarchar](100) NULL,
	[Twitter] [nvarchar](100) NULL,
	[GooglePlus] [nvarchar](100) NULL,
	[Linkedin] [nvarchar](100) NULL,
	[Youtube] [nvarchar](100) NULL,
	[Diger] [nvarchar](100) NULL,
	[SiteLogo] [nvarchar](50) NULL,
 CONSTRAINT [PK_MetaTag] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Popup]    Script Date: 9.9.2017 20:43:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Popup](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Baslik] [nvarchar](100) NOT NULL,
	[Aciklama] [nvarchar](max) NOT NULL,
	[AcilisSekli] [tinyint] NOT NULL,
	[Durum] [bit] NOT NULL,
 CONSTRAINT [PK_Popup] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reklamlar]    Script Date: 9.9.2017 20:43:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reklamlar](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[KategorKodu] [nvarchar](100) NOT NULL,
	[Url] [nvarchar](500) NOT NULL,
	[Target] [nvarchar](50) NOT NULL,
	[Resim] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_UstKayanReklamlar] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sayfalar]    Script Date: 9.9.2017 20:43:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sayfalar](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Ad] [nvarchar](100) NOT NULL,
	[Slug] [nvarchar](100) NOT NULL,
	[Detay] [nvarchar](max) NULL,
	[Url] [nvarchar](100) NULL,
	[Aktif] [bit] NOT NULL,
	[Menu] [bit] NOT NULL,
	[iletisimFormu] [bit] NOT NULL,
	[KategoriId] [tinyint] NOT NULL,
	[GaleriId] [int] NULL,
 CONSTRAINT [PK_Sayfalar_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Slider]    Script Date: 9.9.2017 20:43:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Slider](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SliderId] [int] NOT NULL,
	[Baslik] [nvarchar](1000) NOT NULL,
	[Url] [nvarchar](1000) NOT NULL,
	[Target] [nvarchar](50) NOT NULL,
	[Resim] [nvarchar](50) NOT NULL,
	[Sira] [int] NOT NULL,
	[Aktif] [bit] NULL,
	[Tarih] [datetime] NULL,
 CONSTRAINT [PK_Slider] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SliderKategori]    Script Date: 9.9.2017 20:43:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SliderKategori](
	[SliderId] [int] IDENTITY(1,1) NOT NULL,
	[SliderAdi] [nvarchar](100) NOT NULL,
	[Durum] [bit] NOT NULL,
	[Kod] [varchar](50) NULL,
 CONSTRAINT [PK_SliderKategori] PRIMARY KEY CLUSTERED 
(
	[SliderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Adminler] ON 

INSERT [dbo].[Adminler] ([AdminId], [AdSoyad], [Mail], [Sifre], [Aktif], [Owner]) VALUES (1, N'Kazım Gökhan', N'demo@demo.net', N'YmIxMjM0NTY=', 1, 1)
SET IDENTITY_INSERT [dbo].[Adminler] OFF
SET IDENTITY_INSERT [dbo].[AdminRolIliski] ON 

INSERT [dbo].[AdminRolIliski] ([Id], [RolId], [AdminId]) VALUES (1, 1, 1)
SET IDENTITY_INSERT [dbo].[AdminRolIliski] OFF
SET IDENTITY_INSERT [dbo].[AdminRolleri] ON 

INSERT [dbo].[AdminRolleri] ([RolId], [RolAdi]) VALUES (1, N'Admin')
SET IDENTITY_INSERT [dbo].[AdminRolleri] OFF
SET IDENTITY_INSERT [dbo].[AltKategoriler] ON 

INSERT [dbo].[AltKategoriler] ([AltKategoriId], [AltKategoriAdi], [Ikon], [Slug], [Url], [Aktif], [Area], [Depart], [KategoriId], [Sira]) VALUES (89, N'Çamaşırhaneler', NULL, N'camasirhaneler-1', N'#', 1, 0, 1, 27, 2)
INSERT [dbo].[AltKategoriler] ([AltKategoriId], [AltKategoriAdi], [Ikon], [Slug], [Url], [Aktif], [Area], [Depart], [KategoriId], [Sira]) VALUES (91, N'Oto Kuaför', NULL, N'oto-kuafor', N'#', 1, 0, 1, 27, 4)
INSERT [dbo].[AltKategoriler] ([AltKategoriId], [AltKategoriAdi], [Ikon], [Slug], [Url], [Aktif], [Area], [Depart], [KategoriId], [Sira]) VALUES (92, N'Deterjan Üreticileri', NULL, N'deterjan-ureticileri', N'#', 1, 0, 1, 8, 1)
INSERT [dbo].[AltKategoriler] ([AltKategoriId], [AltKategoriAdi], [Ikon], [Slug], [Url], [Aktif], [Area], [Depart], [KategoriId], [Sira]) VALUES (93, N'Kağıt Üreticileri', NULL, N'kagit-ureticileri', N'#', 1, 0, 1, 8, 2)
INSERT [dbo].[AltKategoriler] ([AltKategoriId], [AltKategoriAdi], [Ikon], [Slug], [Url], [Aktif], [Area], [Depart], [KategoriId], [Sira]) VALUES (94, N'Çöp Poşeti Üreticileri', NULL, N'cop-poseti-ureticileri', N'#', 1, 0, 1, 8, 3)
INSERT [dbo].[AltKategoriler] ([AltKategoriId], [AltKategoriAdi], [Ikon], [Slug], [Url], [Aktif], [Area], [Depart], [KategoriId], [Sira]) VALUES (95, N'Mop Üreticileri', NULL, N'mop-ureticileri', N'#', 1, 0, 1, 8, 4)
INSERT [dbo].[AltKategoriler] ([AltKategoriId], [AltKategoriAdi], [Ikon], [Slug], [Url], [Aktif], [Area], [Depart], [KategoriId], [Sira]) VALUES (96, N'Temizlik Aparat Üreticileri', NULL, N'temizlik-aparat-ureticileri', N'#', 1, 0, 1, 8, 5)
INSERT [dbo].[AltKategoriler] ([AltKategoriId], [AltKategoriAdi], [Ikon], [Slug], [Url], [Aktif], [Area], [Depart], [KategoriId], [Sira]) VALUES (97, N'Havuz Kimyasalları Üreticileri', NULL, N'havuz-kimyasallari-ureticileri', N'#', 1, 0, 1, 8, 6)
INSERT [dbo].[AltKategoriler] ([AltKategoriId], [AltKategoriAdi], [Ikon], [Slug], [Url], [Aktif], [Area], [Depart], [KategoriId], [Sira]) VALUES (98, N'Plastik Temizlik Aletleri', NULL, N'plastik-temizlik-aletleri', N'#', 1, 0, 1, 8, 7)
INSERT [dbo].[AltKategoriler] ([AltKategoriId], [AltKategoriAdi], [Ikon], [Slug], [Url], [Aktif], [Area], [Depart], [KategoriId], [Sira]) VALUES (99, N'Islak Kolonyalı Mendil', NULL, N'islak-kolonyali-mendil', N'#', 1, 0, 1, 8, 8)
INSERT [dbo].[AltKategoriler] ([AltKategoriId], [AltKategoriAdi], [Ikon], [Slug], [Url], [Aktif], [Area], [Depart], [KategoriId], [Sira]) VALUES (100, N'Tek Kullanımlık Ürünler', NULL, N'tek-kullanimlik-urunler', N'#', 1, 0, 1, 8, 9)
INSERT [dbo].[AltKategoriler] ([AltKategoriId], [AltKategoriAdi], [Ikon], [Slug], [Url], [Aktif], [Area], [Depart], [KategoriId], [Sira]) VALUES (101, N'Endüsriyel Temizlik Makinaları', NULL, N'endustriyel-temizlik-makinalari', N'#', 1, 0, 1, 4, 1)
INSERT [dbo].[AltKategoriler] ([AltKategoriId], [AltKategoriAdi], [Ikon], [Slug], [Url], [Aktif], [Area], [Depart], [KategoriId], [Sira]) VALUES (102, N'Halı Yıkama Makinaları', NULL, N'hali-yikama-makinalari', N'#', 1, 0, 1, 4, 2)
INSERT [dbo].[AltKategoriler] ([AltKategoriId], [AltKategoriAdi], [Ikon], [Slug], [Url], [Aktif], [Area], [Depart], [KategoriId], [Sira]) VALUES (103, N'Kuru Temizleme Makinaları', NULL, N'kuru-temizleme-makinalari', N'#', 1, 0, 1, 4, 3)
INSERT [dbo].[AltKategoriler] ([AltKategoriId], [AltKategoriAdi], [Ikon], [Slug], [Url], [Aktif], [Area], [Depart], [KategoriId], [Sira]) VALUES (104, N'Çamaşır Makina ve Kurutma', NULL, N'camasir-makina-ve-kurutma', N'#', 1, 0, 1, 4, 4)
INSERT [dbo].[AltKategoriler] ([AltKategoriId], [AltKategoriAdi], [Ikon], [Slug], [Url], [Aktif], [Area], [Depart], [KategoriId], [Sira]) VALUES (105, N'Yol Temizleme Bakım Makinaları', NULL, N'yol-temizleme-bakim-makinalari', N'#', 1, 0, 1, 4, 5)
SET IDENTITY_INSERT [dbo].[AltKategoriler] OFF
SET IDENTITY_INSERT [dbo].[Anketler] ON 

INSERT [dbo].[Anketler] ([AnketId], [ip], [KurumId], [OgrencininAdi], [OgrencininSinifi], [EnSevdiginizOgretmenveBransi], [EnSevdiginizOgretmenvNedeni], [EnSevdiginizYonetici], [EnSevdiginizYoneticiNedeni], [Tarih], [Yil], [Ay]) VALUES (1, N'::1', 11, N'ÖĞRENCİNİN ADI *', N'SINIFI', 1, N'NEDENİ', 4, N'NEDENİ', CAST(N'2017-06-27T14:19:01.470' AS DateTime), 2017, 6)
INSERT [dbo].[Anketler] ([AnketId], [ip], [KurumId], [OgrencininAdi], [OgrencininSinifi], [EnSevdiginizOgretmenveBransi], [EnSevdiginizOgretmenvNedeni], [EnSevdiginizYonetici], [EnSevdiginizYoneticiNedeni], [Tarih], [Yil], [Ay]) VALUES (2, N'::1', 11, N'Mustafa ERTUĞRUL', N'SINIFI', 1, N'NEDENİ', 4, N'NEDENİ', CAST(N'2017-06-27T14:19:01.560' AS DateTime), 2017, 6)
INSERT [dbo].[Anketler] ([AnketId], [ip], [KurumId], [OgrencininAdi], [OgrencininSinifi], [EnSevdiginizOgretmenveBransi], [EnSevdiginizOgretmenvNedeni], [EnSevdiginizYonetici], [EnSevdiginizYoneticiNedeni], [Tarih], [Yil], [Ay]) VALUES (3, N'::1', 11, N'ÖĞRENCİNİN ADI *', N'SINIFI', 1, N'NEDENİ', 4, N'NEDENİ', CAST(N'2017-06-27T14:19:15.607' AS DateTime), 2017, 6)
INSERT [dbo].[Anketler] ([AnketId], [ip], [KurumId], [OgrencininAdi], [OgrencininSinifi], [EnSevdiginizOgretmenveBransi], [EnSevdiginizOgretmenvNedeni], [EnSevdiginizYonetici], [EnSevdiginizYoneticiNedeni], [Tarih], [Yil], [Ay]) VALUES (4, N'::1', 11, N'Mustafa ERTUĞRUL', N'SINIFI', 1, N'NEDENİ', 4, N'NEDENİ', CAST(N'2017-06-27T14:19:15.657' AS DateTime), 2017, 6)
INSERT [dbo].[Anketler] ([AnketId], [ip], [KurumId], [OgrencininAdi], [OgrencininSinifi], [EnSevdiginizOgretmenveBransi], [EnSevdiginizOgretmenvNedeni], [EnSevdiginizYonetici], [EnSevdiginizYoneticiNedeni], [Tarih], [Yil], [Ay]) VALUES (5, N'::1', 11, N'ÖĞRENCİNİN ADI *', N'SINIFI', 1, N'NEDENİ', 4, N'NEDENİ', CAST(N'2017-06-27T14:19:20.273' AS DateTime), 2017, 6)
INSERT [dbo].[Anketler] ([AnketId], [ip], [KurumId], [OgrencininAdi], [OgrencininSinifi], [EnSevdiginizOgretmenveBransi], [EnSevdiginizOgretmenvNedeni], [EnSevdiginizYonetici], [EnSevdiginizYoneticiNedeni], [Tarih], [Yil], [Ay]) VALUES (6, N'::1', 11, N'Mustafa ERTUĞRUL', N'SINIFI', 1, N'NEDENİ', 4, N'NEDENİ', CAST(N'2017-06-27T14:19:20.307' AS DateTime), 2017, 6)
INSERT [dbo].[Anketler] ([AnketId], [ip], [KurumId], [OgrencininAdi], [OgrencininSinifi], [EnSevdiginizOgretmenveBransi], [EnSevdiginizOgretmenvNedeni], [EnSevdiginizYonetici], [EnSevdiginizYoneticiNedeni], [Tarih], [Yil], [Ay]) VALUES (7, N'::1', 12, N'ÖĞRENCİNİN ADI *', N'SINIFI', 3, N'NEDENİ', 4, N'NEDENİ', CAST(N'2017-06-27T16:53:06.103' AS DateTime), 2017, 6)
INSERT [dbo].[Anketler] ([AnketId], [ip], [KurumId], [OgrencininAdi], [OgrencininSinifi], [EnSevdiginizOgretmenveBransi], [EnSevdiginizOgretmenvNedeni], [EnSevdiginizYonetici], [EnSevdiginizYoneticiNedeni], [Tarih], [Yil], [Ay]) VALUES (8, N'84.51.15.210', 11, N'Ahmet Yavuz', N'1A', 1, N'Çok iyi', 4, N'İyi', CAST(N'2017-06-28T08:31:46.263' AS DateTime), 2017, 6)
SET IDENTITY_INSERT [dbo].[Anketler] OFF
SET IDENTITY_INSERT [dbo].[Bulten] ON 

INSERT [dbo].[Bulten] ([Id], [Mail], [Ip], [Tarih]) VALUES (15, N'suleyman.zemin@destekpatent.com.tr', N'185.51.39.231', CAST(N'2016-07-11T09:33:32.793' AS DateTime))
SET IDENTITY_INSERT [dbo].[Bulten] OFF
SET IDENTITY_INSERT [dbo].[Cozumler] ON 

INSERT [dbo].[Cozumler] ([Id], [Ad], [Slug], [Detay], [Url], [Aktif], [KategoriId]) VALUES (1, N'Akıllı Şehir Yönetimi ve Uygulamaları', N'akilli-sehir-yonetimi-ve-uygulamalari', N'<p><br></p>', NULL, 1, 1)
INSERT [dbo].[Cozumler] ([Id], [Ad], [Slug], [Detay], [Url], [Aktif], [KategoriId]) VALUES (3, N'Varlık, Envanter Yönetimi', N'varlik-envanter-yonetimi', NULL, NULL, 1, 1)
INSERT [dbo].[Cozumler] ([Id], [Ad], [Slug], [Detay], [Url], [Aktif], [KategoriId]) VALUES (4, N'Eğitim, Sınıf Çözümleri', N'egitim-sinif-cozumleri', NULL, NULL, 1, 1)
INSERT [dbo].[Cozumler] ([Id], [Ad], [Slug], [Detay], [Url], [Aktif], [KategoriId]) VALUES (5, N'Depo, Stok Yönetimi', N'depo-stok-yonetimi', NULL, NULL, 1, 1)
INSERT [dbo].[Cozumler] ([Id], [Ad], [Slug], [Detay], [Url], [Aktif], [KategoriId]) VALUES (6, N'Mobil Saha Uygulamaları', N'mobil-saha-uygulamalari', NULL, NULL, 1, 1)
INSERT [dbo].[Cozumler] ([Id], [Ad], [Slug], [Detay], [Url], [Aktif], [KategoriId]) VALUES (7, N'Uzaktan İzleme, Veri Toplama', N'uzaktan-izleme-veri-toplama', NULL, NULL, 1, 1)
INSERT [dbo].[Cozumler] ([Id], [Ad], [Slug], [Detay], [Url], [Aktif], [KategoriId]) VALUES (8, N'Biletleme Çözümleri', N'biletleme-cozumleri', NULL, NULL, 1, 1)
INSERT [dbo].[Cozumler] ([Id], [Ad], [Slug], [Detay], [Url], [Aktif], [KategoriId]) VALUES (9, N'Üretim Kontrol Çözümler', N'uretim-kontrol-cozumler', NULL, NULL, 1, 1)
INSERT [dbo].[Cozumler] ([Id], [Ad], [Slug], [Detay], [Url], [Aktif], [KategoriId]) VALUES (10, N'Saha Satış Çözümleri', N'saha-satis-cozumleri', NULL, NULL, 1, 1)
INSERT [dbo].[Cozumler] ([Id], [Ad], [Slug], [Detay], [Url], [Aktif], [KategoriId]) VALUES (11, N'Biometri Çözümleri', N'biometri-cozumleri', NULL, NULL, 1, 1)
INSERT [dbo].[Cozumler] ([Id], [Ad], [Slug], [Detay], [Url], [Aktif], [KategoriId]) VALUES (12, N'Otel, Restaurant Çözümleri', N'otel-restaurant-cozumleri', NULL, NULL, 1, 1)
INSERT [dbo].[Cozumler] ([Id], [Ad], [Slug], [Detay], [Url], [Aktif], [KategoriId]) VALUES (13, N'Network Altyapı Çözümleri', N'network-altyapi-cozumleri', NULL, NULL, 1, 1)
INSERT [dbo].[Cozumler] ([Id], [Ad], [Slug], [Detay], [Url], [Aktif], [KategoriId]) VALUES (14, N'Araç Yönetim Sistemleri', N'arac-yonetim-sistemleri', NULL, NULL, 1, 1)
INSERT [dbo].[Cozumler] ([Id], [Ad], [Slug], [Detay], [Url], [Aktif], [KategoriId]) VALUES (15, N'Mobit Etiketleme Çözümü', N'mobit-etiketleme-cozumu', N'<p><br></p>', N'http://www.mobit.com.tr/pdf/avm-etiket-cozumu-cn.compressed.pdf', 1, 1)
INSERT [dbo].[Cozumler] ([Id], [Ad], [Slug], [Detay], [Url], [Aktif], [KategoriId]) VALUES (16, N'Sunucu Yazılım Çözümleri', N'sunucu-yazilim-cozumleri', NULL, NULL, 1, 1)
INSERT [dbo].[Cozumler] ([Id], [Ad], [Slug], [Detay], [Url], [Aktif], [KategoriId]) VALUES (17, N'Sunucu, Veri Depolama, Sanallaştırma Çözümleri', N'sunucu-veri-depolama-sanallastirma-cozumleri', NULL, NULL, 1, 1)
INSERT [dbo].[Cozumler] ([Id], [Ad], [Slug], [Detay], [Url], [Aktif], [KategoriId]) VALUES (18, N'Hologram Uygulamaları', N'hologram-uygulamalari', N'<p><br></p>', N'http://www.tersprojeksiyonfilmi.com/hologram.html', 1, 1)
INSERT [dbo].[Cozumler] ([Id], [Ad], [Slug], [Detay], [Url], [Aktif], [KategoriId]) VALUES (19, N'Ters Projeksiyon / Vitrin uygulamaları', N'ters-projeksiyon-vitrin-uygulamalari', N'<p><br></p>', N'http://www.tersprojeksiyonfilmi.com', 1, 1)
INSERT [dbo].[Cozumler] ([Id], [Ad], [Slug], [Detay], [Url], [Aktif], [KategoriId]) VALUES (20, N'Sanal Manken Uygulamaları', N'sanal-manken-uygulamalari', N'<p><br></p>', N'http://www.sanalmankenturkiye.com', 1, 1)
INSERT [dbo].[Cozumler] ([Id], [Ad], [Slug], [Detay], [Url], [Aktif], [KategoriId]) VALUES (21, N'Sayaç Okuma', N'sayac-okuma', NULL, NULL, 1, 2)
INSERT [dbo].[Cozumler] ([Id], [Ad], [Slug], [Detay], [Url], [Aktif], [KategoriId]) VALUES (22, N'Kesme Açma', N'kesme-acma', NULL, NULL, 1, 2)
INSERT [dbo].[Cozumler] ([Id], [Ad], [Slug], [Detay], [Url], [Aktif], [KategoriId]) VALUES (23, N'Sökme Takma', N'sokme-takma', NULL, NULL, 1, 2)
INSERT [dbo].[Cozumler] ([Id], [Ad], [Slug], [Detay], [Url], [Aktif], [KategoriId]) VALUES (24, N'Bakım Onarım', N'bakim-onarim', N'<p><br></p>', NULL, 1, 2)
INSERT [dbo].[Cozumler] ([Id], [Ad], [Slug], [Detay], [Url], [Aktif], [KategoriId]) VALUES (25, N'Vale Yazılımı', N'vale-yazilimi', N'<p><br></p>', NULL, 1, 2)
INSERT [dbo].[Cozumler] ([Id], [Ad], [Slug], [Detay], [Url], [Aktif], [KategoriId]) VALUES (26, N'Mobil Parkomat', N'mobil-parkomat', NULL, NULL, 1, 2)
INSERT [dbo].[Cozumler] ([Id], [Ad], [Slug], [Detay], [Url], [Aktif], [KategoriId]) VALUES (27, N'Biletleme Yazılımı', N'biletleme-yazilimi', N'<p><br></p>', NULL, 1, 2)
INSERT [dbo].[Cozumler] ([Id], [Ad], [Slug], [Detay], [Url], [Aktif], [KategoriId]) VALUES (28, N'Ürün İade Yazılımı', N'urun-iade-yazilimi', N'<p><br></p>', NULL, 1, 2)
INSERT [dbo].[Cozumler] ([Id], [Ad], [Slug], [Detay], [Url], [Aktif], [KategoriId]) VALUES (29, N'Raporlama', N'raporlama', N'<p><br></p>', NULL, 1, 2)
INSERT [dbo].[Cozumler] ([Id], [Ad], [Slug], [Detay], [Url], [Aktif], [KategoriId]) VALUES (30, N'PDKS Yazılım', N'pdks-yazilim', N'<p><br></p>', NULL, 1, 2)
INSERT [dbo].[Cozumler] ([Id], [Ad], [Slug], [Detay], [Url], [Aktif], [KategoriId]) VALUES (31, N'Perakende', N'perakende', NULL, NULL, 1, 2)
INSERT [dbo].[Cozumler] ([Id], [Ad], [Slug], [Detay], [Url], [Aktif], [KategoriId]) VALUES (32, N'Enovia (3D Yönetim Platformu)', N'enovia-3d-yonetim-platformu', N'<p><br></p>', NULL, 1, 2)
INSERT [dbo].[Cozumler] ([Id], [Ad], [Slug], [Detay], [Url], [Aktif], [KategoriId]) VALUES (33, N'Catia (Katı modelleme CAD)', N'catia-kati-modelleme-cad', N'<p><br></p>', NULL, 1, 2)
SET IDENTITY_INSERT [dbo].[Cozumler] OFF
SET IDENTITY_INSERT [dbo].[DosyaYoneticisi] ON 

INSERT [dbo].[DosyaYoneticisi] ([DosyaId], [DosyaAdi], [Url], [Ikon], [Boyut], [Uzanti], [Tarih]) VALUES (6, N'sponsor-.png', N'sponsor5768Q.png', NULL, N'983279', N'.png', CAST(N'2017-06-07T12:57:24.840' AS DateTime))
SET IDENTITY_INSERT [dbo].[DosyaYoneticisi] OFF
SET IDENTITY_INSERT [dbo].[HaberKategorileri] ON 

INSERT [dbo].[HaberKategorileri] ([KategoriId], [Ad], [Slug], [Url], [Aktif]) VALUES (3, N'ROPÖRTAJLAR & BİYOGRAFİLER', N'roportajlar', N'roportajlar', 1)
INSERT [dbo].[HaberKategorileri] ([KategoriId], [Ad], [Slug], [Url], [Aktif]) VALUES (4, N'HABERLER & ETKİNLİKLER', N'haberler', N'haberler', 1)
INSERT [dbo].[HaberKategorileri] ([KategoriId], [Ad], [Slug], [Url], [Aktif]) VALUES (5, N'Sponsor1', N'sponsor1', NULL, 1)
INSERT [dbo].[HaberKategorileri] ([KategoriId], [Ad], [Slug], [Url], [Aktif]) VALUES (6, N'Sponsor2', N'sponsor2', NULL, 1)
INSERT [dbo].[HaberKategorileri] ([KategoriId], [Ad], [Slug], [Url], [Aktif]) VALUES (7, N'Sponsor3', N'sponsor3', NULL, 1)
INSERT [dbo].[HaberKategorileri] ([KategoriId], [Ad], [Slug], [Url], [Aktif]) VALUES (8, N'Sponsor4', N'sponsor4', NULL, 1)
INSERT [dbo].[HaberKategorileri] ([KategoriId], [Ad], [Slug], [Url], [Aktif]) VALUES (9, N'Sponsor5', N'sponsor5', NULL, 1)
INSERT [dbo].[HaberKategorileri] ([KategoriId], [Ad], [Slug], [Url], [Aktif]) VALUES (10, N'Sponsor6', N'sponsor6', NULL, 1)
INSERT [dbo].[HaberKategorileri] ([KategoriId], [Ad], [Slug], [Url], [Aktif]) VALUES (12, N'Genel Haberler', N'genelhaberler', NULL, 1)
INSERT [dbo].[HaberKategorileri] ([KategoriId], [Ad], [Slug], [Url], [Aktif]) VALUES (19, N'Ayın En İyi Temizlik Şirketi', N'Ayın En İyi Temizlik Şirketi', NULL, 1)
INSERT [dbo].[HaberKategorileri] ([KategoriId], [Ad], [Slug], [Url], [Aktif]) VALUES (20, N'Ayın En İyi Tedarikçisi', N'Ayın En İyi Tedarikçisi', NULL, 1)
INSERT [dbo].[HaberKategorileri] ([KategoriId], [Ad], [Slug], [Url], [Aktif]) VALUES (21, N'Ayın En İyi Halı Yıkamacısı', N'Ayın En İyi Halı Yıkamacısı', NULL, 1)
INSERT [dbo].[HaberKategorileri] ([KategoriId], [Ad], [Slug], [Url], [Aktif]) VALUES (22, N'En İyi Temizlik Şirketleri', N'En İyi Temizlik Şirketleri', NULL, 1)
INSERT [dbo].[HaberKategorileri] ([KategoriId], [Ad], [Slug], [Url], [Aktif]) VALUES (23, N'En İyi Ürünler', N'En İyi Ürünler', NULL, 1)
INSERT [dbo].[HaberKategorileri] ([KategoriId], [Ad], [Slug], [Url], [Aktif]) VALUES (24, N'En İyi Tedarikçiler', N'En İyi Tedarikçiler', NULL, 1)
INSERT [dbo].[HaberKategorileri] ([KategoriId], [Ad], [Slug], [Url], [Aktif]) VALUES (25, N'Ayın En İyi Üretici Firması', N'Ayın En İyi Üretici Firması', NULL, 1)
INSERT [dbo].[HaberKategorileri] ([KategoriId], [Ad], [Slug], [Url], [Aktif]) VALUES (26, N'Ayın En İyi Kuru Temizlemecisi', N'Ayın En İyi Kuru Temizlemecisi', NULL, 1)
INSERT [dbo].[HaberKategorileri] ([KategoriId], [Ad], [Slug], [Url], [Aktif]) VALUES (27, N'Ayın En İyi Makina Üreticisi', N'Ayın En İyi Makina Üreticisi', NULL, 1)
SET IDENTITY_INSERT [dbo].[HaberKategorileri] OFF
SET IDENTITY_INSERT [dbo].[Haberler] ON 

INSERT [dbo].[Haberler] ([Id], [Ad], [Resim], [Slug], [Detay], [Aktif], [KategoriId], [GaleriId], [Tarih], [Hit]) VALUES (46, N'ALKEV ÖZEL OKULLARINDAN HANNOVER DEĞİŞİM PROGRAMI 2016', N'Lew6Jq0c_400x400-3843K.jpeg', N'alkev-ozel-okullarindan-hannover-degisim-programi-2016', N'<p><strong>ALKEV &Ouml;ZEL OKULLARINDAN HANNOVER DEĞİŞİM PROGRAMI 2016</strong></p>

<p>Okulumuzda değişim programlarıyla, &ouml;ğrencilerimize Almanca dilini pekiştirebilecekleri ve geliştirebilecekleri fırsatlar yaratılmaktadır. Bu ama&ccedil;la, Hannover şehrinde bulunan&nbsp;<a href="http://www.sophienschule.de/">Sophienschule</a>&nbsp;ile işbirliği yapılarak hazırlık ve 9. sınıfları kapsayan bir değişim programı başlatıldı. Her yıl d&uuml;zenli olarak ger&ccedil;ekleştirilen bu program kapsamında bu yıl 21 &ouml;ğrencimizin katılımı ger&ccedil;ekleşti.<br />
&Ouml;ğrencilerimiz gezi &ouml;ncesinde hazırlık ve okul d&uuml;zeyinde paylaşım ama&ccedil;lı blog sayfalarında karşılıklı olarak &ccedil;alışma başlatıldı.<br />
1-8 Mayıs 2016 tarihleri arasında &ouml;ğrencilerimiz&nbsp; &ouml;ğretmenleri eşliğinde Hannover &ndash; Sophienschule ziyaretlerini ger&ccedil;ekleştirdiler. Ziyaretleri boyunca misafir ailelerde konaklayan &ouml;ğrencilerimiz, okul saatleri &ccedil;er&ccedil;evesinde kardeş okulumuzu ziyaret ederek derslere, kamp&uuml;s i&ccedil;inde ve dışında proje &ccedil;alışmalarına ve &ccedil;eşitli &ouml;nemli programlara katılım sağladılar.<br />
Programımızın Almanya ayağı eski Almanya başbakanının eşi sayın</p>

<p>Doris Schr&ouml;der-K&ouml;pf liderliğinde y&uuml;r&uuml;t&uuml;lmektedir<img alt="IMG_8385" src="http://temizliksektoru.com/wp-content/uploads/2016/08/IMG_8385.jpg" style="height:600px; width:800px" />&nbsp;</p>
', 1, 4, NULL, CAST(N'2017-05-25T22:43:12.000' AS DateTime), 1)
INSERT [dbo].[Haberler] ([Id], [Ad], [Resim], [Slug], [Detay], [Aktif], [KategoriId], [GaleriId], [Tarih], [Hit]) VALUES (47, N'ARSU Güzel Sanatlar Akademisi’nde Sanat Eğitimi Minikler Altı Aylıkken Başlıyor….', N'arsu-guzel-1452E.png', N'arsu-guzel-sanatlar-akademisi-nde-sanat-egitimi-minikler-alti-aylikken-basliyor', N'<p>ARSU G&uuml;zel Sanatlar Akademisi, okul &ouml;ncesi sanat eğitimi programları ve akademik d&uuml;zeydeki eğitimleriyle gen&ccedil; yetenekler yetiştirmeye ve onları sanat ile buluşturmaya devam ediyor. Akademide verilen okul &ouml;ncesi eğitim programı ile &ccedil;ocuklar, atacakları her yaşamsal adımı, oluşan estetik duygusuyla birlikte g&uuml;venle atıyor.</p>

<p>ARSU G&uuml;zel Sanatlar Akademisi sanat eğitimleri bebeğiniz altı aylıkken başlıyor. Arsu G&uuml;zel Sanatlar Akademisi&rsquo;nde sanat eğitiminin başlangı&ccedil; noktası, bilimselliği otoriteler tarafından onaylanmış, d&uuml;nyanın en k&ouml;kl&uuml; ve en saygın okul &ouml;ncesi eğitim sistemi olan Uluslararası Kindermusik International eğitim programı. Bu program &ccedil;ocukların zihinsel gelişimine katkı sağlarken, miniklerin başarılı okul hayatı i&ccedil;in de temeller oluşturuluyor. Kindermusik International eğitim programını tamamlayan minik &ouml;ğrenciler Yetenek Geliştirme ve M&uuml;zikalite Sınıfları&rsquo; nda sanat eğitimlerinin ikinci aşamasına başlıyor. 3.5-5 yaş arası yedi &ouml;ğrencinin bulunduğu M&uuml;zikalite Sınıflarda eğitim, eğlenerek &ouml;ğrenebilecekleri dersler ile devam ediyor. Her iki programda hafta i&ccedil;i ve hafta sonu uygulanabiliyor. 3&rsquo;er aylık periyotlar şeklinde devam eden programlar haftada 1 g&uuml;n/45 dakikalık ders şeklinde hazırlanmış. Eğitim programlarının fiyatı aylık 250 TL&rsquo;den başlıyor. Uluslar arası m&uuml;zik eğitim programları ile devam eden &uuml;&ccedil;&uuml;nc&uuml; aşamada &ouml;ğrenciler daha teknik dersler ile tanışıp, West London Colloge Of Music, ABRSM (Associated Board of Royal Schools of Music) ve Boston Longy School Of Music programları ile sanat eğitimlerine devam ediyorlar. ARSU G&uuml;zel Sanatlar Akademisi&rsquo;nde satan eğitimini başarı ile tamamlayan &ouml;ğrenciler, t&uuml;m d&uuml;nyada ge&ccedil;erli olan lise d&uuml;zeyindeki diplomasına sahip oluyor ve yurtdışındaki konservatuarlarda eğitim alma şansını yakalıyor.</p>
', 1, 3, NULL, CAST(N'2017-05-25T22:52:05.980' AS DateTime), 1)
INSERT [dbo].[Haberler] ([Id], [Ad], [Resim], [Slug], [Detay], [Aktif], [KategoriId], [GaleriId], [Tarih], [Hit]) VALUES (48, N'AVRUPA KOLEJİ SOSYAL SORUMLULUKLARDA BİR ADIM ÖNDE', N'AVRUPAasdasd-4704N.jpg', N'avrupa-koleji-sosyal-sorumluluklarda-bir-adim-onde', N'<p><strong>&Ouml;ğrenci odaklı bir eğitim anlayışını benimseyen ve sosyal ortam farkındalığı y&uuml;ksek bireyler yetiştirmeyi hedeflediklerini belirten Avrupa Koleji Kazlı&ccedil;eşme Kamp&uuml;s&uuml; Lise M&uuml;d&uuml;r&uuml; Miray Şeng&uuml;l, &ouml;ğrencilerini sosyal sorumluluk projelerinde de desteklediklerini s&ouml;yl&uuml;yor.</strong></p>

<p>Her yıl iki kez &ouml;ğrenci-&ouml;ğretmen-veli işbirliği ile geliri &ccedil;eşitli yardım kuruluşlarına bağışlanmak &uuml;zere d&uuml;zenlenen kurum b&uuml;nyesinde ger&ccedil;ekleştirilen kermeslerde Avrupa Koleji &ouml;ğrencilerinin aktif g&ouml;rev aldıklarını ve &ouml;ğrencilerin organizasyonun her s&uuml;recini kendilerinin y&ouml;nlendirdiklerini ifade eden Avrupa Koleji Kazlı&ccedil;eşme Kamp&uuml;s&uuml; Lise M&uuml;d&uuml;r&uuml; Miray Şeng&uuml;l, &ldquo;Avrupa Koleji Okulları&rsquo;nda artık bir gelenek gibi s&uuml;rd&uuml;r&uuml;len bu yardımlaşma anlayışı her &ouml;ğrenci ve &ouml;ğretmenin ortak d&uuml;ş&uuml;nme tarzı olmuştur. Bu şekilde empati kurabilen bireylerin yetiştirildiği kurum olma hedefini de ger&ccedil;ekleştirmek m&uuml;mk&uuml;n olabiliyor.&rdquo; diye konuşuyor.<br />
ENGELSİZ MATEMATİK G&Ouml;RME ENGELLİLERE IŞIK OLDU<br />
Bu yaklaşımın &uuml;r&uuml;nleri olarak nitelenebilecek iki &ouml;rneği anlatan Şeng&uuml;l, ilk &ouml;rneği &ldquo;Matematiğe dokunmak hi&ccedil; bu kadar anlamlı olmamıştı&rdquo; diye insanı d&uuml;ş&uuml;nd&uuml;ren bir ser&uuml;ven olarak nitelendiriyor.<br />
Avrupa Koleji Kazlı&ccedil;eşme Kamp&uuml;s&uuml; 6. sınıf &ouml;ğrencileri Bernis Dila Erg&uuml;l ve Ecehan Kekum&rsquo;un, matematik &ouml;ğretmenleri G&uuml;lşah Ekinci&rsquo;ye farklı bir şeyler &uuml;retmek ve insanların hayatlarını değiştirmek istediklerini s&ouml;ylemeleriyle Engelsiz matematik projesinin ortaya &ccedil;ıktığını ifade eden Şeng&uuml;l, sonraki s&uuml;reci şu s&ouml;zlerle anlatıyor: &ldquo;Bu &ccedil;ok iddalı bir hedefti. Onları y&ouml;nlendirme konusunda profesyonel olan &ouml;ğretmenlerinden biri &ldquo;eğer g&ouml;rme engelli olsaydınız matematik derslerini nasıl algılardınız hi&ccedil; d&uuml;ş&uuml;nd&uuml;n&uuml;z m&uuml;?&rdquo; sorusunu y&ouml;neltir &ouml;ğrencilerine. İşte bu soru ilk kıvılcımdır. Buradan yola &ccedil;ıkan &ouml;ğrenciler ve &ouml;ğretmenleri g&ouml;rme engellilerin matematik &ouml;ğrenmelerini kolaylaştırabilecek bir materyal yapmaya karar verirler. Başlangı&ccedil;ta bir proje yarışması hazırlığı olarak başlar &ccedil;alışmaları. Tasarladıkları materyal uzun &ccedil;alışmalardan sonra oluşur. Artık bu materyalin denenmesi gerekmektedir. &Ouml;ğrencilerimiz ve &ouml;ğretmenleri g&ouml;rme engellilerin eğitim aldığı bir okulu ziyaret ederler. Aldıkları tepkiler beklediklerinden daha olumludur. Bazı ekleme ve d&uuml;zeltmeler yapmaları konusundaki tavsiyelerle okula d&ouml;nerler. B&uuml;y&uuml;k bir heyecanla materyallerini yeniden d&uuml;zenlemeye başlarlar. Bu oluşuma okul ve aileler de destek vermektedir. Hedefledikleri yarışmaya katılıp ikincilik &ouml;d&uuml;llerini alırlar ancak artık ama&ccedil;ları derece değildir aslında. Onlar okullarının da desteğiyle g&ouml;rme engelli &ouml;ğrencilere yardım edebilecekleri bir sosyal sorumluluk projesinin merkezindedirler artık. K&uuml;&ccedil;&uuml;c&uuml;k y&uuml;rekleriyle ortaya koydukları bu b&uuml;y&uuml;k &ccedil;aba meyvelerini vermektedir. Projeleri g&ouml;rsel basının ilgisini &ccedil;ekmiş ve ana haber b&uuml;ltenlerinde &ouml;ğrenciler ve &ouml;ğretmenleri bu s&uuml;reci t&uuml;m &uuml;lkeye anlatabilme fırsatını da yakalamışlardır. Bug&uuml;nlerde materyallerini geliştirme &ccedil;alışmalarını s&uuml;rd&uuml;r&uuml;yorlar. Bu geliştirme &ccedil;alışmalarını da G&ouml;rme Engelliler Federasyonu ile yaptıkları g&ouml;r&uuml;şmeler doğrultusunda kurumun da desteği ile s&uuml;rd&uuml;r&uuml;yorlar.&rdquo;</p>
', 1, 4, NULL, CAST(N'2017-05-25T22:55:00.557' AS DateTime), 1)
INSERT [dbo].[Haberler] ([Id], [Ad], [Resim], [Slug], [Detay], [Aktif], [KategoriId], [GaleriId], [Tarih], [Hit]) VALUES (49, N'ALKEV ÖZEL OKULLARINDAN HANNOVER DEĞİŞİM PROGRAMI 2016', N'Lew6Jq0c_400x400-3843K.jpeg', N'alkev-ozel-okullarindan-hannover-degisim-programi-2016', N'<p><strong>ALKEV &Ouml;ZEL OKULLARINDAN HANNOVER DEĞİŞİM PROGRAMI 2016</strong></p>

<p>Okulumuzda değişim programlarıyla, &ouml;ğrencilerimize Almanca dilini pekiştirebilecekleri ve geliştirebilecekleri fırsatlar yaratılmaktadır. Bu ama&ccedil;la, Hannover şehrinde bulunan&nbsp;<a href="http://www.sophienschule.de/">Sophienschule</a>&nbsp;ile işbirliği yapılarak hazırlık ve 9. sınıfları kapsayan bir değişim programı başlatıldı. Her yıl d&uuml;zenli olarak ger&ccedil;ekleştirilen bu program kapsamında bu yıl 21 &ouml;ğrencimizin katılımı ger&ccedil;ekleşti.<br />
&Ouml;ğrencilerimiz gezi &ouml;ncesinde hazırlık ve okul d&uuml;zeyinde paylaşım ama&ccedil;lı blog sayfalarında karşılıklı olarak &ccedil;alışma başlatıldı.<br />
1-8 Mayıs 2016 tarihleri arasında &ouml;ğrencilerimiz&nbsp; &ouml;ğretmenleri eşliğinde Hannover &ndash; Sophienschule ziyaretlerini ger&ccedil;ekleştirdiler. Ziyaretleri boyunca misafir ailelerde konaklayan &ouml;ğrencilerimiz, okul saatleri &ccedil;er&ccedil;evesinde kardeş okulumuzu ziyaret ederek derslere, kamp&uuml;s i&ccedil;inde ve dışında proje &ccedil;alışmalarına ve &ccedil;eşitli &ouml;nemli programlara katılım sağladılar.<br />
Programımızın Almanya ayağı eski Almanya başbakanının eşi sayın</p>

<p>Doris Schr&ouml;der-K&ouml;pf liderliğinde y&uuml;r&uuml;t&uuml;lmektedir<img alt="IMG_8385" src="http://temizliksektoru.com/wp-content/uploads/2016/08/IMG_8385.jpg" style="height:600px; width:800px" />&nbsp;</p>
', 1, 4, NULL, CAST(N'2017-01-01T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Haberler] ([Id], [Ad], [Resim], [Slug], [Detay], [Aktif], [KategoriId], [GaleriId], [Tarih], [Hit]) VALUES (50, N'ARSU Güzel Sanatlar Akademisi’nde Sanat Eğitimi Minikler Altı Aylıkken Başlıyor….', N'arsu-guzel-1452E.png', N'arsu-guzel-sanatlar-akademisi-nde-sanat-egitimi-minikler-alti-aylikken-basliyor', N'<p>ARSU G&uuml;zel Sanatlar Akademisi, okul &ouml;ncesi sanat eğitimi programları ve akademik d&uuml;zeydeki eğitimleriyle gen&ccedil; yetenekler yetiştirmeye ve onları sanat ile buluşturmaya devam ediyor. Akademide verilen okul &ouml;ncesi eğitim programı ile &ccedil;ocuklar, atacakları her yaşamsal adımı, oluşan estetik duygusuyla birlikte g&uuml;venle atıyor.</p>

<p>ARSU G&uuml;zel Sanatlar Akademisi sanat eğitimleri bebeğiniz altı aylıkken başlıyor. Arsu G&uuml;zel Sanatlar Akademisi&rsquo;nde sanat eğitiminin başlangı&ccedil; noktası, bilimselliği otoriteler tarafından onaylanmış, d&uuml;nyanın en k&ouml;kl&uuml; ve en saygın okul &ouml;ncesi eğitim sistemi olan Uluslararası Kindermusik International eğitim programı. Bu program &ccedil;ocukların zihinsel gelişimine katkı sağlarken, miniklerin başarılı okul hayatı i&ccedil;in de temeller oluşturuluyor. Kindermusik International eğitim programını tamamlayan minik &ouml;ğrenciler Yetenek Geliştirme ve M&uuml;zikalite Sınıfları&rsquo; nda sanat eğitimlerinin ikinci aşamasına başlıyor. 3.5-5 yaş arası yedi &ouml;ğrencinin bulunduğu M&uuml;zikalite Sınıflarda eğitim, eğlenerek &ouml;ğrenebilecekleri dersler ile devam ediyor. Her iki programda hafta i&ccedil;i ve hafta sonu uygulanabiliyor. 3&rsquo;er aylık periyotlar şeklinde devam eden programlar haftada 1 g&uuml;n/45 dakikalık ders şeklinde hazırlanmış. Eğitim programlarının fiyatı aylık 250 TL&rsquo;den başlıyor. Uluslar arası m&uuml;zik eğitim programları ile devam eden &uuml;&ccedil;&uuml;nc&uuml; aşamada &ouml;ğrenciler daha teknik dersler ile tanışıp, West London Colloge Of Music, ABRSM (Associated Board of Royal Schools of Music) ve Boston Longy School Of Music programları ile sanat eğitimlerine devam ediyorlar. ARSU G&uuml;zel Sanatlar Akademisi&rsquo;nde satan eğitimini başarı ile tamamlayan &ouml;ğrenciler, t&uuml;m d&uuml;nyada ge&ccedil;erli olan lise d&uuml;zeyindeki diplomasına sahip oluyor ve yurtdışındaki konservatuarlarda eğitim alma şansını yakalıyor.</p>
', 1, 3, NULL, CAST(N'2017-01-01T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Haberler] ([Id], [Ad], [Resim], [Slug], [Detay], [Aktif], [KategoriId], [GaleriId], [Tarih], [Hit]) VALUES (51, N'AVRUPA KOLEJİ SOSYAL SORUMLULUKLARDA BİR ADIM ÖNDE', N'AVRUPAasdasd-4704N.jpg', N'avrupa-koleji-sosyal-sorumluluklarda-bir-adim-onde', N'<p><strong>&Ouml;ğrenci odaklı bir eğitim anlayışını benimseyen ve sosyal ortam farkındalığı y&uuml;ksek bireyler yetiştirmeyi hedeflediklerini belirten Avrupa Koleji Kazlı&ccedil;eşme Kamp&uuml;s&uuml; Lise M&uuml;d&uuml;r&uuml; Miray Şeng&uuml;l, &ouml;ğrencilerini sosyal sorumluluk projelerinde de desteklediklerini s&ouml;yl&uuml;yor.</strong></p>

<p>Her yıl iki kez &ouml;ğrenci-&ouml;ğretmen-veli işbirliği ile geliri &ccedil;eşitli yardım kuruluşlarına bağışlanmak &uuml;zere d&uuml;zenlenen kurum b&uuml;nyesinde ger&ccedil;ekleştirilen kermeslerde Avrupa Koleji &ouml;ğrencilerinin aktif g&ouml;rev aldıklarını ve &ouml;ğrencilerin organizasyonun her s&uuml;recini kendilerinin y&ouml;nlendirdiklerini ifade eden Avrupa Koleji Kazlı&ccedil;eşme Kamp&uuml;s&uuml; Lise M&uuml;d&uuml;r&uuml; Miray Şeng&uuml;l, &ldquo;Avrupa Koleji Okulları&rsquo;nda artık bir gelenek gibi s&uuml;rd&uuml;r&uuml;len bu yardımlaşma anlayışı her &ouml;ğrenci ve &ouml;ğretmenin ortak d&uuml;ş&uuml;nme tarzı olmuştur. Bu şekilde empati kurabilen bireylerin yetiştirildiği kurum olma hedefini de ger&ccedil;ekleştirmek m&uuml;mk&uuml;n olabiliyor.&rdquo; diye konuşuyor.<br />
ENGELSİZ MATEMATİK G&Ouml;RME ENGELLİLERE IŞIK OLDU<br />
Bu yaklaşımın &uuml;r&uuml;nleri olarak nitelenebilecek iki &ouml;rneği anlatan Şeng&uuml;l, ilk &ouml;rneği &ldquo;Matematiğe dokunmak hi&ccedil; bu kadar anlamlı olmamıştı&rdquo; diye insanı d&uuml;ş&uuml;nd&uuml;ren bir ser&uuml;ven olarak nitelendiriyor.<br />
Avrupa Koleji Kazlı&ccedil;eşme Kamp&uuml;s&uuml; 6. sınıf &ouml;ğrencileri Bernis Dila Erg&uuml;l ve Ecehan Kekum&rsquo;un, matematik &ouml;ğretmenleri G&uuml;lşah Ekinci&rsquo;ye farklı bir şeyler &uuml;retmek ve insanların hayatlarını değiştirmek istediklerini s&ouml;ylemeleriyle Engelsiz matematik projesinin ortaya &ccedil;ıktığını ifade eden Şeng&uuml;l, sonraki s&uuml;reci şu s&ouml;zlerle anlatıyor: &ldquo;Bu &ccedil;ok iddalı bir hedefti. Onları y&ouml;nlendirme konusunda profesyonel olan &ouml;ğretmenlerinden biri &ldquo;eğer g&ouml;rme engelli olsaydınız matematik derslerini nasıl algılardınız hi&ccedil; d&uuml;ş&uuml;nd&uuml;n&uuml;z m&uuml;?&rdquo; sorusunu y&ouml;neltir &ouml;ğrencilerine. İşte bu soru ilk kıvılcımdır. Buradan yola &ccedil;ıkan &ouml;ğrenciler ve &ouml;ğretmenleri g&ouml;rme engellilerin matematik &ouml;ğrenmelerini kolaylaştırabilecek bir materyal yapmaya karar verirler. Başlangı&ccedil;ta bir proje yarışması hazırlığı olarak başlar &ccedil;alışmaları. Tasarladıkları materyal uzun &ccedil;alışmalardan sonra oluşur. Artık bu materyalin denenmesi gerekmektedir. &Ouml;ğrencilerimiz ve &ouml;ğretmenleri g&ouml;rme engellilerin eğitim aldığı bir okulu ziyaret ederler. Aldıkları tepkiler beklediklerinden daha olumludur. Bazı ekleme ve d&uuml;zeltmeler yapmaları konusundaki tavsiyelerle okula d&ouml;nerler. B&uuml;y&uuml;k bir heyecanla materyallerini yeniden d&uuml;zenlemeye başlarlar. Bu oluşuma okul ve aileler de destek vermektedir. Hedefledikleri yarışmaya katılıp ikincilik &ouml;d&uuml;llerini alırlar ancak artık ama&ccedil;ları derece değildir aslında. Onlar okullarının da desteğiyle g&ouml;rme engelli &ouml;ğrencilere yardım edebilecekleri bir sosyal sorumluluk projesinin merkezindedirler artık. K&uuml;&ccedil;&uuml;c&uuml;k y&uuml;rekleriyle ortaya koydukları bu b&uuml;y&uuml;k &ccedil;aba meyvelerini vermektedir. Projeleri g&ouml;rsel basının ilgisini &ccedil;ekmiş ve ana haber b&uuml;ltenlerinde &ouml;ğrenciler ve &ouml;ğretmenleri bu s&uuml;reci t&uuml;m &uuml;lkeye anlatabilme fırsatını da yakalamışlardır. Bug&uuml;nlerde materyallerini geliştirme &ccedil;alışmalarını s&uuml;rd&uuml;r&uuml;yorlar. Bu geliştirme &ccedil;alışmalarını da G&ouml;rme Engelliler Federasyonu ile yaptıkları g&ouml;r&uuml;şmeler doğrultusunda kurumun da desteği ile s&uuml;rd&uuml;r&uuml;yorlar.&rdquo;</p>
', 1, 4, NULL, CAST(N'2017-01-01T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Haberler] ([Id], [Ad], [Resim], [Slug], [Detay], [Aktif], [KategoriId], [GaleriId], [Tarih], [Hit]) VALUES (52, N'ALKEV ÖZEL OKULLARINDAN HANNOVER DEĞİŞİM PROGRAMI 2016', N'Lew6Jq0c_400x400-3843K.jpeg', N'alkev-ozel-okullarindan-hannover-degisim-programi-2016', N'<p><strong>ALKEV &Ouml;ZEL OKULLARINDAN HANNOVER DEĞİŞİM PROGRAMI 2016</strong></p>

<p>Okulumuzda değişim programlarıyla, &ouml;ğrencilerimize Almanca dilini pekiştirebilecekleri ve geliştirebilecekleri fırsatlar yaratılmaktadır. Bu ama&ccedil;la, Hannover şehrinde bulunan&nbsp;<a href="http://www.sophienschule.de/">Sophienschule</a>&nbsp;ile işbirliği yapılarak hazırlık ve 9. sınıfları kapsayan bir değişim programı başlatıldı. Her yıl d&uuml;zenli olarak ger&ccedil;ekleştirilen bu program kapsamında bu yıl 21 &ouml;ğrencimizin katılımı ger&ccedil;ekleşti.<br />
&Ouml;ğrencilerimiz gezi &ouml;ncesinde hazırlık ve okul d&uuml;zeyinde paylaşım ama&ccedil;lı blog sayfalarında karşılıklı olarak &ccedil;alışma başlatıldı.<br />
1-8 Mayıs 2016 tarihleri arasında &ouml;ğrencilerimiz&nbsp; &ouml;ğretmenleri eşliğinde Hannover &ndash; Sophienschule ziyaretlerini ger&ccedil;ekleştirdiler. Ziyaretleri boyunca misafir ailelerde konaklayan &ouml;ğrencilerimiz, okul saatleri &ccedil;er&ccedil;evesinde kardeş okulumuzu ziyaret ederek derslere, kamp&uuml;s i&ccedil;inde ve dışında proje &ccedil;alışmalarına ve &ccedil;eşitli &ouml;nemli programlara katılım sağladılar.<br />
Programımızın Almanya ayağı eski Almanya başbakanının eşi sayın</p>

<p>Doris Schr&ouml;der-K&ouml;pf liderliğinde y&uuml;r&uuml;t&uuml;lmektedir<img alt="IMG_8385" src="http://temizliksektoru.com/wp-content/uploads/2016/08/IMG_8385.jpg" style="height:600px; width:800px" />&nbsp;</p>
', 1, 4, NULL, CAST(N'2017-01-01T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Haberler] ([Id], [Ad], [Resim], [Slug], [Detay], [Aktif], [KategoriId], [GaleriId], [Tarih], [Hit]) VALUES (53, N'ARSU Güzel Sanatlar Akademisi’nde Sanat Eğitimi Minikler Altı Aylıkken Başlıyor….', N'arsu-guzel-1452E.png', N'arsu-guzel-sanatlar-akademisi-nde-sanat-egitimi-minikler-alti-aylikken-basliyor', N'<p>ARSU G&uuml;zel Sanatlar Akademisi, okul &ouml;ncesi sanat eğitimi programları ve akademik d&uuml;zeydeki eğitimleriyle gen&ccedil; yetenekler yetiştirmeye ve onları sanat ile buluşturmaya devam ediyor. Akademide verilen okul &ouml;ncesi eğitim programı ile &ccedil;ocuklar, atacakları her yaşamsal adımı, oluşan estetik duygusuyla birlikte g&uuml;venle atıyor.</p>

<p>ARSU G&uuml;zel Sanatlar Akademisi sanat eğitimleri bebeğiniz altı aylıkken başlıyor. Arsu G&uuml;zel Sanatlar Akademisi&rsquo;nde sanat eğitiminin başlangı&ccedil; noktası, bilimselliği otoriteler tarafından onaylanmış, d&uuml;nyanın en k&ouml;kl&uuml; ve en saygın okul &ouml;ncesi eğitim sistemi olan Uluslararası Kindermusik International eğitim programı. Bu program &ccedil;ocukların zihinsel gelişimine katkı sağlarken, miniklerin başarılı okul hayatı i&ccedil;in de temeller oluşturuluyor. Kindermusik International eğitim programını tamamlayan minik &ouml;ğrenciler Yetenek Geliştirme ve M&uuml;zikalite Sınıfları&rsquo; nda sanat eğitimlerinin ikinci aşamasına başlıyor. 3.5-5 yaş arası yedi &ouml;ğrencinin bulunduğu M&uuml;zikalite Sınıflarda eğitim, eğlenerek &ouml;ğrenebilecekleri dersler ile devam ediyor. Her iki programda hafta i&ccedil;i ve hafta sonu uygulanabiliyor. 3&rsquo;er aylık periyotlar şeklinde devam eden programlar haftada 1 g&uuml;n/45 dakikalık ders şeklinde hazırlanmış. Eğitim programlarının fiyatı aylık 250 TL&rsquo;den başlıyor. Uluslar arası m&uuml;zik eğitim programları ile devam eden &uuml;&ccedil;&uuml;nc&uuml; aşamada &ouml;ğrenciler daha teknik dersler ile tanışıp, West London Colloge Of Music, ABRSM (Associated Board of Royal Schools of Music) ve Boston Longy School Of Music programları ile sanat eğitimlerine devam ediyorlar. ARSU G&uuml;zel Sanatlar Akademisi&rsquo;nde satan eğitimini başarı ile tamamlayan &ouml;ğrenciler, t&uuml;m d&uuml;nyada ge&ccedil;erli olan lise d&uuml;zeyindeki diplomasına sahip oluyor ve yurtdışındaki konservatuarlarda eğitim alma şansını yakalıyor.</p>
', 1, 3, NULL, CAST(N'2017-01-01T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Haberler] ([Id], [Ad], [Resim], [Slug], [Detay], [Aktif], [KategoriId], [GaleriId], [Tarih], [Hit]) VALUES (54, N'AVRUPA KOLEJİ SOSYAL SORUMLULUKLARDA BİR ADIM ÖNDE', N'AVRUPAasdasd-4704N.jpg', N'avrupa-koleji-sosyal-sorumluluklarda-bir-adim-onde', N'<p><strong>&Ouml;ğrenci odaklı bir eğitim anlayışını benimseyen ve sosyal ortam farkındalığı y&uuml;ksek bireyler yetiştirmeyi hedeflediklerini belirten Avrupa Koleji Kazlı&ccedil;eşme Kamp&uuml;s&uuml; Lise M&uuml;d&uuml;r&uuml; Miray Şeng&uuml;l, &ouml;ğrencilerini sosyal sorumluluk projelerinde de desteklediklerini s&ouml;yl&uuml;yor.</strong></p>

<p>Her yıl iki kez &ouml;ğrenci-&ouml;ğretmen-veli işbirliği ile geliri &ccedil;eşitli yardım kuruluşlarına bağışlanmak &uuml;zere d&uuml;zenlenen kurum b&uuml;nyesinde ger&ccedil;ekleştirilen kermeslerde Avrupa Koleji &ouml;ğrencilerinin aktif g&ouml;rev aldıklarını ve &ouml;ğrencilerin organizasyonun her s&uuml;recini kendilerinin y&ouml;nlendirdiklerini ifade eden Avrupa Koleji Kazlı&ccedil;eşme Kamp&uuml;s&uuml; Lise M&uuml;d&uuml;r&uuml; Miray Şeng&uuml;l, &ldquo;Avrupa Koleji Okulları&rsquo;nda artık bir gelenek gibi s&uuml;rd&uuml;r&uuml;len bu yardımlaşma anlayışı her &ouml;ğrenci ve &ouml;ğretmenin ortak d&uuml;ş&uuml;nme tarzı olmuştur. Bu şekilde empati kurabilen bireylerin yetiştirildiği kurum olma hedefini de ger&ccedil;ekleştirmek m&uuml;mk&uuml;n olabiliyor.&rdquo; diye konuşuyor.<br />
ENGELSİZ MATEMATİK G&Ouml;RME ENGELLİLERE IŞIK OLDU<br />
Bu yaklaşımın &uuml;r&uuml;nleri olarak nitelenebilecek iki &ouml;rneği anlatan Şeng&uuml;l, ilk &ouml;rneği &ldquo;Matematiğe dokunmak hi&ccedil; bu kadar anlamlı olmamıştı&rdquo; diye insanı d&uuml;ş&uuml;nd&uuml;ren bir ser&uuml;ven olarak nitelendiriyor.<br />
Avrupa Koleji Kazlı&ccedil;eşme Kamp&uuml;s&uuml; 6. sınıf &ouml;ğrencileri Bernis Dila Erg&uuml;l ve Ecehan Kekum&rsquo;un, matematik &ouml;ğretmenleri G&uuml;lşah Ekinci&rsquo;ye farklı bir şeyler &uuml;retmek ve insanların hayatlarını değiştirmek istediklerini s&ouml;ylemeleriyle Engelsiz matematik projesinin ortaya &ccedil;ıktığını ifade eden Şeng&uuml;l, sonraki s&uuml;reci şu s&ouml;zlerle anlatıyor: &ldquo;Bu &ccedil;ok iddalı bir hedefti. Onları y&ouml;nlendirme konusunda profesyonel olan &ouml;ğretmenlerinden biri &ldquo;eğer g&ouml;rme engelli olsaydınız matematik derslerini nasıl algılardınız hi&ccedil; d&uuml;ş&uuml;nd&uuml;n&uuml;z m&uuml;?&rdquo; sorusunu y&ouml;neltir &ouml;ğrencilerine. İşte bu soru ilk kıvılcımdır. Buradan yola &ccedil;ıkan &ouml;ğrenciler ve &ouml;ğretmenleri g&ouml;rme engellilerin matematik &ouml;ğrenmelerini kolaylaştırabilecek bir materyal yapmaya karar verirler. Başlangı&ccedil;ta bir proje yarışması hazırlığı olarak başlar &ccedil;alışmaları. Tasarladıkları materyal uzun &ccedil;alışmalardan sonra oluşur. Artık bu materyalin denenmesi gerekmektedir. &Ouml;ğrencilerimiz ve &ouml;ğretmenleri g&ouml;rme engellilerin eğitim aldığı bir okulu ziyaret ederler. Aldıkları tepkiler beklediklerinden daha olumludur. Bazı ekleme ve d&uuml;zeltmeler yapmaları konusundaki tavsiyelerle okula d&ouml;nerler. B&uuml;y&uuml;k bir heyecanla materyallerini yeniden d&uuml;zenlemeye başlarlar. Bu oluşuma okul ve aileler de destek vermektedir. Hedefledikleri yarışmaya katılıp ikincilik &ouml;d&uuml;llerini alırlar ancak artık ama&ccedil;ları derece değildir aslında. Onlar okullarının da desteğiyle g&ouml;rme engelli &ouml;ğrencilere yardım edebilecekleri bir sosyal sorumluluk projesinin merkezindedirler artık. K&uuml;&ccedil;&uuml;c&uuml;k y&uuml;rekleriyle ortaya koydukları bu b&uuml;y&uuml;k &ccedil;aba meyvelerini vermektedir. Projeleri g&ouml;rsel basının ilgisini &ccedil;ekmiş ve ana haber b&uuml;ltenlerinde &ouml;ğrenciler ve &ouml;ğretmenleri bu s&uuml;reci t&uuml;m &uuml;lkeye anlatabilme fırsatını da yakalamışlardır. Bug&uuml;nlerde materyallerini geliştirme &ccedil;alışmalarını s&uuml;rd&uuml;r&uuml;yorlar. Bu geliştirme &ccedil;alışmalarını da G&ouml;rme Engelliler Federasyonu ile yaptıkları g&ouml;r&uuml;şmeler doğrultusunda kurumun da desteği ile s&uuml;rd&uuml;r&uuml;yorlar.&rdquo;</p>
', 1, 4, NULL, CAST(N'2017-01-01T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Haberler] ([Id], [Ad], [Resim], [Slug], [Detay], [Aktif], [KategoriId], [GaleriId], [Tarih], [Hit]) VALUES (55, N'ALKEV ÖZEL OKULLARINDAN HANNOVER DEĞİŞİM PROGRAMI 2016', N'Lew6Jq0c_400x400-3843K.jpeg', N'alkev-ozel-okullarindan-hannover-degisim-programi-2016', N'<p><strong>ALKEV &Ouml;ZEL OKULLARINDAN HANNOVER DEĞİŞİM PROGRAMI 2016</strong></p>

<p>Okulumuzda değişim programlarıyla, &ouml;ğrencilerimize Almanca dilini pekiştirebilecekleri ve geliştirebilecekleri fırsatlar yaratılmaktadır. Bu ama&ccedil;la, Hannover şehrinde bulunan&nbsp;<a href="http://www.sophienschule.de/">Sophienschule</a>&nbsp;ile işbirliği yapılarak hazırlık ve 9. sınıfları kapsayan bir değişim programı başlatıldı. Her yıl d&uuml;zenli olarak ger&ccedil;ekleştirilen bu program kapsamında bu yıl 21 &ouml;ğrencimizin katılımı ger&ccedil;ekleşti.<br />
&Ouml;ğrencilerimiz gezi &ouml;ncesinde hazırlık ve okul d&uuml;zeyinde paylaşım ama&ccedil;lı blog sayfalarında karşılıklı olarak &ccedil;alışma başlatıldı.<br />
1-8 Mayıs 2016 tarihleri arasında &ouml;ğrencilerimiz&nbsp; &ouml;ğretmenleri eşliğinde Hannover &ndash; Sophienschule ziyaretlerini ger&ccedil;ekleştirdiler. Ziyaretleri boyunca misafir ailelerde konaklayan &ouml;ğrencilerimiz, okul saatleri &ccedil;er&ccedil;evesinde kardeş okulumuzu ziyaret ederek derslere, kamp&uuml;s i&ccedil;inde ve dışında proje &ccedil;alışmalarına ve &ccedil;eşitli &ouml;nemli programlara katılım sağladılar.<br />
Programımızın Almanya ayağı eski Almanya başbakanının eşi sayın</p>

<p>Doris Schr&ouml;der-K&ouml;pf liderliğinde y&uuml;r&uuml;t&uuml;lmektedir<img alt="IMG_8385" src="http://temizliksektoru.com/wp-content/uploads/2016/08/IMG_8385.jpg" style="height:600px; width:800px" />&nbsp;</p>
', 1, 4, NULL, CAST(N'2017-01-01T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Haberler] ([Id], [Ad], [Resim], [Slug], [Detay], [Aktif], [KategoriId], [GaleriId], [Tarih], [Hit]) VALUES (56, N'ARSU Güzel Sanatlar Akademisi’nde Sanat Eğitimi Minikler Altı Aylıkken Başlıyor….', N'arsu-guzel-1452E.png', N'arsu-guzel-sanatlar-akademisi-nde-sanat-egitimi-minikler-alti-aylikken-basliyor', N'<p>ARSU G&uuml;zel Sanatlar Akademisi, okul &ouml;ncesi sanat eğitimi programları ve akademik d&uuml;zeydeki eğitimleriyle gen&ccedil; yetenekler yetiştirmeye ve onları sanat ile buluşturmaya devam ediyor. Akademide verilen okul &ouml;ncesi eğitim programı ile &ccedil;ocuklar, atacakları her yaşamsal adımı, oluşan estetik duygusuyla birlikte g&uuml;venle atıyor.</p>

<p>ARSU G&uuml;zel Sanatlar Akademisi sanat eğitimleri bebeğiniz altı aylıkken başlıyor. Arsu G&uuml;zel Sanatlar Akademisi&rsquo;nde sanat eğitiminin başlangı&ccedil; noktası, bilimselliği otoriteler tarafından onaylanmış, d&uuml;nyanın en k&ouml;kl&uuml; ve en saygın okul &ouml;ncesi eğitim sistemi olan Uluslararası Kindermusik International eğitim programı. Bu program &ccedil;ocukların zihinsel gelişimine katkı sağlarken, miniklerin başarılı okul hayatı i&ccedil;in de temeller oluşturuluyor. Kindermusik International eğitim programını tamamlayan minik &ouml;ğrenciler Yetenek Geliştirme ve M&uuml;zikalite Sınıfları&rsquo; nda sanat eğitimlerinin ikinci aşamasına başlıyor. 3.5-5 yaş arası yedi &ouml;ğrencinin bulunduğu M&uuml;zikalite Sınıflarda eğitim, eğlenerek &ouml;ğrenebilecekleri dersler ile devam ediyor. Her iki programda hafta i&ccedil;i ve hafta sonu uygulanabiliyor. 3&rsquo;er aylık periyotlar şeklinde devam eden programlar haftada 1 g&uuml;n/45 dakikalık ders şeklinde hazırlanmış. Eğitim programlarının fiyatı aylık 250 TL&rsquo;den başlıyor. Uluslar arası m&uuml;zik eğitim programları ile devam eden &uuml;&ccedil;&uuml;nc&uuml; aşamada &ouml;ğrenciler daha teknik dersler ile tanışıp, West London Colloge Of Music, ABRSM (Associated Board of Royal Schools of Music) ve Boston Longy School Of Music programları ile sanat eğitimlerine devam ediyorlar. ARSU G&uuml;zel Sanatlar Akademisi&rsquo;nde satan eğitimini başarı ile tamamlayan &ouml;ğrenciler, t&uuml;m d&uuml;nyada ge&ccedil;erli olan lise d&uuml;zeyindeki diplomasına sahip oluyor ve yurtdışındaki konservatuarlarda eğitim alma şansını yakalıyor.</p>
', 1, 3, NULL, CAST(N'2017-01-01T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Haberler] ([Id], [Ad], [Resim], [Slug], [Detay], [Aktif], [KategoriId], [GaleriId], [Tarih], [Hit]) VALUES (57, N'AVRUPA KOLEJİ SOSYAL SORUMLULUKLARDA BİR ADIM ÖNDE', N'AVRUPAasdasd-4704N.jpg', N'avrupa-koleji-sosyal-sorumluluklarda-bir-adim-onde', N'<p><strong>&Ouml;ğrenci odaklı bir eğitim anlayışını benimseyen ve sosyal ortam farkındalığı y&uuml;ksek bireyler yetiştirmeyi hedeflediklerini belirten Avrupa Koleji Kazlı&ccedil;eşme Kamp&uuml;s&uuml; Lise M&uuml;d&uuml;r&uuml; Miray Şeng&uuml;l, &ouml;ğrencilerini sosyal sorumluluk projelerinde de desteklediklerini s&ouml;yl&uuml;yor.</strong></p>

<p>Her yıl iki kez &ouml;ğrenci-&ouml;ğretmen-veli işbirliği ile geliri &ccedil;eşitli yardım kuruluşlarına bağışlanmak &uuml;zere d&uuml;zenlenen kurum b&uuml;nyesinde ger&ccedil;ekleştirilen kermeslerde Avrupa Koleji &ouml;ğrencilerinin aktif g&ouml;rev aldıklarını ve &ouml;ğrencilerin organizasyonun her s&uuml;recini kendilerinin y&ouml;nlendirdiklerini ifade eden Avrupa Koleji Kazlı&ccedil;eşme Kamp&uuml;s&uuml; Lise M&uuml;d&uuml;r&uuml; Miray Şeng&uuml;l, &ldquo;Avrupa Koleji Okulları&rsquo;nda artık bir gelenek gibi s&uuml;rd&uuml;r&uuml;len bu yardımlaşma anlayışı her &ouml;ğrenci ve &ouml;ğretmenin ortak d&uuml;ş&uuml;nme tarzı olmuştur. Bu şekilde empati kurabilen bireylerin yetiştirildiği kurum olma hedefini de ger&ccedil;ekleştirmek m&uuml;mk&uuml;n olabiliyor.&rdquo; diye konuşuyor.<br />
ENGELSİZ MATEMATİK G&Ouml;RME ENGELLİLERE IŞIK OLDU<br />
Bu yaklaşımın &uuml;r&uuml;nleri olarak nitelenebilecek iki &ouml;rneği anlatan Şeng&uuml;l, ilk &ouml;rneği &ldquo;Matematiğe dokunmak hi&ccedil; bu kadar anlamlı olmamıştı&rdquo; diye insanı d&uuml;ş&uuml;nd&uuml;ren bir ser&uuml;ven olarak nitelendiriyor.<br />
Avrupa Koleji Kazlı&ccedil;eşme Kamp&uuml;s&uuml; 6. sınıf &ouml;ğrencileri Bernis Dila Erg&uuml;l ve Ecehan Kekum&rsquo;un, matematik &ouml;ğretmenleri G&uuml;lşah Ekinci&rsquo;ye farklı bir şeyler &uuml;retmek ve insanların hayatlarını değiştirmek istediklerini s&ouml;ylemeleriyle Engelsiz matematik projesinin ortaya &ccedil;ıktığını ifade eden Şeng&uuml;l, sonraki s&uuml;reci şu s&ouml;zlerle anlatıyor: &ldquo;Bu &ccedil;ok iddalı bir hedefti. Onları y&ouml;nlendirme konusunda profesyonel olan &ouml;ğretmenlerinden biri &ldquo;eğer g&ouml;rme engelli olsaydınız matematik derslerini nasıl algılardınız hi&ccedil; d&uuml;ş&uuml;nd&uuml;n&uuml;z m&uuml;?&rdquo; sorusunu y&ouml;neltir &ouml;ğrencilerine. İşte bu soru ilk kıvılcımdır. Buradan yola &ccedil;ıkan &ouml;ğrenciler ve &ouml;ğretmenleri g&ouml;rme engellilerin matematik &ouml;ğrenmelerini kolaylaştırabilecek bir materyal yapmaya karar verirler. Başlangı&ccedil;ta bir proje yarışması hazırlığı olarak başlar &ccedil;alışmaları. Tasarladıkları materyal uzun &ccedil;alışmalardan sonra oluşur. Artık bu materyalin denenmesi gerekmektedir. &Ouml;ğrencilerimiz ve &ouml;ğretmenleri g&ouml;rme engellilerin eğitim aldığı bir okulu ziyaret ederler. Aldıkları tepkiler beklediklerinden daha olumludur. Bazı ekleme ve d&uuml;zeltmeler yapmaları konusundaki tavsiyelerle okula d&ouml;nerler. B&uuml;y&uuml;k bir heyecanla materyallerini yeniden d&uuml;zenlemeye başlarlar. Bu oluşuma okul ve aileler de destek vermektedir. Hedefledikleri yarışmaya katılıp ikincilik &ouml;d&uuml;llerini alırlar ancak artık ama&ccedil;ları derece değildir aslında. Onlar okullarının da desteğiyle g&ouml;rme engelli &ouml;ğrencilere yardım edebilecekleri bir sosyal sorumluluk projesinin merkezindedirler artık. K&uuml;&ccedil;&uuml;c&uuml;k y&uuml;rekleriyle ortaya koydukları bu b&uuml;y&uuml;k &ccedil;aba meyvelerini vermektedir. Projeleri g&ouml;rsel basının ilgisini &ccedil;ekmiş ve ana haber b&uuml;ltenlerinde &ouml;ğrenciler ve &ouml;ğretmenleri bu s&uuml;reci t&uuml;m &uuml;lkeye anlatabilme fırsatını da yakalamışlardır. Bug&uuml;nlerde materyallerini geliştirme &ccedil;alışmalarını s&uuml;rd&uuml;r&uuml;yorlar. Bu geliştirme &ccedil;alışmalarını da G&ouml;rme Engelliler Federasyonu ile yaptıkları g&ouml;r&uuml;şmeler doğrultusunda kurumun da desteği ile s&uuml;rd&uuml;r&uuml;yorlar.&rdquo;</p>
', 1, 4, NULL, CAST(N'2017-01-01T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Haberler] ([Id], [Ad], [Resim], [Slug], [Detay], [Aktif], [KategoriId], [GaleriId], [Tarih], [Hit]) VALUES (58, N'ALKEV ÖZEL OKULLARINDAN HANNOVER DEĞİŞİM PROGRAMI 2016', N'Lew6Jq0c_400x400-3843K.jpeg', N'alkev-ozel-okullarindan-hannover-degisim-programi-2016', N'<p><strong>ALKEV &Ouml;ZEL OKULLARINDAN HANNOVER DEĞİŞİM PROGRAMI 2016</strong></p>

<p>Okulumuzda değişim programlarıyla, &ouml;ğrencilerimize Almanca dilini pekiştirebilecekleri ve geliştirebilecekleri fırsatlar yaratılmaktadır. Bu ama&ccedil;la, Hannover şehrinde bulunan&nbsp;<a href="http://www.sophienschule.de/">Sophienschule</a>&nbsp;ile işbirliği yapılarak hazırlık ve 9. sınıfları kapsayan bir değişim programı başlatıldı. Her yıl d&uuml;zenli olarak ger&ccedil;ekleştirilen bu program kapsamında bu yıl 21 &ouml;ğrencimizin katılımı ger&ccedil;ekleşti.<br />
&Ouml;ğrencilerimiz gezi &ouml;ncesinde hazırlık ve okul d&uuml;zeyinde paylaşım ama&ccedil;lı blog sayfalarında karşılıklı olarak &ccedil;alışma başlatıldı.<br />
1-8 Mayıs 2016 tarihleri arasında &ouml;ğrencilerimiz&nbsp; &ouml;ğretmenleri eşliğinde Hannover &ndash; Sophienschule ziyaretlerini ger&ccedil;ekleştirdiler. Ziyaretleri boyunca misafir ailelerde konaklayan &ouml;ğrencilerimiz, okul saatleri &ccedil;er&ccedil;evesinde kardeş okulumuzu ziyaret ederek derslere, kamp&uuml;s i&ccedil;inde ve dışında proje &ccedil;alışmalarına ve &ccedil;eşitli &ouml;nemli programlara katılım sağladılar.<br />
Programımızın Almanya ayağı eski Almanya başbakanının eşi sayın</p>

<p>Doris Schr&ouml;der-K&ouml;pf liderliğinde y&uuml;r&uuml;t&uuml;lmektedir<img alt="IMG_8385" src="http://temizliksektoru.com/wp-content/uploads/2016/08/IMG_8385.jpg" style="height:600px; width:800px" />&nbsp;</p>
', 1, 4, NULL, CAST(N'2017-01-01T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Haberler] ([Id], [Ad], [Resim], [Slug], [Detay], [Aktif], [KategoriId], [GaleriId], [Tarih], [Hit]) VALUES (59, N'ARSU Güzel Sanatlar Akademisi’nde Sanat Eğitimi Minikler Altı Aylıkken Başlıyor….', N'arsu-guzel-1452E.png', N'arsu-guzel-sanatlar-akademisi-nde-sanat-egitimi-minikler-alti-aylikken-basliyor', N'<p>ARSU G&uuml;zel Sanatlar Akademisi, okul &ouml;ncesi sanat eğitimi programları ve akademik d&uuml;zeydeki eğitimleriyle gen&ccedil; yetenekler yetiştirmeye ve onları sanat ile buluşturmaya devam ediyor. Akademide verilen okul &ouml;ncesi eğitim programı ile &ccedil;ocuklar, atacakları her yaşamsal adımı, oluşan estetik duygusuyla birlikte g&uuml;venle atıyor.</p>

<p>ARSU G&uuml;zel Sanatlar Akademisi sanat eğitimleri bebeğiniz altı aylıkken başlıyor. Arsu G&uuml;zel Sanatlar Akademisi&rsquo;nde sanat eğitiminin başlangı&ccedil; noktası, bilimselliği otoriteler tarafından onaylanmış, d&uuml;nyanın en k&ouml;kl&uuml; ve en saygın okul &ouml;ncesi eğitim sistemi olan Uluslararası Kindermusik International eğitim programı. Bu program &ccedil;ocukların zihinsel gelişimine katkı sağlarken, miniklerin başarılı okul hayatı i&ccedil;in de temeller oluşturuluyor. Kindermusik International eğitim programını tamamlayan minik &ouml;ğrenciler Yetenek Geliştirme ve M&uuml;zikalite Sınıfları&rsquo; nda sanat eğitimlerinin ikinci aşamasına başlıyor. 3.5-5 yaş arası yedi &ouml;ğrencinin bulunduğu M&uuml;zikalite Sınıflarda eğitim, eğlenerek &ouml;ğrenebilecekleri dersler ile devam ediyor. Her iki programda hafta i&ccedil;i ve hafta sonu uygulanabiliyor. 3&rsquo;er aylık periyotlar şeklinde devam eden programlar haftada 1 g&uuml;n/45 dakikalık ders şeklinde hazırlanmış. Eğitim programlarının fiyatı aylık 250 TL&rsquo;den başlıyor. Uluslar arası m&uuml;zik eğitim programları ile devam eden &uuml;&ccedil;&uuml;nc&uuml; aşamada &ouml;ğrenciler daha teknik dersler ile tanışıp, West London Colloge Of Music, ABRSM (Associated Board of Royal Schools of Music) ve Boston Longy School Of Music programları ile sanat eğitimlerine devam ediyorlar. ARSU G&uuml;zel Sanatlar Akademisi&rsquo;nde satan eğitimini başarı ile tamamlayan &ouml;ğrenciler, t&uuml;m d&uuml;nyada ge&ccedil;erli olan lise d&uuml;zeyindeki diplomasına sahip oluyor ve yurtdışındaki konservatuarlarda eğitim alma şansını yakalıyor.</p>
', 1, 3, NULL, CAST(N'2017-01-01T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Haberler] ([Id], [Ad], [Resim], [Slug], [Detay], [Aktif], [KategoriId], [GaleriId], [Tarih], [Hit]) VALUES (60, N'AVRUPA KOLEJİ SOSYAL SORUMLULUKLARDA BİR ADIM ÖNDE', N'AVRUPAasdasd-4704N.jpg', N'avrupa-koleji-sosyal-sorumluluklarda-bir-adim-onde', N'<p><strong>&Ouml;ğrenci odaklı bir eğitim anlayışını benimseyen ve sosyal ortam farkındalığı y&uuml;ksek bireyler yetiştirmeyi hedeflediklerini belirten Avrupa Koleji Kazlı&ccedil;eşme Kamp&uuml;s&uuml; Lise M&uuml;d&uuml;r&uuml; Miray Şeng&uuml;l, &ouml;ğrencilerini sosyal sorumluluk projelerinde de desteklediklerini s&ouml;yl&uuml;yor.</strong></p>

<p>Her yıl iki kez &ouml;ğrenci-&ouml;ğretmen-veli işbirliği ile geliri &ccedil;eşitli yardım kuruluşlarına bağışlanmak &uuml;zere d&uuml;zenlenen kurum b&uuml;nyesinde ger&ccedil;ekleştirilen kermeslerde Avrupa Koleji &ouml;ğrencilerinin aktif g&ouml;rev aldıklarını ve &ouml;ğrencilerin organizasyonun her s&uuml;recini kendilerinin y&ouml;nlendirdiklerini ifade eden Avrupa Koleji Kazlı&ccedil;eşme Kamp&uuml;s&uuml; Lise M&uuml;d&uuml;r&uuml; Miray Şeng&uuml;l, &ldquo;Avrupa Koleji Okulları&rsquo;nda artık bir gelenek gibi s&uuml;rd&uuml;r&uuml;len bu yardımlaşma anlayışı her &ouml;ğrenci ve &ouml;ğretmenin ortak d&uuml;ş&uuml;nme tarzı olmuştur. Bu şekilde empati kurabilen bireylerin yetiştirildiği kurum olma hedefini de ger&ccedil;ekleştirmek m&uuml;mk&uuml;n olabiliyor.&rdquo; diye konuşuyor.<br />
ENGELSİZ MATEMATİK G&Ouml;RME ENGELLİLERE IŞIK OLDU<br />
Bu yaklaşımın &uuml;r&uuml;nleri olarak nitelenebilecek iki &ouml;rneği anlatan Şeng&uuml;l, ilk &ouml;rneği &ldquo;Matematiğe dokunmak hi&ccedil; bu kadar anlamlı olmamıştı&rdquo; diye insanı d&uuml;ş&uuml;nd&uuml;ren bir ser&uuml;ven olarak nitelendiriyor.<br />
Avrupa Koleji Kazlı&ccedil;eşme Kamp&uuml;s&uuml; 6. sınıf &ouml;ğrencileri Bernis Dila Erg&uuml;l ve Ecehan Kekum&rsquo;un, matematik &ouml;ğretmenleri G&uuml;lşah Ekinci&rsquo;ye farklı bir şeyler &uuml;retmek ve insanların hayatlarını değiştirmek istediklerini s&ouml;ylemeleriyle Engelsiz matematik projesinin ortaya &ccedil;ıktığını ifade eden Şeng&uuml;l, sonraki s&uuml;reci şu s&ouml;zlerle anlatıyor: &ldquo;Bu &ccedil;ok iddalı bir hedefti. Onları y&ouml;nlendirme konusunda profesyonel olan &ouml;ğretmenlerinden biri &ldquo;eğer g&ouml;rme engelli olsaydınız matematik derslerini nasıl algılardınız hi&ccedil; d&uuml;ş&uuml;nd&uuml;n&uuml;z m&uuml;?&rdquo; sorusunu y&ouml;neltir &ouml;ğrencilerine. İşte bu soru ilk kıvılcımdır. Buradan yola &ccedil;ıkan &ouml;ğrenciler ve &ouml;ğretmenleri g&ouml;rme engellilerin matematik &ouml;ğrenmelerini kolaylaştırabilecek bir materyal yapmaya karar verirler. Başlangı&ccedil;ta bir proje yarışması hazırlığı olarak başlar &ccedil;alışmaları. Tasarladıkları materyal uzun &ccedil;alışmalardan sonra oluşur. Artık bu materyalin denenmesi gerekmektedir. &Ouml;ğrencilerimiz ve &ouml;ğretmenleri g&ouml;rme engellilerin eğitim aldığı bir okulu ziyaret ederler. Aldıkları tepkiler beklediklerinden daha olumludur. Bazı ekleme ve d&uuml;zeltmeler yapmaları konusundaki tavsiyelerle okula d&ouml;nerler. B&uuml;y&uuml;k bir heyecanla materyallerini yeniden d&uuml;zenlemeye başlarlar. Bu oluşuma okul ve aileler de destek vermektedir. Hedefledikleri yarışmaya katılıp ikincilik &ouml;d&uuml;llerini alırlar ancak artık ama&ccedil;ları derece değildir aslında. Onlar okullarının da desteğiyle g&ouml;rme engelli &ouml;ğrencilere yardım edebilecekleri bir sosyal sorumluluk projesinin merkezindedirler artık. K&uuml;&ccedil;&uuml;c&uuml;k y&uuml;rekleriyle ortaya koydukları bu b&uuml;y&uuml;k &ccedil;aba meyvelerini vermektedir. Projeleri g&ouml;rsel basının ilgisini &ccedil;ekmiş ve ana haber b&uuml;ltenlerinde &ouml;ğrenciler ve &ouml;ğretmenleri bu s&uuml;reci t&uuml;m &uuml;lkeye anlatabilme fırsatını da yakalamışlardır. Bug&uuml;nlerde materyallerini geliştirme &ccedil;alışmalarını s&uuml;rd&uuml;r&uuml;yorlar. Bu geliştirme &ccedil;alışmalarını da G&ouml;rme Engelliler Federasyonu ile yaptıkları g&ouml;r&uuml;şmeler doğrultusunda kurumun da desteği ile s&uuml;rd&uuml;r&uuml;yorlar.&rdquo;</p>
', 1, 4, NULL, CAST(N'2017-01-01T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Haberler] ([Id], [Ad], [Resim], [Slug], [Detay], [Aktif], [KategoriId], [GaleriId], [Tarih], [Hit]) VALUES (61, N'ALKEV ÖZEL OKULLARINDAN HANNOVER DEĞİŞİM PROGRAMI 2016', N'Lew6Jq0c_400x400-3843K.jpeg', N'alkev-ozel-okullarindan-hannover-degisim-programi-2016', N'<p><strong>ALKEV &Ouml;ZEL OKULLARINDAN HANNOVER DEĞİŞİM PROGRAMI 2016</strong></p>

<p>Okulumuzda değişim programlarıyla, &ouml;ğrencilerimize Almanca dilini pekiştirebilecekleri ve geliştirebilecekleri fırsatlar yaratılmaktadır. Bu ama&ccedil;la, Hannover şehrinde bulunan&nbsp;<a href="http://www.sophienschule.de/">Sophienschule</a>&nbsp;ile işbirliği yapılarak hazırlık ve 9. sınıfları kapsayan bir değişim programı başlatıldı. Her yıl d&uuml;zenli olarak ger&ccedil;ekleştirilen bu program kapsamında bu yıl 21 &ouml;ğrencimizin katılımı ger&ccedil;ekleşti.<br />
&Ouml;ğrencilerimiz gezi &ouml;ncesinde hazırlık ve okul d&uuml;zeyinde paylaşım ama&ccedil;lı blog sayfalarında karşılıklı olarak &ccedil;alışma başlatıldı.<br />
1-8 Mayıs 2016 tarihleri arasında &ouml;ğrencilerimiz&nbsp; &ouml;ğretmenleri eşliğinde Hannover &ndash; Sophienschule ziyaretlerini ger&ccedil;ekleştirdiler. Ziyaretleri boyunca misafir ailelerde konaklayan &ouml;ğrencilerimiz, okul saatleri &ccedil;er&ccedil;evesinde kardeş okulumuzu ziyaret ederek derslere, kamp&uuml;s i&ccedil;inde ve dışında proje &ccedil;alışmalarına ve &ccedil;eşitli &ouml;nemli programlara katılım sağladılar.<br />
Programımızın Almanya ayağı eski Almanya başbakanının eşi sayın</p>

<p>Doris Schr&ouml;der-K&ouml;pf liderliğinde y&uuml;r&uuml;t&uuml;lmektedir<img alt="IMG_8385" src="http://temizliksektoru.com/wp-content/uploads/2016/08/IMG_8385.jpg" style="height:600px; width:800px" />&nbsp;</p>
', 1, 4, NULL, CAST(N'2017-01-01T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Haberler] ([Id], [Ad], [Resim], [Slug], [Detay], [Aktif], [KategoriId], [GaleriId], [Tarih], [Hit]) VALUES (62, N'ARSU Güzel Sanatlar Akademisi’nde Sanat Eğitimi Minikler Altı Aylıkken Başlıyor….', N'arsu-guzel-1452E.png', N'arsu-guzel-sanatlar-akademisi-nde-sanat-egitimi-minikler-alti-aylikken-basliyor', N'<p>ARSU G&uuml;zel Sanatlar Akademisi, okul &ouml;ncesi sanat eğitimi programları ve akademik d&uuml;zeydeki eğitimleriyle gen&ccedil; yetenekler yetiştirmeye ve onları sanat ile buluşturmaya devam ediyor. Akademide verilen okul &ouml;ncesi eğitim programı ile &ccedil;ocuklar, atacakları her yaşamsal adımı, oluşan estetik duygusuyla birlikte g&uuml;venle atıyor.</p>

<p>ARSU G&uuml;zel Sanatlar Akademisi sanat eğitimleri bebeğiniz altı aylıkken başlıyor. Arsu G&uuml;zel Sanatlar Akademisi&rsquo;nde sanat eğitiminin başlangı&ccedil; noktası, bilimselliği otoriteler tarafından onaylanmış, d&uuml;nyanın en k&ouml;kl&uuml; ve en saygın okul &ouml;ncesi eğitim sistemi olan Uluslararası Kindermusik International eğitim programı. Bu program &ccedil;ocukların zihinsel gelişimine katkı sağlarken, miniklerin başarılı okul hayatı i&ccedil;in de temeller oluşturuluyor. Kindermusik International eğitim programını tamamlayan minik &ouml;ğrenciler Yetenek Geliştirme ve M&uuml;zikalite Sınıfları&rsquo; nda sanat eğitimlerinin ikinci aşamasına başlıyor. 3.5-5 yaş arası yedi &ouml;ğrencinin bulunduğu M&uuml;zikalite Sınıflarda eğitim, eğlenerek &ouml;ğrenebilecekleri dersler ile devam ediyor. Her iki programda hafta i&ccedil;i ve hafta sonu uygulanabiliyor. 3&rsquo;er aylık periyotlar şeklinde devam eden programlar haftada 1 g&uuml;n/45 dakikalık ders şeklinde hazırlanmış. Eğitim programlarının fiyatı aylık 250 TL&rsquo;den başlıyor. Uluslar arası m&uuml;zik eğitim programları ile devam eden &uuml;&ccedil;&uuml;nc&uuml; aşamada &ouml;ğrenciler daha teknik dersler ile tanışıp, West London Colloge Of Music, ABRSM (Associated Board of Royal Schools of Music) ve Boston Longy School Of Music programları ile sanat eğitimlerine devam ediyorlar. ARSU G&uuml;zel Sanatlar Akademisi&rsquo;nde satan eğitimini başarı ile tamamlayan &ouml;ğrenciler, t&uuml;m d&uuml;nyada ge&ccedil;erli olan lise d&uuml;zeyindeki diplomasına sahip oluyor ve yurtdışındaki konservatuarlarda eğitim alma şansını yakalıyor.</p>
', 1, 3, NULL, CAST(N'2017-01-01T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Haberler] ([Id], [Ad], [Resim], [Slug], [Detay], [Aktif], [KategoriId], [GaleriId], [Tarih], [Hit]) VALUES (63, N'AVRUPA KOLEJİ SOSYAL SORUMLULUKLARDA BİR ADIM ÖNDE', N'AVRUPAasdasd-4704N.jpg', N'avrupa-koleji-sosyal-sorumluluklarda-bir-adim-onde', N'<p><strong>&Ouml;ğrenci odaklı bir eğitim anlayışını benimseyen ve sosyal ortam farkındalığı y&uuml;ksek bireyler yetiştirmeyi hedeflediklerini belirten Avrupa Koleji Kazlı&ccedil;eşme Kamp&uuml;s&uuml; Lise M&uuml;d&uuml;r&uuml; Miray Şeng&uuml;l, &ouml;ğrencilerini sosyal sorumluluk projelerinde de desteklediklerini s&ouml;yl&uuml;yor.</strong></p>

<p>Her yıl iki kez &ouml;ğrenci-&ouml;ğretmen-veli işbirliği ile geliri &ccedil;eşitli yardım kuruluşlarına bağışlanmak &uuml;zere d&uuml;zenlenen kurum b&uuml;nyesinde ger&ccedil;ekleştirilen kermeslerde Avrupa Koleji &ouml;ğrencilerinin aktif g&ouml;rev aldıklarını ve &ouml;ğrencilerin organizasyonun her s&uuml;recini kendilerinin y&ouml;nlendirdiklerini ifade eden Avrupa Koleji Kazlı&ccedil;eşme Kamp&uuml;s&uuml; Lise M&uuml;d&uuml;r&uuml; Miray Şeng&uuml;l, &ldquo;Avrupa Koleji Okulları&rsquo;nda artık bir gelenek gibi s&uuml;rd&uuml;r&uuml;len bu yardımlaşma anlayışı her &ouml;ğrenci ve &ouml;ğretmenin ortak d&uuml;ş&uuml;nme tarzı olmuştur. Bu şekilde empati kurabilen bireylerin yetiştirildiği kurum olma hedefini de ger&ccedil;ekleştirmek m&uuml;mk&uuml;n olabiliyor.&rdquo; diye konuşuyor.<br />
ENGELSİZ MATEMATİK G&Ouml;RME ENGELLİLERE IŞIK OLDU<br />
Bu yaklaşımın &uuml;r&uuml;nleri olarak nitelenebilecek iki &ouml;rneği anlatan Şeng&uuml;l, ilk &ouml;rneği &ldquo;Matematiğe dokunmak hi&ccedil; bu kadar anlamlı olmamıştı&rdquo; diye insanı d&uuml;ş&uuml;nd&uuml;ren bir ser&uuml;ven olarak nitelendiriyor.<br />
Avrupa Koleji Kazlı&ccedil;eşme Kamp&uuml;s&uuml; 6. sınıf &ouml;ğrencileri Bernis Dila Erg&uuml;l ve Ecehan Kekum&rsquo;un, matematik &ouml;ğretmenleri G&uuml;lşah Ekinci&rsquo;ye farklı bir şeyler &uuml;retmek ve insanların hayatlarını değiştirmek istediklerini s&ouml;ylemeleriyle Engelsiz matematik projesinin ortaya &ccedil;ıktığını ifade eden Şeng&uuml;l, sonraki s&uuml;reci şu s&ouml;zlerle anlatıyor: &ldquo;Bu &ccedil;ok iddalı bir hedefti. Onları y&ouml;nlendirme konusunda profesyonel olan &ouml;ğretmenlerinden biri &ldquo;eğer g&ouml;rme engelli olsaydınız matematik derslerini nasıl algılardınız hi&ccedil; d&uuml;ş&uuml;nd&uuml;n&uuml;z m&uuml;?&rdquo; sorusunu y&ouml;neltir &ouml;ğrencilerine. İşte bu soru ilk kıvılcımdır. Buradan yola &ccedil;ıkan &ouml;ğrenciler ve &ouml;ğretmenleri g&ouml;rme engellilerin matematik &ouml;ğrenmelerini kolaylaştırabilecek bir materyal yapmaya karar verirler. Başlangı&ccedil;ta bir proje yarışması hazırlığı olarak başlar &ccedil;alışmaları. Tasarladıkları materyal uzun &ccedil;alışmalardan sonra oluşur. Artık bu materyalin denenmesi gerekmektedir. &Ouml;ğrencilerimiz ve &ouml;ğretmenleri g&ouml;rme engellilerin eğitim aldığı bir okulu ziyaret ederler. Aldıkları tepkiler beklediklerinden daha olumludur. Bazı ekleme ve d&uuml;zeltmeler yapmaları konusundaki tavsiyelerle okula d&ouml;nerler. B&uuml;y&uuml;k bir heyecanla materyallerini yeniden d&uuml;zenlemeye başlarlar. Bu oluşuma okul ve aileler de destek vermektedir. Hedefledikleri yarışmaya katılıp ikincilik &ouml;d&uuml;llerini alırlar ancak artık ama&ccedil;ları derece değildir aslında. Onlar okullarının da desteğiyle g&ouml;rme engelli &ouml;ğrencilere yardım edebilecekleri bir sosyal sorumluluk projesinin merkezindedirler artık. K&uuml;&ccedil;&uuml;c&uuml;k y&uuml;rekleriyle ortaya koydukları bu b&uuml;y&uuml;k &ccedil;aba meyvelerini vermektedir. Projeleri g&ouml;rsel basının ilgisini &ccedil;ekmiş ve ana haber b&uuml;ltenlerinde &ouml;ğrenciler ve &ouml;ğretmenleri bu s&uuml;reci t&uuml;m &uuml;lkeye anlatabilme fırsatını da yakalamışlardır. Bug&uuml;nlerde materyallerini geliştirme &ccedil;alışmalarını s&uuml;rd&uuml;r&uuml;yorlar. Bu geliştirme &ccedil;alışmalarını da G&ouml;rme Engelliler Federasyonu ile yaptıkları g&ouml;r&uuml;şmeler doğrultusunda kurumun da desteği ile s&uuml;rd&uuml;r&uuml;yorlar.&rdquo;</p>
', 1, 4, NULL, CAST(N'2017-01-01T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Haberler] ([Id], [Ad], [Resim], [Slug], [Detay], [Aktif], [KategoriId], [GaleriId], [Tarih], [Hit]) VALUES (64, N'ALKEV ÖZEL OKULLARINDAN HANNOVER DEĞİŞİM PROGRAMI 2016', N'Lew6Jq0c_400x400-3843K.jpeg', N'alkev-ozel-okullarindan-hannover-degisim-programi-2016', N'<p><strong>ALKEV &Ouml;ZEL OKULLARINDAN HANNOVER DEĞİŞİM PROGRAMI 2016</strong></p>

<p>Okulumuzda değişim programlarıyla, &ouml;ğrencilerimize Almanca dilini pekiştirebilecekleri ve geliştirebilecekleri fırsatlar yaratılmaktadır. Bu ama&ccedil;la, Hannover şehrinde bulunan&nbsp;<a href="http://www.sophienschule.de/">Sophienschule</a>&nbsp;ile işbirliği yapılarak hazırlık ve 9. sınıfları kapsayan bir değişim programı başlatıldı. Her yıl d&uuml;zenli olarak ger&ccedil;ekleştirilen bu program kapsamında bu yıl 21 &ouml;ğrencimizin katılımı ger&ccedil;ekleşti.<br />
&Ouml;ğrencilerimiz gezi &ouml;ncesinde hazırlık ve okul d&uuml;zeyinde paylaşım ama&ccedil;lı blog sayfalarında karşılıklı olarak &ccedil;alışma başlatıldı.<br />
1-8 Mayıs 2016 tarihleri arasında &ouml;ğrencilerimiz&nbsp; &ouml;ğretmenleri eşliğinde Hannover &ndash; Sophienschule ziyaretlerini ger&ccedil;ekleştirdiler. Ziyaretleri boyunca misafir ailelerde konaklayan &ouml;ğrencilerimiz, okul saatleri &ccedil;er&ccedil;evesinde kardeş okulumuzu ziyaret ederek derslere, kamp&uuml;s i&ccedil;inde ve dışında proje &ccedil;alışmalarına ve &ccedil;eşitli &ouml;nemli programlara katılım sağladılar.<br />
Programımızın Almanya ayağı eski Almanya başbakanının eşi sayın</p>

<p>Doris Schr&ouml;der-K&ouml;pf liderliğinde y&uuml;r&uuml;t&uuml;lmektedir<img alt="IMG_8385" src="http://temizliksektoru.com/wp-content/uploads/2016/08/IMG_8385.jpg" style="height:600px; width:800px" />&nbsp;</p>
', 1, 4, NULL, CAST(N'2017-01-01T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Haberler] ([Id], [Ad], [Resim], [Slug], [Detay], [Aktif], [KategoriId], [GaleriId], [Tarih], [Hit]) VALUES (65, N'ARSU Güzel Sanatlar Akademisi’nde Sanat Eğitimi Minikler Altı Aylıkken Başlıyor….', N'arsu-guzel-1452E.png', N'arsu-guzel-sanatlar-akademisi-nde-sanat-egitimi-minikler-alti-aylikken-basliyor', N'<p>ARSU G&uuml;zel Sanatlar Akademisi, okul &ouml;ncesi sanat eğitimi programları ve akademik d&uuml;zeydeki eğitimleriyle gen&ccedil; yetenekler yetiştirmeye ve onları sanat ile buluşturmaya devam ediyor. Akademide verilen okul &ouml;ncesi eğitim programı ile &ccedil;ocuklar, atacakları her yaşamsal adımı, oluşan estetik duygusuyla birlikte g&uuml;venle atıyor.</p>

<p>ARSU G&uuml;zel Sanatlar Akademisi sanat eğitimleri bebeğiniz altı aylıkken başlıyor. Arsu G&uuml;zel Sanatlar Akademisi&rsquo;nde sanat eğitiminin başlangı&ccedil; noktası, bilimselliği otoriteler tarafından onaylanmış, d&uuml;nyanın en k&ouml;kl&uuml; ve en saygın okul &ouml;ncesi eğitim sistemi olan Uluslararası Kindermusik International eğitim programı. Bu program &ccedil;ocukların zihinsel gelişimine katkı sağlarken, miniklerin başarılı okul hayatı i&ccedil;in de temeller oluşturuluyor. Kindermusik International eğitim programını tamamlayan minik &ouml;ğrenciler Yetenek Geliştirme ve M&uuml;zikalite Sınıfları&rsquo; nda sanat eğitimlerinin ikinci aşamasına başlıyor. 3.5-5 yaş arası yedi &ouml;ğrencinin bulunduğu M&uuml;zikalite Sınıflarda eğitim, eğlenerek &ouml;ğrenebilecekleri dersler ile devam ediyor. Her iki programda hafta i&ccedil;i ve hafta sonu uygulanabiliyor. 3&rsquo;er aylık periyotlar şeklinde devam eden programlar haftada 1 g&uuml;n/45 dakikalık ders şeklinde hazırlanmış. Eğitim programlarının fiyatı aylık 250 TL&rsquo;den başlıyor. Uluslar arası m&uuml;zik eğitim programları ile devam eden &uuml;&ccedil;&uuml;nc&uuml; aşamada &ouml;ğrenciler daha teknik dersler ile tanışıp, West London Colloge Of Music, ABRSM (Associated Board of Royal Schools of Music) ve Boston Longy School Of Music programları ile sanat eğitimlerine devam ediyorlar. ARSU G&uuml;zel Sanatlar Akademisi&rsquo;nde satan eğitimini başarı ile tamamlayan &ouml;ğrenciler, t&uuml;m d&uuml;nyada ge&ccedil;erli olan lise d&uuml;zeyindeki diplomasına sahip oluyor ve yurtdışındaki konservatuarlarda eğitim alma şansını yakalıyor.</p>
', 1, 3, NULL, CAST(N'2017-01-01T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Haberler] ([Id], [Ad], [Resim], [Slug], [Detay], [Aktif], [KategoriId], [GaleriId], [Tarih], [Hit]) VALUES (66, N'AVRUPA KOLEJİ SOSYAL SORUMLULUKLARDA BİR ADIM ÖNDE', N'AVRUPAasdasd-4704N.jpg', N'avrupa-koleji-sosyal-sorumluluklarda-bir-adim-onde', N'<p><strong>&Ouml;ğrenci odaklı bir eğitim anlayışını benimseyen ve sosyal ortam farkındalığı y&uuml;ksek bireyler yetiştirmeyi hedeflediklerini belirten Avrupa Koleji Kazlı&ccedil;eşme Kamp&uuml;s&uuml; Lise M&uuml;d&uuml;r&uuml; Miray Şeng&uuml;l, &ouml;ğrencilerini sosyal sorumluluk projelerinde de desteklediklerini s&ouml;yl&uuml;yor.</strong></p>

<p>Her yıl iki kez &ouml;ğrenci-&ouml;ğretmen-veli işbirliği ile geliri &ccedil;eşitli yardım kuruluşlarına bağışlanmak &uuml;zere d&uuml;zenlenen kurum b&uuml;nyesinde ger&ccedil;ekleştirilen kermeslerde Avrupa Koleji &ouml;ğrencilerinin aktif g&ouml;rev aldıklarını ve &ouml;ğrencilerin organizasyonun her s&uuml;recini kendilerinin y&ouml;nlendirdiklerini ifade eden Avrupa Koleji Kazlı&ccedil;eşme Kamp&uuml;s&uuml; Lise M&uuml;d&uuml;r&uuml; Miray Şeng&uuml;l, &ldquo;Avrupa Koleji Okulları&rsquo;nda artık bir gelenek gibi s&uuml;rd&uuml;r&uuml;len bu yardımlaşma anlayışı her &ouml;ğrenci ve &ouml;ğretmenin ortak d&uuml;ş&uuml;nme tarzı olmuştur. Bu şekilde empati kurabilen bireylerin yetiştirildiği kurum olma hedefini de ger&ccedil;ekleştirmek m&uuml;mk&uuml;n olabiliyor.&rdquo; diye konuşuyor.<br />
ENGELSİZ MATEMATİK G&Ouml;RME ENGELLİLERE IŞIK OLDU<br />
Bu yaklaşımın &uuml;r&uuml;nleri olarak nitelenebilecek iki &ouml;rneği anlatan Şeng&uuml;l, ilk &ouml;rneği &ldquo;Matematiğe dokunmak hi&ccedil; bu kadar anlamlı olmamıştı&rdquo; diye insanı d&uuml;ş&uuml;nd&uuml;ren bir ser&uuml;ven olarak nitelendiriyor.<br />
Avrupa Koleji Kazlı&ccedil;eşme Kamp&uuml;s&uuml; 6. sınıf &ouml;ğrencileri Bernis Dila Erg&uuml;l ve Ecehan Kekum&rsquo;un, matematik &ouml;ğretmenleri G&uuml;lşah Ekinci&rsquo;ye farklı bir şeyler &uuml;retmek ve insanların hayatlarını değiştirmek istediklerini s&ouml;ylemeleriyle Engelsiz matematik projesinin ortaya &ccedil;ıktığını ifade eden Şeng&uuml;l, sonraki s&uuml;reci şu s&ouml;zlerle anlatıyor: &ldquo;Bu &ccedil;ok iddalı bir hedefti. Onları y&ouml;nlendirme konusunda profesyonel olan &ouml;ğretmenlerinden biri &ldquo;eğer g&ouml;rme engelli olsaydınız matematik derslerini nasıl algılardınız hi&ccedil; d&uuml;ş&uuml;nd&uuml;n&uuml;z m&uuml;?&rdquo; sorusunu y&ouml;neltir &ouml;ğrencilerine. İşte bu soru ilk kıvılcımdır. Buradan yola &ccedil;ıkan &ouml;ğrenciler ve &ouml;ğretmenleri g&ouml;rme engellilerin matematik &ouml;ğrenmelerini kolaylaştırabilecek bir materyal yapmaya karar verirler. Başlangı&ccedil;ta bir proje yarışması hazırlığı olarak başlar &ccedil;alışmaları. Tasarladıkları materyal uzun &ccedil;alışmalardan sonra oluşur. Artık bu materyalin denenmesi gerekmektedir. &Ouml;ğrencilerimiz ve &ouml;ğretmenleri g&ouml;rme engellilerin eğitim aldığı bir okulu ziyaret ederler. Aldıkları tepkiler beklediklerinden daha olumludur. Bazı ekleme ve d&uuml;zeltmeler yapmaları konusundaki tavsiyelerle okula d&ouml;nerler. B&uuml;y&uuml;k bir heyecanla materyallerini yeniden d&uuml;zenlemeye başlarlar. Bu oluşuma okul ve aileler de destek vermektedir. Hedefledikleri yarışmaya katılıp ikincilik &ouml;d&uuml;llerini alırlar ancak artık ama&ccedil;ları derece değildir aslında. Onlar okullarının da desteğiyle g&ouml;rme engelli &ouml;ğrencilere yardım edebilecekleri bir sosyal sorumluluk projesinin merkezindedirler artık. K&uuml;&ccedil;&uuml;c&uuml;k y&uuml;rekleriyle ortaya koydukları bu b&uuml;y&uuml;k &ccedil;aba meyvelerini vermektedir. Projeleri g&ouml;rsel basının ilgisini &ccedil;ekmiş ve ana haber b&uuml;ltenlerinde &ouml;ğrenciler ve &ouml;ğretmenleri bu s&uuml;reci t&uuml;m &uuml;lkeye anlatabilme fırsatını da yakalamışlardır. Bug&uuml;nlerde materyallerini geliştirme &ccedil;alışmalarını s&uuml;rd&uuml;r&uuml;yorlar. Bu geliştirme &ccedil;alışmalarını da G&ouml;rme Engelliler Federasyonu ile yaptıkları g&ouml;r&uuml;şmeler doğrultusunda kurumun da desteği ile s&uuml;rd&uuml;r&uuml;yorlar.&rdquo;</p>
', 1, 4, NULL, CAST(N'2017-01-01T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Haberler] ([Id], [Ad], [Resim], [Slug], [Detay], [Aktif], [KategoriId], [GaleriId], [Tarih], [Hit]) VALUES (67, N'ALKEV ÖZEL OKULLARINDAN HANNOVER DEĞİŞİM PROGRAMI 2016', N'Lew6Jq0c_400x400-3843K.jpeg', N'alkev-ozel-okullarindan-hannover-degisim-programi-2016', N'<p><strong>ALKEV &Ouml;ZEL OKULLARINDAN HANNOVER DEĞİŞİM PROGRAMI 2016</strong></p>

<p>Okulumuzda değişim programlarıyla, &ouml;ğrencilerimize Almanca dilini pekiştirebilecekleri ve geliştirebilecekleri fırsatlar yaratılmaktadır. Bu ama&ccedil;la, Hannover şehrinde bulunan&nbsp;<a href="http://www.sophienschule.de/">Sophienschule</a>&nbsp;ile işbirliği yapılarak hazırlık ve 9. sınıfları kapsayan bir değişim programı başlatıldı. Her yıl d&uuml;zenli olarak ger&ccedil;ekleştirilen bu program kapsamında bu yıl 21 &ouml;ğrencimizin katılımı ger&ccedil;ekleşti.<br />
&Ouml;ğrencilerimiz gezi &ouml;ncesinde hazırlık ve okul d&uuml;zeyinde paylaşım ama&ccedil;lı blog sayfalarında karşılıklı olarak &ccedil;alışma başlatıldı.<br />
1-8 Mayıs 2016 tarihleri arasında &ouml;ğrencilerimiz&nbsp; &ouml;ğretmenleri eşliğinde Hannover &ndash; Sophienschule ziyaretlerini ger&ccedil;ekleştirdiler. Ziyaretleri boyunca misafir ailelerde konaklayan &ouml;ğrencilerimiz, okul saatleri &ccedil;er&ccedil;evesinde kardeş okulumuzu ziyaret ederek derslere, kamp&uuml;s i&ccedil;inde ve dışında proje &ccedil;alışmalarına ve &ccedil;eşitli &ouml;nemli programlara katılım sağladılar.<br />
Programımızın Almanya ayağı eski Almanya başbakanının eşi sayın</p>

<p>Doris Schr&ouml;der-K&ouml;pf liderliğinde y&uuml;r&uuml;t&uuml;lmektedir<img alt="IMG_8385" src="http://temizliksektoru.com/wp-content/uploads/2016/08/IMG_8385.jpg" style="height:600px; width:800px" />&nbsp;</p>
', 1, 4, NULL, CAST(N'2017-01-01T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Haberler] ([Id], [Ad], [Resim], [Slug], [Detay], [Aktif], [KategoriId], [GaleriId], [Tarih], [Hit]) VALUES (68, N'ARSU Güzel Sanatlar Akademisi’nde Sanat Eğitimi Minikler Altı Aylıkken Başlıyor….', N'arsu-guzel-1452E.png', N'arsu-guzel-sanatlar-akademisi-nde-sanat-egitimi-minikler-alti-aylikken-basliyor', N'<p>ARSU G&uuml;zel Sanatlar Akademisi, okul &ouml;ncesi sanat eğitimi programları ve akademik d&uuml;zeydeki eğitimleriyle gen&ccedil; yetenekler yetiştirmeye ve onları sanat ile buluşturmaya devam ediyor. Akademide verilen okul &ouml;ncesi eğitim programı ile &ccedil;ocuklar, atacakları her yaşamsal adımı, oluşan estetik duygusuyla birlikte g&uuml;venle atıyor.</p>

<p>ARSU G&uuml;zel Sanatlar Akademisi sanat eğitimleri bebeğiniz altı aylıkken başlıyor. Arsu G&uuml;zel Sanatlar Akademisi&rsquo;nde sanat eğitiminin başlangı&ccedil; noktası, bilimselliği otoriteler tarafından onaylanmış, d&uuml;nyanın en k&ouml;kl&uuml; ve en saygın okul &ouml;ncesi eğitim sistemi olan Uluslararası Kindermusik International eğitim programı. Bu program &ccedil;ocukların zihinsel gelişimine katkı sağlarken, miniklerin başarılı okul hayatı i&ccedil;in de temeller oluşturuluyor. Kindermusik International eğitim programını tamamlayan minik &ouml;ğrenciler Yetenek Geliştirme ve M&uuml;zikalite Sınıfları&rsquo; nda sanat eğitimlerinin ikinci aşamasına başlıyor. 3.5-5 yaş arası yedi &ouml;ğrencinin bulunduğu M&uuml;zikalite Sınıflarda eğitim, eğlenerek &ouml;ğrenebilecekleri dersler ile devam ediyor. Her iki programda hafta i&ccedil;i ve hafta sonu uygulanabiliyor. 3&rsquo;er aylık periyotlar şeklinde devam eden programlar haftada 1 g&uuml;n/45 dakikalık ders şeklinde hazırlanmış. Eğitim programlarının fiyatı aylık 250 TL&rsquo;den başlıyor. Uluslar arası m&uuml;zik eğitim programları ile devam eden &uuml;&ccedil;&uuml;nc&uuml; aşamada &ouml;ğrenciler daha teknik dersler ile tanışıp, West London Colloge Of Music, ABRSM (Associated Board of Royal Schools of Music) ve Boston Longy School Of Music programları ile sanat eğitimlerine devam ediyorlar. ARSU G&uuml;zel Sanatlar Akademisi&rsquo;nde satan eğitimini başarı ile tamamlayan &ouml;ğrenciler, t&uuml;m d&uuml;nyada ge&ccedil;erli olan lise d&uuml;zeyindeki diplomasına sahip oluyor ve yurtdışındaki konservatuarlarda eğitim alma şansını yakalıyor.</p>
', 1, 3, NULL, CAST(N'2017-01-01T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Haberler] ([Id], [Ad], [Resim], [Slug], [Detay], [Aktif], [KategoriId], [GaleriId], [Tarih], [Hit]) VALUES (69, N'AVRUPA KOLEJİ SOSYAL SORUMLULUKLARDA BİR ADIM ÖNDE', N'AVRUPAasdasd-4704N.jpg', N'avrupa-koleji-sosyal-sorumluluklarda-bir-adim-onde', N'<p><strong>&Ouml;ğrenci odaklı bir eğitim anlayışını benimseyen ve sosyal ortam farkındalığı y&uuml;ksek bireyler yetiştirmeyi hedeflediklerini belirten Avrupa Koleji Kazlı&ccedil;eşme Kamp&uuml;s&uuml; Lise M&uuml;d&uuml;r&uuml; Miray Şeng&uuml;l, &ouml;ğrencilerini sosyal sorumluluk projelerinde de desteklediklerini s&ouml;yl&uuml;yor.</strong></p>

<p>Her yıl iki kez &ouml;ğrenci-&ouml;ğretmen-veli işbirliği ile geliri &ccedil;eşitli yardım kuruluşlarına bağışlanmak &uuml;zere d&uuml;zenlenen kurum b&uuml;nyesinde ger&ccedil;ekleştirilen kermeslerde Avrupa Koleji &ouml;ğrencilerinin aktif g&ouml;rev aldıklarını ve &ouml;ğrencilerin organizasyonun her s&uuml;recini kendilerinin y&ouml;nlendirdiklerini ifade eden Avrupa Koleji Kazlı&ccedil;eşme Kamp&uuml;s&uuml; Lise M&uuml;d&uuml;r&uuml; Miray Şeng&uuml;l, &ldquo;Avrupa Koleji Okulları&rsquo;nda artık bir gelenek gibi s&uuml;rd&uuml;r&uuml;len bu yardımlaşma anlayışı her &ouml;ğrenci ve &ouml;ğretmenin ortak d&uuml;ş&uuml;nme tarzı olmuştur. Bu şekilde empati kurabilen bireylerin yetiştirildiği kurum olma hedefini de ger&ccedil;ekleştirmek m&uuml;mk&uuml;n olabiliyor.&rdquo; diye konuşuyor.<br />
ENGELSİZ MATEMATİK G&Ouml;RME ENGELLİLERE IŞIK OLDU<br />
Bu yaklaşımın &uuml;r&uuml;nleri olarak nitelenebilecek iki &ouml;rneği anlatan Şeng&uuml;l, ilk &ouml;rneği &ldquo;Matematiğe dokunmak hi&ccedil; bu kadar anlamlı olmamıştı&rdquo; diye insanı d&uuml;ş&uuml;nd&uuml;ren bir ser&uuml;ven olarak nitelendiriyor.<br />
Avrupa Koleji Kazlı&ccedil;eşme Kamp&uuml;s&uuml; 6. sınıf &ouml;ğrencileri Bernis Dila Erg&uuml;l ve Ecehan Kekum&rsquo;un, matematik &ouml;ğretmenleri G&uuml;lşah Ekinci&rsquo;ye farklı bir şeyler &uuml;retmek ve insanların hayatlarını değiştirmek istediklerini s&ouml;ylemeleriyle Engelsiz matematik projesinin ortaya &ccedil;ıktığını ifade eden Şeng&uuml;l, sonraki s&uuml;reci şu s&ouml;zlerle anlatıyor: &ldquo;Bu &ccedil;ok iddalı bir hedefti. Onları y&ouml;nlendirme konusunda profesyonel olan &ouml;ğretmenlerinden biri &ldquo;eğer g&ouml;rme engelli olsaydınız matematik derslerini nasıl algılardınız hi&ccedil; d&uuml;ş&uuml;nd&uuml;n&uuml;z m&uuml;?&rdquo; sorusunu y&ouml;neltir &ouml;ğrencilerine. İşte bu soru ilk kıvılcımdır. Buradan yola &ccedil;ıkan &ouml;ğrenciler ve &ouml;ğretmenleri g&ouml;rme engellilerin matematik &ouml;ğrenmelerini kolaylaştırabilecek bir materyal yapmaya karar verirler. Başlangı&ccedil;ta bir proje yarışması hazırlığı olarak başlar &ccedil;alışmaları. Tasarladıkları materyal uzun &ccedil;alışmalardan sonra oluşur. Artık bu materyalin denenmesi gerekmektedir. &Ouml;ğrencilerimiz ve &ouml;ğretmenleri g&ouml;rme engellilerin eğitim aldığı bir okulu ziyaret ederler. Aldıkları tepkiler beklediklerinden daha olumludur. Bazı ekleme ve d&uuml;zeltmeler yapmaları konusundaki tavsiyelerle okula d&ouml;nerler. B&uuml;y&uuml;k bir heyecanla materyallerini yeniden d&uuml;zenlemeye başlarlar. Bu oluşuma okul ve aileler de destek vermektedir. Hedefledikleri yarışmaya katılıp ikincilik &ouml;d&uuml;llerini alırlar ancak artık ama&ccedil;ları derece değildir aslında. Onlar okullarının da desteğiyle g&ouml;rme engelli &ouml;ğrencilere yardım edebilecekleri bir sosyal sorumluluk projesinin merkezindedirler artık. K&uuml;&ccedil;&uuml;c&uuml;k y&uuml;rekleriyle ortaya koydukları bu b&uuml;y&uuml;k &ccedil;aba meyvelerini vermektedir. Projeleri g&ouml;rsel basının ilgisini &ccedil;ekmiş ve ana haber b&uuml;ltenlerinde &ouml;ğrenciler ve &ouml;ğretmenleri bu s&uuml;reci t&uuml;m &uuml;lkeye anlatabilme fırsatını da yakalamışlardır. Bug&uuml;nlerde materyallerini geliştirme &ccedil;alışmalarını s&uuml;rd&uuml;r&uuml;yorlar. Bu geliştirme &ccedil;alışmalarını da G&ouml;rme Engelliler Federasyonu ile yaptıkları g&ouml;r&uuml;şmeler doğrultusunda kurumun da desteği ile s&uuml;rd&uuml;r&uuml;yorlar.&rdquo;</p>
', 1, 4, NULL, CAST(N'2017-01-01T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Haberler] ([Id], [Ad], [Resim], [Slug], [Detay], [Aktif], [KategoriId], [GaleriId], [Tarih], [Hit]) VALUES (73, N'ALKEV ÖZEL OKULLARINDAN HANNOVER DEĞİŞİM PROGRAMI 2016', N'Lew6Jq0c_400x400-3843K.jpeg', N'alkev-ozel-okullarindan-hannover-degisim-programi-2016', N'<p><strong>ALKEV &Ouml;ZEL OKULLARINDAN HANNOVER DEĞİŞİM PROGRAMI 2016</strong></p>

<p>Okulumuzda değişim programlarıyla, &ouml;ğrencilerimize Almanca dilini pekiştirebilecekleri ve geliştirebilecekleri fırsatlar yaratılmaktadır. Bu ama&ccedil;la, Hannover şehrinde bulunan&nbsp;<a href="http://www.sophienschule.de/">Sophienschule</a>&nbsp;ile işbirliği yapılarak hazırlık ve 9. sınıfları kapsayan bir değişim programı başlatıldı. Her yıl d&uuml;zenli olarak ger&ccedil;ekleştirilen bu program kapsamında bu yıl 21 &ouml;ğrencimizin katılımı ger&ccedil;ekleşti.<br />
&Ouml;ğrencilerimiz gezi &ouml;ncesinde hazırlık ve okul d&uuml;zeyinde paylaşım ama&ccedil;lı blog sayfalarında karşılıklı olarak &ccedil;alışma başlatıldı.<br />
1-8 Mayıs 2016 tarihleri arasında &ouml;ğrencilerimiz&nbsp; &ouml;ğretmenleri eşliğinde Hannover &ndash; Sophienschule ziyaretlerini ger&ccedil;ekleştirdiler. Ziyaretleri boyunca misafir ailelerde konaklayan &ouml;ğrencilerimiz, okul saatleri &ccedil;er&ccedil;evesinde kardeş okulumuzu ziyaret ederek derslere, kamp&uuml;s i&ccedil;inde ve dışında proje &ccedil;alışmalarına ve &ccedil;eşitli &ouml;nemli programlara katılım sağladılar.<br />
Programımızın Almanya ayağı eski Almanya başbakanının eşi sayın</p>

<p>Doris Schr&ouml;der-K&ouml;pf liderliğinde y&uuml;r&uuml;t&uuml;lmektedir<img alt="IMG_8385" src="http://temizliksektoru.com/wp-content/uploads/2016/08/IMG_8385.jpg" style="height:600px; width:800px" />&nbsp;</p>
', 1, 4, NULL, CAST(N'2017-01-01T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Haberler] ([Id], [Ad], [Resim], [Slug], [Detay], [Aktif], [KategoriId], [GaleriId], [Tarih], [Hit]) VALUES (74, N'ARSU Güzel Sanatlar Akademisi’nde Sanat Eğitimi Minikler Altı Aylıkken Başlıyor….', N'arsu-guzel-1452E.png', N'arsu-guzel-sanatlar-akademisi-nde-sanat-egitimi-minikler-alti-aylikken-basliyor', N'<p>ARSU G&uuml;zel Sanatlar Akademisi, okul &ouml;ncesi sanat eğitimi programları ve akademik d&uuml;zeydeki eğitimleriyle gen&ccedil; yetenekler yetiştirmeye ve onları sanat ile buluşturmaya devam ediyor. Akademide verilen okul &ouml;ncesi eğitim programı ile &ccedil;ocuklar, atacakları her yaşamsal adımı, oluşan estetik duygusuyla birlikte g&uuml;venle atıyor.</p>

<p>ARSU G&uuml;zel Sanatlar Akademisi sanat eğitimleri bebeğiniz altı aylıkken başlıyor. Arsu G&uuml;zel Sanatlar Akademisi&rsquo;nde sanat eğitiminin başlangı&ccedil; noktası, bilimselliği otoriteler tarafından onaylanmış, d&uuml;nyanın en k&ouml;kl&uuml; ve en saygın okul &ouml;ncesi eğitim sistemi olan Uluslararası Kindermusik International eğitim programı. Bu program &ccedil;ocukların zihinsel gelişimine katkı sağlarken, miniklerin başarılı okul hayatı i&ccedil;in de temeller oluşturuluyor. Kindermusik International eğitim programını tamamlayan minik &ouml;ğrenciler Yetenek Geliştirme ve M&uuml;zikalite Sınıfları&rsquo; nda sanat eğitimlerinin ikinci aşamasına başlıyor. 3.5-5 yaş arası yedi &ouml;ğrencinin bulunduğu M&uuml;zikalite Sınıflarda eğitim, eğlenerek &ouml;ğrenebilecekleri dersler ile devam ediyor. Her iki programda hafta i&ccedil;i ve hafta sonu uygulanabiliyor. 3&rsquo;er aylık periyotlar şeklinde devam eden programlar haftada 1 g&uuml;n/45 dakikalık ders şeklinde hazırlanmış. Eğitim programlarının fiyatı aylık 250 TL&rsquo;den başlıyor. Uluslar arası m&uuml;zik eğitim programları ile devam eden &uuml;&ccedil;&uuml;nc&uuml; aşamada &ouml;ğrenciler daha teknik dersler ile tanışıp, West London Colloge Of Music, ABRSM (Associated Board of Royal Schools of Music) ve Boston Longy School Of Music programları ile sanat eğitimlerine devam ediyorlar. ARSU G&uuml;zel Sanatlar Akademisi&rsquo;nde satan eğitimini başarı ile tamamlayan &ouml;ğrenciler, t&uuml;m d&uuml;nyada ge&ccedil;erli olan lise d&uuml;zeyindeki diplomasına sahip oluyor ve yurtdışındaki konservatuarlarda eğitim alma şansını yakalıyor.</p>
', 1, 3, NULL, CAST(N'2017-01-01T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Haberler] ([Id], [Ad], [Resim], [Slug], [Detay], [Aktif], [KategoriId], [GaleriId], [Tarih], [Hit]) VALUES (75, N'AVRUPA KOLEJİ SOSYAL SORUMLULUKLARDA BİR ADIM ÖNDE', N'AVRUPAasdasd-4704N.jpg', N'avrupa-koleji-sosyal-sorumluluklarda-bir-adim-onde', N'<p><strong>&Ouml;ğrenci odaklı bir eğitim anlayışını benimseyen ve sosyal ortam farkındalığı y&uuml;ksek bireyler yetiştirmeyi hedeflediklerini belirten Avrupa Koleji Kazlı&ccedil;eşme Kamp&uuml;s&uuml; Lise M&uuml;d&uuml;r&uuml; Miray Şeng&uuml;l, &ouml;ğrencilerini sosyal sorumluluk projelerinde de desteklediklerini s&ouml;yl&uuml;yor.</strong></p>

<p>Her yıl iki kez &ouml;ğrenci-&ouml;ğretmen-veli işbirliği ile geliri &ccedil;eşitli yardım kuruluşlarına bağışlanmak &uuml;zere d&uuml;zenlenen kurum b&uuml;nyesinde ger&ccedil;ekleştirilen kermeslerde Avrupa Koleji &ouml;ğrencilerinin aktif g&ouml;rev aldıklarını ve &ouml;ğrencilerin organizasyonun her s&uuml;recini kendilerinin y&ouml;nlendirdiklerini ifade eden Avrupa Koleji Kazlı&ccedil;eşme Kamp&uuml;s&uuml; Lise M&uuml;d&uuml;r&uuml; Miray Şeng&uuml;l, &ldquo;Avrupa Koleji Okulları&rsquo;nda artık bir gelenek gibi s&uuml;rd&uuml;r&uuml;len bu yardımlaşma anlayışı her &ouml;ğrenci ve &ouml;ğretmenin ortak d&uuml;ş&uuml;nme tarzı olmuştur. Bu şekilde empati kurabilen bireylerin yetiştirildiği kurum olma hedefini de ger&ccedil;ekleştirmek m&uuml;mk&uuml;n olabiliyor.&rdquo; diye konuşuyor.<br />
ENGELSİZ MATEMATİK G&Ouml;RME ENGELLİLERE IŞIK OLDU<br />
Bu yaklaşımın &uuml;r&uuml;nleri olarak nitelenebilecek iki &ouml;rneği anlatan Şeng&uuml;l, ilk &ouml;rneği &ldquo;Matematiğe dokunmak hi&ccedil; bu kadar anlamlı olmamıştı&rdquo; diye insanı d&uuml;ş&uuml;nd&uuml;ren bir ser&uuml;ven olarak nitelendiriyor.<br />
Avrupa Koleji Kazlı&ccedil;eşme Kamp&uuml;s&uuml; 6. sınıf &ouml;ğrencileri Bernis Dila Erg&uuml;l ve Ecehan Kekum&rsquo;un, matematik &ouml;ğretmenleri G&uuml;lşah Ekinci&rsquo;ye farklı bir şeyler &uuml;retmek ve insanların hayatlarını değiştirmek istediklerini s&ouml;ylemeleriyle Engelsiz matematik projesinin ortaya &ccedil;ıktığını ifade eden Şeng&uuml;l, sonraki s&uuml;reci şu s&ouml;zlerle anlatıyor: &ldquo;Bu &ccedil;ok iddalı bir hedefti. Onları y&ouml;nlendirme konusunda profesyonel olan &ouml;ğretmenlerinden biri &ldquo;eğer g&ouml;rme engelli olsaydınız matematik derslerini nasıl algılardınız hi&ccedil; d&uuml;ş&uuml;nd&uuml;n&uuml;z m&uuml;?&rdquo; sorusunu y&ouml;neltir &ouml;ğrencilerine. İşte bu soru ilk kıvılcımdır. Buradan yola &ccedil;ıkan &ouml;ğrenciler ve &ouml;ğretmenleri g&ouml;rme engellilerin matematik &ouml;ğrenmelerini kolaylaştırabilecek bir materyal yapmaya karar verirler. Başlangı&ccedil;ta bir proje yarışması hazırlığı olarak başlar &ccedil;alışmaları. Tasarladıkları materyal uzun &ccedil;alışmalardan sonra oluşur. Artık bu materyalin denenmesi gerekmektedir. &Ouml;ğrencilerimiz ve &ouml;ğretmenleri g&ouml;rme engellilerin eğitim aldığı bir okulu ziyaret ederler. Aldıkları tepkiler beklediklerinden daha olumludur. Bazı ekleme ve d&uuml;zeltmeler yapmaları konusundaki tavsiyelerle okula d&ouml;nerler. B&uuml;y&uuml;k bir heyecanla materyallerini yeniden d&uuml;zenlemeye başlarlar. Bu oluşuma okul ve aileler de destek vermektedir. Hedefledikleri yarışmaya katılıp ikincilik &ouml;d&uuml;llerini alırlar ancak artık ama&ccedil;ları derece değildir aslında. Onlar okullarının da desteğiyle g&ouml;rme engelli &ouml;ğrencilere yardım edebilecekleri bir sosyal sorumluluk projesinin merkezindedirler artık. K&uuml;&ccedil;&uuml;c&uuml;k y&uuml;rekleriyle ortaya koydukları bu b&uuml;y&uuml;k &ccedil;aba meyvelerini vermektedir. Projeleri g&ouml;rsel basının ilgisini &ccedil;ekmiş ve ana haber b&uuml;ltenlerinde &ouml;ğrenciler ve &ouml;ğretmenleri bu s&uuml;reci t&uuml;m &uuml;lkeye anlatabilme fırsatını da yakalamışlardır. Bug&uuml;nlerde materyallerini geliştirme &ccedil;alışmalarını s&uuml;rd&uuml;r&uuml;yorlar. Bu geliştirme &ccedil;alışmalarını da G&ouml;rme Engelliler Federasyonu ile yaptıkları g&ouml;r&uuml;şmeler doğrultusunda kurumun da desteği ile s&uuml;rd&uuml;r&uuml;yorlar.&rdquo;</p>
', 1, 4, NULL, CAST(N'2017-01-01T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Haberler] ([Id], [Ad], [Resim], [Slug], [Detay], [Aktif], [KategoriId], [GaleriId], [Tarih], [Hit]) VALUES (76, N'ALKEV ÖZEL OKULLARINDAN HANNOVER DEĞİŞİM PROGRAMI 2016', N'Lew6Jq0c_400x400-3843K.jpeg', N'alkev-ozel-okullarindan-hannover-degisim-programi-2016', N'<p><strong>ALKEV &Ouml;ZEL OKULLARINDAN HANNOVER DEĞİŞİM PROGRAMI 2016</strong></p>

<p>Okulumuzda değişim programlarıyla, &ouml;ğrencilerimize Almanca dilini pekiştirebilecekleri ve geliştirebilecekleri fırsatlar yaratılmaktadır. Bu ama&ccedil;la, Hannover şehrinde bulunan&nbsp;<a href="http://www.sophienschule.de/">Sophienschule</a>&nbsp;ile işbirliği yapılarak hazırlık ve 9. sınıfları kapsayan bir değişim programı başlatıldı. Her yıl d&uuml;zenli olarak ger&ccedil;ekleştirilen bu program kapsamında bu yıl 21 &ouml;ğrencimizin katılımı ger&ccedil;ekleşti.<br />
&Ouml;ğrencilerimiz gezi &ouml;ncesinde hazırlık ve okul d&uuml;zeyinde paylaşım ama&ccedil;lı blog sayfalarında karşılıklı olarak &ccedil;alışma başlatıldı.<br />
1-8 Mayıs 2016 tarihleri arasında &ouml;ğrencilerimiz&nbsp; &ouml;ğretmenleri eşliğinde Hannover &ndash; Sophienschule ziyaretlerini ger&ccedil;ekleştirdiler. Ziyaretleri boyunca misafir ailelerde konaklayan &ouml;ğrencilerimiz, okul saatleri &ccedil;er&ccedil;evesinde kardeş okulumuzu ziyaret ederek derslere, kamp&uuml;s i&ccedil;inde ve dışında proje &ccedil;alışmalarına ve &ccedil;eşitli &ouml;nemli programlara katılım sağladılar.<br />
Programımızın Almanya ayağı eski Almanya başbakanının eşi sayın</p>

<p>Doris Schr&ouml;der-K&ouml;pf liderliğinde y&uuml;r&uuml;t&uuml;lmektedir<img alt="IMG_8385" src="http://temizliksektoru.com/wp-content/uploads/2016/08/IMG_8385.jpg" style="height:600px; width:800px" />&nbsp;</p>
', 1, 4, NULL, CAST(N'2017-01-01T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Haberler] ([Id], [Ad], [Resim], [Slug], [Detay], [Aktif], [KategoriId], [GaleriId], [Tarih], [Hit]) VALUES (77, N'ARSU Güzel Sanatlar Akademisi’nde Sanat Eğitimi Minikler Altı Aylıkken Başlıyor….', N'arsu-guzel-1452E.png', N'arsu-guzel-sanatlar-akademisi-nde-sanat-egitimi-minikler-alti-aylikken-basliyor', N'<p>ARSU G&uuml;zel Sanatlar Akademisi, okul &ouml;ncesi sanat eğitimi programları ve akademik d&uuml;zeydeki eğitimleriyle gen&ccedil; yetenekler yetiştirmeye ve onları sanat ile buluşturmaya devam ediyor. Akademide verilen okul &ouml;ncesi eğitim programı ile &ccedil;ocuklar, atacakları her yaşamsal adımı, oluşan estetik duygusuyla birlikte g&uuml;venle atıyor.</p>

<p>ARSU G&uuml;zel Sanatlar Akademisi sanat eğitimleri bebeğiniz altı aylıkken başlıyor. Arsu G&uuml;zel Sanatlar Akademisi&rsquo;nde sanat eğitiminin başlangı&ccedil; noktası, bilimselliği otoriteler tarafından onaylanmış, d&uuml;nyanın en k&ouml;kl&uuml; ve en saygın okul &ouml;ncesi eğitim sistemi olan Uluslararası Kindermusik International eğitim programı. Bu program &ccedil;ocukların zihinsel gelişimine katkı sağlarken, miniklerin başarılı okul hayatı i&ccedil;in de temeller oluşturuluyor. Kindermusik International eğitim programını tamamlayan minik &ouml;ğrenciler Yetenek Geliştirme ve M&uuml;zikalite Sınıfları&rsquo; nda sanat eğitimlerinin ikinci aşamasına başlıyor. 3.5-5 yaş arası yedi &ouml;ğrencinin bulunduğu M&uuml;zikalite Sınıflarda eğitim, eğlenerek &ouml;ğrenebilecekleri dersler ile devam ediyor. Her iki programda hafta i&ccedil;i ve hafta sonu uygulanabiliyor. 3&rsquo;er aylık periyotlar şeklinde devam eden programlar haftada 1 g&uuml;n/45 dakikalık ders şeklinde hazırlanmış. Eğitim programlarının fiyatı aylık 250 TL&rsquo;den başlıyor. Uluslar arası m&uuml;zik eğitim programları ile devam eden &uuml;&ccedil;&uuml;nc&uuml; aşamada &ouml;ğrenciler daha teknik dersler ile tanışıp, West London Colloge Of Music, ABRSM (Associated Board of Royal Schools of Music) ve Boston Longy School Of Music programları ile sanat eğitimlerine devam ediyorlar. ARSU G&uuml;zel Sanatlar Akademisi&rsquo;nde satan eğitimini başarı ile tamamlayan &ouml;ğrenciler, t&uuml;m d&uuml;nyada ge&ccedil;erli olan lise d&uuml;zeyindeki diplomasına sahip oluyor ve yurtdışındaki konservatuarlarda eğitim alma şansını yakalıyor.</p>
', 1, 3, NULL, CAST(N'2017-01-01T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Haberler] ([Id], [Ad], [Resim], [Slug], [Detay], [Aktif], [KategoriId], [GaleriId], [Tarih], [Hit]) VALUES (78, N'AVRUPA KOLEJİ SOSYAL SORUMLULUKLARDA BİR ADIM ÖNDE', N'AVRUPAasdasd-4704N.jpg', N'avrupa-koleji-sosyal-sorumluluklarda-bir-adim-onde', N'<p><strong>&Ouml;ğrenci odaklı bir eğitim anlayışını benimseyen ve sosyal ortam farkındalığı y&uuml;ksek bireyler yetiştirmeyi hedeflediklerini belirten Avrupa Koleji Kazlı&ccedil;eşme Kamp&uuml;s&uuml; Lise M&uuml;d&uuml;r&uuml; Miray Şeng&uuml;l, &ouml;ğrencilerini sosyal sorumluluk projelerinde de desteklediklerini s&ouml;yl&uuml;yor.</strong></p>

<p>Her yıl iki kez &ouml;ğrenci-&ouml;ğretmen-veli işbirliği ile geliri &ccedil;eşitli yardım kuruluşlarına bağışlanmak &uuml;zere d&uuml;zenlenen kurum b&uuml;nyesinde ger&ccedil;ekleştirilen kermeslerde Avrupa Koleji &ouml;ğrencilerinin aktif g&ouml;rev aldıklarını ve &ouml;ğrencilerin organizasyonun her s&uuml;recini kendilerinin y&ouml;nlendirdiklerini ifade eden Avrupa Koleji Kazlı&ccedil;eşme Kamp&uuml;s&uuml; Lise M&uuml;d&uuml;r&uuml; Miray Şeng&uuml;l, &ldquo;Avrupa Koleji Okulları&rsquo;nda artık bir gelenek gibi s&uuml;rd&uuml;r&uuml;len bu yardımlaşma anlayışı her &ouml;ğrenci ve &ouml;ğretmenin ortak d&uuml;ş&uuml;nme tarzı olmuştur. Bu şekilde empati kurabilen bireylerin yetiştirildiği kurum olma hedefini de ger&ccedil;ekleştirmek m&uuml;mk&uuml;n olabiliyor.&rdquo; diye konuşuyor.<br />
ENGELSİZ MATEMATİK G&Ouml;RME ENGELLİLERE IŞIK OLDU<br />
Bu yaklaşımın &uuml;r&uuml;nleri olarak nitelenebilecek iki &ouml;rneği anlatan Şeng&uuml;l, ilk &ouml;rneği &ldquo;Matematiğe dokunmak hi&ccedil; bu kadar anlamlı olmamıştı&rdquo; diye insanı d&uuml;ş&uuml;nd&uuml;ren bir ser&uuml;ven olarak nitelendiriyor.<br />
Avrupa Koleji Kazlı&ccedil;eşme Kamp&uuml;s&uuml; 6. sınıf &ouml;ğrencileri Bernis Dila Erg&uuml;l ve Ecehan Kekum&rsquo;un, matematik &ouml;ğretmenleri G&uuml;lşah Ekinci&rsquo;ye farklı bir şeyler &uuml;retmek ve insanların hayatlarını değiştirmek istediklerini s&ouml;ylemeleriyle Engelsiz matematik projesinin ortaya &ccedil;ıktığını ifade eden Şeng&uuml;l, sonraki s&uuml;reci şu s&ouml;zlerle anlatıyor: &ldquo;Bu &ccedil;ok iddalı bir hedefti. Onları y&ouml;nlendirme konusunda profesyonel olan &ouml;ğretmenlerinden biri &ldquo;eğer g&ouml;rme engelli olsaydınız matematik derslerini nasıl algılardınız hi&ccedil; d&uuml;ş&uuml;nd&uuml;n&uuml;z m&uuml;?&rdquo; sorusunu y&ouml;neltir &ouml;ğrencilerine. İşte bu soru ilk kıvılcımdır. Buradan yola &ccedil;ıkan &ouml;ğrenciler ve &ouml;ğretmenleri g&ouml;rme engellilerin matematik &ouml;ğrenmelerini kolaylaştırabilecek bir materyal yapmaya karar verirler. Başlangı&ccedil;ta bir proje yarışması hazırlığı olarak başlar &ccedil;alışmaları. Tasarladıkları materyal uzun &ccedil;alışmalardan sonra oluşur. Artık bu materyalin denenmesi gerekmektedir. &Ouml;ğrencilerimiz ve &ouml;ğretmenleri g&ouml;rme engellilerin eğitim aldığı bir okulu ziyaret ederler. Aldıkları tepkiler beklediklerinden daha olumludur. Bazı ekleme ve d&uuml;zeltmeler yapmaları konusundaki tavsiyelerle okula d&ouml;nerler. B&uuml;y&uuml;k bir heyecanla materyallerini yeniden d&uuml;zenlemeye başlarlar. Bu oluşuma okul ve aileler de destek vermektedir. Hedefledikleri yarışmaya katılıp ikincilik &ouml;d&uuml;llerini alırlar ancak artık ama&ccedil;ları derece değildir aslında. Onlar okullarının da desteğiyle g&ouml;rme engelli &ouml;ğrencilere yardım edebilecekleri bir sosyal sorumluluk projesinin merkezindedirler artık. K&uuml;&ccedil;&uuml;c&uuml;k y&uuml;rekleriyle ortaya koydukları bu b&uuml;y&uuml;k &ccedil;aba meyvelerini vermektedir. Projeleri g&ouml;rsel basının ilgisini &ccedil;ekmiş ve ana haber b&uuml;ltenlerinde &ouml;ğrenciler ve &ouml;ğretmenleri bu s&uuml;reci t&uuml;m &uuml;lkeye anlatabilme fırsatını da yakalamışlardır. Bug&uuml;nlerde materyallerini geliştirme &ccedil;alışmalarını s&uuml;rd&uuml;r&uuml;yorlar. Bu geliştirme &ccedil;alışmalarını da G&ouml;rme Engelliler Federasyonu ile yaptıkları g&ouml;r&uuml;şmeler doğrultusunda kurumun da desteği ile s&uuml;rd&uuml;r&uuml;yorlar.&rdquo;</p>
', 1, 4, NULL, CAST(N'2017-01-01T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Haberler] ([Id], [Ad], [Resim], [Slug], [Detay], [Aktif], [KategoriId], [GaleriId], [Tarih], [Hit]) VALUES (79, N'ARSU Güzel Sanatlar Akademisi’nde Sanat Eğitimi Minikler Altı Aylıkken Başlıyor….', N'arsu-guzel-1452E.png', N'arsu-guzel-sanatlar-akademisi-nde-sanat-egitimi-minikler-alti-aylikken-basliyor', N'<p>ARSU G&uuml;zel Sanatlar Akademisi, okul &ouml;ncesi sanat eğitimi programları ve akademik d&uuml;zeydeki eğitimleriyle gen&ccedil; yetenekler yetiştirmeye ve onları sanat ile buluşturmaya devam ediyor. Akademide verilen okul &ouml;ncesi eğitim programı ile &ccedil;ocuklar, atacakları her yaşamsal adımı, oluşan estetik duygusuyla birlikte g&uuml;venle atıyor.</p>

<p>ARSU G&uuml;zel Sanatlar Akademisi sanat eğitimleri bebeğiniz altı aylıkken başlıyor. Arsu G&uuml;zel Sanatlar Akademisi&rsquo;nde sanat eğitiminin başlangı&ccedil; noktası, bilimselliği otoriteler tarafından onaylanmış, d&uuml;nyanın en k&ouml;kl&uuml; ve en saygın okul &ouml;ncesi eğitim sistemi olan Uluslararası Kindermusik International eğitim programı. Bu program &ccedil;ocukların zihinsel gelişimine katkı sağlarken, miniklerin başarılı okul hayatı i&ccedil;in de temeller oluşturuluyor. Kindermusik International eğitim programını tamamlayan minik &ouml;ğrenciler Yetenek Geliştirme ve M&uuml;zikalite Sınıfları&rsquo; nda sanat eğitimlerinin ikinci aşamasına başlıyor. 3.5-5 yaş arası yedi &ouml;ğrencinin bulunduğu M&uuml;zikalite Sınıflarda eğitim, eğlenerek &ouml;ğrenebilecekleri dersler ile devam ediyor. Her iki programda hafta i&ccedil;i ve hafta sonu uygulanabiliyor. 3&rsquo;er aylık periyotlar şeklinde devam eden programlar haftada 1 g&uuml;n/45 dakikalık ders şeklinde hazırlanmış. Eğitim programlarının fiyatı aylık 250 TL&rsquo;den başlıyor. Uluslar arası m&uuml;zik eğitim programları ile devam eden &uuml;&ccedil;&uuml;nc&uuml; aşamada &ouml;ğrenciler daha teknik dersler ile tanışıp, West London Colloge Of Music, ABRSM (Associated Board of Royal Schools of Music) ve Boston Longy School Of Music programları ile sanat eğitimlerine devam ediyorlar. ARSU G&uuml;zel Sanatlar Akademisi&rsquo;nde satan eğitimini başarı ile tamamlayan &ouml;ğrenciler, t&uuml;m d&uuml;nyada ge&ccedil;erli olan lise d&uuml;zeyindeki diplomasına sahip oluyor ve yurtdışındaki konservatuarlarda eğitim alma şansını yakalıyor.</p>
', 1, 3, NULL, CAST(N'2017-01-01T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Haberler] ([Id], [Ad], [Resim], [Slug], [Detay], [Aktif], [KategoriId], [GaleriId], [Tarih], [Hit]) VALUES (80, N'ARSU Güzel Sanatlar Akademisi’nde Sanat Eğitimi Minikler Altı Aylıkken Başlıyor….', N'arsu-guzel-1452E.png', N'arsu-guzel-sanatlar-akademisi-nde-sanat-egitimi-minikler-alti-aylikken-basliyor', N'<p>ARSU G&uuml;zel Sanatlar Akademisi, okul &ouml;ncesi sanat eğitimi programları ve akademik d&uuml;zeydeki eğitimleriyle gen&ccedil; yetenekler yetiştirmeye ve onları sanat ile buluşturmaya devam ediyor. Akademide verilen okul &ouml;ncesi eğitim programı ile &ccedil;ocuklar, atacakları her yaşamsal adımı, oluşan estetik duygusuyla birlikte g&uuml;venle atıyor.</p>

<p>ARSU G&uuml;zel Sanatlar Akademisi sanat eğitimleri bebeğiniz altı aylıkken başlıyor. Arsu G&uuml;zel Sanatlar Akademisi&rsquo;nde sanat eğitiminin başlangı&ccedil; noktası, bilimselliği otoriteler tarafından onaylanmış, d&uuml;nyanın en k&ouml;kl&uuml; ve en saygın okul &ouml;ncesi eğitim sistemi olan Uluslararası Kindermusik International eğitim programı. Bu program &ccedil;ocukların zihinsel gelişimine katkı sağlarken, miniklerin başarılı okul hayatı i&ccedil;in de temeller oluşturuluyor. Kindermusik International eğitim programını tamamlayan minik &ouml;ğrenciler Yetenek Geliştirme ve M&uuml;zikalite Sınıfları&rsquo; nda sanat eğitimlerinin ikinci aşamasına başlıyor. 3.5-5 yaş arası yedi &ouml;ğrencinin bulunduğu M&uuml;zikalite Sınıflarda eğitim, eğlenerek &ouml;ğrenebilecekleri dersler ile devam ediyor. Her iki programda hafta i&ccedil;i ve hafta sonu uygulanabiliyor. 3&rsquo;er aylık periyotlar şeklinde devam eden programlar haftada 1 g&uuml;n/45 dakikalık ders şeklinde hazırlanmış. Eğitim programlarının fiyatı aylık 250 TL&rsquo;den başlıyor. Uluslar arası m&uuml;zik eğitim programları ile devam eden &uuml;&ccedil;&uuml;nc&uuml; aşamada &ouml;ğrenciler daha teknik dersler ile tanışıp, West London Colloge Of Music, ABRSM (Associated Board of Royal Schools of Music) ve Boston Longy School Of Music programları ile sanat eğitimlerine devam ediyorlar. ARSU G&uuml;zel Sanatlar Akademisi&rsquo;nde satan eğitimini başarı ile tamamlayan &ouml;ğrenciler, t&uuml;m d&uuml;nyada ge&ccedil;erli olan lise d&uuml;zeyindeki diplomasına sahip oluyor ve yurtdışındaki konservatuarlarda eğitim alma şansını yakalıyor.</p>
', 1, 3, NULL, CAST(N'2017-01-01T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Haberler] ([Id], [Ad], [Resim], [Slug], [Detay], [Aktif], [KategoriId], [GaleriId], [Tarih], [Hit]) VALUES (81, N'ARSU Güzel Sanatlar Akademisi’nde Sanat Eğitimi Minikler Altı Aylıkken Başlıyor….', N'arsu-guzel-1452E.png', N'arsu-guzel-sanatlar-akademisi-nde-sanat-egitimi-minikler-alti-aylikken-basliyor', N'<p>ARSU G&uuml;zel Sanatlar Akademisi, okul &ouml;ncesi sanat eğitimi programları ve akademik d&uuml;zeydeki eğitimleriyle gen&ccedil; yetenekler yetiştirmeye ve onları sanat ile buluşturmaya devam ediyor. Akademide verilen okul &ouml;ncesi eğitim programı ile &ccedil;ocuklar, atacakları her yaşamsal adımı, oluşan estetik duygusuyla birlikte g&uuml;venle atıyor.</p>

<p>ARSU G&uuml;zel Sanatlar Akademisi sanat eğitimleri bebeğiniz altı aylıkken başlıyor. Arsu G&uuml;zel Sanatlar Akademisi&rsquo;nde sanat eğitiminin başlangı&ccedil; noktası, bilimselliği otoriteler tarafından onaylanmış, d&uuml;nyanın en k&ouml;kl&uuml; ve en saygın okul &ouml;ncesi eğitim sistemi olan Uluslararası Kindermusik International eğitim programı. Bu program &ccedil;ocukların zihinsel gelişimine katkı sağlarken, miniklerin başarılı okul hayatı i&ccedil;in de temeller oluşturuluyor. Kindermusik International eğitim programını tamamlayan minik &ouml;ğrenciler Yetenek Geliştirme ve M&uuml;zikalite Sınıfları&rsquo; nda sanat eğitimlerinin ikinci aşamasına başlıyor. 3.5-5 yaş arası yedi &ouml;ğrencinin bulunduğu M&uuml;zikalite Sınıflarda eğitim, eğlenerek &ouml;ğrenebilecekleri dersler ile devam ediyor. Her iki programda hafta i&ccedil;i ve hafta sonu uygulanabiliyor. 3&rsquo;er aylık periyotlar şeklinde devam eden programlar haftada 1 g&uuml;n/45 dakikalık ders şeklinde hazırlanmış. Eğitim programlarının fiyatı aylık 250 TL&rsquo;den başlıyor. Uluslar arası m&uuml;zik eğitim programları ile devam eden &uuml;&ccedil;&uuml;nc&uuml; aşamada &ouml;ğrenciler daha teknik dersler ile tanışıp, West London Colloge Of Music, ABRSM (Associated Board of Royal Schools of Music) ve Boston Longy School Of Music programları ile sanat eğitimlerine devam ediyorlar. ARSU G&uuml;zel Sanatlar Akademisi&rsquo;nde satan eğitimini başarı ile tamamlayan &ouml;ğrenciler, t&uuml;m d&uuml;nyada ge&ccedil;erli olan lise d&uuml;zeyindeki diplomasına sahip oluyor ve yurtdışındaki konservatuarlarda eğitim alma şansını yakalıyor.</p>
', 1, 3, NULL, CAST(N'2017-01-01T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Haberler] ([Id], [Ad], [Resim], [Slug], [Detay], [Aktif], [KategoriId], [GaleriId], [Tarih], [Hit]) VALUES (82, N'ARSU Güzel Sanatlar Akademisi’nde Sanat Eğitimi Minikler Altı Aylıkken Başlıyor….', N'arsu-guzel-1452E.png', N'arsu-guzel-sanatlar-akademisi-nde-sanat-egitimi-minikler-alti-aylikken-basliyor', N'<p>ARSU G&uuml;zel Sanatlar Akademisi, okul &ouml;ncesi sanat eğitimi programları ve akademik d&uuml;zeydeki eğitimleriyle gen&ccedil; yetenekler yetiştirmeye ve onları sanat ile buluşturmaya devam ediyor. Akademide verilen okul &ouml;ncesi eğitim programı ile &ccedil;ocuklar, atacakları her yaşamsal adımı, oluşan estetik duygusuyla birlikte g&uuml;venle atıyor.</p>

<p>ARSU G&uuml;zel Sanatlar Akademisi sanat eğitimleri bebeğiniz altı aylıkken başlıyor. Arsu G&uuml;zel Sanatlar Akademisi&rsquo;nde sanat eğitiminin başlangı&ccedil; noktası, bilimselliği otoriteler tarafından onaylanmış, d&uuml;nyanın en k&ouml;kl&uuml; ve en saygın okul &ouml;ncesi eğitim sistemi olan Uluslararası Kindermusik International eğitim programı. Bu program &ccedil;ocukların zihinsel gelişimine katkı sağlarken, miniklerin başarılı okul hayatı i&ccedil;in de temeller oluşturuluyor. Kindermusik International eğitim programını tamamlayan minik &ouml;ğrenciler Yetenek Geliştirme ve M&uuml;zikalite Sınıfları&rsquo; nda sanat eğitimlerinin ikinci aşamasına başlıyor. 3.5-5 yaş arası yedi &ouml;ğrencinin bulunduğu M&uuml;zikalite Sınıflarda eğitim, eğlenerek &ouml;ğrenebilecekleri dersler ile devam ediyor. Her iki programda hafta i&ccedil;i ve hafta sonu uygulanabiliyor. 3&rsquo;er aylık periyotlar şeklinde devam eden programlar haftada 1 g&uuml;n/45 dakikalık ders şeklinde hazırlanmış. Eğitim programlarının fiyatı aylık 250 TL&rsquo;den başlıyor. Uluslar arası m&uuml;zik eğitim programları ile devam eden &uuml;&ccedil;&uuml;nc&uuml; aşamada &ouml;ğrenciler daha teknik dersler ile tanışıp, West London Colloge Of Music, ABRSM (Associated Board of Royal Schools of Music) ve Boston Longy School Of Music programları ile sanat eğitimlerine devam ediyorlar. ARSU G&uuml;zel Sanatlar Akademisi&rsquo;nde satan eğitimini başarı ile tamamlayan &ouml;ğrenciler, t&uuml;m d&uuml;nyada ge&ccedil;erli olan lise d&uuml;zeyindeki diplomasına sahip oluyor ve yurtdışındaki konservatuarlarda eğitim alma şansını yakalıyor.</p>
', 1, 3, NULL, CAST(N'2017-01-01T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Haberler] ([Id], [Ad], [Resim], [Slug], [Detay], [Aktif], [KategoriId], [GaleriId], [Tarih], [Hit]) VALUES (83, N'ARSU Güzel Sanatlar Akademisi’nde Sanat Eğitimi Minikler Altı Aylıkken Başlıyor….', N'arsu-guzel-1452E.png', N'arsu-guzel-sanatlar-akademisi-nde-sanat-egitimi-minikler-alti-aylikken-basliyor', N'<p>ARSU G&uuml;zel Sanatlar Akademisi, okul &ouml;ncesi sanat eğitimi programları ve akademik d&uuml;zeydeki eğitimleriyle gen&ccedil; yetenekler yetiştirmeye ve onları sanat ile buluşturmaya devam ediyor. Akademide verilen okul &ouml;ncesi eğitim programı ile &ccedil;ocuklar, atacakları her yaşamsal adımı, oluşan estetik duygusuyla birlikte g&uuml;venle atıyor.</p>

<p>ARSU G&uuml;zel Sanatlar Akademisi sanat eğitimleri bebeğiniz altı aylıkken başlıyor. Arsu G&uuml;zel Sanatlar Akademisi&rsquo;nde sanat eğitiminin başlangı&ccedil; noktası, bilimselliği otoriteler tarafından onaylanmış, d&uuml;nyanın en k&ouml;kl&uuml; ve en saygın okul &ouml;ncesi eğitim sistemi olan Uluslararası Kindermusik International eğitim programı. Bu program &ccedil;ocukların zihinsel gelişimine katkı sağlarken, miniklerin başarılı okul hayatı i&ccedil;in de temeller oluşturuluyor. Kindermusik International eğitim programını tamamlayan minik &ouml;ğrenciler Yetenek Geliştirme ve M&uuml;zikalite Sınıfları&rsquo; nda sanat eğitimlerinin ikinci aşamasına başlıyor. 3.5-5 yaş arası yedi &ouml;ğrencinin bulunduğu M&uuml;zikalite Sınıflarda eğitim, eğlenerek &ouml;ğrenebilecekleri dersler ile devam ediyor. Her iki programda hafta i&ccedil;i ve hafta sonu uygulanabiliyor. 3&rsquo;er aylık periyotlar şeklinde devam eden programlar haftada 1 g&uuml;n/45 dakikalık ders şeklinde hazırlanmış. Eğitim programlarının fiyatı aylık 250 TL&rsquo;den başlıyor. Uluslar arası m&uuml;zik eğitim programları ile devam eden &uuml;&ccedil;&uuml;nc&uuml; aşamada &ouml;ğrenciler daha teknik dersler ile tanışıp, West London Colloge Of Music, ABRSM (Associated Board of Royal Schools of Music) ve Boston Longy School Of Music programları ile sanat eğitimlerine devam ediyorlar. ARSU G&uuml;zel Sanatlar Akademisi&rsquo;nde satan eğitimini başarı ile tamamlayan &ouml;ğrenciler, t&uuml;m d&uuml;nyada ge&ccedil;erli olan lise d&uuml;zeyindeki diplomasına sahip oluyor ve yurtdışındaki konservatuarlarda eğitim alma şansını yakalıyor.</p>
', 1, 3, NULL, CAST(N'2017-01-01T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Haberler] ([Id], [Ad], [Resim], [Slug], [Detay], [Aktif], [KategoriId], [GaleriId], [Tarih], [Hit]) VALUES (84, N'ARSU Güzel Sanatlar Akademisi’nde Sanat Eğitimi Minikler Altı Aylıkken Başlıyor….', N'arsu-guzel-1452E.png', N'arsu-guzel-sanatlar-akademisi-nde-sanat-egitimi-minikler-alti-aylikken-basliyor', N'<p>ARSU G&uuml;zel Sanatlar Akademisi, okul &ouml;ncesi sanat eğitimi programları ve akademik d&uuml;zeydeki eğitimleriyle gen&ccedil; yetenekler yetiştirmeye ve onları sanat ile buluşturmaya devam ediyor. Akademide verilen okul &ouml;ncesi eğitim programı ile &ccedil;ocuklar, atacakları her yaşamsal adımı, oluşan estetik duygusuyla birlikte g&uuml;venle atıyor.</p>

<p>ARSU G&uuml;zel Sanatlar Akademisi sanat eğitimleri bebeğiniz altı aylıkken başlıyor. Arsu G&uuml;zel Sanatlar Akademisi&rsquo;nde sanat eğitiminin başlangı&ccedil; noktası, bilimselliği otoriteler tarafından onaylanmış, d&uuml;nyanın en k&ouml;kl&uuml; ve en saygın okul &ouml;ncesi eğitim sistemi olan Uluslararası Kindermusik International eğitim programı. Bu program &ccedil;ocukların zihinsel gelişimine katkı sağlarken, miniklerin başarılı okul hayatı i&ccedil;in de temeller oluşturuluyor. Kindermusik International eğitim programını tamamlayan minik &ouml;ğrenciler Yetenek Geliştirme ve M&uuml;zikalite Sınıfları&rsquo; nda sanat eğitimlerinin ikinci aşamasına başlıyor. 3.5-5 yaş arası yedi &ouml;ğrencinin bulunduğu M&uuml;zikalite Sınıflarda eğitim, eğlenerek &ouml;ğrenebilecekleri dersler ile devam ediyor. Her iki programda hafta i&ccedil;i ve hafta sonu uygulanabiliyor. 3&rsquo;er aylık periyotlar şeklinde devam eden programlar haftada 1 g&uuml;n/45 dakikalık ders şeklinde hazırlanmış. Eğitim programlarının fiyatı aylık 250 TL&rsquo;den başlıyor. Uluslar arası m&uuml;zik eğitim programları ile devam eden &uuml;&ccedil;&uuml;nc&uuml; aşamada &ouml;ğrenciler daha teknik dersler ile tanışıp, West London Colloge Of Music, ABRSM (Associated Board of Royal Schools of Music) ve Boston Longy School Of Music programları ile sanat eğitimlerine devam ediyorlar. ARSU G&uuml;zel Sanatlar Akademisi&rsquo;nde satan eğitimini başarı ile tamamlayan &ouml;ğrenciler, t&uuml;m d&uuml;nyada ge&ccedil;erli olan lise d&uuml;zeyindeki diplomasına sahip oluyor ve yurtdışındaki konservatuarlarda eğitim alma şansını yakalıyor.</p>
', 1, 3, NULL, CAST(N'2017-01-01T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Haberler] ([Id], [Ad], [Resim], [Slug], [Detay], [Aktif], [KategoriId], [GaleriId], [Tarih], [Hit]) VALUES (85, N'ARSU Güzel Sanatlar Akademisi’nde Sanat Eğitimi Minikler Altı Aylıkken Başlıyor….', N'arsu-guzel-1452E.png', N'arsu-guzel-sanatlar-akademisi-nde-sanat-egitimi-minikler-alti-aylikken-basliyor', N'<p>ARSU G&uuml;zel Sanatlar Akademisi, okul &ouml;ncesi sanat eğitimi programları ve akademik d&uuml;zeydeki eğitimleriyle gen&ccedil; yetenekler yetiştirmeye ve onları sanat ile buluşturmaya devam ediyor. Akademide verilen okul &ouml;ncesi eğitim programı ile &ccedil;ocuklar, atacakları her yaşamsal adımı, oluşan estetik duygusuyla birlikte g&uuml;venle atıyor.</p>

<p>ARSU G&uuml;zel Sanatlar Akademisi sanat eğitimleri bebeğiniz altı aylıkken başlıyor. Arsu G&uuml;zel Sanatlar Akademisi&rsquo;nde sanat eğitiminin başlangı&ccedil; noktası, bilimselliği otoriteler tarafından onaylanmış, d&uuml;nyanın en k&ouml;kl&uuml; ve en saygın okul &ouml;ncesi eğitim sistemi olan Uluslararası Kindermusik International eğitim programı. Bu program &ccedil;ocukların zihinsel gelişimine katkı sağlarken, miniklerin başarılı okul hayatı i&ccedil;in de temeller oluşturuluyor. Kindermusik International eğitim programını tamamlayan minik &ouml;ğrenciler Yetenek Geliştirme ve M&uuml;zikalite Sınıfları&rsquo; nda sanat eğitimlerinin ikinci aşamasına başlıyor. 3.5-5 yaş arası yedi &ouml;ğrencinin bulunduğu M&uuml;zikalite Sınıflarda eğitim, eğlenerek &ouml;ğrenebilecekleri dersler ile devam ediyor. Her iki programda hafta i&ccedil;i ve hafta sonu uygulanabiliyor. 3&rsquo;er aylık periyotlar şeklinde devam eden programlar haftada 1 g&uuml;n/45 dakikalık ders şeklinde hazırlanmış. Eğitim programlarının fiyatı aylık 250 TL&rsquo;den başlıyor. Uluslar arası m&uuml;zik eğitim programları ile devam eden &uuml;&ccedil;&uuml;nc&uuml; aşamada &ouml;ğrenciler daha teknik dersler ile tanışıp, West London Colloge Of Music, ABRSM (Associated Board of Royal Schools of Music) ve Boston Longy School Of Music programları ile sanat eğitimlerine devam ediyorlar. ARSU G&uuml;zel Sanatlar Akademisi&rsquo;nde satan eğitimini başarı ile tamamlayan &ouml;ğrenciler, t&uuml;m d&uuml;nyada ge&ccedil;erli olan lise d&uuml;zeyindeki diplomasına sahip oluyor ve yurtdışındaki konservatuarlarda eğitim alma şansını yakalıyor.</p>
', 1, 3, NULL, CAST(N'2017-01-01T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Haberler] ([Id], [Ad], [Resim], [Slug], [Detay], [Aktif], [KategoriId], [GaleriId], [Tarih], [Hit]) VALUES (86, N'ALKEV ÖZEL OKULLARINDAN HANNOVER DEĞİŞİM PROGRAMI 2016', N'Lew6Jq0c_400x400-3843K.jpeg', N'alkev-ozel-okullarindan-hannover-degisim-programi-2016', N'<p><strong>ALKEV &Ouml;ZEL OKULLARINDAN HANNOVER DEĞİŞİM PROGRAMI 2016</strong></p>

<p>Okulumuzda değişim programlarıyla, &ouml;ğrencilerimize Almanca dilini pekiştirebilecekleri ve geliştirebilecekleri fırsatlar yaratılmaktadır. Bu ama&ccedil;la, Hannover şehrinde bulunan&nbsp;<a href="http://www.sophienschule.de/">Sophienschule</a>&nbsp;ile işbirliği yapılarak hazırlık ve 9. sınıfları kapsayan bir değişim programı başlatıldı. Her yıl d&uuml;zenli olarak ger&ccedil;ekleştirilen bu program kapsamında bu yıl 21 &ouml;ğrencimizin katılımı ger&ccedil;ekleşti.<br />
&Ouml;ğrencilerimiz gezi &ouml;ncesinde hazırlık ve okul d&uuml;zeyinde paylaşım ama&ccedil;lı blog sayfalarında karşılıklı olarak &ccedil;alışma başlatıldı.<br />
1-8 Mayıs 2016 tarihleri arasında &ouml;ğrencilerimiz&nbsp; &ouml;ğretmenleri eşliğinde Hannover &ndash; Sophienschule ziyaretlerini ger&ccedil;ekleştirdiler. Ziyaretleri boyunca misafir ailelerde konaklayan &ouml;ğrencilerimiz, okul saatleri &ccedil;er&ccedil;evesinde kardeş okulumuzu ziyaret ederek derslere, kamp&uuml;s i&ccedil;inde ve dışında proje &ccedil;alışmalarına ve &ccedil;eşitli &ouml;nemli programlara katılım sağladılar.<br />
Programımızın Almanya ayağı eski Almanya başbakanının eşi sayın</p>

<p>Doris Schr&ouml;der-K&ouml;pf liderliğinde y&uuml;r&uuml;t&uuml;lmektedir<img alt="IMG_8385" src="http://temizliksektoru.com/wp-content/uploads/2016/08/IMG_8385.jpg" style="height:600px; width:800px" />&nbsp;</p>
', 1, 5, NULL, CAST(N'2017-06-15T01:29:52.327' AS DateTime), 1)
INSERT [dbo].[Haberler] ([Id], [Ad], [Resim], [Slug], [Detay], [Aktif], [KategoriId], [GaleriId], [Tarih], [Hit]) VALUES (87, N'ARSU Güzel Sanatlar Akademisi’nde Sanat Eğitimi Minikler Altı Aylıkken Başlıyor….', N'arsu-guzel-1452E.png', N'arsu-guzel-sanatlar-akademisi-nde-sanat-egitimi-minikler-alti-aylikken-basliyor', N'<p>ARSU G&uuml;zel Sanatlar Akademisi, okul &ouml;ncesi sanat eğitimi programları ve akademik d&uuml;zeydeki eğitimleriyle gen&ccedil; yetenekler yetiştirmeye ve onları sanat ile buluşturmaya devam ediyor. Akademide verilen okul &ouml;ncesi eğitim programı ile &ccedil;ocuklar, atacakları her yaşamsal adımı, oluşan estetik duygusuyla birlikte g&uuml;venle atıyor.</p>

<p>ARSU G&uuml;zel Sanatlar Akademisi sanat eğitimleri bebeğiniz altı aylıkken başlıyor. Arsu G&uuml;zel Sanatlar Akademisi&rsquo;nde sanat eğitiminin başlangı&ccedil; noktası, bilimselliği otoriteler tarafından onaylanmış, d&uuml;nyanın en k&ouml;kl&uuml; ve en saygın okul &ouml;ncesi eğitim sistemi olan Uluslararası Kindermusik International eğitim programı. Bu program &ccedil;ocukların zihinsel gelişimine katkı sağlarken, miniklerin başarılı okul hayatı i&ccedil;in de temeller oluşturuluyor. Kindermusik International eğitim programını tamamlayan minik &ouml;ğrenciler Yetenek Geliştirme ve M&uuml;zikalite Sınıfları&rsquo; nda sanat eğitimlerinin ikinci aşamasına başlıyor. 3.5-5 yaş arası yedi &ouml;ğrencinin bulunduğu M&uuml;zikalite Sınıflarda eğitim, eğlenerek &ouml;ğrenebilecekleri dersler ile devam ediyor. Her iki programda hafta i&ccedil;i ve hafta sonu uygulanabiliyor. 3&rsquo;er aylık periyotlar şeklinde devam eden programlar haftada 1 g&uuml;n/45 dakikalık ders şeklinde hazırlanmış. Eğitim programlarının fiyatı aylık 250 TL&rsquo;den başlıyor. Uluslar arası m&uuml;zik eğitim programları ile devam eden &uuml;&ccedil;&uuml;nc&uuml; aşamada &ouml;ğrenciler daha teknik dersler ile tanışıp, West London Colloge Of Music, ABRSM (Associated Board of Royal Schools of Music) ve Boston Longy School Of Music programları ile sanat eğitimlerine devam ediyorlar. ARSU G&uuml;zel Sanatlar Akademisi&rsquo;nde satan eğitimini başarı ile tamamlayan &ouml;ğrenciler, t&uuml;m d&uuml;nyada ge&ccedil;erli olan lise d&uuml;zeyindeki diplomasına sahip oluyor ve yurtdışındaki konservatuarlarda eğitim alma şansını yakalıyor.</p>
', 1, 6, NULL, CAST(N'2017-06-15T01:29:52.550' AS DateTime), 1)
INSERT [dbo].[Haberler] ([Id], [Ad], [Resim], [Slug], [Detay], [Aktif], [KategoriId], [GaleriId], [Tarih], [Hit]) VALUES (88, N'AVRUPA KOLEJİ SOSYAL SORUMLULUKLARDA BİR ADIM ÖNDE', N'AVRUPAasdasd-4704N.jpg', N'avrupa-koleji-sosyal-sorumluluklarda-bir-adim-onde', N'<p><strong>&Ouml;ğrenci odaklı bir eğitim anlayışını benimseyen ve sosyal ortam farkındalığı y&uuml;ksek bireyler yetiştirmeyi hedeflediklerini belirten Avrupa Koleji Kazlı&ccedil;eşme Kamp&uuml;s&uuml; Lise M&uuml;d&uuml;r&uuml; Miray Şeng&uuml;l, &ouml;ğrencilerini sosyal sorumluluk projelerinde de desteklediklerini s&ouml;yl&uuml;yor.</strong></p>

<p>Her yıl iki kez &ouml;ğrenci-&ouml;ğretmen-veli işbirliği ile geliri &ccedil;eşitli yardım kuruluşlarına bağışlanmak &uuml;zere d&uuml;zenlenen kurum b&uuml;nyesinde ger&ccedil;ekleştirilen kermeslerde Avrupa Koleji &ouml;ğrencilerinin aktif g&ouml;rev aldıklarını ve &ouml;ğrencilerin organizasyonun her s&uuml;recini kendilerinin y&ouml;nlendirdiklerini ifade eden Avrupa Koleji Kazlı&ccedil;eşme Kamp&uuml;s&uuml; Lise M&uuml;d&uuml;r&uuml; Miray Şeng&uuml;l, &ldquo;Avrupa Koleji Okulları&rsquo;nda artık bir gelenek gibi s&uuml;rd&uuml;r&uuml;len bu yardımlaşma anlayışı her &ouml;ğrenci ve &ouml;ğretmenin ortak d&uuml;ş&uuml;nme tarzı olmuştur. Bu şekilde empati kurabilen bireylerin yetiştirildiği kurum olma hedefini de ger&ccedil;ekleştirmek m&uuml;mk&uuml;n olabiliyor.&rdquo; diye konuşuyor.<br />
ENGELSİZ MATEMATİK G&Ouml;RME ENGELLİLERE IŞIK OLDU<br />
Bu yaklaşımın &uuml;r&uuml;nleri olarak nitelenebilecek iki &ouml;rneği anlatan Şeng&uuml;l, ilk &ouml;rneği &ldquo;Matematiğe dokunmak hi&ccedil; bu kadar anlamlı olmamıştı&rdquo; diye insanı d&uuml;ş&uuml;nd&uuml;ren bir ser&uuml;ven olarak nitelendiriyor.<br />
Avrupa Koleji Kazlı&ccedil;eşme Kamp&uuml;s&uuml; 6. sınıf &ouml;ğrencileri Bernis Dila Erg&uuml;l ve Ecehan Kekum&rsquo;un, matematik &ouml;ğretmenleri G&uuml;lşah Ekinci&rsquo;ye farklı bir şeyler &uuml;retmek ve insanların hayatlarını değiştirmek istediklerini s&ouml;ylemeleriyle Engelsiz matematik projesinin ortaya &ccedil;ıktığını ifade eden Şeng&uuml;l, sonraki s&uuml;reci şu s&ouml;zlerle anlatıyor: &ldquo;Bu &ccedil;ok iddalı bir hedefti. Onları y&ouml;nlendirme konusunda profesyonel olan &ouml;ğretmenlerinden biri &ldquo;eğer g&ouml;rme engelli olsaydınız matematik derslerini nasıl algılardınız hi&ccedil; d&uuml;ş&uuml;nd&uuml;n&uuml;z m&uuml;?&rdquo; sorusunu y&ouml;neltir &ouml;ğrencilerine. İşte bu soru ilk kıvılcımdır. Buradan yola &ccedil;ıkan &ouml;ğrenciler ve &ouml;ğretmenleri g&ouml;rme engellilerin matematik &ouml;ğrenmelerini kolaylaştırabilecek bir materyal yapmaya karar verirler. Başlangı&ccedil;ta bir proje yarışması hazırlığı olarak başlar &ccedil;alışmaları. Tasarladıkları materyal uzun &ccedil;alışmalardan sonra oluşur. Artık bu materyalin denenmesi gerekmektedir. &Ouml;ğrencilerimiz ve &ouml;ğretmenleri g&ouml;rme engellilerin eğitim aldığı bir okulu ziyaret ederler. Aldıkları tepkiler beklediklerinden daha olumludur. Bazı ekleme ve d&uuml;zeltmeler yapmaları konusundaki tavsiyelerle okula d&ouml;nerler. B&uuml;y&uuml;k bir heyecanla materyallerini yeniden d&uuml;zenlemeye başlarlar. Bu oluşuma okul ve aileler de destek vermektedir. Hedefledikleri yarışmaya katılıp ikincilik &ouml;d&uuml;llerini alırlar ancak artık ama&ccedil;ları derece değildir aslında. Onlar okullarının da desteğiyle g&ouml;rme engelli &ouml;ğrencilere yardım edebilecekleri bir sosyal sorumluluk projesinin merkezindedirler artık. K&uuml;&ccedil;&uuml;c&uuml;k y&uuml;rekleriyle ortaya koydukları bu b&uuml;y&uuml;k &ccedil;aba meyvelerini vermektedir. Projeleri g&ouml;rsel basının ilgisini &ccedil;ekmiş ve ana haber b&uuml;ltenlerinde &ouml;ğrenciler ve &ouml;ğretmenleri bu s&uuml;reci t&uuml;m &uuml;lkeye anlatabilme fırsatını da yakalamışlardır. Bug&uuml;nlerde materyallerini geliştirme &ccedil;alışmalarını s&uuml;rd&uuml;r&uuml;yorlar. Bu geliştirme &ccedil;alışmalarını da G&ouml;rme Engelliler Federasyonu ile yaptıkları g&ouml;r&uuml;şmeler doğrultusunda kurumun da desteği ile s&uuml;rd&uuml;r&uuml;yorlar.&rdquo;</p>
', 1, 7, NULL, CAST(N'2017-06-15T01:30:21.267' AS DateTime), 1)
INSERT [dbo].[Haberler] ([Id], [Ad], [Resim], [Slug], [Detay], [Aktif], [KategoriId], [GaleriId], [Tarih], [Hit]) VALUES (89, N'ALKEV ÖZEL OKULLARINDAN HANNOVER DEĞİŞİM PROGRAMI 2016', N'Lew6Jq0c_400x400-3843K.jpeg', N'alkev-ozel-okullarindan-hannover-degisim-programi-2016', N'<p><strong>ALKEV &Ouml;ZEL OKULLARINDAN HANNOVER DEĞİŞİM PROGRAMI 2016</strong></p>

<p>Okulumuzda değişim programlarıyla, &ouml;ğrencilerimize Almanca dilini pekiştirebilecekleri ve geliştirebilecekleri fırsatlar yaratılmaktadır. Bu ama&ccedil;la, Hannover şehrinde bulunan&nbsp;<a href="http://www.sophienschule.de/">Sophienschule</a>&nbsp;ile işbirliği yapılarak hazırlık ve 9. sınıfları kapsayan bir değişim programı başlatıldı. Her yıl d&uuml;zenli olarak ger&ccedil;ekleştirilen bu program kapsamında bu yıl 21 &ouml;ğrencimizin katılımı ger&ccedil;ekleşti.<br />
&Ouml;ğrencilerimiz gezi &ouml;ncesinde hazırlık ve okul d&uuml;zeyinde paylaşım ama&ccedil;lı blog sayfalarında karşılıklı olarak &ccedil;alışma başlatıldı.<br />
1-8 Mayıs 2016 tarihleri arasında &ouml;ğrencilerimiz&nbsp; &ouml;ğretmenleri eşliğinde Hannover &ndash; Sophienschule ziyaretlerini ger&ccedil;ekleştirdiler. Ziyaretleri boyunca misafir ailelerde konaklayan &ouml;ğrencilerimiz, okul saatleri &ccedil;er&ccedil;evesinde kardeş okulumuzu ziyaret ederek derslere, kamp&uuml;s i&ccedil;inde ve dışında proje &ccedil;alışmalarına ve &ccedil;eşitli &ouml;nemli programlara katılım sağladılar.<br />
Programımızın Almanya ayağı eski Almanya başbakanının eşi sayın</p>

<p>Doris Schr&ouml;der-K&ouml;pf liderliğinde y&uuml;r&uuml;t&uuml;lmektedir<img alt="IMG_8385" src="http://temizliksektoru.com/wp-content/uploads/2016/08/IMG_8385.jpg" style="height:600px; width:800px" />&nbsp;</p>
', 1, 8, NULL, CAST(N'2017-06-15T01:29:53.080' AS DateTime), 1)
INSERT [dbo].[Haberler] ([Id], [Ad], [Resim], [Slug], [Detay], [Aktif], [KategoriId], [GaleriId], [Tarih], [Hit]) VALUES (90, N'ARSU Güzel Sanatlar Akademisi’nde Sanat Eğitimi Minikler Altı Aylıkken Başlıyor….', N'arsu-guzel-1452E.png', N'arsu-guzel-sanatlar-akademisi-nde-sanat-egitimi-minikler-alti-aylikken-basliyor', N'<p>ARSU G&uuml;zel Sanatlar Akademisi, okul &ouml;ncesi sanat eğitimi programları ve akademik d&uuml;zeydeki eğitimleriyle gen&ccedil; yetenekler yetiştirmeye ve onları sanat ile buluşturmaya devam ediyor. Akademide verilen okul &ouml;ncesi eğitim programı ile &ccedil;ocuklar, atacakları her yaşamsal adımı, oluşan estetik duygusuyla birlikte g&uuml;venle atıyor.</p>

<p>ARSU G&uuml;zel Sanatlar Akademisi sanat eğitimleri bebeğiniz altı aylıkken başlıyor. Arsu G&uuml;zel Sanatlar Akademisi&rsquo;nde sanat eğitiminin başlangı&ccedil; noktası, bilimselliği otoriteler tarafından onaylanmış, d&uuml;nyanın en k&ouml;kl&uuml; ve en saygın okul &ouml;ncesi eğitim sistemi olan Uluslararası Kindermusik International eğitim programı. Bu program &ccedil;ocukların zihinsel gelişimine katkı sağlarken, miniklerin başarılı okul hayatı i&ccedil;in de temeller oluşturuluyor. Kindermusik International eğitim programını tamamlayan minik &ouml;ğrenciler Yetenek Geliştirme ve M&uuml;zikalite Sınıfları&rsquo; nda sanat eğitimlerinin ikinci aşamasına başlıyor. 3.5-5 yaş arası yedi &ouml;ğrencinin bulunduğu M&uuml;zikalite Sınıflarda eğitim, eğlenerek &ouml;ğrenebilecekleri dersler ile devam ediyor. Her iki programda hafta i&ccedil;i ve hafta sonu uygulanabiliyor. 3&rsquo;er aylık periyotlar şeklinde devam eden programlar haftada 1 g&uuml;n/45 dakikalık ders şeklinde hazırlanmış. Eğitim programlarının fiyatı aylık 250 TL&rsquo;den başlıyor. Uluslar arası m&uuml;zik eğitim programları ile devam eden &uuml;&ccedil;&uuml;nc&uuml; aşamada &ouml;ğrenciler daha teknik dersler ile tanışıp, West London Colloge Of Music, ABRSM (Associated Board of Royal Schools of Music) ve Boston Longy School Of Music programları ile sanat eğitimlerine devam ediyorlar. ARSU G&uuml;zel Sanatlar Akademisi&rsquo;nde satan eğitimini başarı ile tamamlayan &ouml;ğrenciler, t&uuml;m d&uuml;nyada ge&ccedil;erli olan lise d&uuml;zeyindeki diplomasına sahip oluyor ve yurtdışındaki konservatuarlarda eğitim alma şansını yakalıyor.</p>
', 1, 9, NULL, CAST(N'2017-06-15T01:29:53.300' AS DateTime), 1)
INSERT [dbo].[Haberler] ([Id], [Ad], [Resim], [Slug], [Detay], [Aktif], [KategoriId], [GaleriId], [Tarih], [Hit]) VALUES (91, N'AVRUPA KOLEJİ SOSYAL SORUMLULUKLARDA BİR ADIM ÖNDE', N'AVRUPAasdasd-4704N.jpg', N'avrupa-koleji-sosyal-sorumluluklarda-bir-adim-onde', N'<p><strong>&Ouml;ğrenci odaklı bir eğitim anlayışını benimseyen ve sosyal ortam farkındalığı y&uuml;ksek bireyler yetiştirmeyi hedeflediklerini belirten Avrupa Koleji Kazlı&ccedil;eşme Kamp&uuml;s&uuml; Lise M&uuml;d&uuml;r&uuml; Miray Şeng&uuml;l, &ouml;ğrencilerini sosyal sorumluluk projelerinde de desteklediklerini s&ouml;yl&uuml;yor.</strong></p>

<p>Her yıl iki kez &ouml;ğrenci-&ouml;ğretmen-veli işbirliği ile geliri &ccedil;eşitli yardım kuruluşlarına bağışlanmak &uuml;zere d&uuml;zenlenen kurum b&uuml;nyesinde ger&ccedil;ekleştirilen kermeslerde Avrupa Koleji &ouml;ğrencilerinin aktif g&ouml;rev aldıklarını ve &ouml;ğrencilerin organizasyonun her s&uuml;recini kendilerinin y&ouml;nlendirdiklerini ifade eden Avrupa Koleji Kazlı&ccedil;eşme Kamp&uuml;s&uuml; Lise M&uuml;d&uuml;r&uuml; Miray Şeng&uuml;l, &ldquo;Avrupa Koleji Okulları&rsquo;nda artık bir gelenek gibi s&uuml;rd&uuml;r&uuml;len bu yardımlaşma anlayışı her &ouml;ğrenci ve &ouml;ğretmenin ortak d&uuml;ş&uuml;nme tarzı olmuştur. Bu şekilde empati kurabilen bireylerin yetiştirildiği kurum olma hedefini de ger&ccedil;ekleştirmek m&uuml;mk&uuml;n olabiliyor.&rdquo; diye konuşuyor.<br />
ENGELSİZ MATEMATİK G&Ouml;RME ENGELLİLERE IŞIK OLDU<br />
Bu yaklaşımın &uuml;r&uuml;nleri olarak nitelenebilecek iki &ouml;rneği anlatan Şeng&uuml;l, ilk &ouml;rneği &ldquo;Matematiğe dokunmak hi&ccedil; bu kadar anlamlı olmamıştı&rdquo; diye insanı d&uuml;ş&uuml;nd&uuml;ren bir ser&uuml;ven olarak nitelendiriyor.<br />
Avrupa Koleji Kazlı&ccedil;eşme Kamp&uuml;s&uuml; 6. sınıf &ouml;ğrencileri Bernis Dila Erg&uuml;l ve Ecehan Kekum&rsquo;un, matematik &ouml;ğretmenleri G&uuml;lşah Ekinci&rsquo;ye farklı bir şeyler &uuml;retmek ve insanların hayatlarını değiştirmek istediklerini s&ouml;ylemeleriyle Engelsiz matematik projesinin ortaya &ccedil;ıktığını ifade eden Şeng&uuml;l, sonraki s&uuml;reci şu s&ouml;zlerle anlatıyor: &ldquo;Bu &ccedil;ok iddalı bir hedefti. Onları y&ouml;nlendirme konusunda profesyonel olan &ouml;ğretmenlerinden biri &ldquo;eğer g&ouml;rme engelli olsaydınız matematik derslerini nasıl algılardınız hi&ccedil; d&uuml;ş&uuml;nd&uuml;n&uuml;z m&uuml;?&rdquo; sorusunu y&ouml;neltir &ouml;ğrencilerine. İşte bu soru ilk kıvılcımdır. Buradan yola &ccedil;ıkan &ouml;ğrenciler ve &ouml;ğretmenleri g&ouml;rme engellilerin matematik &ouml;ğrenmelerini kolaylaştırabilecek bir materyal yapmaya karar verirler. Başlangı&ccedil;ta bir proje yarışması hazırlığı olarak başlar &ccedil;alışmaları. Tasarladıkları materyal uzun &ccedil;alışmalardan sonra oluşur. Artık bu materyalin denenmesi gerekmektedir. &Ouml;ğrencilerimiz ve &ouml;ğretmenleri g&ouml;rme engellilerin eğitim aldığı bir okulu ziyaret ederler. Aldıkları tepkiler beklediklerinden daha olumludur. Bazı ekleme ve d&uuml;zeltmeler yapmaları konusundaki tavsiyelerle okula d&ouml;nerler. B&uuml;y&uuml;k bir heyecanla materyallerini yeniden d&uuml;zenlemeye başlarlar. Bu oluşuma okul ve aileler de destek vermektedir. Hedefledikleri yarışmaya katılıp ikincilik &ouml;d&uuml;llerini alırlar ancak artık ama&ccedil;ları derece değildir aslında. Onlar okullarının da desteğiyle g&ouml;rme engelli &ouml;ğrencilere yardım edebilecekleri bir sosyal sorumluluk projesinin merkezindedirler artık. K&uuml;&ccedil;&uuml;c&uuml;k y&uuml;rekleriyle ortaya koydukları bu b&uuml;y&uuml;k &ccedil;aba meyvelerini vermektedir. Projeleri g&ouml;rsel basının ilgisini &ccedil;ekmiş ve ana haber b&uuml;ltenlerinde &ouml;ğrenciler ve &ouml;ğretmenleri bu s&uuml;reci t&uuml;m &uuml;lkeye anlatabilme fırsatını da yakalamışlardır. Bug&uuml;nlerde materyallerini geliştirme &ccedil;alışmalarını s&uuml;rd&uuml;r&uuml;yorlar. Bu geliştirme &ccedil;alışmalarını da G&ouml;rme Engelliler Federasyonu ile yaptıkları g&ouml;r&uuml;şmeler doğrultusunda kurumun da desteği ile s&uuml;rd&uuml;r&uuml;yorlar.&rdquo;</p>
', 1, 10, NULL, CAST(N'2017-06-15T01:29:53.633' AS DateTime), 1)
INSERT [dbo].[Haberler] ([Id], [Ad], [Resim], [Slug], [Detay], [Aktif], [KategoriId], [GaleriId], [Tarih], [Hit]) VALUES (92, N'ALKEV ÖZEL OKULLARINDAN HANNOVER DEĞİŞİM PROGRAMI 2016', N'Lew6Jq0c_400x400-3843K.jpeg', N'alkev-ozel-okullarindan-hannover-degisim-programi-2016', N'<p><strong>ALKEV &Ouml;ZEL OKULLARINDAN HANNOVER DEĞİŞİM PROGRAMI 2016</strong></p>

<p>Okulumuzda değişim programlarıyla, &ouml;ğrencilerimize Almanca dilini pekiştirebilecekleri ve geliştirebilecekleri fırsatlar yaratılmaktadır. Bu ama&ccedil;la, Hannover şehrinde bulunan&nbsp;<a href="http://www.sophienschule.de/">Sophienschule</a>&nbsp;ile işbirliği yapılarak hazırlık ve 9. sınıfları kapsayan bir değişim programı başlatıldı. Her yıl d&uuml;zenli olarak ger&ccedil;ekleştirilen bu program kapsamında bu yıl 21 &ouml;ğrencimizin katılımı ger&ccedil;ekleşti.<br />
&Ouml;ğrencilerimiz gezi &ouml;ncesinde hazırlık ve okul d&uuml;zeyinde paylaşım ama&ccedil;lı blog sayfalarında karşılıklı olarak &ccedil;alışma başlatıldı.<br />
1-8 Mayıs 2016 tarihleri arasında &ouml;ğrencilerimiz&nbsp; &ouml;ğretmenleri eşliğinde Hannover &ndash; Sophienschule ziyaretlerini ger&ccedil;ekleştirdiler. Ziyaretleri boyunca misafir ailelerde konaklayan &ouml;ğrencilerimiz, okul saatleri &ccedil;er&ccedil;evesinde kardeş okulumuzu ziyaret ederek derslere, kamp&uuml;s i&ccedil;inde ve dışında proje &ccedil;alışmalarına ve &ccedil;eşitli &ouml;nemli programlara katılım sağladılar.<br />
Programımızın Almanya ayağı eski Almanya başbakanının eşi sayın</p>

<p>Doris Schr&ouml;der-K&ouml;pf liderliğinde y&uuml;r&uuml;t&uuml;lmektedir<img alt="IMG_8385" src="http://temizliksektoru.com/wp-content/uploads/2016/08/IMG_8385.jpg" style="height:600px; width:800px" />&nbsp;</p>
', 1, 5, NULL, CAST(N'2017-06-15T01:29:53.810' AS DateTime), 1)
INSERT [dbo].[Haberler] ([Id], [Ad], [Resim], [Slug], [Detay], [Aktif], [KategoriId], [GaleriId], [Tarih], [Hit]) VALUES (93, N'ARSU Güzel Sanatlar Akademisi’nde Sanat Eğitimi Minikler Altı Aylıkken Başlıyor….', N'arsu-guzel-1452E.png', N'arsu-guzel-sanatlar-akademisi-nde-sanat-egitimi-minikler-alti-aylikken-basliyor', N'<p>ARSU G&uuml;zel Sanatlar Akademisi, okul &ouml;ncesi sanat eğitimi programları ve akademik d&uuml;zeydeki eğitimleriyle gen&ccedil; yetenekler yetiştirmeye ve onları sanat ile buluşturmaya devam ediyor. Akademide verilen okul &ouml;ncesi eğitim programı ile &ccedil;ocuklar, atacakları her yaşamsal adımı, oluşan estetik duygusuyla birlikte g&uuml;venle atıyor.</p>

<p>ARSU G&uuml;zel Sanatlar Akademisi sanat eğitimleri bebeğiniz altı aylıkken başlıyor. Arsu G&uuml;zel Sanatlar Akademisi&rsquo;nde sanat eğitiminin başlangı&ccedil; noktası, bilimselliği otoriteler tarafından onaylanmış, d&uuml;nyanın en k&ouml;kl&uuml; ve en saygın okul &ouml;ncesi eğitim sistemi olan Uluslararası Kindermusik International eğitim programı. Bu program &ccedil;ocukların zihinsel gelişimine katkı sağlarken, miniklerin başarılı okul hayatı i&ccedil;in de temeller oluşturuluyor. Kindermusik International eğitim programını tamamlayan minik &ouml;ğrenciler Yetenek Geliştirme ve M&uuml;zikalite Sınıfları&rsquo; nda sanat eğitimlerinin ikinci aşamasına başlıyor. 3.5-5 yaş arası yedi &ouml;ğrencinin bulunduğu M&uuml;zikalite Sınıflarda eğitim, eğlenerek &ouml;ğrenebilecekleri dersler ile devam ediyor. Her iki programda hafta i&ccedil;i ve hafta sonu uygulanabiliyor. 3&rsquo;er aylık periyotlar şeklinde devam eden programlar haftada 1 g&uuml;n/45 dakikalık ders şeklinde hazırlanmış. Eğitim programlarının fiyatı aylık 250 TL&rsquo;den başlıyor. Uluslar arası m&uuml;zik eğitim programları ile devam eden &uuml;&ccedil;&uuml;nc&uuml; aşamada &ouml;ğrenciler daha teknik dersler ile tanışıp, West London Colloge Of Music, ABRSM (Associated Board of Royal Schools of Music) ve Boston Longy School Of Music programları ile sanat eğitimlerine devam ediyorlar. ARSU G&uuml;zel Sanatlar Akademisi&rsquo;nde satan eğitimini başarı ile tamamlayan &ouml;ğrenciler, t&uuml;m d&uuml;nyada ge&ccedil;erli olan lise d&uuml;zeyindeki diplomasına sahip oluyor ve yurtdışındaki konservatuarlarda eğitim alma şansını yakalıyor.</p>
', 1, 6, NULL, CAST(N'2017-06-15T01:29:54.043' AS DateTime), 1)
INSERT [dbo].[Haberler] ([Id], [Ad], [Resim], [Slug], [Detay], [Aktif], [KategoriId], [GaleriId], [Tarih], [Hit]) VALUES (94, N'AVRUPA KOLEJİ SOSYAL SORUMLULUKLARDA BİR ADIM ÖNDE', N'AVRUPAasdasd-4704N.jpg', N'avrupa-koleji-sosyal-sorumluluklarda-bir-adim-onde', N'<p><strong>&Ouml;ğrenci odaklı bir eğitim anlayışını benimseyen ve sosyal ortam farkındalığı y&uuml;ksek bireyler yetiştirmeyi hedeflediklerini belirten Avrupa Koleji Kazlı&ccedil;eşme Kamp&uuml;s&uuml; Lise M&uuml;d&uuml;r&uuml; Miray Şeng&uuml;l, &ouml;ğrencilerini sosyal sorumluluk projelerinde de desteklediklerini s&ouml;yl&uuml;yor.</strong></p>

<p>Her yıl iki kez &ouml;ğrenci-&ouml;ğretmen-veli işbirliği ile geliri &ccedil;eşitli yardım kuruluşlarına bağışlanmak &uuml;zere d&uuml;zenlenen kurum b&uuml;nyesinde ger&ccedil;ekleştirilen kermeslerde Avrupa Koleji &ouml;ğrencilerinin aktif g&ouml;rev aldıklarını ve &ouml;ğrencilerin organizasyonun her s&uuml;recini kendilerinin y&ouml;nlendirdiklerini ifade eden Avrupa Koleji Kazlı&ccedil;eşme Kamp&uuml;s&uuml; Lise M&uuml;d&uuml;r&uuml; Miray Şeng&uuml;l, &ldquo;Avrupa Koleji Okulları&rsquo;nda artık bir gelenek gibi s&uuml;rd&uuml;r&uuml;len bu yardımlaşma anlayışı her &ouml;ğrenci ve &ouml;ğretmenin ortak d&uuml;ş&uuml;nme tarzı olmuştur. Bu şekilde empati kurabilen bireylerin yetiştirildiği kurum olma hedefini de ger&ccedil;ekleştirmek m&uuml;mk&uuml;n olabiliyor.&rdquo; diye konuşuyor.<br />
ENGELSİZ MATEMATİK G&Ouml;RME ENGELLİLERE IŞIK OLDU<br />
Bu yaklaşımın &uuml;r&uuml;nleri olarak nitelenebilecek iki &ouml;rneği anlatan Şeng&uuml;l, ilk &ouml;rneği &ldquo;Matematiğe dokunmak hi&ccedil; bu kadar anlamlı olmamıştı&rdquo; diye insanı d&uuml;ş&uuml;nd&uuml;ren bir ser&uuml;ven olarak nitelendiriyor.<br />
Avrupa Koleji Kazlı&ccedil;eşme Kamp&uuml;s&uuml; 6. sınıf &ouml;ğrencileri Bernis Dila Erg&uuml;l ve Ecehan Kekum&rsquo;un, matematik &ouml;ğretmenleri G&uuml;lşah Ekinci&rsquo;ye farklı bir şeyler &uuml;retmek ve insanların hayatlarını değiştirmek istediklerini s&ouml;ylemeleriyle Engelsiz matematik projesinin ortaya &ccedil;ıktığını ifade eden Şeng&uuml;l, sonraki s&uuml;reci şu s&ouml;zlerle anlatıyor: &ldquo;Bu &ccedil;ok iddalı bir hedefti. Onları y&ouml;nlendirme konusunda profesyonel olan &ouml;ğretmenlerinden biri &ldquo;eğer g&ouml;rme engelli olsaydınız matematik derslerini nasıl algılardınız hi&ccedil; d&uuml;ş&uuml;nd&uuml;n&uuml;z m&uuml;?&rdquo; sorusunu y&ouml;neltir &ouml;ğrencilerine. İşte bu soru ilk kıvılcımdır. Buradan yola &ccedil;ıkan &ouml;ğrenciler ve &ouml;ğretmenleri g&ouml;rme engellilerin matematik &ouml;ğrenmelerini kolaylaştırabilecek bir materyal yapmaya karar verirler. Başlangı&ccedil;ta bir proje yarışması hazırlığı olarak başlar &ccedil;alışmaları. Tasarladıkları materyal uzun &ccedil;alışmalardan sonra oluşur. Artık bu materyalin denenmesi gerekmektedir. &Ouml;ğrencilerimiz ve &ouml;ğretmenleri g&ouml;rme engellilerin eğitim aldığı bir okulu ziyaret ederler. Aldıkları tepkiler beklediklerinden daha olumludur. Bazı ekleme ve d&uuml;zeltmeler yapmaları konusundaki tavsiyelerle okula d&ouml;nerler. B&uuml;y&uuml;k bir heyecanla materyallerini yeniden d&uuml;zenlemeye başlarlar. Bu oluşuma okul ve aileler de destek vermektedir. Hedefledikleri yarışmaya katılıp ikincilik &ouml;d&uuml;llerini alırlar ancak artık ama&ccedil;ları derece değildir aslında. Onlar okullarının da desteğiyle g&ouml;rme engelli &ouml;ğrencilere yardım edebilecekleri bir sosyal sorumluluk projesinin merkezindedirler artık. K&uuml;&ccedil;&uuml;c&uuml;k y&uuml;rekleriyle ortaya koydukları bu b&uuml;y&uuml;k &ccedil;aba meyvelerini vermektedir. Projeleri g&ouml;rsel basının ilgisini &ccedil;ekmiş ve ana haber b&uuml;ltenlerinde &ouml;ğrenciler ve &ouml;ğretmenleri bu s&uuml;reci t&uuml;m &uuml;lkeye anlatabilme fırsatını da yakalamışlardır. Bug&uuml;nlerde materyallerini geliştirme &ccedil;alışmalarını s&uuml;rd&uuml;r&uuml;yorlar. Bu geliştirme &ccedil;alışmalarını da G&ouml;rme Engelliler Federasyonu ile yaptıkları g&ouml;r&uuml;şmeler doğrultusunda kurumun da desteği ile s&uuml;rd&uuml;r&uuml;yorlar.&rdquo;</p>
', 1, 7, NULL, CAST(N'2017-06-15T01:29:54.387' AS DateTime), 1)
INSERT [dbo].[Haberler] ([Id], [Ad], [Resim], [Slug], [Detay], [Aktif], [KategoriId], [GaleriId], [Tarih], [Hit]) VALUES (95, N'ALKEV ÖZEL OKULLARINDAN HANNOVER DEĞİŞİM PROGRAMI 2016', N'Lew6Jq0c_400x400-3843K.jpeg', N'alkev-ozel-okullarindan-hannover-degisim-programi-2016', N'<p><strong>ALKEV &Ouml;ZEL OKULLARINDAN HANNOVER DEĞİŞİM PROGRAMI 2016</strong></p>

<p>Okulumuzda değişim programlarıyla, &ouml;ğrencilerimize Almanca dilini pekiştirebilecekleri ve geliştirebilecekleri fırsatlar yaratılmaktadır. Bu ama&ccedil;la, Hannover şehrinde bulunan&nbsp;<a href="http://www.sophienschule.de/">Sophienschule</a>&nbsp;ile işbirliği yapılarak hazırlık ve 9. sınıfları kapsayan bir değişim programı başlatıldı. Her yıl d&uuml;zenli olarak ger&ccedil;ekleştirilen bu program kapsamında bu yıl 21 &ouml;ğrencimizin katılımı ger&ccedil;ekleşti.<br />
&Ouml;ğrencilerimiz gezi &ouml;ncesinde hazırlık ve okul d&uuml;zeyinde paylaşım ama&ccedil;lı blog sayfalarında karşılıklı olarak &ccedil;alışma başlatıldı.<br />
1-8 Mayıs 2016 tarihleri arasında &ouml;ğrencilerimiz&nbsp; &ouml;ğretmenleri eşliğinde Hannover &ndash; Sophienschule ziyaretlerini ger&ccedil;ekleştirdiler. Ziyaretleri boyunca misafir ailelerde konaklayan &ouml;ğrencilerimiz, okul saatleri &ccedil;er&ccedil;evesinde kardeş okulumuzu ziyaret ederek derslere, kamp&uuml;s i&ccedil;inde ve dışında proje &ccedil;alışmalarına ve &ccedil;eşitli &ouml;nemli programlara katılım sağladılar.<br />
Programımızın Almanya ayağı eski Almanya başbakanının eşi sayın</p>

<p>Doris Schr&ouml;der-K&ouml;pf liderliğinde y&uuml;r&uuml;t&uuml;lmektedir<img alt="IMG_8385" src="http://temizliksektoru.com/wp-content/uploads/2016/08/IMG_8385.jpg" style="height:600px; width:800px" />&nbsp;</p>
', 1, 8, NULL, CAST(N'2017-06-15T01:29:54.567' AS DateTime), 1)
INSERT [dbo].[Haberler] ([Id], [Ad], [Resim], [Slug], [Detay], [Aktif], [KategoriId], [GaleriId], [Tarih], [Hit]) VALUES (96, N'ARSU Güzel Sanatlar Akademisi’nde Sanat Eğitimi Minikler Altı Aylıkken Başlıyor….', N'arsu-guzel-1452E.png', N'arsu-guzel-sanatlar-akademisi-nde-sanat-egitimi-minikler-alti-aylikken-basliyor', N'<p>ARSU G&uuml;zel Sanatlar Akademisi, okul &ouml;ncesi sanat eğitimi programları ve akademik d&uuml;zeydeki eğitimleriyle gen&ccedil; yetenekler yetiştirmeye ve onları sanat ile buluşturmaya devam ediyor. Akademide verilen okul &ouml;ncesi eğitim programı ile &ccedil;ocuklar, atacakları her yaşamsal adımı, oluşan estetik duygusuyla birlikte g&uuml;venle atıyor.</p>

<p>ARSU G&uuml;zel Sanatlar Akademisi sanat eğitimleri bebeğiniz altı aylıkken başlıyor. Arsu G&uuml;zel Sanatlar Akademisi&rsquo;nde sanat eğitiminin başlangı&ccedil; noktası, bilimselliği otoriteler tarafından onaylanmış, d&uuml;nyanın en k&ouml;kl&uuml; ve en saygın okul &ouml;ncesi eğitim sistemi olan Uluslararası Kindermusik International eğitim programı. Bu program &ccedil;ocukların zihinsel gelişimine katkı sağlarken, miniklerin başarılı okul hayatı i&ccedil;in de temeller oluşturuluyor. Kindermusik International eğitim programını tamamlayan minik &ouml;ğrenciler Yetenek Geliştirme ve M&uuml;zikalite Sınıfları&rsquo; nda sanat eğitimlerinin ikinci aşamasına başlıyor. 3.5-5 yaş arası yedi &ouml;ğrencinin bulunduğu M&uuml;zikalite Sınıflarda eğitim, eğlenerek &ouml;ğrenebilecekleri dersler ile devam ediyor. Her iki programda hafta i&ccedil;i ve hafta sonu uygulanabiliyor. 3&rsquo;er aylık periyotlar şeklinde devam eden programlar haftada 1 g&uuml;n/45 dakikalık ders şeklinde hazırlanmış. Eğitim programlarının fiyatı aylık 250 TL&rsquo;den başlıyor. Uluslar arası m&uuml;zik eğitim programları ile devam eden &uuml;&ccedil;&uuml;nc&uuml; aşamada &ouml;ğrenciler daha teknik dersler ile tanışıp, West London Colloge Of Music, ABRSM (Associated Board of Royal Schools of Music) ve Boston Longy School Of Music programları ile sanat eğitimlerine devam ediyorlar. ARSU G&uuml;zel Sanatlar Akademisi&rsquo;nde satan eğitimini başarı ile tamamlayan &ouml;ğrenciler, t&uuml;m d&uuml;nyada ge&ccedil;erli olan lise d&uuml;zeyindeki diplomasına sahip oluyor ve yurtdışındaki konservatuarlarda eğitim alma şansını yakalıyor.</p>
', 1, 9, NULL, CAST(N'2017-06-15T01:29:54.793' AS DateTime), 1)
INSERT [dbo].[Haberler] ([Id], [Ad], [Resim], [Slug], [Detay], [Aktif], [KategoriId], [GaleriId], [Tarih], [Hit]) VALUES (97, N'AVRUPA KOLEJİ SOSYAL SORUMLULUKLARDA BİR ADIM ÖNDE', N'AVRUPAasdasd-4704N.jpg', N'avrupa-koleji-sosyal-sorumluluklarda-bir-adim-onde', N'<p><strong>&Ouml;ğrenci odaklı bir eğitim anlayışını benimseyen ve sosyal ortam farkındalığı y&uuml;ksek bireyler yetiştirmeyi hedeflediklerini belirten Avrupa Koleji Kazlı&ccedil;eşme Kamp&uuml;s&uuml; Lise M&uuml;d&uuml;r&uuml; Miray Şeng&uuml;l, &ouml;ğrencilerini sosyal sorumluluk projelerinde de desteklediklerini s&ouml;yl&uuml;yor.</strong></p>

<p>Her yıl iki kez &ouml;ğrenci-&ouml;ğretmen-veli işbirliği ile geliri &ccedil;eşitli yardım kuruluşlarına bağışlanmak &uuml;zere d&uuml;zenlenen kurum b&uuml;nyesinde ger&ccedil;ekleştirilen kermeslerde Avrupa Koleji &ouml;ğrencilerinin aktif g&ouml;rev aldıklarını ve &ouml;ğrencilerin organizasyonun her s&uuml;recini kendilerinin y&ouml;nlendirdiklerini ifade eden Avrupa Koleji Kazlı&ccedil;eşme Kamp&uuml;s&uuml; Lise M&uuml;d&uuml;r&uuml; Miray Şeng&uuml;l, &ldquo;Avrupa Koleji Okulları&rsquo;nda artık bir gelenek gibi s&uuml;rd&uuml;r&uuml;len bu yardımlaşma anlayışı her &ouml;ğrenci ve &ouml;ğretmenin ortak d&uuml;ş&uuml;nme tarzı olmuştur. Bu şekilde empati kurabilen bireylerin yetiştirildiği kurum olma hedefini de ger&ccedil;ekleştirmek m&uuml;mk&uuml;n olabiliyor.&rdquo; diye konuşuyor.<br />
ENGELSİZ MATEMATİK G&Ouml;RME ENGELLİLERE IŞIK OLDU<br />
Bu yaklaşımın &uuml;r&uuml;nleri olarak nitelenebilecek iki &ouml;rneği anlatan Şeng&uuml;l, ilk &ouml;rneği &ldquo;Matematiğe dokunmak hi&ccedil; bu kadar anlamlı olmamıştı&rdquo; diye insanı d&uuml;ş&uuml;nd&uuml;ren bir ser&uuml;ven olarak nitelendiriyor.<br />
Avrupa Koleji Kazlı&ccedil;eşme Kamp&uuml;s&uuml; 6. sınıf &ouml;ğrencileri Bernis Dila Erg&uuml;l ve Ecehan Kekum&rsquo;un, matematik &ouml;ğretmenleri G&uuml;lşah Ekinci&rsquo;ye farklı bir şeyler &uuml;retmek ve insanların hayatlarını değiştirmek istediklerini s&ouml;ylemeleriyle Engelsiz matematik projesinin ortaya &ccedil;ıktığını ifade eden Şeng&uuml;l, sonraki s&uuml;reci şu s&ouml;zlerle anlatıyor: &ldquo;Bu &ccedil;ok iddalı bir hedefti. Onları y&ouml;nlendirme konusunda profesyonel olan &ouml;ğretmenlerinden biri &ldquo;eğer g&ouml;rme engelli olsaydınız matematik derslerini nasıl algılardınız hi&ccedil; d&uuml;ş&uuml;nd&uuml;n&uuml;z m&uuml;?&rdquo; sorusunu y&ouml;neltir &ouml;ğrencilerine. İşte bu soru ilk kıvılcımdır. Buradan yola &ccedil;ıkan &ouml;ğrenciler ve &ouml;ğretmenleri g&ouml;rme engellilerin matematik &ouml;ğrenmelerini kolaylaştırabilecek bir materyal yapmaya karar verirler. Başlangı&ccedil;ta bir proje yarışması hazırlığı olarak başlar &ccedil;alışmaları. Tasarladıkları materyal uzun &ccedil;alışmalardan sonra oluşur. Artık bu materyalin denenmesi gerekmektedir. &Ouml;ğrencilerimiz ve &ouml;ğretmenleri g&ouml;rme engellilerin eğitim aldığı bir okulu ziyaret ederler. Aldıkları tepkiler beklediklerinden daha olumludur. Bazı ekleme ve d&uuml;zeltmeler yapmaları konusundaki tavsiyelerle okula d&ouml;nerler. B&uuml;y&uuml;k bir heyecanla materyallerini yeniden d&uuml;zenlemeye başlarlar. Bu oluşuma okul ve aileler de destek vermektedir. Hedefledikleri yarışmaya katılıp ikincilik &ouml;d&uuml;llerini alırlar ancak artık ama&ccedil;ları derece değildir aslında. Onlar okullarının da desteğiyle g&ouml;rme engelli &ouml;ğrencilere yardım edebilecekleri bir sosyal sorumluluk projesinin merkezindedirler artık. K&uuml;&ccedil;&uuml;c&uuml;k y&uuml;rekleriyle ortaya koydukları bu b&uuml;y&uuml;k &ccedil;aba meyvelerini vermektedir. Projeleri g&ouml;rsel basının ilgisini &ccedil;ekmiş ve ana haber b&uuml;ltenlerinde &ouml;ğrenciler ve &ouml;ğretmenleri bu s&uuml;reci t&uuml;m &uuml;lkeye anlatabilme fırsatını da yakalamışlardır. Bug&uuml;nlerde materyallerini geliştirme &ccedil;alışmalarını s&uuml;rd&uuml;r&uuml;yorlar. Bu geliştirme &ccedil;alışmalarını da G&ouml;rme Engelliler Federasyonu ile yaptıkları g&ouml;r&uuml;şmeler doğrultusunda kurumun da desteği ile s&uuml;rd&uuml;r&uuml;yorlar.&rdquo;</p>
', 1, 10, NULL, CAST(N'2017-06-15T01:29:55.140' AS DateTime), 1)
INSERT [dbo].[Haberler] ([Id], [Ad], [Resim], [Slug], [Detay], [Aktif], [KategoriId], [GaleriId], [Tarih], [Hit]) VALUES (98, N'ALKEV ÖZEL OKULLARINDAN HANNOVER DEĞİŞİM PROGRAMI 2016', N'Lew6Jq0c_400x400-3843K.jpeg', N'alkev-ozel-okullarindan-hannover-degisim-programi-2016', N'<p><strong>ALKEV &Ouml;ZEL OKULLARINDAN HANNOVER DEĞİŞİM PROGRAMI 2016</strong></p>

<p>Okulumuzda değişim programlarıyla, &ouml;ğrencilerimize Almanca dilini pekiştirebilecekleri ve geliştirebilecekleri fırsatlar yaratılmaktadır. Bu ama&ccedil;la, Hannover şehrinde bulunan&nbsp;<a href="http://www.sophienschule.de/">Sophienschule</a>&nbsp;ile işbirliği yapılarak hazırlık ve 9. sınıfları kapsayan bir değişim programı başlatıldı. Her yıl d&uuml;zenli olarak ger&ccedil;ekleştirilen bu program kapsamında bu yıl 21 &ouml;ğrencimizin katılımı ger&ccedil;ekleşti.<br />
&Ouml;ğrencilerimiz gezi &ouml;ncesinde hazırlık ve okul d&uuml;zeyinde paylaşım ama&ccedil;lı blog sayfalarında karşılıklı olarak &ccedil;alışma başlatıldı.<br />
1-8 Mayıs 2016 tarihleri arasında &ouml;ğrencilerimiz&nbsp; &ouml;ğretmenleri eşliğinde Hannover &ndash; Sophienschule ziyaretlerini ger&ccedil;ekleştirdiler. Ziyaretleri boyunca misafir ailelerde konaklayan &ouml;ğrencilerimiz, okul saatleri &ccedil;er&ccedil;evesinde kardeş okulumuzu ziyaret ederek derslere, kamp&uuml;s i&ccedil;inde ve dışında proje &ccedil;alışmalarına ve &ccedil;eşitli &ouml;nemli programlara katılım sağladılar.<br />
Programımızın Almanya ayağı eski Almanya başbakanının eşi sayın</p>

<p>Doris Schr&ouml;der-K&ouml;pf liderliğinde y&uuml;r&uuml;t&uuml;lmektedir<img alt="IMG_8385" src="http://temizliksektoru.com/wp-content/uploads/2016/08/IMG_8385.jpg" style="height:600px; width:800px" />&nbsp;</p>
', 1, 5, NULL, CAST(N'2017-06-15T01:29:55.313' AS DateTime), 1)
INSERT [dbo].[Haberler] ([Id], [Ad], [Resim], [Slug], [Detay], [Aktif], [KategoriId], [GaleriId], [Tarih], [Hit]) VALUES (99, N'ARSU Güzel Sanatlar Akademisi’nde Sanat Eğitimi Minikler Altı Aylıkken Başlıyor….', N'arsu-guzel-1452E.png', N'arsu-guzel-sanatlar-akademisi-nde-sanat-egitimi-minikler-alti-aylikken-basliyor', N'<p>ARSU G&uuml;zel Sanatlar Akademisi, okul &ouml;ncesi sanat eğitimi programları ve akademik d&uuml;zeydeki eğitimleriyle gen&ccedil; yetenekler yetiştirmeye ve onları sanat ile buluşturmaya devam ediyor. Akademide verilen okul &ouml;ncesi eğitim programı ile &ccedil;ocuklar, atacakları her yaşamsal adımı, oluşan estetik duygusuyla birlikte g&uuml;venle atıyor.</p>

<p>ARSU G&uuml;zel Sanatlar Akademisi sanat eğitimleri bebeğiniz altı aylıkken başlıyor. Arsu G&uuml;zel Sanatlar Akademisi&rsquo;nde sanat eğitiminin başlangı&ccedil; noktası, bilimselliği otoriteler tarafından onaylanmış, d&uuml;nyanın en k&ouml;kl&uuml; ve en saygın okul &ouml;ncesi eğitim sistemi olan Uluslararası Kindermusik International eğitim programı. Bu program &ccedil;ocukların zihinsel gelişimine katkı sağlarken, miniklerin başarılı okul hayatı i&ccedil;in de temeller oluşturuluyor. Kindermusik International eğitim programını tamamlayan minik &ouml;ğrenciler Yetenek Geliştirme ve M&uuml;zikalite Sınıfları&rsquo; nda sanat eğitimlerinin ikinci aşamasına başlıyor. 3.5-5 yaş arası yedi &ouml;ğrencinin bulunduğu M&uuml;zikalite Sınıflarda eğitim, eğlenerek &ouml;ğrenebilecekleri dersler ile devam ediyor. Her iki programda hafta i&ccedil;i ve hafta sonu uygulanabiliyor. 3&rsquo;er aylık periyotlar şeklinde devam eden programlar haftada 1 g&uuml;n/45 dakikalık ders şeklinde hazırlanmış. Eğitim programlarının fiyatı aylık 250 TL&rsquo;den başlıyor. Uluslar arası m&uuml;zik eğitim programları ile devam eden &uuml;&ccedil;&uuml;nc&uuml; aşamada &ouml;ğrenciler daha teknik dersler ile tanışıp, West London Colloge Of Music, ABRSM (Associated Board of Royal Schools of Music) ve Boston Longy School Of Music programları ile sanat eğitimlerine devam ediyorlar. ARSU G&uuml;zel Sanatlar Akademisi&rsquo;nde satan eğitimini başarı ile tamamlayan &ouml;ğrenciler, t&uuml;m d&uuml;nyada ge&ccedil;erli olan lise d&uuml;zeyindeki diplomasına sahip oluyor ve yurtdışındaki konservatuarlarda eğitim alma şansını yakalıyor.</p>
', 1, 6, NULL, CAST(N'2017-06-15T01:29:55.537' AS DateTime), 1)
INSERT [dbo].[Haberler] ([Id], [Ad], [Resim], [Slug], [Detay], [Aktif], [KategoriId], [GaleriId], [Tarih], [Hit]) VALUES (100, N'AVRUPA KOLEJİ SOSYAL SORUMLULUKLARDA BİR ADIM ÖNDE', N'AVRUPAasdasd-4704N.jpg', N'avrupa-koleji-sosyal-sorumluluklarda-bir-adim-onde', N'<p><strong>&Ouml;ğrenci odaklı bir eğitim anlayışını benimseyen ve sosyal ortam farkındalığı y&uuml;ksek bireyler yetiştirmeyi hedeflediklerini belirten Avrupa Koleji Kazlı&ccedil;eşme Kamp&uuml;s&uuml; Lise M&uuml;d&uuml;r&uuml; Miray Şeng&uuml;l, &ouml;ğrencilerini sosyal sorumluluk projelerinde de desteklediklerini s&ouml;yl&uuml;yor.</strong></p>

<p>Her yıl iki kez &ouml;ğrenci-&ouml;ğretmen-veli işbirliği ile geliri &ccedil;eşitli yardım kuruluşlarına bağışlanmak &uuml;zere d&uuml;zenlenen kurum b&uuml;nyesinde ger&ccedil;ekleştirilen kermeslerde Avrupa Koleji &ouml;ğrencilerinin aktif g&ouml;rev aldıklarını ve &ouml;ğrencilerin organizasyonun her s&uuml;recini kendilerinin y&ouml;nlendirdiklerini ifade eden Avrupa Koleji Kazlı&ccedil;eşme Kamp&uuml;s&uuml; Lise M&uuml;d&uuml;r&uuml; Miray Şeng&uuml;l, &ldquo;Avrupa Koleji Okulları&rsquo;nda artık bir gelenek gibi s&uuml;rd&uuml;r&uuml;len bu yardımlaşma anlayışı her &ouml;ğrenci ve &ouml;ğretmenin ortak d&uuml;ş&uuml;nme tarzı olmuştur. Bu şekilde empati kurabilen bireylerin yetiştirildiği kurum olma hedefini de ger&ccedil;ekleştirmek m&uuml;mk&uuml;n olabiliyor.&rdquo; diye konuşuyor.<br />
ENGELSİZ MATEMATİK G&Ouml;RME ENGELLİLERE IŞIK OLDU<br />
Bu yaklaşımın &uuml;r&uuml;nleri olarak nitelenebilecek iki &ouml;rneği anlatan Şeng&uuml;l, ilk &ouml;rneği &ldquo;Matematiğe dokunmak hi&ccedil; bu kadar anlamlı olmamıştı&rdquo; diye insanı d&uuml;ş&uuml;nd&uuml;ren bir ser&uuml;ven olarak nitelendiriyor.<br />
Avrupa Koleji Kazlı&ccedil;eşme Kamp&uuml;s&uuml; 6. sınıf &ouml;ğrencileri Bernis Dila Erg&uuml;l ve Ecehan Kekum&rsquo;un, matematik &ouml;ğretmenleri G&uuml;lşah Ekinci&rsquo;ye farklı bir şeyler &uuml;retmek ve insanların hayatlarını değiştirmek istediklerini s&ouml;ylemeleriyle Engelsiz matematik projesinin ortaya &ccedil;ıktığını ifade eden Şeng&uuml;l, sonraki s&uuml;reci şu s&ouml;zlerle anlatıyor: &ldquo;Bu &ccedil;ok iddalı bir hedefti. Onları y&ouml;nlendirme konusunda profesyonel olan &ouml;ğretmenlerinden biri &ldquo;eğer g&ouml;rme engelli olsaydınız matematik derslerini nasıl algılardınız hi&ccedil; d&uuml;ş&uuml;nd&uuml;n&uuml;z m&uuml;?&rdquo; sorusunu y&ouml;neltir &ouml;ğrencilerine. İşte bu soru ilk kıvılcımdır. Buradan yola &ccedil;ıkan &ouml;ğrenciler ve &ouml;ğretmenleri g&ouml;rme engellilerin matematik &ouml;ğrenmelerini kolaylaştırabilecek bir materyal yapmaya karar verirler. Başlangı&ccedil;ta bir proje yarışması hazırlığı olarak başlar &ccedil;alışmaları. Tasarladıkları materyal uzun &ccedil;alışmalardan sonra oluşur. Artık bu materyalin denenmesi gerekmektedir. &Ouml;ğrencilerimiz ve &ouml;ğretmenleri g&ouml;rme engellilerin eğitim aldığı bir okulu ziyaret ederler. Aldıkları tepkiler beklediklerinden daha olumludur. Bazı ekleme ve d&uuml;zeltmeler yapmaları konusundaki tavsiyelerle okula d&ouml;nerler. B&uuml;y&uuml;k bir heyecanla materyallerini yeniden d&uuml;zenlemeye başlarlar. Bu oluşuma okul ve aileler de destek vermektedir. Hedefledikleri yarışmaya katılıp ikincilik &ouml;d&uuml;llerini alırlar ancak artık ama&ccedil;ları derece değildir aslında. Onlar okullarının da desteğiyle g&ouml;rme engelli &ouml;ğrencilere yardım edebilecekleri bir sosyal sorumluluk projesinin merkezindedirler artık. K&uuml;&ccedil;&uuml;c&uuml;k y&uuml;rekleriyle ortaya koydukları bu b&uuml;y&uuml;k &ccedil;aba meyvelerini vermektedir. Projeleri g&ouml;rsel basının ilgisini &ccedil;ekmiş ve ana haber b&uuml;ltenlerinde &ouml;ğrenciler ve &ouml;ğretmenleri bu s&uuml;reci t&uuml;m &uuml;lkeye anlatabilme fırsatını da yakalamışlardır. Bug&uuml;nlerde materyallerini geliştirme &ccedil;alışmalarını s&uuml;rd&uuml;r&uuml;yorlar. Bu geliştirme &ccedil;alışmalarını da G&ouml;rme Engelliler Federasyonu ile yaptıkları g&ouml;r&uuml;şmeler doğrultusunda kurumun da desteği ile s&uuml;rd&uuml;r&uuml;yorlar.&rdquo;</p>
', 1, 7, NULL, CAST(N'2017-06-15T01:29:55.893' AS DateTime), 1)
INSERT [dbo].[Haberler] ([Id], [Ad], [Resim], [Slug], [Detay], [Aktif], [KategoriId], [GaleriId], [Tarih], [Hit]) VALUES (101, N'ALKEV ÖZEL OKULLARINDAN HANNOVER DEĞİŞİM PROGRAMI 2016', N'Lew6Jq0c_400x400-3843K.jpeg', N'alkev-ozel-okullarindan-hannover-degisim-programi-2016', N'<p><strong>ALKEV &Ouml;ZEL OKULLARINDAN HANNOVER DEĞİŞİM PROGRAMI 2016</strong></p>

<p>Okulumuzda değişim programlarıyla, &ouml;ğrencilerimize Almanca dilini pekiştirebilecekleri ve geliştirebilecekleri fırsatlar yaratılmaktadır. Bu ama&ccedil;la, Hannover şehrinde bulunan&nbsp;<a href="http://www.sophienschule.de/">Sophienschule</a>&nbsp;ile işbirliği yapılarak hazırlık ve 9. sınıfları kapsayan bir değişim programı başlatıldı. Her yıl d&uuml;zenli olarak ger&ccedil;ekleştirilen bu program kapsamında bu yıl 21 &ouml;ğrencimizin katılımı ger&ccedil;ekleşti.<br />
&Ouml;ğrencilerimiz gezi &ouml;ncesinde hazırlık ve okul d&uuml;zeyinde paylaşım ama&ccedil;lı blog sayfalarında karşılıklı olarak &ccedil;alışma başlatıldı.<br />
1-8 Mayıs 2016 tarihleri arasında &ouml;ğrencilerimiz&nbsp; &ouml;ğretmenleri eşliğinde Hannover &ndash; Sophienschule ziyaretlerini ger&ccedil;ekleştirdiler. Ziyaretleri boyunca misafir ailelerde konaklayan &ouml;ğrencilerimiz, okul saatleri &ccedil;er&ccedil;evesinde kardeş okulumuzu ziyaret ederek derslere, kamp&uuml;s i&ccedil;inde ve dışında proje &ccedil;alışmalarına ve &ccedil;eşitli &ouml;nemli programlara katılım sağladılar.<br />
Programımızın Almanya ayağı eski Almanya başbakanının eşi sayın</p>

<p>Doris Schr&ouml;der-K&ouml;pf liderliğinde y&uuml;r&uuml;t&uuml;lmektedir<img alt="IMG_8385" src="http://temizliksektoru.com/wp-content/uploads/2016/08/IMG_8385.jpg" style="height:600px; width:800px" />&nbsp;</p>
', 1, 8, NULL, CAST(N'2017-06-15T01:29:56.070' AS DateTime), 1)
INSERT [dbo].[Haberler] ([Id], [Ad], [Resim], [Slug], [Detay], [Aktif], [KategoriId], [GaleriId], [Tarih], [Hit]) VALUES (102, N'ARSU Güzel Sanatlar Akademisi’nde Sanat Eğitimi Minikler Altı Aylıkken Başlıyor….', N'arsu-guzel-1452E.png', N'arsu-guzel-sanatlar-akademisi-nde-sanat-egitimi-minikler-alti-aylikken-basliyor', N'<p>ARSU G&uuml;zel Sanatlar Akademisi, okul &ouml;ncesi sanat eğitimi programları ve akademik d&uuml;zeydeki eğitimleriyle gen&ccedil; yetenekler yetiştirmeye ve onları sanat ile buluşturmaya devam ediyor. Akademide verilen okul &ouml;ncesi eğitim programı ile &ccedil;ocuklar, atacakları her yaşamsal adımı, oluşan estetik duygusuyla birlikte g&uuml;venle atıyor.</p>

<p>ARSU G&uuml;zel Sanatlar Akademisi sanat eğitimleri bebeğiniz altı aylıkken başlıyor. Arsu G&uuml;zel Sanatlar Akademisi&rsquo;nde sanat eğitiminin başlangı&ccedil; noktası, bilimselliği otoriteler tarafından onaylanmış, d&uuml;nyanın en k&ouml;kl&uuml; ve en saygın okul &ouml;ncesi eğitim sistemi olan Uluslararası Kindermusik International eğitim programı. Bu program &ccedil;ocukların zihinsel gelişimine katkı sağlarken, miniklerin başarılı okul hayatı i&ccedil;in de temeller oluşturuluyor. Kindermusik International eğitim programını tamamlayan minik &ouml;ğrenciler Yetenek Geliştirme ve M&uuml;zikalite Sınıfları&rsquo; nda sanat eğitimlerinin ikinci aşamasına başlıyor. 3.5-5 yaş arası yedi &ouml;ğrencinin bulunduğu M&uuml;zikalite Sınıflarda eğitim, eğlenerek &ouml;ğrenebilecekleri dersler ile devam ediyor. Her iki programda hafta i&ccedil;i ve hafta sonu uygulanabiliyor. 3&rsquo;er aylık periyotlar şeklinde devam eden programlar haftada 1 g&uuml;n/45 dakikalık ders şeklinde hazırlanmış. Eğitim programlarının fiyatı aylık 250 TL&rsquo;den başlıyor. Uluslar arası m&uuml;zik eğitim programları ile devam eden &uuml;&ccedil;&uuml;nc&uuml; aşamada &ouml;ğrenciler daha teknik dersler ile tanışıp, West London Colloge Of Music, ABRSM (Associated Board of Royal Schools of Music) ve Boston Longy School Of Music programları ile sanat eğitimlerine devam ediyorlar. ARSU G&uuml;zel Sanatlar Akademisi&rsquo;nde satan eğitimini başarı ile tamamlayan &ouml;ğrenciler, t&uuml;m d&uuml;nyada ge&ccedil;erli olan lise d&uuml;zeyindeki diplomasına sahip oluyor ve yurtdışındaki konservatuarlarda eğitim alma şansını yakalıyor.</p>
', 1, 9, NULL, CAST(N'2017-06-15T01:29:56.290' AS DateTime), 1)
INSERT [dbo].[Haberler] ([Id], [Ad], [Resim], [Slug], [Detay], [Aktif], [KategoriId], [GaleriId], [Tarih], [Hit]) VALUES (103, N'AVRUPA KOLEJİ SOSYAL SORUMLULUKLARDA BİR ADIM ÖNDE', N'AVRUPAasdasd-4704N.jpg', N'avrupa-koleji-sosyal-sorumluluklarda-bir-adim-onde', N'<p><strong>&Ouml;ğrenci odaklı bir eğitim anlayışını benimseyen ve sosyal ortam farkındalığı y&uuml;ksek bireyler yetiştirmeyi hedeflediklerini belirten Avrupa Koleji Kazlı&ccedil;eşme Kamp&uuml;s&uuml; Lise M&uuml;d&uuml;r&uuml; Miray Şeng&uuml;l, &ouml;ğrencilerini sosyal sorumluluk projelerinde de desteklediklerini s&ouml;yl&uuml;yor.</strong></p>

<p>Her yıl iki kez &ouml;ğrenci-&ouml;ğretmen-veli işbirliği ile geliri &ccedil;eşitli yardım kuruluşlarına bağışlanmak &uuml;zere d&uuml;zenlenen kurum b&uuml;nyesinde ger&ccedil;ekleştirilen kermeslerde Avrupa Koleji &ouml;ğrencilerinin aktif g&ouml;rev aldıklarını ve &ouml;ğrencilerin organizasyonun her s&uuml;recini kendilerinin y&ouml;nlendirdiklerini ifade eden Avrupa Koleji Kazlı&ccedil;eşme Kamp&uuml;s&uuml; Lise M&uuml;d&uuml;r&uuml; Miray Şeng&uuml;l, &ldquo;Avrupa Koleji Okulları&rsquo;nda artık bir gelenek gibi s&uuml;rd&uuml;r&uuml;len bu yardımlaşma anlayışı her &ouml;ğrenci ve &ouml;ğretmenin ortak d&uuml;ş&uuml;nme tarzı olmuştur. Bu şekilde empati kurabilen bireylerin yetiştirildiği kurum olma hedefini de ger&ccedil;ekleştirmek m&uuml;mk&uuml;n olabiliyor.&rdquo; diye konuşuyor.<br />
ENGELSİZ MATEMATİK G&Ouml;RME ENGELLİLERE IŞIK OLDU<br />
Bu yaklaşımın &uuml;r&uuml;nleri olarak nitelenebilecek iki &ouml;rneği anlatan Şeng&uuml;l, ilk &ouml;rneği &ldquo;Matematiğe dokunmak hi&ccedil; bu kadar anlamlı olmamıştı&rdquo; diye insanı d&uuml;ş&uuml;nd&uuml;ren bir ser&uuml;ven olarak nitelendiriyor.<br />
Avrupa Koleji Kazlı&ccedil;eşme Kamp&uuml;s&uuml; 6. sınıf &ouml;ğrencileri Bernis Dila Erg&uuml;l ve Ecehan Kekum&rsquo;un, matematik &ouml;ğretmenleri G&uuml;lşah Ekinci&rsquo;ye farklı bir şeyler &uuml;retmek ve insanların hayatlarını değiştirmek istediklerini s&ouml;ylemeleriyle Engelsiz matematik projesinin ortaya &ccedil;ıktığını ifade eden Şeng&uuml;l, sonraki s&uuml;reci şu s&ouml;zlerle anlatıyor: &ldquo;Bu &ccedil;ok iddalı bir hedefti. Onları y&ouml;nlendirme konusunda profesyonel olan &ouml;ğretmenlerinden biri &ldquo;eğer g&ouml;rme engelli olsaydınız matematik derslerini nasıl algılardınız hi&ccedil; d&uuml;ş&uuml;nd&uuml;n&uuml;z m&uuml;?&rdquo; sorusunu y&ouml;neltir &ouml;ğrencilerine. İşte bu soru ilk kıvılcımdır. Buradan yola &ccedil;ıkan &ouml;ğrenciler ve &ouml;ğretmenleri g&ouml;rme engellilerin matematik &ouml;ğrenmelerini kolaylaştırabilecek bir materyal yapmaya karar verirler. Başlangı&ccedil;ta bir proje yarışması hazırlığı olarak başlar &ccedil;alışmaları. Tasarladıkları materyal uzun &ccedil;alışmalardan sonra oluşur. Artık bu materyalin denenmesi gerekmektedir. &Ouml;ğrencilerimiz ve &ouml;ğretmenleri g&ouml;rme engellilerin eğitim aldığı bir okulu ziyaret ederler. Aldıkları tepkiler beklediklerinden daha olumludur. Bazı ekleme ve d&uuml;zeltmeler yapmaları konusundaki tavsiyelerle okula d&ouml;nerler. B&uuml;y&uuml;k bir heyecanla materyallerini yeniden d&uuml;zenlemeye başlarlar. Bu oluşuma okul ve aileler de destek vermektedir. Hedefledikleri yarışmaya katılıp ikincilik &ouml;d&uuml;llerini alırlar ancak artık ama&ccedil;ları derece değildir aslında. Onlar okullarının da desteğiyle g&ouml;rme engelli &ouml;ğrencilere yardım edebilecekleri bir sosyal sorumluluk projesinin merkezindedirler artık. K&uuml;&ccedil;&uuml;c&uuml;k y&uuml;rekleriyle ortaya koydukları bu b&uuml;y&uuml;k &ccedil;aba meyvelerini vermektedir. Projeleri g&ouml;rsel basının ilgisini &ccedil;ekmiş ve ana haber b&uuml;ltenlerinde &ouml;ğrenciler ve &ouml;ğretmenleri bu s&uuml;reci t&uuml;m &uuml;lkeye anlatabilme fırsatını da yakalamışlardır. Bug&uuml;nlerde materyallerini geliştirme &ccedil;alışmalarını s&uuml;rd&uuml;r&uuml;yorlar. Bu geliştirme &ccedil;alışmalarını da G&ouml;rme Engelliler Federasyonu ile yaptıkları g&ouml;r&uuml;şmeler doğrultusunda kurumun da desteği ile s&uuml;rd&uuml;r&uuml;yorlar.&rdquo;</p>
', 1, 10, NULL, CAST(N'2017-06-15T01:29:56.633' AS DateTime), 1)
INSERT [dbo].[Haberler] ([Id], [Ad], [Resim], [Slug], [Detay], [Aktif], [KategoriId], [GaleriId], [Tarih], [Hit]) VALUES (104, N'KORUMA TEMİZLİK ÜRÜN YELPAZESİNİ VE KAPASİTESİNİ ARTIRARAK HIZLA BüYüYOR..', N'koruma-temizlik-kuc-sık-1335D.jpg', N'koruma-temizlik-urun-yelpazesini-ve-kapasitesini-artirarak-hizla-buyuyor', N'<p>1963 yılında Hypo markası ile &ccedil;amaşır suyunu şişeleyerek ilk piyasaya s&uuml;ren firma olarak adından s&ouml;z ettiren Koruma Temizlik</p>

<p>54 yıldan bu yana b&uuml;y&uuml;yen &uuml;retim kapasitesi ile artan talebe daima en kısa s&uuml;re i&ccedil;inde cevap veren bir &uuml;retici olmanın yanı sıra, t&uuml;keticiler ve talepte bulunanlara y&ouml;nelik bir &ccedil;&ouml;z&uuml;m ortağı olmaya devam eden KORUMA TEMİZLİK<br />
Kocaeli, Hatay ve Denizli tesislerinde ileri teknoloji donanımlara sahip , bir &uuml;retici olmanın yanı sıra g&uuml;nden g&uuml;ne değişen t&uuml;ketici ihtiya&ccedil;larına y&ouml;nelik belirlediği dinamik bir strateji ile sadece &uuml;retim yapmak yerine pazarın ihtiya&ccedil;larına cevap vermektedir. Ar-Ge yatırımları ve bu vizyonu sayesinde de sekt&ouml;rde &ouml;nc&uuml; yenilikler ile her d&ouml;nemde iz bırakmıştır. Temizlik anlayışının değişmesi ile yeni nesil, pratik, &ccedil;&ouml;z&uuml;m odaklı ve daha kısa s&uuml;re i&ccedil;inde temizlik yapmayı kolaylaştıran &uuml;r&uuml;nleri raflarda yer almaktadır.<br />
T&uuml;rkiye&rsquo;de ilk ambalajlanıp market raflarına giren &ccedil;amaşır suyu markası HYPO&rsquo;dur. 1994 yılında Koruma Şirketler Grubu, Vefa İbrahim Arıcı tarafından satın alındı. Tesisler modern hale getirildi. Kocaeli&rsquo;ndeki 140 bin metrekarede kurulu, kendi limanı olan, kendi elektriğini kendi &uuml;reten bir şirket olan KORUMA TEMİZLİK&nbsp; 1200&rsquo;&uuml;n &uuml;zerinde kişiye istihdam sağlamış bulunmaktadır. T&uuml;rkiye&rsquo;nin &ouml;nemli firmalarına hammadde temini konusundada lider firmalardandır.</p>

<p><span style="color:#ff0000"><strong>AR-GE &Ccedil;ALIŞMALARI..</strong></span><br />
Kazandığını işine yatıran bir iş politikası izleyen KORUMA TEMİZLİK&nbsp; Yatırım &uuml;st&uuml;ne yatırım yapıyor. Kendi Ar-Ge merkezi Sanayi Bakanlığı tarafından onaylı olup ve 40&rsquo;dan fazla personel &ccedil;alışmaktadır. Markası 54 yıldır T&uuml;rkiye&rsquo;nin en sevilen ve en beğenilen markalarından biridir. Koruma Şirketler Grubu olarak İSO 500 listesinde yer almaktadır.</p>

<p><span style="color:#ff0000"><strong>2017 YILI HEDEFLERİ..</strong></span><br />
Bu yılda b&uuml;t&ccedil;ede y&uuml;zde 20 b&uuml;y&uuml;me hedefliyen firma.Eyl&uuml;l 2016 yılında tamamlanan yeni &uuml;r&uuml;nlerin pazar hareketliliği, bize 2017 yılında ciro artışı olarak yansımasını ama&ccedil;lamaktadır.</p>

<p><span style="color:#ff0000"><strong>İHRACAT HACMİ..</strong></span><br />
Cirosunun y&uuml;zde 20&rsquo;sini ihracattan karşılıyan KORUMA TEMİZLİK . 30&rsquo;a yakın &uuml;lkeye ihracat yapıyor. AB &uuml;lkeleri &ccedil;oğunlukta. Kanada&rsquo;ya da ihracat ger&ccedil;ekleştiriyor. Avrupa&rsquo;da PL yaptığı b&uuml;y&uuml;k marketlerde var. Avustralya&rsquo;da Aldi mağazalarına PL yapıyor.<br />
Şirket stratejisi olarak belirli standartlarda ve kalitede &uuml;r&uuml;n yapması. KORUMA TEMİZLİK olarak Avrupa pazarına girmesini sağlıyor.</p>

<p>&nbsp;</p>
', 1, 4, NULL, CAST(N'2017-07-28T14:37:43.930' AS DateTime), 1)
INSERT [dbo].[Haberler] ([Id], [Ad], [Resim], [Slug], [Detay], [Aktif], [KategoriId], [GaleriId], [Tarih], [Hit]) VALUES (105, N'ICS GRUP SEKTÖRDE ÖNCÜ OLMIYA DEVAM EDİYOR', N'ICS-KUC-SIK-2535H.jpg', N'ics-grup-sektorde-oncu-olmiya-devam-ediyor', N'<p>Hizmet sekt&ouml;r&uuml;nde yerini aldığı 2010 yılından itibaren ve y&uuml;kselen bir ivmeyle &uuml;lke &ccedil;apında b&uuml;y&uuml;meye devam eden&nbsp;<strong>ICS GRUP&nbsp;</strong>m&uuml;şterilerine daima&nbsp;<strong>&quot;kendilerini &ouml;zel hissettirecek farklılıklar yaşatmak&quot;&nbsp;</strong>ilkesiyle faaliyet g&ouml;stermektedir.</p>

<p><span style="color:#ff0000"><strong>HİZMETİN ADI..&hellip;</strong></span><br />
T&uuml;rkiye&rsquo;nin gelişen ve daha da liberalleşen ekonomisinin getirdiği daha fazla rekabet ortamı, tamamen yeni bir iş yaklaşımı yaratmıştır. Değişen şartlar, ticari kuruluşları daha verimli, daha az maliyetli ve daha az riskli yeni &ccedil;alışma metotları aramaya y&ouml;neltmiştir.&nbsp;<strong>ICS GRUP</strong>, yeni ve daha modern &ccedil;alışma metotları ve teknoloji kullanarak, yeni talepleri karşılamak amacıyla, geniş bir hizmet yelpazesi geliştirmiştir.&nbsp;<strong>ICS GRUP</strong>, şirketlerin iş verimliliğini artırmaya yardımcı olan tesis hizmetleri y&ouml;netimi firmasıdır.&nbsp;<br />
<br />
<strong>ICS GRUP&rsquo; un</strong>&nbsp;esas hedefi T&uuml;rkiye&rsquo;deki hizmet sekt&ouml;r&uuml;ne tamamen yeni bir vizyon ve yaklaşım getirmektedir.&nbsp;<strong>ICS GRUP</strong>, en iyi &ccedil;alışma metotlarını kullanarak, işin niteliğine g&ouml;re personel se&ccedil;imi ve d&uuml;zenli eğitimleri ile yapılan işleri, kullanılan malzemeyi, ekipman kalitesini s&uuml;rekli kontrol ederek ve m&uuml;şterileri ile iyi diyalog sağlayarak m&uuml;şteri memnuniyetini en &uuml;st seviyeye &ccedil;ıkarmayı hedeflemektedir.&nbsp;<br />
<br />
<strong>ICS GRUP</strong>, t&uuml;m m&uuml;şterilerinin zaman ve enerjilerini asıl faaliyet konularına ayırmalarına yardımcı olarak maliyetlerini azaltma ve kontrol altında tutma imkanı vermektedir. Bu y&uuml;zden<strong>&nbsp;ICS GRUP&nbsp;</strong>sizin i&ccedil;in en doğru ve uzun soluklu &quot;<strong>iş ortağıdır</strong>&quot;.<br />
<br />
<strong>ICS GRUP&nbsp;</strong>hızlı gelişen bir hizmet organizasyonu olup. Bug&uuml;n, her sekt&ouml;r&uuml; temsil eden uluslararası ve yerli, ticari ve sanayi işletmelerinden oluşan geniş bir m&uuml;şteri portf&ouml;y&uuml;ne sahiptir.&nbsp;İşyeri kavramı genişledik&ccedil;e bizim hizmet alanımızda genişlemektedir.&nbsp;<strong>ICS GRUP&nbsp;</strong>y&uuml;ksek hizmet ilkelerine sadık kalarak, her ge&ccedil;en g&uuml;n artan m&uuml;şteri beklentilerini ve ihtiya&ccedil;larını karşılama garantisi vermektedir.<br />
<br />
Amacımızı, iyi bildiğimiz ve uzmanlaştığımız konular da d&uuml;nyada kabul edilmiş en y&uuml;ksek standartları yakalamaktır.</p>

<p><span style="color:#ff0000"><strong>HİZMETLERİ..</strong></span><br />
<strong>ICS GRUP&nbsp;</strong>entegre tesis hizmetleri y&ouml;netimi, temizlik ve bakım hizmetleri, g&uuml;venlik hizmetleri, teknik hizmetler, peyzaj hizmetleri ile m&uuml;şterilerine kaliteli hizmeti, en avantajlı ve uygun fiyat şartlarında sunuyor&hellip;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>
', 1, 4, NULL, CAST(N'2017-07-28T15:03:09.290' AS DateTime), 1)
INSERT [dbo].[Haberler] ([Id], [Ad], [Resim], [Slug], [Detay], [Aktif], [KategoriId], [GaleriId], [Tarih], [Hit]) VALUES (106, N'test', NULL, N'test', N'<p>test</p>
', 1, 12, NULL, CAST(N'2017-09-09T12:38:22.727' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[Haberler] OFF
SET IDENTITY_INSERT [dbo].[ilceler] ON 

INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (1, 1, N'ALADAĞ')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (2, 1, N'CEYHAN')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (3, 1, N'ÇUKUROVA')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (4, 1, N'FEKE')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (5, 1, N'İMAMOĞLU')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (6, 1, N'KARAİSALI')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (7, 1, N'KARATAŞ')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (8, 1, N'KOZAN')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (9, 1, N'POZANTI')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (10, 1, N'SAİMBEYLİ')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (11, 1, N'SARIÇAM')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (12, 1, N'SEYHAN')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (13, 1, N'TUFANBEYLİ')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (14, 1, N'YUMURTALIK')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (15, 1, N'YÜREĞİR')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (16, 2, N'BESNİ')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (17, 2, N'ÇELİKHAN')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (18, 2, N'GERGER')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (19, 2, N'GÖLBAŞI')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (20, 2, N'KAHTA')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (21, 2, N'MERKEZ')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (22, 2, N'SAMSAT')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (23, 2, N'SİNCİK')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (24, 2, N'TUT')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (25, 3, N'BAŞMAKÇI')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (26, 3, N'BAYAT')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (27, 3, N'BOLVADİN')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (28, 3, N'ÇAY')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (29, 3, N'ÇOBANLAR')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (30, 3, N'DAZKIRI')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (31, 3, N'DİNAR')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (32, 3, N'EMİRDAĞ')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (33, 3, N'EVCİLER')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (34, 3, N'HOCALAR')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (35, 3, N'İHSANİYE')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (36, 3, N'İSCEHİSAR')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (37, 3, N'KIZILÖREN')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (38, 3, N'MERKEZ')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (39, 3, N'SANDIKLI')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (40, 3, N'SİNANPAŞA')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (41, 3, N'ŞUHUT')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (42, 3, N'SULTANDAĞI')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (43, 4, N'DİYADİN')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (44, 4, N'DOĞUBAYAZIT')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (45, 4, N'ELEŞKİRT')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (46, 4, N'HAMUR')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (47, 4, N'MERKEZ')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (48, 4, N'PATNOS')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (49, 4, N'TAŞLIÇAY')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (50, 4, N'TUTAK')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (51, 5, N'AĞAÇÖREN')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (52, 5, N'ESKİL')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (53, 5, N'GÜLAĞAÇ')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (54, 5, N'GÜZELYURT')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (55, 5, N'MERKEZ')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (56, 5, N'ORTAKÖY')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (57, 5, N'SARIYAHŞİ')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (58, 6, N'GÖYNÜCEK')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (59, 6, N'GÜMÜŞHACIKÖY')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (60, 6, N'HAMAMÖZÜ')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (61, 6, N'MERKEZ')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (62, 6, N'MERZİFON')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (63, 6, N'SULUOVA')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (64, 6, N'TAŞOVA')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (65, 7, N'AKYURT')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (66, 7, N'ALTINDAĞ')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (67, 7, N'AYAŞ')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (68, 7, N'BALA')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (69, 7, N'BEYPAZARI')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (70, 7, N'ÇAMLIDERE')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (71, 7, N'ÇANKAYA')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (72, 7, N'ÇUBUK')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (73, 7, N'ELMADAĞ')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (74, 7, N'ETİMESGUT')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (75, 7, N'EVREN')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (76, 7, N'GÖLBAŞI')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (77, 7, N'GÜDÜL')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (78, 7, N'HAYMANA')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (79, 7, N'KAHRAMANKAZAN')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (80, 7, N'KALECİK')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (81, 7, N'KEÇİÖREN')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (82, 7, N'KIZILCAHAMAM')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (83, 7, N'MAMAK')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (84, 7, N'NALLIHAN')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (85, 7, N'POLATLI')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (86, 7, N'PURSAKLAR')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (87, 7, N'ŞEREFLİKOÇHİSAR')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (88, 7, N'SİNCAN')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (89, 7, N'YENİMAHALLE')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (90, 8, N'AKSEKİ')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (91, 8, N'AKSU')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (92, 8, N'ALANYA')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (93, 8, N'DEMRE')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (94, 8, N'DÖŞEMEALTI')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (95, 8, N'ELMALI')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (96, 8, N'FİNİKE')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (97, 8, N'GAZİPAŞA')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (98, 8, N'GÜNDOĞMUŞ')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (99, 8, N'İBRADI')
GO
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (100, 8, N'KAŞ')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (101, 8, N'KEMER')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (102, 8, N'KEPEZ')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (103, 8, N'KONYAALTI')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (104, 8, N'KORKUTELİ')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (105, 8, N'KUMLUCA')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (106, 8, N'MANAVGAT')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (107, 8, N'MURATPAŞA')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (108, 8, N'SERİK')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (109, 9, N'ÇILDIR')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (110, 9, N'DAMAL')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (111, 9, N'GÖLE')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (112, 9, N'HANAK')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (113, 9, N'MERKEZ')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (114, 9, N'POSOF')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (115, 10, N'ARDANUÇ')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (116, 10, N'ARHAVİ')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (117, 10, N'BORÇKA')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (118, 10, N'HOPA')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (119, 10, N'MERKEZ')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (120, 10, N'MURGUL')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (121, 10, N'ŞAVŞAT')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (122, 10, N'YUSUFELİ')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (123, 11, N'BOZDOĞAN')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (124, 11, N'BUHARKENT')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (125, 11, N'ÇİNE')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (126, 11, N'DİDİM')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (127, 11, N'EFELER')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (128, 11, N'GERMENCİK')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (129, 11, N'İNCİRLİOVA')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (130, 11, N'KARACASU')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (131, 11, N'KARPUZLU')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (132, 11, N'KOÇARLI')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (133, 11, N'KÖŞK')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (134, 11, N'KUŞADASI')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (135, 11, N'KUYUCAK')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (136, 11, N'NAZİLLİ')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (137, 11, N'SÖKE')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (138, 11, N'SULTANHİSAR')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (139, 11, N'YENİPAZAR')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (140, 12, N'ALTIEYLÜL')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (141, 12, N'AYVALIK')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (142, 12, N'BALYA')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (143, 12, N'BANDIRMA')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (144, 12, N'BİGADİÇ')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (145, 12, N'BURHANİYE')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (146, 12, N'DURSUNBEY')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (147, 12, N'EDREMİT')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (148, 12, N'ERDEK')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (149, 12, N'GÖMEÇ')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (150, 12, N'GÖNEN')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (151, 12, N'HAVRAN')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (152, 12, N'İVRİNDİ')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (153, 12, N'KARESİ')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (154, 12, N'KEPSUT')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (155, 12, N'MANYAS')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (156, 12, N'MARMARA')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (157, 12, N'SAVAŞTEPE')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (158, 12, N'SINDIRGI')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (159, 12, N'SUSURLUK')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (160, 13, N'AMASRA')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (161, 13, N'KURUCAŞİLE')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (162, 13, N'MERKEZ')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (163, 13, N'ULUS')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (164, 14, N'BEŞİRİ')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (165, 14, N'GERCÜŞ')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (166, 14, N'HASANKEYF')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (167, 14, N'KOZLUK')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (168, 14, N'MERKEZ')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (169, 14, N'SASON')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (170, 15, N'AYDINTEPE')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (171, 15, N'DEMİRÖZÜ')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (172, 15, N'MERKEZ')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (173, 16, N'BOZÜYÜK')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (174, 16, N'GÖLPAZARI')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (175, 16, N'İNHİSAR')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (176, 16, N'MERKEZ')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (177, 16, N'OSMANELİ')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (178, 16, N'PAZARYERİ')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (179, 16, N'SÖĞÜT')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (180, 16, N'YENİPAZAR')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (181, 17, N'ADAKLI')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (182, 17, N'GENÇ')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (183, 17, N'KARLIOVA')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (184, 17, N'KİĞI')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (185, 17, N'MERKEZ')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (186, 17, N'SOLHAN')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (187, 17, N'YAYLADERE')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (188, 17, N'YEDİSU')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (189, 18, N'ADİLCEVAZ')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (190, 18, N'AHLAT')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (191, 18, N'GÜROYMAK')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (192, 18, N'HİZAN')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (193, 18, N'MERKEZ')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (194, 18, N'MUTKİ')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (195, 18, N'TATVAN')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (196, 19, N'DÖRTDİVAN')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (197, 19, N'GEREDE')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (198, 19, N'GÖYNÜK')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (199, 19, N'KIBRISCIK')
GO
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (200, 19, N'MENGEN')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (201, 19, N'MERKEZ')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (202, 19, N'MUDURNU')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (203, 19, N'SEBEN')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (204, 19, N'YENİÇAĞA')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (205, 20, N'AĞLASUN')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (206, 20, N'ALTINYAYLA')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (207, 20, N'BUCAK')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (208, 20, N'ÇAVDIR')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (209, 20, N'ÇELTİKÇİ')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (210, 20, N'GÖLHİSAR')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (211, 20, N'KARAMANLI')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (212, 20, N'KEMER')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (213, 20, N'MERKEZ')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (214, 20, N'TEFENNİ')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (215, 20, N'YEŞİLOVA')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (216, 21, N'BÜYÜKORHAN')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (217, 21, N'GEMLİK')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (218, 21, N'GÜRSU')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (219, 21, N'HARMANCIK')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (220, 21, N'İNEGÖL')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (221, 21, N'İZNİK')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (222, 21, N'KARACABEY')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (223, 21, N'KELES')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (224, 21, N'KESTEL')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (225, 21, N'MUDANYA')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (226, 21, N'MUSTAFAKEMALPAŞA')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (227, 21, N'NİLÜFER')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (228, 21, N'ORHANELİ')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (229, 21, N'ORHANGAZİ')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (230, 21, N'OSMANGAZİ')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (231, 21, N'YENİŞEHİR')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (232, 21, N'YILDIRIM')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (233, 22, N'AYVACIK')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (234, 22, N'BAYRAMİÇ')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (235, 22, N'BİGA')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (236, 22, N'BOZCAADA')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (237, 22, N'ÇAN')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (238, 22, N'ECEABAT')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (239, 22, N'EZİNE')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (240, 22, N'GELİBOLU')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (241, 22, N'GÖKÇEADA')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (242, 22, N'LAPSEKİ')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (243, 22, N'MERKEZ')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (244, 22, N'YENİCE')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (245, 23, N'ATKARACALAR')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (246, 23, N'BAYRAMÖREN')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (247, 23, N'ÇERKEŞ')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (248, 23, N'ELDİVAN')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (249, 23, N'ILGAZ')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (250, 23, N'KIZILIRMAK')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (251, 23, N'KORGUN')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (252, 23, N'KURŞUNLU')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (253, 23, N'MERKEZ')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (254, 23, N'ORTA')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (255, 23, N'ŞABANÖZÜ')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (256, 23, N'YAPRAKLI')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (257, 24, N'ALACA')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (258, 24, N'BAYAT')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (259, 24, N'BOĞAZKALE')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (260, 24, N'DODURGA')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (261, 24, N'İSKİLİP')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (262, 24, N'KARGI')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (263, 24, N'LAÇİN')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (264, 24, N'MECİTÖZÜ')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (265, 24, N'MERKEZ')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (266, 24, N'OĞUZLAR')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (267, 24, N'ORTAKÖY')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (268, 24, N'OSMANCIK')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (269, 24, N'SUNGURLU')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (270, 24, N'UĞURLUDAĞ')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (271, 25, N'ACIPAYAM')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (272, 25, N'BABADAĞ')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (273, 25, N'BAKLAN')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (274, 25, N'BEKİLLİ')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (275, 25, N'BEYAĞAÇ')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (276, 25, N'BOZKURT')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (277, 25, N'BULDAN')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (278, 25, N'ÇAL')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (279, 25, N'ÇAMELİ')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (280, 25, N'ÇARDAK')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (281, 25, N'ÇİVRİL')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (282, 25, N'GÜNEY')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (283, 25, N'HONAZ')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (284, 25, N'KALE')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (285, 25, N'MERKEZEFENDİ')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (286, 25, N'PAMUKKALE')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (287, 25, N'SARAYKÖY')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (288, 25, N'SERİNHİSAR')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (289, 25, N'TAVAS')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (290, 26, N'BAĞLAR')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (291, 26, N'BİSMİL')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (292, 26, N'ÇERMİK')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (293, 26, N'ÇINAR')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (294, 26, N'ÇÜNGÜŞ')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (295, 26, N'DİCLE')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (296, 26, N'EĞİL')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (297, 26, N'ERGANİ')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (298, 26, N'HANİ')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (299, 26, N'HAZRO')
GO
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (300, 26, N'KAYAPINAR')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (301, 26, N'KOCAKÖY')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (302, 26, N'KULP')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (303, 26, N'LİCE')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (304, 26, N'SİLVAN')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (305, 26, N'SUR')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (306, 26, N'YENİŞEHİR')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (307, 27, N'AKÇAKOCA')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (308, 27, N'ÇİLİMLİ')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (309, 27, N'CUMAYERİ')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (310, 27, N'GÖLYAKA')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (311, 27, N'GÜMÜŞOVA')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (312, 27, N'KAYNAŞLI')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (313, 27, N'MERKEZ')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (314, 27, N'YIĞILCA')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (315, 28, N'ENEZ')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (316, 28, N'HAVSA')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (317, 28, N'İPSALA')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (318, 28, N'KEŞAN')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (319, 28, N'LALAPAŞA')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (320, 28, N'MERİÇ')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (321, 28, N'MERKEZ')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (322, 28, N'SÜLOĞLU')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (323, 28, N'UZUNKÖPRÜ')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (324, 29, N'AĞIN')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (325, 29, N'ALACAKAYA')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (326, 29, N'ARICAK')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (327, 29, N'BASKİL')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (328, 29, N'KARAKOÇAN')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (329, 29, N'KEBAN')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (330, 29, N'KOVANCILAR')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (331, 29, N'MADEN')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (332, 29, N'MERKEZ')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (333, 29, N'PALU')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (334, 29, N'SİVRİCE')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (335, 30, N'ÇAYIRLI')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (336, 30, N'İLİÇ')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (337, 30, N'KEMAH')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (338, 30, N'KEMALİYE')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (339, 30, N'MERKEZ')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (340, 30, N'OTLUKBELİ')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (341, 30, N'REFAHİYE')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (342, 30, N'TERCAN')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (343, 30, N'ÜZÜMLÜ')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (344, 31, N'AŞKALE')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (345, 31, N'AZİZİYE')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (346, 31, N'ÇAT')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (347, 31, N'HINIS')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (348, 31, N'HORASAN')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (349, 31, N'İSPİR')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (350, 31, N'KARAÇOBAN')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (351, 31, N'KARAYAZI')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (352, 31, N'KÖPRÜKÖY')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (353, 31, N'NARMAN')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (354, 31, N'OLTU')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (355, 31, N'OLUR')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (356, 31, N'PALANDÖKEN')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (357, 31, N'PASİNLER')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (358, 31, N'PAZARYOLU')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (359, 31, N'ŞENKAYA')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (360, 31, N'TEKMAN')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (361, 31, N'TORTUM')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (362, 31, N'UZUNDERE')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (363, 31, N'YAKUTİYE')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (364, 32, N'ALPU')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (365, 32, N'BEYLİKOVA')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (366, 32, N'ÇİFTELER')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (367, 32, N'GÜNYÜZÜ')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (368, 32, N'HAN')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (369, 32, N'İNÖNÜ')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (370, 32, N'MAHMUDİYE')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (371, 32, N'MİHALGAZİ')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (372, 32, N'MİHALIÇÇIK')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (373, 32, N'ODUNPAZARI')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (374, 32, N'SARICAKAYA')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (375, 32, N'SEYİTGAZİ')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (376, 32, N'SİVRİHİSAR')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (377, 32, N'TEPEBAŞI')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (378, 33, N'ARABAN')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (379, 33, N'İSLAHİYE')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (380, 33, N'KARKAMIŞ')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (381, 33, N'NİZİP')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (382, 33, N'NURDAĞI')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (383, 33, N'OĞUZELİ')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (384, 33, N'ŞAHİNBEY')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (385, 33, N'ŞEHİTKAMİL')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (386, 33, N'YAVUZELİ')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (387, 34, N'ALUCRA')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (388, 34, N'BULANCAK')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (389, 34, N'ÇAMOLUK')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (390, 34, N'ÇANAKÇI')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (391, 34, N'DERELİ')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (392, 34, N'DOĞANKENT')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (393, 34, N'ESPİYE')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (394, 34, N'EYNESİL')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (395, 34, N'GÖRELE')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (396, 34, N'GÜCE')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (397, 34, N'KEŞAP')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (398, 34, N'MERKEZ')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (399, 34, N'PİRAZİZ')
GO
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (400, 34, N'ŞEBİNKARAHİSAR')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (401, 34, N'TİREBOLU')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (402, 34, N'YAĞLIDERE')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (403, 35, N'KELKİT')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (404, 35, N'KÖSE')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (405, 35, N'KÜRTÜN')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (406, 35, N'MERKEZ')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (407, 35, N'ŞİRAN')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (408, 35, N'TORUL')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (409, 36, N'ÇUKURCA')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (410, 36, N'MERKEZ')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (411, 36, N'ŞEMDİNLİ')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (412, 36, N'YÜKSEKOVA')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (413, 37, N'ALTINÖZÜ')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (414, 37, N'ANTAKYA')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (415, 37, N'ARSUZ')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (416, 37, N'BELEN')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (417, 37, N'DEFNE')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (418, 37, N'DÖRTYOL')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (419, 37, N'ERZİN')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (420, 37, N'HASSA')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (421, 37, N'İSKENDERUN')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (422, 37, N'KIRIKHAN')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (423, 37, N'KUMLU')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (424, 37, N'PAYAS')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (425, 37, N'REYHANLI')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (426, 37, N'SAMANDAĞ')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (427, 37, N'YAYLADAĞI')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (428, 38, N'ARALIK')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (429, 38, N'KARAKOYUNLU')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (430, 38, N'MERKEZ')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (431, 38, N'TUZLUCA')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (432, 39, N'AKSU')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (433, 39, N'ATABEY')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (434, 39, N'EĞİRDİR')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (435, 39, N'GELENDOST')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (436, 39, N'GÖNEN')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (437, 39, N'KEÇİBORLU')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (438, 39, N'MERKEZ')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (439, 39, N'ŞARKİKARAAĞAÇ')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (440, 39, N'SENİRKENT')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (441, 39, N'SÜTÇÜLER')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (442, 39, N'ULUBORLU')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (443, 39, N'YALVAÇ')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (444, 39, N'YENİŞARBADEMLİ')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (445, 40, N'ADALAR')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (446, 82, N'ARNAVUTKÖY')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (447, 40, N'ATAŞEHİR')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (448, 82, N'AVCILAR')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (449, 82, N'BAĞCILAR')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (450, 82, N'BAHÇELİEVLER')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (451, 82, N'BAKIRKÖY')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (452, 82, N'BAŞAKŞEHİR')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (453, 82, N'BAYRAMPAŞA')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (454, 82, N'BEŞİKTAŞ')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (455, 40, N'BEYKOZ')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (456, 82, N'BEYLİKDÜZÜ')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (457, 82, N'BEYOĞLU')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (458, 82, N'BÜYÜKÇEKMECE')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (459, 82, N'ÇATALCA')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (460, 40, N'ÇEKMEKÖY')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (461, 82, N'ESENLER')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (462, 82, N'ESENYURT')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (463, 82, N'EYÜP')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (464, 82, N'FATİH')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (465, 82, N'GAZİOSMANPAŞA')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (466, 82, N'GÜNGÖREN')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (467, 40, N'KADIKÖY')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (468, 82, N'KAĞITHANE')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (469, 40, N'KARTAL')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (470, 82, N'KÜÇÜKÇEKMECE')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (471, 40, N'MALTEPE')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (472, 40, N'PENDİK')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (473, 40, N'SANCAKTEPE')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (474, 82, N'SARIYER')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (475, 40, N'ŞİLE')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (476, 82, N'SİLİVRİ')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (477, 82, N'ŞİŞLİ')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (478, 40, N'SULTANBEYLİ')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (479, 82, N'SULTANGAZİ')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (480, 40, N'TUZLA')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (481, 40, N'ÜMRANİYE')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (482, 40, N'ÜSKÜDAR')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (483, 82, N'ZEYTİNBURNU')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (484, 41, N'ALİAĞA')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (485, 41, N'BALÇOVA')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (486, 41, N'BAYINDIR')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (487, 41, N'BAYRAKLI')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (488, 41, N'BERGAMA')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (489, 41, N'BEYDAĞ')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (490, 41, N'BORNOVA')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (491, 41, N'BUCA')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (492, 41, N'ÇEŞME')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (493, 41, N'ÇİĞLİ')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (494, 41, N'DİKİLİ')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (495, 41, N'FOÇA')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (496, 41, N'GAZİEMİR')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (497, 41, N'GÜZELBAHÇE')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (498, 41, N'KARABAĞLAR')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (499, 41, N'KARABURUN')
GO
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (500, 41, N'KARŞIYAKA')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (501, 41, N'KEMALPAŞA')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (502, 41, N'KINIK')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (503, 41, N'KİRAZ')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (504, 41, N'KONAK')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (505, 41, N'MENDERES')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (506, 41, N'MENEMEN')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (507, 41, N'NARLIDERE')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (508, 41, N'ÖDEMİŞ')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (509, 41, N'SEFERİHİSAR')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (510, 41, N'SELÇUK')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (511, 41, N'TİRE')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (512, 41, N'TORBALI')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (513, 41, N'URLA')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (514, 42, N'AFŞİN')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (515, 42, N'ANDIRIN')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (516, 42, N'ÇAĞLAYANCERİT')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (517, 42, N'DULKADİROĞLU')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (518, 42, N'EKİNÖZÜ')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (519, 42, N'ELBİSTAN')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (520, 42, N'GÖKSUN')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (521, 42, N'NURHAK')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (522, 42, N'ONİKİŞUBAT')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (523, 42, N'PAZARCIK')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (524, 42, N'TÜRKOĞLU')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (525, 43, N'EFLANİ')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (526, 43, N'ESKİPAZAR')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (527, 43, N'MERKEZ')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (528, 43, N'OVACIK')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (529, 43, N'SAFRANBOLU')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (530, 43, N'YENİCE')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (531, 44, N'AYRANCI')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (532, 44, N'BAŞYAYLA')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (533, 44, N'ERMENEK')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (534, 44, N'KAZIMKARABEKİR')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (535, 44, N'MERKEZ')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (536, 44, N'SARIVELİLER')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (537, 45, N'AKYAKA')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (538, 45, N'ARPAÇAY')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (539, 45, N'DİGOR')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (540, 45, N'KAĞIZMAN')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (541, 45, N'MERKEZ')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (542, 45, N'SARIKAMIŞ')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (543, 45, N'SELİM')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (544, 45, N'SUSUZ')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (545, 46, N'ABANA')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (546, 46, N'AĞLI')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (547, 46, N'ARAÇ')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (548, 46, N'AZDAVAY')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (549, 46, N'BOZKURT')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (550, 46, N'ÇATALZEYTİN')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (551, 46, N'CİDE')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (552, 46, N'DADAY')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (553, 46, N'DEVREKANİ')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (554, 46, N'DOĞANYURT')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (555, 46, N'HANÖNÜ')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (556, 46, N'İHSANGAZİ')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (557, 46, N'İNEBOLU')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (558, 46, N'KÜRE')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (559, 46, N'MERKEZ')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (560, 46, N'PINARBAŞI')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (561, 46, N'ŞENPAZAR')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (562, 46, N'SEYDİLER')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (563, 46, N'TAŞKÖPRÜ')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (564, 46, N'TOSYA')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (565, 47, N'AKKIŞLA')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (566, 47, N'BÜNYAN')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (567, 47, N'DEVELİ')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (568, 47, N'FELAHİYE')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (569, 47, N'HACILAR')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (570, 47, N'İNCESU')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (571, 47, N'KOCASİNAN')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (572, 47, N'MELİKGAZİ')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (573, 47, N'ÖZVATAN')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (574, 47, N'PINARBAŞI')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (575, 47, N'SARIOĞLAN')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (576, 47, N'SARIZ')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (577, 47, N'TALAS')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (578, 47, N'TOMARZA')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (579, 47, N'YAHYALI')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (580, 47, N'YEŞİLHİSAR')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (581, 51, N'ELBEYLİ')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (582, 51, N'MERKEZ')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (583, 51, N'MUSABEYLİ')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (584, 51, N'POLATELİ')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (585, 48, N'BAHŞİLİ')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (586, 48, N'BALIŞEYH')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (587, 48, N'ÇELEBİ')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (588, 48, N'DELİCE')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (589, 48, N'KARAKEÇİLİ')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (590, 48, N'KESKİN')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (591, 48, N'MERKEZ')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (592, 48, N'SULAKYURT')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (593, 48, N'YAHŞİHAN')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (594, 49, N'BABAESKİ')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (595, 49, N'DEMİRKÖY')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (596, 49, N'KOFÇAZ')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (597, 49, N'LÜLEBURGAZ')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (598, 49, N'MERKEZ')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (599, 49, N'PEHLİVANKÖY')
GO
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (600, 49, N'PINARHİSAR')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (601, 49, N'VİZE')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (602, 50, N'AKÇAKENT')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (603, 50, N'AKPINAR')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (604, 50, N'BOZTEPE')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (605, 50, N'ÇİÇEKDAĞI')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (606, 50, N'KAMAN')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (607, 50, N'MERKEZ')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (608, 50, N'MUCUR')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (609, 52, N'BAŞİSKELE')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (610, 52, N'ÇAYIROVA')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (611, 52, N'DARICA')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (612, 52, N'DERİNCE')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (613, 52, N'DİLOVASI')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (614, 52, N'GEBZE')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (615, 52, N'GÖLCÜK')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (616, 52, N'İZMİT')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (617, 52, N'KANDIRA')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (618, 52, N'KARAMÜRSEL')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (619, 52, N'KARTEPE')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (620, 52, N'KÖRFEZ')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (621, 53, N'AHIRLI')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (622, 53, N'AKÖREN')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (623, 53, N'AKŞEHİR')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (624, 53, N'ALTINEKİN')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (625, 53, N'BEYŞEHİR')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (626, 53, N'BOZKIR')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (627, 53, N'ÇELTİK')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (628, 53, N'CİHANBEYLİ')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (629, 53, N'ÇUMRA')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (630, 53, N'DERBENT')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (631, 53, N'DEREBUCAK')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (632, 53, N'DOĞANHİSAR')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (633, 53, N'EMİRGAZİ')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (634, 53, N'EREĞLİ')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (635, 53, N'GÜNEYSINIR')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (636, 53, N'HADİM')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (637, 53, N'HALKAPINAR')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (638, 53, N'HÜYÜK')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (639, 53, N'ILGIN')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (640, 53, N'KADINHANI')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (641, 53, N'KARAPINAR')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (642, 53, N'KARATAY')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (643, 53, N'KULU')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (644, 53, N'MERAM')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (645, 53, N'SARAYÖNÜ')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (646, 53, N'SELÇUKLU')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (647, 53, N'SEYDİŞEHİR')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (648, 53, N'TAŞKENT')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (649, 53, N'TUZLUKÇU')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (650, 53, N'YALIHÜYÜK')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (651, 53, N'YUNAK')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (652, 54, N'ALTINTAŞ')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (653, 54, N'ASLANAPA')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (654, 54, N'ÇAVDARHİSAR')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (655, 54, N'DOMANİÇ')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (656, 54, N'DUMLUPINAR')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (657, 54, N'EMET')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (658, 54, N'GEDİZ')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (659, 54, N'HİSARCIK')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (660, 54, N'MERKEZ')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (661, 54, N'PAZARLAR')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (662, 54, N'ŞAPHANE')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (663, 54, N'SİMAV')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (664, 54, N'TAVŞANLI')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (665, 55, N'AKÇADAĞ')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (666, 55, N'ARAPGİR')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (667, 55, N'ARGUVAN')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (668, 55, N'BATTALGAZİ')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (669, 55, N'DARENDE')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (670, 55, N'DOĞANŞEHİR')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (671, 55, N'DOĞANYOL')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (672, 55, N'HEKİMHAN')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (673, 55, N'KALE')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (674, 55, N'KULUNCAK')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (675, 55, N'PÜTÜRGE')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (676, 55, N'YAZIHAN')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (677, 55, N'YEŞİLYURT')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (678, 56, N'AHMETLİ')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (679, 56, N'AKHİSAR')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (680, 56, N'ALAŞEHİR')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (681, 56, N'DEMİRCİ')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (682, 56, N'GÖLMARMARA')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (683, 56, N'GÖRDES')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (684, 56, N'KIRKAĞAÇ')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (685, 56, N'KÖPRÜBAŞI')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (686, 56, N'KULA')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (687, 56, N'SALİHLİ')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (688, 56, N'SARIGÖL')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (689, 56, N'SARUHANLI')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (690, 56, N'ŞEHZADELER')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (691, 56, N'SELENDİ')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (692, 56, N'SOMA')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (693, 56, N'TURGUTLU')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (694, 56, N'YUNUSEMRE')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (695, 57, N'ARTUKLU')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (696, 57, N'DARGEÇİT')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (697, 57, N'DERİK')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (698, 57, N'KIZILTEPE')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (699, 57, N'MAZIDAĞI')
GO
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (700, 57, N'MİDYAT')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (701, 57, N'NUSAYBİN')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (702, 57, N'ÖMERLİ')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (703, 57, N'SAVUR')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (704, 57, N'YEŞİLLİ')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (705, 58, N'AKDENİZ')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (706, 58, N'ANAMUR')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (707, 58, N'AYDINCIK')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (708, 58, N'BOZYAZI')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (709, 58, N'ÇAMLIYAYLA')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (710, 58, N'ERDEMLİ')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (711, 58, N'GÜLNAR')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (712, 58, N'MEZİTLİ')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (713, 58, N'MUT')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (714, 58, N'SİLİFKE')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (715, 58, N'TARSUS')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (716, 58, N'TOROSLAR')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (717, 58, N'YENİŞEHİR')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (718, 59, N'BODRUM')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (719, 59, N'DALAMAN')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (720, 59, N'DATÇA')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (721, 59, N'FETHİYE')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (722, 59, N'KAVAKLIDERE')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (723, 59, N'KÖYCEĞİZ')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (724, 59, N'MARMARİS')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (725, 59, N'MENTEŞE')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (726, 59, N'MİLAS')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (727, 59, N'ORTACA')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (728, 59, N'SEYDİKEMER')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (729, 59, N'ULA')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (730, 59, N'YATAĞAN')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (731, 60, N'BULANIK')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (732, 60, N'HASKÖY')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (733, 60, N'KORKUT')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (734, 60, N'MALAZGİRT')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (735, 60, N'MERKEZ')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (736, 60, N'VARTO')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (737, 61, N'ACIGÖL')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (738, 61, N'AVANOS')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (739, 61, N'DERİNKUYU')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (740, 61, N'GÜLŞEHİR')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (741, 61, N'HACIBEKTAŞ')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (742, 61, N'KOZAKLI')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (743, 61, N'MERKEZ')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (744, 61, N'ÜRGÜP')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (745, 62, N'ALTUNHİSAR')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (746, 62, N'BOR')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (747, 62, N'ÇAMARDI')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (748, 62, N'ÇİFTLİK')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (749, 62, N'MERKEZ')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (750, 62, N'ULUKIŞLA')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (751, 63, N'AKKUŞ')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (752, 63, N'ALTINORDU')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (753, 63, N'AYBASTI')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (754, 63, N'ÇAMAŞ')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (755, 63, N'ÇATALPINAR')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (756, 63, N'ÇAYBAŞI')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (757, 63, N'FATSA')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (758, 63, N'GÖLKÖY')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (759, 63, N'GÜLYALI')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (760, 63, N'GÜRGENTEPE')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (761, 63, N'İKİZCE')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (762, 63, N'KABADÜZ')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (763, 63, N'KABATAŞ')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (764, 63, N'KORGAN')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (765, 63, N'KUMRU')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (766, 63, N'MESUDİYE')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (767, 63, N'PERŞEMBE')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (768, 63, N'ULUBEY')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (769, 63, N'ÜNYE')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (770, 64, N'BAHÇE')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (771, 64, N'DÜZİÇİ')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (772, 64, N'HASANBEYLİ')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (773, 64, N'KADİRLİ')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (774, 64, N'MERKEZ')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (775, 64, N'SUMBAS')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (776, 64, N'TOPRAKKALE')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (777, 65, N'ARDEŞEN')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (778, 65, N'ÇAMLIHEMŞİN')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (779, 65, N'ÇAYELİ')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (780, 65, N'DEREPAZARI')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (781, 65, N'FINDIKLI')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (782, 65, N'GÜNEYSU')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (783, 65, N'HEMŞİN')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (784, 65, N'İKİZDERE')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (785, 65, N'İYİDERE')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (786, 65, N'KALKANDERE')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (787, 65, N'MERKEZ')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (788, 65, N'PAZAR')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (789, 66, N'ADAPAZARI')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (790, 66, N'AKYAZI')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (791, 66, N'ARİFİYE')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (792, 66, N'ERENLER')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (793, 66, N'FERİZLİ')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (794, 66, N'GEYVE')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (795, 66, N'HENDEK')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (796, 66, N'KARAPÜRÇEK')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (797, 66, N'KARASU')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (798, 66, N'KAYNARCA')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (799, 66, N'KOCAALİ')
GO
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (800, 66, N'PAMUKOVA')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (801, 66, N'SAPANCA')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (802, 66, N'SERDİVAN')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (803, 66, N'SÖĞÜTLÜ')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (804, 66, N'TARAKLI')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (805, 67, N'19 MAYIS')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (806, 67, N'ALAÇAM')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (807, 67, N'ASARCIK')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (808, 67, N'ATAKUM')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (809, 67, N'AYVACIK')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (810, 67, N'BAFRA')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (811, 67, N'CANİK')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (812, 67, N'ÇARŞAMBA')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (813, 67, N'HAVZA')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (814, 67, N'İLKADIM')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (815, 67, N'KAVAK')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (816, 67, N'LADİK')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (817, 67, N'SALIPAZARI')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (818, 67, N'TEKKEKÖY')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (819, 67, N'TERME')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (820, 67, N'VEZİRKÖPRÜ')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (821, 67, N'YAKAKENT')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (822, 71, N'AKÇAKALE')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (823, 71, N'BİRECİK')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (824, 71, N'BOZOVA')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (825, 71, N'CEYLANPINAR')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (826, 71, N'EYYÜBİYE')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (827, 71, N'HALFETİ')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (828, 71, N'HALİLİYE')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (829, 71, N'HARRAN')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (830, 71, N'HİLVAN')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (831, 71, N'KARAKÖPRÜ')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (832, 71, N'SİVEREK')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (833, 71, N'SURUÇ')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (834, 71, N'VİRANŞEHİR')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (835, 68, N'BAYKAN')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (836, 68, N'ERUH')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (837, 68, N'KURTALAN')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (838, 68, N'MERKEZ')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (839, 68, N'PERVARİ')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (840, 68, N'ŞİRVAN')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (841, 68, N'TİLLO')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (842, 69, N'AYANCIK')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (843, 69, N'BOYABAT')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (844, 69, N'DİKMEN')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (845, 69, N'DURAĞAN')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (846, 69, N'ERFELEK')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (847, 69, N'GERZE')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (848, 69, N'MERKEZ')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (849, 69, N'SARAYDÜZÜ')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (850, 69, N'TÜRKELİ')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (851, 72, N'BEYTÜŞŞEBAP')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (852, 72, N'CİZRE')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (853, 72, N'GÜÇLÜKONAK')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (854, 72, N'İDİL')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (855, 72, N'MERKEZ')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (856, 72, N'SİLOPİ')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (857, 72, N'ULUDERE')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (858, 70, N'AKINCILAR')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (859, 70, N'ALTINYAYLA')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (860, 70, N'DİVRİĞİ')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (861, 70, N'DOĞANŞAR')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (862, 70, N'GEMEREK')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (863, 70, N'GÖLOVA')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (864, 70, N'GÜRÜN')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (865, 70, N'HAFİK')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (866, 70, N'İMRANLI')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (867, 70, N'KANGAL')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (868, 70, N'KOYULHİSAR')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (869, 70, N'MERKEZ')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (870, 70, N'ŞARKIŞLA')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (871, 70, N'SUŞEHRİ')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (872, 70, N'ULAŞ')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (873, 70, N'YILDIZELİ')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (874, 70, N'ZARA')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (875, 73, N'ÇERKEZKÖY')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (876, 73, N'ÇORLU')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (877, 73, N'ERGENE')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (878, 73, N'HAYRABOLU')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (879, 73, N'KAPAKLI')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (880, 73, N'MALKARA')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (881, 73, N'MARMARAEREĞLİSİ')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (882, 73, N'MURATLI')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (883, 73, N'SARAY')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (884, 73, N'ŞARKÖY')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (885, 73, N'SÜLEYMANPAŞA')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (886, 74, N'ALMUS')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (887, 74, N'ARTOVA')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (888, 74, N'BAŞÇİFTLİK')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (889, 74, N'ERBAA')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (890, 74, N'MERKEZ')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (891, 74, N'NİKSAR')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (892, 74, N'PAZAR')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (893, 74, N'REŞADİYE')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (894, 74, N'SULUSARAY')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (895, 74, N'TURHAL')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (896, 74, N'YEŞİLYURT')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (897, 74, N'ZİLE')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (898, 75, N'AKÇAABAT')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (899, 75, N'ARAKLI')
GO
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (900, 75, N'ARSİN')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (901, 75, N'BEŞİKDÜZÜ')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (902, 75, N'ÇARŞIBAŞI')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (903, 75, N'ÇAYKARA')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (904, 75, N'DERNEKPAZARI')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (905, 75, N'DÜZKÖY')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (906, 75, N'HAYRAT')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (907, 75, N'KÖPRÜBAŞI')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (908, 75, N'MAÇKA')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (909, 75, N'OF')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (910, 75, N'ORTAHİSAR')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (911, 75, N'ŞALPAZARI')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (912, 75, N'SÜRMENE')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (913, 75, N'TONYA')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (914, 75, N'VAKFIKEBİR')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (915, 75, N'YOMRA')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (916, 76, N'ÇEMİŞGEZEK')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (917, 76, N'HOZAT')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (918, 76, N'MAZGİRT')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (919, 76, N'MERKEZ')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (920, 76, N'NAZIMİYE')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (921, 76, N'OVACIK')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (922, 76, N'PERTEK')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (923, 76, N'PÜLÜMÜR')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (924, 77, N'BANAZ')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (925, 77, N'EŞME')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (926, 77, N'KARAHALLI')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (927, 77, N'MERKEZ')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (928, 77, N'SİVASLI')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (929, 77, N'ULUBEY')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (930, 78, N'BAHÇESARAY')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (931, 78, N'BAŞKALE')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (932, 78, N'ÇALDIRAN')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (933, 78, N'ÇATAK')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (934, 78, N'EDREMİT')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (935, 78, N'ERCİŞ')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (936, 78, N'GEVAŞ')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (937, 78, N'GÜRPINAR')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (938, 78, N'İPEKYOLU')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (939, 78, N'MURADİYE')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (940, 78, N'ÖZALP')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (941, 78, N'SARAY')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (942, 78, N'TUŞBA')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (943, 79, N'ALTINOVA')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (944, 79, N'ARMUTLU')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (945, 79, N'ÇİFTLİKKÖY')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (946, 79, N'ÇINARCIK')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (947, 79, N'MERKEZ')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (948, 79, N'TERMAL')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (949, 80, N'AKDAĞMADENİ')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (950, 80, N'AYDINCIK')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (951, 80, N'BOĞAZLIYAN')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (952, 80, N'ÇANDIR')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (953, 80, N'ÇAYIRALAN')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (954, 80, N'ÇEKEREK')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (955, 80, N'KADIŞEHRİ')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (956, 80, N'MERKEZ')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (957, 80, N'SARAYKENT')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (958, 80, N'SARIKAYA')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (959, 80, N'ŞEFAATLİ')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (960, 80, N'SORGUN')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (961, 80, N'YENİFAKILI')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (962, 80, N'YERKÖY')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (963, 81, N'ALAPLI')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (964, 81, N'ÇAYCUMA')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (965, 81, N'DEVREK')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (966, 81, N'EREĞLİ')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (967, 81, N'GÖKÇEBEY')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (968, 81, N'KİLİMLİ')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (969, 81, N'KOZLU')
INSERT [dbo].[ilceler] ([ilceId], [ilId], [ilceAdi]) VALUES (970, 81, N'MERKEZ')
SET IDENTITY_INSERT [dbo].[ilceler] OFF
SET IDENTITY_INSERT [dbo].[iletisim] ON 

INSERT [dbo].[iletisim] ([Id], [Telefon], [Faks], [Mail], [Harita], [Adres], [Mailler], [DestekMailler], [SmtpPort], [SmtpMail], [SmtpAdres], [Sifre]) VALUES (1, N'444 0 730', N'+90 (212) 000 00 00', N'test@test.net', N'test', N'<h4>test adres</h4>
', N'test@test.net', N'test@test.net', 1, N'test@test.net', N'mail.test.com.tr', N'1')
SET IDENTITY_INSERT [dbo].[iletisim] OFF
SET IDENTITY_INSERT [dbo].[iller] ON 

INSERT [dbo].[iller] ([ilId], [UlkeId], [ilAdi], [PlakaNo], [TelKodu]) VALUES (1, 212, N'ADANA', N'1', N'322')
INSERT [dbo].[iller] ([ilId], [UlkeId], [ilAdi], [PlakaNo], [TelKodu]) VALUES (2, 212, N'ADIYAMAN', N'2', N'416')
INSERT [dbo].[iller] ([ilId], [UlkeId], [ilAdi], [PlakaNo], [TelKodu]) VALUES (3, 212, N'AFYONKARAHİSAR', N'3', N'272')
INSERT [dbo].[iller] ([ilId], [UlkeId], [ilAdi], [PlakaNo], [TelKodu]) VALUES (4, 212, N'AĞRI', N'4', N'472')
INSERT [dbo].[iller] ([ilId], [UlkeId], [ilAdi], [PlakaNo], [TelKodu]) VALUES (5, 212, N'AKSARAY', N'68', N'382')
INSERT [dbo].[iller] ([ilId], [UlkeId], [ilAdi], [PlakaNo], [TelKodu]) VALUES (6, 212, N'AMASYA', N'5', N'358')
INSERT [dbo].[iller] ([ilId], [UlkeId], [ilAdi], [PlakaNo], [TelKodu]) VALUES (7, 212, N'ANKARA', N'6', N'312')
INSERT [dbo].[iller] ([ilId], [UlkeId], [ilAdi], [PlakaNo], [TelKodu]) VALUES (8, 212, N'ANTALYA', N'7', N'242')
INSERT [dbo].[iller] ([ilId], [UlkeId], [ilAdi], [PlakaNo], [TelKodu]) VALUES (9, 212, N'ARDAHAN', N'75', N'478')
INSERT [dbo].[iller] ([ilId], [UlkeId], [ilAdi], [PlakaNo], [TelKodu]) VALUES (10, 212, N'ARTVİN', N'8', N'466')
INSERT [dbo].[iller] ([ilId], [UlkeId], [ilAdi], [PlakaNo], [TelKodu]) VALUES (11, 212, N'AYDIN', N'9', N'256')
INSERT [dbo].[iller] ([ilId], [UlkeId], [ilAdi], [PlakaNo], [TelKodu]) VALUES (12, 212, N'BALIKESİR', N'10', N'266')
INSERT [dbo].[iller] ([ilId], [UlkeId], [ilAdi], [PlakaNo], [TelKodu]) VALUES (13, 212, N'BARTIN', N'74', N'378')
INSERT [dbo].[iller] ([ilId], [UlkeId], [ilAdi], [PlakaNo], [TelKodu]) VALUES (14, 212, N'BATMAN', N'72', N'488')
INSERT [dbo].[iller] ([ilId], [UlkeId], [ilAdi], [PlakaNo], [TelKodu]) VALUES (15, 212, N'BAYBURT', N'69', N'458')
INSERT [dbo].[iller] ([ilId], [UlkeId], [ilAdi], [PlakaNo], [TelKodu]) VALUES (16, 212, N'BİLECİK', N'11', N'228')
INSERT [dbo].[iller] ([ilId], [UlkeId], [ilAdi], [PlakaNo], [TelKodu]) VALUES (17, 212, N'BİNGÖL', N'12', N'426')
INSERT [dbo].[iller] ([ilId], [UlkeId], [ilAdi], [PlakaNo], [TelKodu]) VALUES (18, 212, N'BİTLİS', N'13', N'434')
INSERT [dbo].[iller] ([ilId], [UlkeId], [ilAdi], [PlakaNo], [TelKodu]) VALUES (19, 212, N'BOLU', N'14', N'374')
INSERT [dbo].[iller] ([ilId], [UlkeId], [ilAdi], [PlakaNo], [TelKodu]) VALUES (20, 212, N'BURDUR', N'15', N'248')
INSERT [dbo].[iller] ([ilId], [UlkeId], [ilAdi], [PlakaNo], [TelKodu]) VALUES (21, 212, N'BURSA', N'16', N'224')
INSERT [dbo].[iller] ([ilId], [UlkeId], [ilAdi], [PlakaNo], [TelKodu]) VALUES (22, 212, N'ÇANAKKALE', N'17', N'286')
INSERT [dbo].[iller] ([ilId], [UlkeId], [ilAdi], [PlakaNo], [TelKodu]) VALUES (23, 212, N'ÇANKIRI', N'18', N'376')
INSERT [dbo].[iller] ([ilId], [UlkeId], [ilAdi], [PlakaNo], [TelKodu]) VALUES (24, 212, N'ÇORUM', N'19', N'364')
INSERT [dbo].[iller] ([ilId], [UlkeId], [ilAdi], [PlakaNo], [TelKodu]) VALUES (25, 212, N'DENİZLİ', N'20', N'258')
INSERT [dbo].[iller] ([ilId], [UlkeId], [ilAdi], [PlakaNo], [TelKodu]) VALUES (26, 212, N'DİYARBAKIR', N'21', N'412')
INSERT [dbo].[iller] ([ilId], [UlkeId], [ilAdi], [PlakaNo], [TelKodu]) VALUES (27, 212, N'DÜZCE', N'81', N'380')
INSERT [dbo].[iller] ([ilId], [UlkeId], [ilAdi], [PlakaNo], [TelKodu]) VALUES (28, 212, N'EDİRNE', N'22', N'284')
INSERT [dbo].[iller] ([ilId], [UlkeId], [ilAdi], [PlakaNo], [TelKodu]) VALUES (29, 212, N'ELAZIĞ', N'23', N'424')
INSERT [dbo].[iller] ([ilId], [UlkeId], [ilAdi], [PlakaNo], [TelKodu]) VALUES (30, 212, N'ERZİNCAN', N'24', N'446')
INSERT [dbo].[iller] ([ilId], [UlkeId], [ilAdi], [PlakaNo], [TelKodu]) VALUES (31, 212, N'ERZURUM', N'25', N'442')
INSERT [dbo].[iller] ([ilId], [UlkeId], [ilAdi], [PlakaNo], [TelKodu]) VALUES (32, 212, N'ESKİŞEHİR', N'26', N'222')
INSERT [dbo].[iller] ([ilId], [UlkeId], [ilAdi], [PlakaNo], [TelKodu]) VALUES (33, 212, N'GAZİANTEP', N'27', N'342')
INSERT [dbo].[iller] ([ilId], [UlkeId], [ilAdi], [PlakaNo], [TelKodu]) VALUES (34, 212, N'GİRESUN', N'28', N'454')
INSERT [dbo].[iller] ([ilId], [UlkeId], [ilAdi], [PlakaNo], [TelKodu]) VALUES (35, 212, N'GÜMÜŞHANE', N'29', N'456')
INSERT [dbo].[iller] ([ilId], [UlkeId], [ilAdi], [PlakaNo], [TelKodu]) VALUES (36, 212, N'HAKKARİ', N'30', N'438')
INSERT [dbo].[iller] ([ilId], [UlkeId], [ilAdi], [PlakaNo], [TelKodu]) VALUES (37, 212, N'HATAY', N'31', N'326')
INSERT [dbo].[iller] ([ilId], [UlkeId], [ilAdi], [PlakaNo], [TelKodu]) VALUES (38, 212, N'IĞDIR', N'76', N'476')
INSERT [dbo].[iller] ([ilId], [UlkeId], [ilAdi], [PlakaNo], [TelKodu]) VALUES (39, 212, N'ISPARTA', N'32', N'246')
INSERT [dbo].[iller] ([ilId], [UlkeId], [ilAdi], [PlakaNo], [TelKodu]) VALUES (40, 212, N'İstanbul Anadolu', N'34', N'212-216')
INSERT [dbo].[iller] ([ilId], [UlkeId], [ilAdi], [PlakaNo], [TelKodu]) VALUES (41, 212, N'İZMİR', N'35', N'232')
INSERT [dbo].[iller] ([ilId], [UlkeId], [ilAdi], [PlakaNo], [TelKodu]) VALUES (42, 212, N'KAHRAMANMARAŞ', N'46', N'344')
INSERT [dbo].[iller] ([ilId], [UlkeId], [ilAdi], [PlakaNo], [TelKodu]) VALUES (43, 212, N'KARABÜK', N'78', N'370')
INSERT [dbo].[iller] ([ilId], [UlkeId], [ilAdi], [PlakaNo], [TelKodu]) VALUES (44, 212, N'KARAMAN', N'70', N'338')
INSERT [dbo].[iller] ([ilId], [UlkeId], [ilAdi], [PlakaNo], [TelKodu]) VALUES (45, 212, N'KARS', N'36', N'474')
INSERT [dbo].[iller] ([ilId], [UlkeId], [ilAdi], [PlakaNo], [TelKodu]) VALUES (46, 212, N'KASTAMONU', N'37', N'366')
INSERT [dbo].[iller] ([ilId], [UlkeId], [ilAdi], [PlakaNo], [TelKodu]) VALUES (47, 212, N'KAYSERİ', N'38', N'352')
INSERT [dbo].[iller] ([ilId], [UlkeId], [ilAdi], [PlakaNo], [TelKodu]) VALUES (48, 212, N'KIRIKKALE', N'71', N'318')
INSERT [dbo].[iller] ([ilId], [UlkeId], [ilAdi], [PlakaNo], [TelKodu]) VALUES (49, 212, N'KIRKLARELİ', N'39', N'288')
INSERT [dbo].[iller] ([ilId], [UlkeId], [ilAdi], [PlakaNo], [TelKodu]) VALUES (50, 212, N'KIRŞEHİR', N'40', N'386')
INSERT [dbo].[iller] ([ilId], [UlkeId], [ilAdi], [PlakaNo], [TelKodu]) VALUES (51, 212, N'KİLİS', N'79', N'348')
INSERT [dbo].[iller] ([ilId], [UlkeId], [ilAdi], [PlakaNo], [TelKodu]) VALUES (52, 212, N'KOCAELİ', N'41', N'262')
INSERT [dbo].[iller] ([ilId], [UlkeId], [ilAdi], [PlakaNo], [TelKodu]) VALUES (53, 212, N'KONYA', N'42', N'332')
INSERT [dbo].[iller] ([ilId], [UlkeId], [ilAdi], [PlakaNo], [TelKodu]) VALUES (54, 212, N'KÜTAHYA', N'43', N'274')
INSERT [dbo].[iller] ([ilId], [UlkeId], [ilAdi], [PlakaNo], [TelKodu]) VALUES (55, 212, N'MALATYA', N'44', N'422')
INSERT [dbo].[iller] ([ilId], [UlkeId], [ilAdi], [PlakaNo], [TelKodu]) VALUES (56, 212, N'MANİSA', N'45', N'236')
INSERT [dbo].[iller] ([ilId], [UlkeId], [ilAdi], [PlakaNo], [TelKodu]) VALUES (57, 212, N'MARDİN', N'47', N'482')
INSERT [dbo].[iller] ([ilId], [UlkeId], [ilAdi], [PlakaNo], [TelKodu]) VALUES (58, 212, N'MERSİN', N'33', N'324')
INSERT [dbo].[iller] ([ilId], [UlkeId], [ilAdi], [PlakaNo], [TelKodu]) VALUES (59, 212, N'MUĞLA', N'48', N'252')
INSERT [dbo].[iller] ([ilId], [UlkeId], [ilAdi], [PlakaNo], [TelKodu]) VALUES (60, 212, N'MUŞ', N'49', N'436')
INSERT [dbo].[iller] ([ilId], [UlkeId], [ilAdi], [PlakaNo], [TelKodu]) VALUES (61, 212, N'NEVŞEHİR', N'50', N'384')
INSERT [dbo].[iller] ([ilId], [UlkeId], [ilAdi], [PlakaNo], [TelKodu]) VALUES (62, 212, N'NİĞDE', N'51', N'388')
INSERT [dbo].[iller] ([ilId], [UlkeId], [ilAdi], [PlakaNo], [TelKodu]) VALUES (63, 212, N'ORDU', N'52', N'452')
INSERT [dbo].[iller] ([ilId], [UlkeId], [ilAdi], [PlakaNo], [TelKodu]) VALUES (64, 212, N'OSMANİYE', N'80', N'328')
INSERT [dbo].[iller] ([ilId], [UlkeId], [ilAdi], [PlakaNo], [TelKodu]) VALUES (65, 212, N'RİZE', N'53', N'464')
INSERT [dbo].[iller] ([ilId], [UlkeId], [ilAdi], [PlakaNo], [TelKodu]) VALUES (66, 212, N'SAKARYA', N'54', N'264')
INSERT [dbo].[iller] ([ilId], [UlkeId], [ilAdi], [PlakaNo], [TelKodu]) VALUES (67, 212, N'SAMSUN', N'55', N'362')
INSERT [dbo].[iller] ([ilId], [UlkeId], [ilAdi], [PlakaNo], [TelKodu]) VALUES (68, 212, N'SİİRT', N'56', N'484')
INSERT [dbo].[iller] ([ilId], [UlkeId], [ilAdi], [PlakaNo], [TelKodu]) VALUES (69, 212, N'SİNOP', N'57', N'368')
INSERT [dbo].[iller] ([ilId], [UlkeId], [ilAdi], [PlakaNo], [TelKodu]) VALUES (70, 212, N'SİVAS', N'58', N'346')
INSERT [dbo].[iller] ([ilId], [UlkeId], [ilAdi], [PlakaNo], [TelKodu]) VALUES (71, 212, N'ŞANLIURFA', N'63', N'414')
INSERT [dbo].[iller] ([ilId], [UlkeId], [ilAdi], [PlakaNo], [TelKodu]) VALUES (72, 212, N'ŞIRNAK', N'73', N'486')
INSERT [dbo].[iller] ([ilId], [UlkeId], [ilAdi], [PlakaNo], [TelKodu]) VALUES (73, 212, N'TEKİRDAĞ', N'59', N'282')
INSERT [dbo].[iller] ([ilId], [UlkeId], [ilAdi], [PlakaNo], [TelKodu]) VALUES (74, 212, N'TOKAT', N'60', N'356')
INSERT [dbo].[iller] ([ilId], [UlkeId], [ilAdi], [PlakaNo], [TelKodu]) VALUES (75, 212, N'TRABZON', N'61', N'462')
INSERT [dbo].[iller] ([ilId], [UlkeId], [ilAdi], [PlakaNo], [TelKodu]) VALUES (76, 212, N'TUNCELİ', N'62', N'428')
INSERT [dbo].[iller] ([ilId], [UlkeId], [ilAdi], [PlakaNo], [TelKodu]) VALUES (77, 212, N'UŞAK', N'64', N'276')
INSERT [dbo].[iller] ([ilId], [UlkeId], [ilAdi], [PlakaNo], [TelKodu]) VALUES (78, 212, N'VAN', N'65', N'432')
INSERT [dbo].[iller] ([ilId], [UlkeId], [ilAdi], [PlakaNo], [TelKodu]) VALUES (79, 212, N'YALOVA', N'77', N'226')
INSERT [dbo].[iller] ([ilId], [UlkeId], [ilAdi], [PlakaNo], [TelKodu]) VALUES (80, 212, N'YOZGAT', N'66', N'354')
INSERT [dbo].[iller] ([ilId], [UlkeId], [ilAdi], [PlakaNo], [TelKodu]) VALUES (81, 212, N'ZONGULDAK', N'67', N'372')
INSERT [dbo].[iller] ([ilId], [UlkeId], [ilAdi], [PlakaNo], [TelKodu]) VALUES (82, 212, N'İstanbul Avrupa', N'34', N'212')
SET IDENTITY_INSERT [dbo].[iller] OFF
SET IDENTITY_INSERT [dbo].[Kategoriler] ON 

INSERT [dbo].[Kategoriler] ([KategoriId], [KategoriAdi], [Ikon], [Slug], [Url], [Aktif], [Area], [Depart], [Sira]) VALUES (3, N'ÇAMAŞIRHANELER ', N'C-19567-dropdownMenu_araGorsel.png', N'camasirhaneler', NULL, 0, 0, 1, 6)
INSERT [dbo].[Kategoriler] ([KategoriId], [KategoriAdi], [Ikon], [Slug], [Url], [Aktif], [Area], [Depart], [Sira]) VALUES (4, N'TEMİZLİK MAKİNALARI', N'K-47884-dropdownMenu_araGorsel.png', N'temizlik-makinalari', NULL, 1, 1, 1, 9)
INSERT [dbo].[Kategoriler] ([KategoriId], [KategoriAdi], [Ikon], [Slug], [Url], [Aktif], [Area], [Depart], [Sira]) VALUES (5, N'HALI YIKAMACILAR', N'A-11029-dropdownMenu_araGorsel.png', N'hali-yikamacilar', NULL, 1, 0, 0, 4)
INSERT [dbo].[Kategoriler] ([KategoriId], [KategoriAdi], [Ikon], [Slug], [Url], [Aktif], [Area], [Depart], [Sira]) VALUES (8, N'TEMİZLİK ÜRÜNLERİ ', NULL, N'temizlik-urunleri', NULL, 1, 1, 0, 8)
INSERT [dbo].[Kategoriler] ([KategoriId], [KategoriAdi], [Ikon], [Slug], [Url], [Aktif], [Area], [Depart], [Sira]) VALUES (11, N'KURU TEMİZLEME', N'R-70152-dropdownMenu_araGorsel.png', N'kuru-temizleme', NULL, 1, 0, 0, 5)
INSERT [dbo].[Kategoriler] ([KategoriId], [KategoriAdi], [Ikon], [Slug], [Url], [Aktif], [Area], [Depart], [Sira]) VALUES (25, N'TEMİZLİK FİRMALARI ', NULL, N'temizlik-firmalari', NULL, 1, 0, 1, 1)
INSERT [dbo].[Kategoriler] ([KategoriId], [KategoriAdi], [Ikon], [Slug], [Url], [Aktif], [Area], [Depart], [Sira]) VALUES (26, N'TEDARİKÇİLER', NULL, N'tedarikciler', NULL, 1, 0, 1, 10)
INSERT [dbo].[Kategoriler] ([KategoriId], [KategoriAdi], [Ikon], [Slug], [Url], [Aktif], [Area], [Depart], [Sira]) VALUES (27, N'YIKAMACILAR', NULL, N'temizlikciler', NULL, 1, 1, 1, 4)
SET IDENTITY_INSERT [dbo].[Kategoriler] OFF
SET IDENTITY_INSERT [dbo].[Kurumlar] ON 

INSERT [dbo].[Kurumlar] ([KurumId], [KategoriId], [AltKategoriId], [ilId], [ilceId], [KurumAdi], [Slug], [UploadYolu], [Resim], [KurumMuduru], [MudurYardimcilari], [Aktiviteler], [Aciklama], [KurulusTarih], [WebSitesi], [Tel], [Fax], [Harita], [Video], [Email], [Adres], [Durum], [Subeler], [Kurucusu], [Egitimciler], [Panoroma], [TicSicNo], [KaliteBelgeNo], [FiyatAraligi], [TeslimSuresi], [GarantiSuresi], [MakineCesitleri], [MakineOzellikleri], [DigerMakinalar], [BagliDernek], [YaptigiHizmetler], [Referanslar], [ServisBolgeleri], [Sponsorlar], [D3Boyutlu]) VALUES (52, NULL, NULL, NULL, NULL, N'FORSA KAĞIT', N'sponsor-1', N'sponsor-1', N'indir (2) (1)sk-495.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'', NULL, NULL, N'Sponsor1', NULL)
INSERT [dbo].[Kurumlar] ([KurumId], [KategoriId], [AltKategoriId], [ilId], [ilceId], [KurumAdi], [Slug], [UploadYolu], [Resim], [KurumMuduru], [MudurYardimcilari], [Aktiviteler], [Aciklama], [KurulusTarih], [WebSitesi], [Tel], [Fax], [Harita], [Video], [Email], [Adres], [Durum], [Subeler], [Kurucusu], [Egitimciler], [Panoroma], [TicSicNo], [KaliteBelgeNo], [FiyatAraligi], [TeslimSuresi], [GarantiSuresi], [MakineCesitleri], [MakineOzellikleri], [DigerMakinalar], [BagliDernek], [YaptigiHizmetler], [Referanslar], [ServisBolgeleri], [Sponsorlar], [D3Boyutlu]) VALUES (53, NULL, NULL, NULL, NULL, N'Sponsor 2', N'sponsor-2', N'sponsor-2', N'aydos-makina sık-927.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'', NULL, NULL, N'Sponsor2', NULL)
INSERT [dbo].[Kurumlar] ([KurumId], [KategoriId], [AltKategoriId], [ilId], [ilceId], [KurumAdi], [Slug], [UploadYolu], [Resim], [KurumMuduru], [MudurYardimcilari], [Aktiviteler], [Aciklama], [KurulusTarih], [WebSitesi], [Tel], [Fax], [Harita], [Video], [Email], [Adres], [Durum], [Subeler], [Kurucusu], [Egitimciler], [Panoroma], [TicSicNo], [KaliteBelgeNo], [FiyatAraligi], [TeslimSuresi], [GarantiSuresi], [MakineCesitleri], [MakineOzellikleri], [DigerMakinalar], [BagliDernek], [YaptigiHizmetler], [Referanslar], [ServisBolgeleri], [Sponsorlar], [D3Boyutlu]) VALUES (54, NULL, NULL, NULL, NULL, N'Sponsor 3', N'sponsor-3', N'sponsor-3', N'kocal-SK-53.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'', NULL, NULL, N'Sponsor3', NULL)
INSERT [dbo].[Kurumlar] ([KurumId], [KategoriId], [AltKategoriId], [ilId], [ilceId], [KurumAdi], [Slug], [UploadYolu], [Resim], [KurumMuduru], [MudurYardimcilari], [Aktiviteler], [Aciklama], [KurulusTarih], [WebSitesi], [Tel], [Fax], [Harita], [Video], [Email], [Adres], [Durum], [Subeler], [Kurucusu], [Egitimciler], [Panoroma], [TicSicNo], [KaliteBelgeNo], [FiyatAraligi], [TeslimSuresi], [GarantiSuresi], [MakineCesitleri], [MakineOzellikleri], [DigerMakinalar], [BagliDernek], [YaptigiHizmetler], [Referanslar], [ServisBolgeleri], [Sponsorlar], [D3Boyutlu]) VALUES (55, NULL, NULL, NULL, NULL, N'Sponsor 4', N'sponsor-4', N'sponsor-4', N'44489KC-SK-9180.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'', NULL, NULL, N'Sponsor4', NULL)
INSERT [dbo].[Kurumlar] ([KurumId], [KategoriId], [AltKategoriId], [ilId], [ilceId], [KurumAdi], [Slug], [UploadYolu], [Resim], [KurumMuduru], [MudurYardimcilari], [Aktiviteler], [Aciklama], [KurulusTarih], [WebSitesi], [Tel], [Fax], [Harita], [Video], [Email], [Adres], [Durum], [Subeler], [Kurucusu], [Egitimciler], [Panoroma], [TicSicNo], [KaliteBelgeNo], [FiyatAraligi], [TeslimSuresi], [GarantiSuresi], [MakineCesitleri], [MakineOzellikleri], [DigerMakinalar], [BagliDernek], [YaptigiHizmetler], [Referanslar], [ServisBolgeleri], [Sponsorlar], [D3Boyutlu]) VALUES (56, NULL, NULL, NULL, NULL, N'Sponsor 5', N'sponsor-5', N'sponsor-5', N'iss-sk-8017.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'', NULL, NULL, N'Sponsor5', NULL)
INSERT [dbo].[Kurumlar] ([KurumId], [KategoriId], [AltKategoriId], [ilId], [ilceId], [KurumAdi], [Slug], [UploadYolu], [Resim], [KurumMuduru], [MudurYardimcilari], [Aktiviteler], [Aciklama], [KurulusTarih], [WebSitesi], [Tel], [Fax], [Harita], [Video], [Email], [Adres], [Durum], [Subeler], [Kurucusu], [Egitimciler], [Panoroma], [TicSicNo], [KaliteBelgeNo], [FiyatAraligi], [TeslimSuresi], [GarantiSuresi], [MakineCesitleri], [MakineOzellikleri], [DigerMakinalar], [BagliDernek], [YaptigiHizmetler], [Referanslar], [ServisBolgeleri], [Sponsorlar], [D3Boyutlu]) VALUES (57, NULL, NULL, NULL, NULL, N'Sponsor 6', N'sponsor-6', N'sponsor-6', N'sk-8573.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'', NULL, NULL, N'Sponsor6', NULL)
INSERT [dbo].[Kurumlar] ([KurumId], [KategoriId], [AltKategoriId], [ilId], [ilceId], [KurumAdi], [Slug], [UploadYolu], [Resim], [KurumMuduru], [MudurYardimcilari], [Aktiviteler], [Aciklama], [KurulusTarih], [WebSitesi], [Tel], [Fax], [Harita], [Video], [Email], [Adres], [Durum], [Subeler], [Kurucusu], [Egitimciler], [Panoroma], [TicSicNo], [KaliteBelgeNo], [FiyatAraligi], [TeslimSuresi], [GarantiSuresi], [MakineCesitleri], [MakineOzellikleri], [DigerMakinalar], [BagliDernek], [YaptigiHizmetler], [Referanslar], [ServisBolgeleri], [Sponsorlar], [D3Boyutlu]) VALUES (64, NULL, NULL, NULL, NULL, N'Temizlik Şirketi', N'temizlik-sirketi', N'temizlik-sirketi', N'ornekResim-4996.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Ayın En İyi Temizlik Şirketi', NULL)
INSERT [dbo].[Kurumlar] ([KurumId], [KategoriId], [AltKategoriId], [ilId], [ilceId], [KurumAdi], [Slug], [UploadYolu], [Resim], [KurumMuduru], [MudurYardimcilari], [Aktiviteler], [Aciklama], [KurulusTarih], [WebSitesi], [Tel], [Fax], [Harita], [Video], [Email], [Adres], [Durum], [Subeler], [Kurucusu], [Egitimciler], [Panoroma], [TicSicNo], [KaliteBelgeNo], [FiyatAraligi], [TeslimSuresi], [GarantiSuresi], [MakineCesitleri], [MakineOzellikleri], [DigerMakinalar], [BagliDernek], [YaptigiHizmetler], [Referanslar], [ServisBolgeleri], [Sponsorlar], [D3Boyutlu]) VALUES (65, NULL, NULL, NULL, NULL, N'Tedarikçi', N'tedarikci', N'tedarikci', N'ornekResim2-2437.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Ayın En İyi Tedarikçisi', NULL)
INSERT [dbo].[Kurumlar] ([KurumId], [KategoriId], [AltKategoriId], [ilId], [ilceId], [KurumAdi], [Slug], [UploadYolu], [Resim], [KurumMuduru], [MudurYardimcilari], [Aktiviteler], [Aciklama], [KurulusTarih], [WebSitesi], [Tel], [Fax], [Harita], [Video], [Email], [Adres], [Durum], [Subeler], [Kurucusu], [Egitimciler], [Panoroma], [TicSicNo], [KaliteBelgeNo], [FiyatAraligi], [TeslimSuresi], [GarantiSuresi], [MakineCesitleri], [MakineOzellikleri], [DigerMakinalar], [BagliDernek], [YaptigiHizmetler], [Referanslar], [ServisBolgeleri], [Sponsorlar], [D3Boyutlu]) VALUES (66, NULL, NULL, NULL, NULL, N'Ürün', N'urun', N'urun', N'ornekResim3-2155.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Ayın En İyi Ürünü', NULL)
INSERT [dbo].[Kurumlar] ([KurumId], [KategoriId], [AltKategoriId], [ilId], [ilceId], [KurumAdi], [Slug], [UploadYolu], [Resim], [KurumMuduru], [MudurYardimcilari], [Aktiviteler], [Aciklama], [KurulusTarih], [WebSitesi], [Tel], [Fax], [Harita], [Video], [Email], [Adres], [Durum], [Subeler], [Kurucusu], [Egitimciler], [Panoroma], [TicSicNo], [KaliteBelgeNo], [FiyatAraligi], [TeslimSuresi], [GarantiSuresi], [MakineCesitleri], [MakineOzellikleri], [DigerMakinalar], [BagliDernek], [YaptigiHizmetler], [Referanslar], [ServisBolgeleri], [Sponsorlar], [D3Boyutlu]) VALUES (67, NULL, NULL, NULL, NULL, N'Şirket', N'sirket', N'sirket', N'ornekResim4-655.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'En İyi Temizlik Şirketleri', NULL)
INSERT [dbo].[Kurumlar] ([KurumId], [KategoriId], [AltKategoriId], [ilId], [ilceId], [KurumAdi], [Slug], [UploadYolu], [Resim], [KurumMuduru], [MudurYardimcilari], [Aktiviteler], [Aciklama], [KurulusTarih], [WebSitesi], [Tel], [Fax], [Harita], [Video], [Email], [Adres], [Durum], [Subeler], [Kurucusu], [Egitimciler], [Panoroma], [TicSicNo], [KaliteBelgeNo], [FiyatAraligi], [TeslimSuresi], [GarantiSuresi], [MakineCesitleri], [MakineOzellikleri], [DigerMakinalar], [BagliDernek], [YaptigiHizmetler], [Referanslar], [ServisBolgeleri], [Sponsorlar], [D3Boyutlu]) VALUES (68, NULL, NULL, NULL, NULL, N'Ürünler', N'urunler', N'urunler', N'ornekResim5-3786.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'En İyi Ürünler', NULL)
INSERT [dbo].[Kurumlar] ([KurumId], [KategoriId], [AltKategoriId], [ilId], [ilceId], [KurumAdi], [Slug], [UploadYolu], [Resim], [KurumMuduru], [MudurYardimcilari], [Aktiviteler], [Aciklama], [KurulusTarih], [WebSitesi], [Tel], [Fax], [Harita], [Video], [Email], [Adres], [Durum], [Subeler], [Kurucusu], [Egitimciler], [Panoroma], [TicSicNo], [KaliteBelgeNo], [FiyatAraligi], [TeslimSuresi], [GarantiSuresi], [MakineCesitleri], [MakineOzellikleri], [DigerMakinalar], [BagliDernek], [YaptigiHizmetler], [Referanslar], [ServisBolgeleri], [Sponsorlar], [D3Boyutlu]) VALUES (69, NULL, NULL, NULL, NULL, N'Tedarikçi', N'tedarikci', N'tedarikci', N'ornekResim5-7299.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'En İyi Tedarikçiler', NULL)
INSERT [dbo].[Kurumlar] ([KurumId], [KategoriId], [AltKategoriId], [ilId], [ilceId], [KurumAdi], [Slug], [UploadYolu], [Resim], [KurumMuduru], [MudurYardimcilari], [Aktiviteler], [Aciklama], [KurulusTarih], [WebSitesi], [Tel], [Fax], [Harita], [Video], [Email], [Adres], [Durum], [Subeler], [Kurucusu], [Egitimciler], [Panoroma], [TicSicNo], [KaliteBelgeNo], [FiyatAraligi], [TeslimSuresi], [GarantiSuresi], [MakineCesitleri], [MakineOzellikleri], [DigerMakinalar], [BagliDernek], [YaptigiHizmetler], [Referanslar], [ServisBolgeleri], [Sponsorlar], [D3Boyutlu]) VALUES (70, NULL, NULL, NULL, NULL, N'Ayın En İyi Üretici Firması', N'ureticisi-firmasi', N'ureticisi-firmasi', N'ornekResim3-7560.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Ayın En İyi Üretici Firması', NULL)
INSERT [dbo].[Kurumlar] ([KurumId], [KategoriId], [AltKategoriId], [ilId], [ilceId], [KurumAdi], [Slug], [UploadYolu], [Resim], [KurumMuduru], [MudurYardimcilari], [Aktiviteler], [Aciklama], [KurulusTarih], [WebSitesi], [Tel], [Fax], [Harita], [Video], [Email], [Adres], [Durum], [Subeler], [Kurucusu], [Egitimciler], [Panoroma], [TicSicNo], [KaliteBelgeNo], [FiyatAraligi], [TeslimSuresi], [GarantiSuresi], [MakineCesitleri], [MakineOzellikleri], [DigerMakinalar], [BagliDernek], [YaptigiHizmetler], [Referanslar], [ServisBolgeleri], [Sponsorlar], [D3Boyutlu]) VALUES (71, NULL, NULL, NULL, NULL, N'En İyi Kuru Temizlemecisi', N'kuru-temizlemeci', N'kuru-temizlemeci', N'ornekResim7-9351.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Ayın En İyi Kuru Temizlemecisi', NULL)
INSERT [dbo].[Kurumlar] ([KurumId], [KategoriId], [AltKategoriId], [ilId], [ilceId], [KurumAdi], [Slug], [UploadYolu], [Resim], [KurumMuduru], [MudurYardimcilari], [Aktiviteler], [Aciklama], [KurulusTarih], [WebSitesi], [Tel], [Fax], [Harita], [Video], [Email], [Adres], [Durum], [Subeler], [Kurucusu], [Egitimciler], [Panoroma], [TicSicNo], [KaliteBelgeNo], [FiyatAraligi], [TeslimSuresi], [GarantiSuresi], [MakineCesitleri], [MakineOzellikleri], [DigerMakinalar], [BagliDernek], [YaptigiHizmetler], [Referanslar], [ServisBolgeleri], [Sponsorlar], [D3Boyutlu]) VALUES (72, NULL, NULL, NULL, NULL, N'Ayın En İyi Makina Üreticisi', N'makina-ureticisi', N'makina-ureticisi', N'ornekResim6-3988.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Ayın En İyi Makina Üreticisi', NULL)
INSERT [dbo].[Kurumlar] ([KurumId], [KategoriId], [AltKategoriId], [ilId], [ilceId], [KurumAdi], [Slug], [UploadYolu], [Resim], [KurumMuduru], [MudurYardimcilari], [Aktiviteler], [Aciklama], [KurulusTarih], [WebSitesi], [Tel], [Fax], [Harita], [Video], [Email], [Adres], [Durum], [Subeler], [Kurucusu], [Egitimciler], [Panoroma], [TicSicNo], [KaliteBelgeNo], [FiyatAraligi], [TeslimSuresi], [GarantiSuresi], [MakineCesitleri], [MakineOzellikleri], [DigerMakinalar], [BagliDernek], [YaptigiHizmetler], [Referanslar], [ServisBolgeleri], [Sponsorlar], [D3Boyutlu]) VALUES (73, NULL, NULL, NULL, NULL, N'Ayın En İyi Halı Yıkamacısı', N'hali-yikamasici', N'hali-yikamasici', N'ornekResim4-155.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Ayın En İyi Halı Yıkamacısı', NULL)
SET IDENTITY_INSERT [dbo].[Kurumlar] OFF
SET IDENTITY_INSERT [dbo].[Markalar] ON 

INSERT [dbo].[Markalar] ([MarkaId], [MarkaAdi], [Aciklama], [Resim], [Slug], [Aktif], [Area], [Depart], [Sira]) VALUES (3, N'CASIO', N'Casio, Japon elektronik alet üreticisi, 1946 yılında Tokyo''da kuruldu.', N'D-20709-casio-marka.jpg', N'casio', 1, 1, 1, 1)
INSERT [dbo].[Markalar] ([MarkaId], [MarkaAdi], [Aciklama], [Resim], [Slug], [Aktif], [Area], [Depart], [Sira]) VALUES (4, N'GETAC', NULL, N'B-15546-getac-480x349.jpg', N'getac', 1, 1, 1, 3)
INSERT [dbo].[Markalar] ([MarkaId], [MarkaAdi], [Aciklama], [Resim], [Slug], [Aktif], [Area], [Depart], [Sira]) VALUES (5, N'MOTION', NULL, N'Q-65617-motion.jpg', N'motion', 1, 1, 1, 2)
INSERT [dbo].[Markalar] ([MarkaId], [MarkaAdi], [Aciklama], [Resim], [Slug], [Aktif], [Area], [Depart], [Sira]) VALUES (6, N'HANASIS', NULL, N'D-22969-hanasis.jpg', N'hanasis', 1, 1, 1, NULL)
INSERT [dbo].[Markalar] ([MarkaId], [MarkaAdi], [Aciklama], [Resim], [Slug], [Aktif], [Area], [Depart], [Sira]) VALUES (7, N'BIXOLON', NULL, N'V-84714-bixolon-480x349.jpg', N'bixolon', 1, 1, 1, NULL)
INSERT [dbo].[Markalar] ([MarkaId], [MarkaAdi], [Aciklama], [Resim], [Slug], [Aktif], [Area], [Depart], [Sira]) VALUES (8, N'POINT MOBILE', NULL, N'D-23457-point-mobile.jpg', N'point-mobile', 1, 1, 1, NULL)
INSERT [dbo].[Markalar] ([MarkaId], [MarkaAdi], [Aciklama], [Resim], [Slug], [Aktif], [Area], [Depart], [Sira]) VALUES (9, N'DOT', NULL, N'T-77851-dotel.jpg', N'dot', 1, 1, 1, NULL)
INSERT [dbo].[Markalar] ([MarkaId], [MarkaAdi], [Aciklama], [Resim], [Slug], [Aktif], [Area], [Depart], [Sira]) VALUES (10, N'SEWOO', NULL, N'M-54818-sewoo.jpg', N'sewoo', 1, 1, 1, NULL)
INSERT [dbo].[Markalar] ([MarkaId], [MarkaAdi], [Aciklama], [Resim], [Slug], [Aktif], [Area], [Depart], [Sira]) VALUES (11, N'JOLIMARK', NULL, N'I-38157-jolimark.jpg', N'jolimark', 1, 1, 1, NULL)
INSERT [dbo].[Markalar] ([MarkaId], [MarkaAdi], [Aciklama], [Resim], [Slug], [Aktif], [Area], [Depart], [Sira]) VALUES (12, N'AAEON', NULL, N'B-15017-aaeon.jpg', N'aaeon', 1, 1, 1, NULL)
INSERT [dbo].[Markalar] ([MarkaId], [MarkaAdi], [Aciklama], [Resim], [Slug], [Aktif], [Area], [Depart], [Sira]) VALUES (13, N'XPLORE', NULL, N'E-24249-XPLORE.jpg', N'xplore', 1, 1, 1, NULL)
INSERT [dbo].[Markalar] ([MarkaId], [MarkaAdi], [Aciklama], [Resim], [Slug], [Aktif], [Area], [Depart], [Sira]) VALUES (14, N'MITAC', NULL, N'X-92679-mitac.jpg', N'mitac', 1, 1, 1, NULL)
INSERT [dbo].[Markalar] ([MarkaId], [MarkaAdi], [Aciklama], [Resim], [Slug], [Aktif], [Area], [Depart], [Sira]) VALUES (15, N'HANSHIN', NULL, N'M-51684-neoboard.jpg', N'hanshin', 1, 1, 1, NULL)
INSERT [dbo].[Markalar] ([MarkaId], [MarkaAdi], [Aciklama], [Resim], [Slug], [Aktif], [Area], [Depart], [Sira]) VALUES (16, N'MOBİCELL', NULL, N'E-24314-mobicell.jpg', N'mobicell', 1, 1, 1, NULL)
INSERT [dbo].[Markalar] ([MarkaId], [MarkaAdi], [Aciklama], [Resim], [Slug], [Aktif], [Area], [Depart], [Sira]) VALUES (17, N'NEOBOOK', NULL, N'T-76245-neobook.jpg', N'neobook', 1, 1, 1, NULL)
INSERT [dbo].[Markalar] ([MarkaId], [MarkaAdi], [Aciklama], [Resim], [Slug], [Aktif], [Area], [Depart], [Sira]) VALUES (18, N'TBK', NULL, N'G-33469-tbk.jpg', N'tbk', 1, 1, 1, NULL)
INSERT [dbo].[Markalar] ([MarkaId], [MarkaAdi], [Aciklama], [Resim], [Slug], [Aktif], [Area], [Depart], [Sira]) VALUES (19, N'HPRT', NULL, N'L-51037-hprt.jpg', N'hprt', 1, 1, 1, NULL)
INSERT [dbo].[Markalar] ([MarkaId], [MarkaAdi], [Aciklama], [Resim], [Slug], [Aktif], [Area], [Depart], [Sira]) VALUES (20, N'WOONGJIN', NULL, N'R-68897-Woongjin.jpg', N'woongjin', 1, 1, 1, NULL)
INSERT [dbo].[Markalar] ([MarkaId], [MarkaAdi], [Aciklama], [Resim], [Slug], [Aktif], [Area], [Depart], [Sira]) VALUES (21, N'ROBOX', NULL, N'W-87621-robox.jpg', N'robox', 1, 1, 1, NULL)
INSERT [dbo].[Markalar] ([MarkaId], [MarkaAdi], [Aciklama], [Resim], [Slug], [Aktif], [Area], [Depart], [Sira]) VALUES (22, N'Araç Yazıcı Seti', NULL, N'M-52969-yazici-seti.jpg', N'arac-yazici-seti', 0, 0, 0, NULL)
INSERT [dbo].[Markalar] ([MarkaId], [MarkaAdi], [Aciklama], [Resim], [Slug], [Aktif], [Area], [Depart], [Sira]) VALUES (23, N'MARSON', NULL, N'G-31265-marson.jpg', N'marson', 1, 1, 1, NULL)
INSERT [dbo].[Markalar] ([MarkaId], [MarkaAdi], [Aciklama], [Resim], [Slug], [Aktif], [Area], [Depart], [Sira]) VALUES (24, N'MOBİT', NULL, N'C-19527-mobit-bn.jpg', N'mobit', 1, 1, 1, NULL)
INSERT [dbo].[Markalar] ([MarkaId], [MarkaAdi], [Aciklama], [Resim], [Slug], [Aktif], [Area], [Depart], [Sira]) VALUES (25, N'POKINI', NULL, N'N-55621-pokini.jpg', N'pokini', 1, 1, 1, NULL)
INSERT [dbo].[Markalar] ([MarkaId], [MarkaAdi], [Aciklama], [Resim], [Slug], [Aktif], [Area], [Depart], [Sira]) VALUES (26, N'CLINICALL', NULL, N'O-58955-clinicall.jpg', N'clinicall', 1, 1, 1, NULL)
INSERT [dbo].[Markalar] ([MarkaId], [MarkaAdi], [Aciklama], [Resim], [Slug], [Aktif], [Area], [Depart], [Sira]) VALUES (27, N'TOSHIBA', NULL, N'L-50909-toshiba.jpg', N'toshiba', 1, 1, 1, NULL)
INSERT [dbo].[Markalar] ([MarkaId], [MarkaAdi], [Aciklama], [Resim], [Slug], [Aktif], [Area], [Depart], [Sira]) VALUES (28, N'BLACKVİEW', NULL, N'V-83129-blackview-logo.jpg', N'blackview', 1, 1, 1, NULL)
INSERT [dbo].[Markalar] ([MarkaId], [MarkaAdi], [Aciklama], [Resim], [Slug], [Aktif], [Area], [Depart], [Sira]) VALUES (29, N'Valcretec', NULL, N'H-37013-Valcretec.jpg', N'valcretec', 1, 1, 1, NULL)
INSERT [dbo].[Markalar] ([MarkaId], [MarkaAdi], [Aciklama], [Resim], [Slug], [Aktif], [Area], [Depart], [Sira]) VALUES (30, N'EC Line', NULL, N'F-29848-ecline.jpg', N'ec-line', 1, 1, 1, NULL)
INSERT [dbo].[Markalar] ([MarkaId], [MarkaAdi], [Aciklama], [Resim], [Slug], [Aktif], [Area], [Depart], [Sira]) VALUES (31, N'Avalue', NULL, N'E-24128-avalue.jpg', N'avalue', 1, 1, 1, NULL)
SET IDENTITY_INSERT [dbo].[Markalar] OFF
SET IDENTITY_INSERT [dbo].[MetaTag] ON 

INSERT [dbo].[MetaTag] ([Id], [Title], [Description], [Keywords], [Facebook], [Twitter], [GooglePlus], [Linkedin], [Youtube], [Diger], [SiteLogo]) VALUES (1, N'Temizlik Sektörü', N'Temizlik Sektörü', N'Temizlik Sektörü', N'https://www.facebook.com/temizliksektoru', N'https://twitter.com/temizliksektoru', N'https://plus.google.com/113373229107429418547', N'https://www.linkedin.com/temizliksektoru', N'https://www.youtube.com/temizliksektoru', N'https://www.instagram.com/temizliksektoru', N'temizliksektorulogosu.fw.png')
SET IDENTITY_INSERT [dbo].[MetaTag] OFF
SET IDENTITY_INSERT [dbo].[Popup] ON 

INSERT [dbo].[Popup] ([Id], [Baslik], [Aciklama], [AcilisSekli], [Durum]) VALUES (1, N'Sponsor Alanı', N'<p><img alt="" src="http://powertechsoft.com/upload/files/sponsor5768Q.png" style="height:100%; width:598px" /></p>
', 3, 1)
SET IDENTITY_INSERT [dbo].[Popup] OFF
SET IDENTITY_INSERT [dbo].[Sayfalar] ON 

INSERT [dbo].[Sayfalar] ([Id], [Ad], [Slug], [Detay], [Url], [Aktif], [Menu], [iletisimFormu], [KategoriId], [GaleriId]) VALUES (1, N'Hakkımızda', N'hakkimizda', N'<p style="color: rgb(34, 34, 34); font-family: Arial, Verdana, sans-serif; font-size: 12px; line-height: normal;"><strong>MOBİT BİLİŞİM A.Ş.</strong></p><p style="color: rgb(34, 34, 34); font-family: Arial, Verdana, sans-serif; font-size: 12px; line-height: normal;">Bilişim sektöründe OT/VT (Otomatik Tanıma/Veri Toplama) ve işletme çözümleri sunmak amacı ile 1998 yılında Data Bilgisayar Ltd. Şti. adıyla kurulan firmamız, Temmuz 2003’den itibaren Mobit Bilişim ve Elektronik Kontrol Sistemleri Dış Ticaret A.Ş. olarak yeniden yapılanmıştır.</p><p style="color: rgb(34, 34, 34); font-family: Arial, Verdana, sans-serif; font-size: 12px; line-height: normal;">Otomatik Tanıma/Veri Toplama ürünleri konusunda zengin bir ürün portföyüne sahip olan Mobit Bilişim, ürünlerini yurt içi ve yurt dışında destek ve servis güvencesi ile sunmaktadır. Mobit Bilişim, 6 yılı aşkındır da Casio Projeksiyon Sistemlerinin Türkiye distribütörlüğünü gerçekleştirmektedir. Şirket tarafından satılan her bir ürün için donanım ve yazılım desteği sürekli olarak sağlanmaktadır. Satışı yapılan ürünler ile ilgili her türlü eğitim, yedek parça tedariki satış sonrası hizmetler olarak sunulmaktadır.</p><p style="color: rgb(34, 34, 34); font-family: Arial, Verdana, sans-serif; font-size: 12px; line-height: normal;">Mobit Bilişim tarafından sektöre sunulan yazılımlar, depo ve ambar yönetimi, lojistik ve sevkiyat sistemleri, sıcak satış-sipariş sistemleri, sayaç okuma, parkomat, kargo otomasyonu, entegrasyon yazılımları ve özel çözümler gibi operasyonel programlar ve bu faaliyetlerin tümünü kapsayan ürün yelpazesi ile müşterilerine gerekli olan hızı ve dinamizmi sunmaktadır.</p><p style="color: rgb(34, 34, 34); font-family: Arial, Verdana, sans-serif; font-size: 12px; line-height: normal;">Mobit Bilişim, Casio, Motion, Sewoo, Hanasis, Jolimark, Dotel, Bixolon, Mobicell, TBK, Neobook gibi 10’dan fazla markanın distribütörlüğünü yapmaktadır. Cihazlarımız Elektrik-Su Doğalgaz (CNG, LNG) Sayaç okumaları, sahada sıcak satış, kargo teslimatları, market ve mağazacılık uygulamaları, restoran, bar, cafe uygulamaları, ile mobil uygulamalar, bakım, inşaat kontrolü gibi çalışmalarda sahada belgelendirme uygulamaları için geliştirilen çözümler de kullanılmaktadır. </p>', NULL, 1, 1, 1, 1, NULL)
INSERT [dbo].[Sayfalar] ([Id], [Ad], [Slug], [Detay], [Url], [Aktif], [Menu], [iletisimFormu], [KategoriId], [GaleriId]) VALUES (4, N'Kredi Kartı Oranları', N'kredi-karti-oranlari', N'<p><br></p>', NULL, 0, 0, 0, 1, NULL)
INSERT [dbo].[Sayfalar] ([Id], [Ad], [Slug], [Detay], [Url], [Aktif], [Menu], [iletisimFormu], [KategoriId], [GaleriId]) VALUES (6, N'Şirket Profil Sunumu', N'sirket-profil-sunumu', N'<p><br></p>', N'/upload/files/Mobit-Profil-Sunumu-1939F.pps', 1, 1, 0, 1, NULL)
INSERT [dbo].[Sayfalar] ([Id], [Ad], [Slug], [Detay], [Url], [Aktif], [Menu], [iletisimFormu], [KategoriId], [GaleriId]) VALUES (7, N'Mobit Kurumsal Broşürü', N'mobit-kurumsal-brosuru', N'<p><br></p>', N'/upload/files/mobit-bilisim-kurumsal-brosuru-4462M.pdf', 1, 1, 0, 1, NULL)
INSERT [dbo].[Sayfalar] ([Id], [Ad], [Slug], [Detay], [Url], [Aktif], [Menu], [iletisimFormu], [KategoriId], [GaleriId]) VALUES (8, N'Hesap Numaraları', N'hesap-numaralari', N'<p>
	 </p>
<table class="table table-bordered" style="text-align: center;">
	<tbody>
		<tr>
			<td>
				<h3 style="text-align: center; ">
					<span style="color: rgb(0, 0, 0);">Mobit Bilişim Elektronik ve Kontrol Sistemleri Dış Tic. A.Ş.</span></h3>
			</td>
		</tr>
	</tbody>
</table>
<table class="table table-bordered" style="text-align: center;">
	<tbody>
		<tr>
			<td>
				<span style="font-weight: bold; color: rgb(0, 0, 0);">BANKA ADI</span></td>
			<td>
				<span style="font-weight: bold; color: rgb(0, 0, 0);">ŞUBESİ</span></td>
			<td>
				<span style="font-weight: bold; color: rgb(0, 0, 0);">TL IBAN</span></td>
			<td>
				 </td>
			<td>
				<span style="font-weight: bold; color: rgb(0, 0, 0);">USD IBAN</span></td>
			
		</tr>
		<tr>
			<td>
				AKBANK</td>
			<td>
				PERPA</td>
			<td>
				TR35 0004 6006 3388 8000 0449 75</td>
			<td>
				 </td>
			<td>
				TR40 0004 6006 3300 1000 0449 73</td>
			
		</tr>
		<tr>
			<td>
				ALBARAKA TURK</td>
			<td>
				ŞİRİNEVLER</td>
			<td>
				TR24 0020 3000 0023 9991 0000 12</td>
			<td>
				 </td>
			<td>
				TR51-0020-3000-0023-9991-0000-11</td>
			
		</tr>
		<tr>
			<td>
				DENİZBANK</td>
			<td>
				TOPKAPI SAN</td>
			<td>
				TR02 0013 4000 0012 9315 1000 03</td>
			<td>
				 </td>
			<td>
				TR72 0013 4000 0012 9315 1000 04</td>
			
		</tr>
		<tr>
			<td>
				FİNANSBANK</td>
			<td>
				PERPA</td>
			<td>
				TR65 0011 1000 0000 0013 4053 20</td>
			<td>
				 </td>
			<td>
				TR46 0011 1000 0000 0026 4110 34</td>
			
		</tr>
		<tr>
			<td>
				GARANTİ</td>
			<td>
				PERPA</td>
			<td>
				TR30 0006 2000 4590 0006 2982 30</td>
			<td>
				 </td>
			<td>
				TR34 0006 2000 4590 0009 0947 65</td>
			
		</tr>
		<tr>
			<td>
				İŞBANKASI</td>
			<td>
				PERPA</td>
			<td>
				TR24 0006 4000 0011 1880 3497 18</td>
			<td>
				 </td>
			<td>
				TR13 0006 4000 0021 1880 1740 50</td>
			
		</tr>
		<tr>
			<td>
				KUVEYT TURK</td>
			<td>
				TOPKAPI</td>
			<td>
				TR19 0020 5000 0005 9635 8000 03</td>
			<td>
				 </td>
			<td>
				TR89 0020 5000 0005 9635 8001 01</td>
			
		</tr>
		<tr>
			<td>
				ŞEKERBANK</td>
			<td>
				SUADİYE</td>
			<td>
				TR 93 0005 9024 0057 8024 0528 61</td>
			<td>
				 </td>
			<td>
				TR23 0005 9024 0051 1024 0529 07</td>
			
		</tr>
		<tr>
			<td>
				T.F.K.B.</td>
			<td>
				PERPA</td>
			<td>
				TR33 0020 6001 3100 1445 6600 03</td>
			<td>
				 </td>
			<td>
				TR65 0020 6001 3100 1445 6601 06</td>
			
		</tr>
		<tr>
			<td>
				TEB</td>
			<td>
				PERPA</td>
			<td>
				TR53 0003 2000 1270 0000 0105 54</td>
			<td>
				 </td>
			<td>
				TR26 0003 2000 1270 0000 0105 55</td>
			
		</tr>
		<tr>
			<td>
				YAPI KREDİ</td>
			<td>
				PERPA</td>
			<td>
				TR59 0006 7010 0000 0064 1737 51</td>
			<td>
				 </td>
			<td>
				TR79 0006 7010 0000 0064 2575 87</td>
			
		</tr>
		<tr>
			<td>
				ZİRAAT</td>
			<td>
				SALI PAZARI</td>
			<td>
				TR73 0001 0009 0159 1483 6150 02</td>
			<td>
				 </td>
			<td>
				TR03 0001 0009 0159 1483 6150 01</td>
			
		</tr>
	</tbody>
</table>
<p>
	 </p>


', NULL, 1, 1, 0, 2, NULL)
INSERT [dbo].[Sayfalar] ([Id], [Ad], [Slug], [Detay], [Url], [Aktif], [Menu], [iletisimFormu], [KategoriId], [GaleriId]) VALUES (9, N'Akıllı Kürsü Çözümleri', N'akilli-kursu-cozumleri', N'<p><span style="font-weight: bold;">Mobit Bilişim tarafından geliştirilen Akıllı Kürsü ile eğitmenler ders anlatımında teknolojiyi yakalıyor.</span><br></p><p><span style="line-height: 1.42857;">Mobit Bilişim Çözüm Mimarı Murat Demirci "Üniversiteler, okullar, özel eğitim kurumlarında öğretmen masası olarak kullanılan kürsüler çağ atlayacak. Masa ya da eski tip kürsü yerine kurulan Akıllı Kürsü ile öğretmenler artık yanlarında ders notu, bilgisayar, öğrenci yoklama notlarını taşımak zorunda kalmayacak. Öğrenciler sahip olduğu akıllı kartlar ile yoklamalarını kürsü üzerindeki kart okuyucudan yapacak." dedi.</span><br></p><p>Demirci "Akıllı Kürsü, üzerine yerleştirilen dokunmatik özellikli endüstriyel PC, kart okuyucu ve haberleşme portları olan entegre bir üründür. Eğitmene verilen özel kartlar okutularak açılır. Eğitmen, kürsünün içine yerleştirilmiş bilgisayardaki ders anlatımını, projeksiyonla tahtaya yansıtabilir. Gerekirse tablet üzerinden eklemeler yaparak, ders sonunda öğrencilere ders notu olarak gönderebilir." şeklinde konuştu.</p><p></p><p>Mobit Bilişim tarafından geliştirilen ve bazı üniversitelerde kullanılmaya başlanan akıllı kürsü ile eğitimcilerin bilgisayar ya da tableti derse gelirken yanlarında taşımasına gerek kalmıyor. Kilitlenebilen ve şifre ile korunan bu kürsüde, eğitimci müfredat bilgilerini hazır yüklenmiş olarak buluyor. Bu bilgilerin üzerine ekranı kullanarak notlar yazabilen eğitimci, notları projeksiyon aracılığıyla ders anında tahtaya da yansıtabiliyor. Bir eğitim kurumundaki yüzlerce sınıfı tek bir noktadan yönetme imkanı veren Akıllı Kürsü''ye entegre harici mikrofon ve ses sistemi girişiyle ders sunumları daha interaktif, keyifli ve verimli hale geliyor. Akıllı Kürsü, eğitimcilerle öğrenciler arasındaki teknolojik nesil farkını kapatmayı hedefliyor.</p><p><img src="data:image/jpeg;base64,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" style="width: 300px; height: 224.664px;"><img src="data:image/jpeg;base64,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" style="width: 300px; height: 224.664px;"></p><p><img src="data:image/jpeg;base64,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" style="width: 300px; height: 224.664px;"><img src="data:image/jpeg;base64,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" style="width: 300px; height: 224.664px;"><br></p><p></p>', NULL, 1, 1, 1, 3, NULL)
INSERT [dbo].[Sayfalar] ([Id], [Ad], [Slug], [Detay], [Url], [Aktif], [Menu], [iletisimFormu], [KategoriId], [GaleriId]) VALUES (10, N'Cıvasız Teknoloji', N'civasiz-teknoloji', N'<p style="color: rgb(34, 34, 34); font-family: Arial, Verdana, sans-serif; font-size: 12px; line-height: normal; margin-left: -15px;"><strong>CIVA ZEHİRLİDİR VE KALICI HASARLARA YOL AÇAR</strong></p><p style="color: rgb(34, 34, 34); font-family: Arial, Verdana, sans-serif; font-size: 12px; line-height: normal;">Cıvanın kendisi, bileşikleri ve buharı çok zehirli bir elementtir. Güçlü bir nörotoksiktir. Zarar vermesi için çok fazla cıvaya maruz kalmaya gerek yoktur. Ortama yayıldığında hızla buharlaşan ve zehirli bir hava solunmasına yol açan cıvanın bir kısmı idrar yoluyla atılır. Ancak bir kısmı vücutta; beyin, karaciğer ve böbreklerde depolanır. Merkezi sinir sistemi rahatsızlıklarından, karaciğer ve deri hastalıklarına, sinir iltihabı, MS, Parkinson, göz hastalıkları, sindirim sistemi hastalıklarından, hormonal ve psikiyatrik hastalıklara kadar pek çok rahatsızlığa yol açabilir. <br><br></p><p style="color: rgb(34, 34, 34); font-family: Arial, Verdana, sans-serif; font-size: 12px; line-height: normal; margin-left: -15px;"><strong>CIVA ÇEVRE FELAKETİ SEBEBİDİR</strong></p><p style="color: rgb(34, 34, 34); font-family: Arial, Verdana, sans-serif; font-size: 12px; line-height: normal;">Cıva insan ve çevre sağlığını tehdit ediyor. 5 mg kadar cıvayı küçük bir göle dökerseniz, o göl çevresel tehlikeler yüzünden kapatılmak zorunda kalabilir. Küresel cıva salınımının geldiği ciddi seviyeler dünya denizlerindeki balıkların % 84''ünde tehlikeli miktarda cıva birikmesine yol açmıştır. <br><br></p><p style="color: rgb(34, 34, 34); font-family: Arial, Verdana, sans-serif; font-size: 12px; line-height: normal; margin-left: -15px;"><strong>UZMANLAR İÇERİĞİNDE CIVA OLAN ŞEYLERİN KULLANILMASI KONUSUNDA UYARIYOR</strong></p><p style="color: rgb(34, 34, 34); font-family: Arial, Verdana, sans-serif; font-size: 12px; line-height: normal;">Sanayi atıkları, evlerde kullanılan enerji tasarruflu lambalar, toplantı salonlarında okullarda kullanılan lambalı projeksiyonlar kaynağı ne olursa olsun cıva hızla buharlaşır, atmosfere karışır. Cıva kanserojen madde içermektedir. Evlerde ve projeksiyonlarda kullanılan lambalar ortalama 5 mg cıva içerir. Cıvalı bir lambanın yada projeksiyon lambasının okul ortamında kırılması, çocukların büyük tehlikelerle karşı karşıya kalmasına yol açar. Japonya’da atom bombası dahil en büyük felaketlerden biri olarak görülen bu olay 1932 yılında yaşanmıştır. Minamata’da bir kimyasal madde fabrikası cıva atıklarını denize dökmüş, cıva birikimi önce planktonları sonra da bu plaktonlarla beslenmiş balıkları etkilemiştir. Bu balıkları yiyen insanlar Minamata hastalığına yakalanmıştır. İstatistiklere göre 68’i ölümle sonuçlanan 370 zehirlenme olayından söz edilmiştir. Hastalığa adını veren bu yerdeki çocuklar daha anne karnındayken ölmüş, hastalık nesiller boyu devam etmiştir. </p>', NULL, 1, 1, 0, 3, NULL)
INSERT [dbo].[Sayfalar] ([Id], [Ad], [Slug], [Detay], [Url], [Aktif], [Menu], [iletisimFormu], [KategoriId], [GaleriId]) VALUES (11, N'İnsan Kaynakları', N'insan-kaynaklari', N'<p>MOBİT A.Ş. uzman olduğu iş kollarında iş verenin ve kullanıcıların ihtiya&ccedil;larını KALİTE,MALİYET ve TERMİN a&ccedil;ısından en iyi şekilde karşılayan &uuml;r&uuml;nler &uuml;retir.</p>

<p>MOBİT A.Ş. bu ama&ccedil;la</p>

<p>*İşlerliği kanıtlanmış teknolojiyi kendi bilgi birikimi ve tecr&uuml;besi ile birleştirerek iş verenin ve kullanıcıların ihtiya&ccedil;larını en uygun şekilde karşılayacak &uuml;r&uuml;n ve hizmet sağlar,<br />
*Kaliteli &uuml;r&uuml;n ve hizmet ger&ccedil;ekleştirmek ve &ccedil;alışanların eğitimine katkıda bulunmak adına uygulamaya etkin şekilde d&ouml;n&uuml;şt&uuml;r&uuml;lmesi i&ccedil;in gerekli lojistik ve mali desteği sağlar,<br />
*İş veren,iş ortakları ve MOBİT A.Ş. tarafından belirlenen kalite kriterlerinin eksiksiz ve zamanında yerine getirilmesi i&ccedil;in, gerekli olan kaynakları tahsis ederek uygulamaların etkin ve verimli y&uuml;r&uuml;t&uuml;lmesini sağlar.</p>

<p>Şirketimize uygun pozisyonlar i&ccedil;in, iş başvurusunda bulunmak istiyorsanız; CV&#39;nizi&nbsp;<a href="mailto:ik@mobit.com.tr">ik@mobit.com.tr</a>&nbsp;adresine g&ouml;nderebilirsiniz.</p>

<p><strong>Şirketimize uygun pozisyonlar</strong></p>

<ul>
	<li>Bilgisayar M&uuml;hendisi</li>
	<li>Yazılım M&uuml;hendisi</li>
	<li>Elektrik Elektronik M&uuml;hendisi</li>
	<li>Teknik Servis Personeli</li>
	<li>Depo Sevkiyat Personeli</li>
	<li>M&uuml;şteri Temsilcisi</li>
</ul>
', NULL, 1, 1, 0, 1, NULL)
SET IDENTITY_INSERT [dbo].[Sayfalar] OFF
SET IDENTITY_INSERT [dbo].[Slider] ON 

INSERT [dbo].[Slider] ([Id], [SliderId], [Baslik], [Url], [Target], [Resim], [Sira], [Aktif], [Tarih]) VALUES (14, 1, N'Temizliğe Dair Herşey ; Temizlik Şirketleri , Temizlik Ürünleri; Halı Yıkama , Kuru Temizleme;Tedarikçiler,  Temizlik Makinaları', N'#.', N'_self', N'vuralakman_kadikoydenbakis1-230.jpg', 1, 1, CAST(N'2017-05-11T10:30:11.527' AS DateTime))
INSERT [dbo].[Slider] ([Id], [SliderId], [Baslik], [Url], [Target], [Resim], [Sira], [Aktif], [Tarih]) VALUES (1019, 3, N'DGR TEMİZLİK', N'http://www.dgr.com.tr/hizmetlerimiz/temizlik-hizmetleri', N'_blank', N'1459924927_logosk-8491.jpg', 1, 1, CAST(N'2017-05-18T20:36:57.670' AS DateTime))
INSERT [dbo].[Slider] ([Id], [SliderId], [Baslik], [Url], [Target], [Resim], [Sira], [Aktif], [Tarih]) VALUES (1068, 13, N'test', N'#', N'_blank', N'bahcesehir-university-merveoflaz-4110.jpg', 3, 1, CAST(N'2017-05-30T09:47:14.157' AS DateTime))
INSERT [dbo].[Slider] ([Id], [SliderId], [Baslik], [Url], [Target], [Resim], [Sira], [Aktif], [Tarih]) VALUES (1069, 13, N'test', N'#', N'_blank', N'3324-9445-image-66.jpg', 2, 1, CAST(N'2017-05-30T09:47:27.857' AS DateTime))
INSERT [dbo].[Slider] ([Id], [SliderId], [Baslik], [Url], [Target], [Resim], [Sira], [Aktif], [Tarih]) VALUES (1070, 13, N'test', N'#', N'_blank', N'IGUR-HAZIRLIK-LİSELERİ-4105.png', 2, 1, CAST(N'2017-05-30T09:47:29.843' AS DateTime))
INSERT [dbo].[Slider] ([Id], [SliderId], [Baslik], [Url], [Target], [Resim], [Sira], [Aktif], [Tarih]) VALUES (1080, 14, N' ', N'#.', N'_self', N'IGUR-HAZIRLIK-LİSELERİ-3188.png', 1, 1, CAST(N'2017-06-06T15:50:19.807' AS DateTime))
INSERT [dbo].[Slider] ([Id], [SliderId], [Baslik], [Url], [Target], [Resim], [Sira], [Aktif], [Tarih]) VALUES (1081, 14, N' ', N'#.', N'_blank', N'images-8413.png', 2, 1, CAST(N'2017-06-06T16:13:25.583' AS DateTime))
INSERT [dbo].[Slider] ([Id], [SliderId], [Baslik], [Url], [Target], [Resim], [Sira], [Aktif], [Tarih]) VALUES (1082, 14, N' ', N'#.', N'_blank', N'bahcesehir-university-merveoflaz-9638.jpg', 3, 1, CAST(N'2017-06-06T16:13:43.633' AS DateTime))
INSERT [dbo].[Slider] ([Id], [SliderId], [Baslik], [Url], [Target], [Resim], [Sira], [Aktif], [Tarih]) VALUES (1083, 14, N' ', N'#.', N'_blank', N'3324-9445-image-4940.jpg', 4, 1, CAST(N'2017-06-06T16:13:59.423' AS DateTime))
INSERT [dbo].[Slider] ([Id], [SliderId], [Baslik], [Url], [Target], [Resim], [Sira], [Aktif], [Tarih]) VALUES (1084, 14, N' ', N'5', N'_blank', N'IGUR-HAZIRLIK-LİSELERİ-4021.png', 5, 1, CAST(N'2017-06-06T16:14:14.760' AS DateTime))
INSERT [dbo].[Slider] ([Id], [SliderId], [Baslik], [Url], [Target], [Resim], [Sira], [Aktif], [Tarih]) VALUES (1086, 15, N' ', N'#.', N'_blank', N'atabanner-1432.jpg', 1, 1, CAST(N'2017-06-07T14:37:20.233' AS DateTime))
INSERT [dbo].[Slider] ([Id], [SliderId], [Baslik], [Url], [Target], [Resim], [Sira], [Aktif], [Tarih]) VALUES (1087, 16, N'.', N'#', N'_blank', N'atabanner-8658.jpg', 1, 1, CAST(N'2017-06-07T18:38:02.860' AS DateTime))
INSERT [dbo].[Slider] ([Id], [SliderId], [Baslik], [Url], [Target], [Resim], [Sira], [Aktif], [Tarih]) VALUES (1088, 13, N' ', N'#', N'_blank', N'IGUR-HAZIRLIK-LİSELERİ-7484.png', 1, 1, CAST(N'2017-06-08T11:49:29.077' AS DateTime))
INSERT [dbo].[Slider] ([Id], [SliderId], [Baslik], [Url], [Target], [Resim], [Sira], [Aktif], [Tarih]) VALUES (1089, 13, N' ', N'#', N'_blank', N'images-8043.png', 2, 1, CAST(N'2017-06-08T11:49:44.997' AS DateTime))
INSERT [dbo].[Slider] ([Id], [SliderId], [Baslik], [Url], [Target], [Resim], [Sira], [Aktif], [Tarih]) VALUES (1103, 19, N'Sponsor 1', N'Sponsor1', N'_blank', N'IGUR-HAZIRLIK-LİSELERİ-1061.png', 1, 1, CAST(N'2017-06-22T11:13:07.093' AS DateTime))
INSERT [dbo].[Slider] ([Id], [SliderId], [Baslik], [Url], [Target], [Resim], [Sira], [Aktif], [Tarih]) VALUES (1104, 19, N'Sponsor 2', N'Sponsor2', N'_blank', N'new_placeholder-7490.jpg', 2, 1, CAST(N'2017-06-22T11:13:26.390' AS DateTime))
INSERT [dbo].[Slider] ([Id], [SliderId], [Baslik], [Url], [Target], [Resim], [Sira], [Aktif], [Tarih]) VALUES (1105, 19, N'Sponsor 3', N'Sponsor3', N'_blank', N'images-4120.png', 3, 1, CAST(N'2017-06-22T11:13:43.827' AS DateTime))
INSERT [dbo].[Slider] ([Id], [SliderId], [Baslik], [Url], [Target], [Resim], [Sira], [Aktif], [Tarih]) VALUES (1106, 19, N'Sponsor 4', N'Sponsor4', N'_blank', N'3324-9445-image-9766.jpg', 4, 1, CAST(N'2017-06-22T11:14:04.577' AS DateTime))
INSERT [dbo].[Slider] ([Id], [SliderId], [Baslik], [Url], [Target], [Resim], [Sira], [Aktif], [Tarih]) VALUES (1107, 19, N'Sponsor 5', N'Sponsor5', N'_blank', N'bahcesehir-university-merveoflaz-637.jpg', 5, 1, CAST(N'2017-06-22T11:14:20.203' AS DateTime))
INSERT [dbo].[Slider] ([Id], [SliderId], [Baslik], [Url], [Target], [Resim], [Sira], [Aktif], [Tarih]) VALUES (1108, 19, N'Sponsor 6', N'Sponsor6', N'_blank', N'uzem_banner-7959.jpg', 6, 1, CAST(N'2017-06-22T14:41:24.847' AS DateTime))
INSERT [dbo].[Slider] ([Id], [SliderId], [Baslik], [Url], [Target], [Resim], [Sira], [Aktif], [Tarih]) VALUES (1110, 1, N'Temizliğe Dair Herşey ; Temizlik Şirketleri , Temizlik Ürünleri; Halı Yıkama , Kuru Temizleme;Tedarikçiler,  Temizlik Makinaları', N'#', N'_blank', N'vuralakman_kadikoydenbakis1-230.jpg', 2, 1, CAST(N'2017-07-16T23:19:38.537' AS DateTime))
INSERT [dbo].[Slider] ([Id], [SliderId], [Baslik], [Url], [Target], [Resim], [Sira], [Aktif], [Tarih]) VALUES (1111, 1, N'Temizliğe Dair Herşey ; Temizlik Şirketleri , Temizlik Ürünleri; Halı Yıkama , Kuru Temizleme;Tedarikçiler,  Temizlik Makinaları', N'#', N'_blank', N'vuralakman_kadikoydenbakis1-230.jpg', 3, 1, CAST(N'2017-07-16T23:19:57.210' AS DateTime))
INSERT [dbo].[Slider] ([Id], [SliderId], [Baslik], [Url], [Target], [Resim], [Sira], [Aktif], [Tarih]) VALUES (1116, 3, N'KORUMA', N'http://koruma.com/', N'_blank', N'koruma-temizlik kuc (1)sk-5745.jpg', 3, 1, CAST(N'2017-08-16T12:04:18.980' AS DateTime))
INSERT [dbo].[Slider] ([Id], [SliderId], [Baslik], [Url], [Target], [Resim], [Sira], [Aktif], [Tarih]) VALUES (1118, 3, N'SEALED AİR', N'https://sealedair.com/company/diversey-care', N'_blank', N'sk-3155.jpg', 5, 1, CAST(N'2017-08-16T13:47:43.713' AS DateTime))
INSERT [dbo].[Slider] ([Id], [SliderId], [Baslik], [Url], [Target], [Resim], [Sira], [Aktif], [Tarih]) VALUES (1120, 3, N'UNİLEVER', N'https://www.unilever.com.tr/', N'_blank', N'39ab27d9ec456932cc0d867be2e4bc4d-5600.jpg', 7, 1, CAST(N'2017-08-16T13:54:04.590' AS DateTime))
INSERT [dbo].[Slider] ([Id], [SliderId], [Baslik], [Url], [Target], [Resim], [Sira], [Aktif], [Tarih]) VALUES (1123, 3, N'DRY İSTANBUL', N'https://www.dryistanbul.com.tr/', N'_blank', N'logodrySK-841.jpg', 10, 1, CAST(N'2017-08-16T14:14:56.093' AS DateTime))
INSERT [dbo].[Slider] ([Id], [SliderId], [Baslik], [Url], [Target], [Resim], [Sira], [Aktif], [Tarih]) VALUES (1127, 6, N'hayat kimya', N'https://www.hayat.com.tr/', N'_blank', N'hayat kc22sk-1153.jpg', 5, 1, CAST(N'2017-08-24T16:21:46.410' AS DateTime))
INSERT [dbo].[Slider] ([Id], [SliderId], [Baslik], [Url], [Target], [Resim], [Sira], [Aktif], [Tarih]) VALUES (1128, 3, N'LİLA KAĞIT', N'http://www.lilakagit.com/', N'_blank', N'lila_kagit kcsk-4502.jpg', 6, 1, CAST(N'2017-08-27T14:45:40.173' AS DateTime))
INSERT [dbo].[Slider] ([Id], [SliderId], [Baslik], [Url], [Target], [Resim], [Sira], [Aktif], [Tarih]) VALUES (1129, 3, N'ER AR KURUTEMİZLEME', N'http://www.erar.com.tr/', N'_blank', N'adsiz-KCSK-3522.jpg', 7, 1, CAST(N'2017-08-27T14:49:17.140' AS DateTime))
INSERT [dbo].[Slider] ([Id], [SliderId], [Baslik], [Url], [Target], [Resim], [Sira], [Aktif], [Tarih]) VALUES (1130, 3, N'KOÇAL KAĞIT', N'http://www.kocalkagit.com', N'_blank', N'kocal-SK-5771.jpg', 8, 1, CAST(N'2017-08-27T14:59:06.847' AS DateTime))
INSERT [dbo].[Slider] ([Id], [SliderId], [Baslik], [Url], [Target], [Resim], [Sira], [Aktif], [Tarih]) VALUES (1131, 3, N'AYDOS MAKİNA', N'temizliksektoru.istanbul', N'_blank', N'aydos-makina sık-3461.jpg', 9, 1, CAST(N'2017-08-27T15:01:30.063' AS DateTime))
INSERT [dbo].[Slider] ([Id], [SliderId], [Baslik], [Url], [Target], [Resim], [Sira], [Aktif], [Tarih]) VALUES (1132, 3, N'ERMOP', N'http://www.ermop.com', N'_blank', N'indir (1) (2)sk-114.jpg', 10, 1, CAST(N'2017-08-27T15:04:04.080' AS DateTime))
INSERT [dbo].[Slider] ([Id], [SliderId], [Baslik], [Url], [Target], [Resim], [Sira], [Aktif], [Tarih]) VALUES (1133, 3, N'NILCO', N'http://nilco.com.tr', N'_blank', N'52a7a9AW629KC-8262.jpg', 11, 1, CAST(N'2017-08-27T15:07:26.173' AS DateTime))
INSERT [dbo].[Slider] ([Id], [SliderId], [Baslik], [Url], [Target], [Resim], [Sira], [Aktif], [Tarih]) VALUES (1135, 2, N'DRY TÜRK', N'http://www.dryturk.com.tr/Ana_Sayfa.asp', N'_blank', N'DRY BANNER kcsk-3199.jpg', 6, 1, CAST(N'2017-08-29T13:06:12.840' AS DateTime))
INSERT [dbo].[Slider] ([Id], [SliderId], [Baslik], [Url], [Target], [Resim], [Sira], [Aktif], [Tarih]) VALUES (1136, 2, N'CNR HALI YIKAMA MAKİNALARI', N'http://www.cleanvac.com/', N'_blank', N'HALI BANNER kcsk-8527.jpg', 7, 1, CAST(N'2017-08-29T13:09:15.433' AS DateTime))
INSERT [dbo].[Slider] ([Id], [SliderId], [Baslik], [Url], [Target], [Resim], [Sira], [Aktif], [Tarih]) VALUES (1137, 2, N'İSTASYON MAKİNA', N'http://www.istasyonmakine.com/', N'_blank', N'istasyon3-1kc-1377.jpg', 8, 1, CAST(N'2017-08-29T13:10:48.997' AS DateTime))
INSERT [dbo].[Slider] ([Id], [SliderId], [Baslik], [Url], [Target], [Resim], [Sira], [Aktif], [Tarih]) VALUES (1138, 2, N'STAR MAKİNA', N'http://www.starmakina.com.tr/', N'_blank', N'star kc-6658.jpg', 9, 1, CAST(N'2017-08-29T13:12:35.683' AS DateTime))
INSERT [dbo].[Slider] ([Id], [SliderId], [Baslik], [Url], [Target], [Resim], [Sira], [Aktif], [Tarih]) VALUES (1139, 2, N'SOFİA TUVALET KAĞIDI', N'http://www.lilakagit.com', N'_blank', N'sofiaEnat-9126.jpg', 10, 1, CAST(N'2017-08-29T13:15:00.230' AS DateTime))
INSERT [dbo].[Slider] ([Id], [SliderId], [Baslik], [Url], [Target], [Resim], [Sira], [Aktif], [Tarih]) VALUES (1140, 2, N'KARCHER', N'https://www.kaercher.com/tr/', N'_blank', N'KERCHER kcsk-8724.jpg', 11, 1, CAST(N'2017-08-29T13:17:57.917' AS DateTime))
INSERT [dbo].[Slider] ([Id], [SliderId], [Baslik], [Url], [Target], [Resim], [Sira], [Aktif], [Tarih]) VALUES (1141, 2, N'METELER KAĞIT', N'http://www.meteler.com.tr/', N'_blank', N'METELER-KCSK-243.jpg', 12, 1, CAST(N'2017-08-29T13:29:19.327' AS DateTime))
INSERT [dbo].[Slider] ([Id], [SliderId], [Baslik], [Url], [Target], [Resim], [Sira], [Aktif], [Tarih]) VALUES (1142, 2, N'KUZEY DETERJAN', N'http://begimgil.com.tr/', N'_blank', N'KUZEY BANNER copy-1sk-4216.jpg', 13, 1, CAST(N'2017-08-29T13:31:16.077' AS DateTime))
INSERT [dbo].[Slider] ([Id], [SliderId], [Baslik], [Url], [Target], [Resim], [Sira], [Aktif], [Tarih]) VALUES (1143, 2, N'HAS KİMYA OMAY DETERJAN', N'http://www.omay.com.tr/', N'_blank', N'has kimya-kc sk-9637.jpg', 15, 1, CAST(N'2017-08-29T13:35:39.810' AS DateTime))
INSERT [dbo].[Slider] ([Id], [SliderId], [Baslik], [Url], [Target], [Resim], [Sira], [Aktif], [Tarih]) VALUES (1144, 5, N'EUROCLEAN', N'http://www.euroclean.com.tr/', N'_blank', N'euroclean-logo sk-4033.jpg', 1, 1, CAST(N'2017-08-29T14:06:58.613' AS DateTime))
INSERT [dbo].[Slider] ([Id], [SliderId], [Baslik], [Url], [Target], [Resim], [Sira], [Aktif], [Tarih]) VALUES (1145, 5, N'KOROPLAST', N'https://www.koroplast.com/index.php?lang=tr', N'_blank', N'kroplast kcsk-8123.jpg', 2, 1, CAST(N'2017-08-29T14:11:12.050' AS DateTime))
INSERT [dbo].[Slider] ([Id], [SliderId], [Baslik], [Url], [Target], [Resim], [Sira], [Aktif], [Tarih]) VALUES (1146, 17, N'PAREX', N'http://www.parex.com.tr/', N'_blank', N'44489KC-SK-5822.jpg', 1, 1, CAST(N'2017-08-29T14:16:28.757' AS DateTime))
INSERT [dbo].[Slider] ([Id], [SliderId], [Baslik], [Url], [Target], [Resim], [Sira], [Aktif], [Tarih]) VALUES (1148, 17, N'TOPÇUOĞLU PLAŞTİK TUPPEX', N'http://www.topcuogluplastik.com', N'_blank', N'04e1c823807997.56329201810b0sk-4966.jpg', 2, 1, CAST(N'2017-08-29T14:18:30.587' AS DateTime))
INSERT [dbo].[Slider] ([Id], [SliderId], [Baslik], [Url], [Target], [Resim], [Sira], [Aktif], [Tarih]) VALUES (1149, 6, N'KİEHL', N'http://kiehlturkey.com', N'_blank', N'ban2-1kcsk-7793.jpg', 4, 1, CAST(N'2017-08-30T14:33:52.527' AS DateTime))
INSERT [dbo].[Slider] ([Id], [SliderId], [Baslik], [Url], [Target], [Resim], [Sira], [Aktif], [Tarih]) VALUES (1150, 6, N'MARMARİS KAĞIT', N'http://www.marmaris.com.tr/', N'_blank', N'bann4.pdf5-1sk-4664.jpg', 3, 1, CAST(N'2017-08-30T14:35:06.213' AS DateTime))
INSERT [dbo].[Slider] ([Id], [SliderId], [Baslik], [Url], [Target], [Resim], [Sira], [Aktif], [Tarih]) VALUES (1151, 6, N'MADOLYON ÇÖP TORBALARI NAKKAŞ PLASTİK', N'https://nakkasplastik.com/', N'_blank', N'ban5-1sk-1825.jpg', 4, 1, CAST(N'2017-08-30T14:36:45.980' AS DateTime))
INSERT [dbo].[Slider] ([Id], [SliderId], [Baslik], [Url], [Target], [Resim], [Sira], [Aktif], [Tarih]) VALUES (1152, 6, N'ERMOP', N'http://www.ermop.com', N'_blank', N'ban3-1kcsk-7064.jpg', 5, 1, CAST(N'2017-08-30T14:38:43.323' AS DateTime))
INSERT [dbo].[Slider] ([Id], [SliderId], [Baslik], [Url], [Target], [Resim], [Sira], [Aktif], [Tarih]) VALUES (1153, 9, N'POLMİX ÇÖP TORBALARI', N'http://www.polsanplastik.com/', N'_blank', N'POLMİX KCSK-2003.jpg', 1, 1, CAST(N'2017-08-30T14:50:02.620' AS DateTime))
INSERT [dbo].[Slider] ([Id], [SliderId], [Baslik], [Url], [Target], [Resim], [Sira], [Aktif], [Tarih]) VALUES (1154, 9, N'LAVOR MAKİNA', N'https://www.lavormakina.com', N'_blank', N'lavor_temizliK KCSK-2241.jpg', 2, 1, CAST(N'2017-08-30T14:51:20.013' AS DateTime))
INSERT [dbo].[Slider] ([Id], [SliderId], [Baslik], [Url], [Target], [Resim], [Sira], [Aktif], [Tarih]) VALUES (1155, 10, N'GÜÇ PLASTİK', N'http://www.gucplastik.com.tr', N'_blank', N'cop_posetiKCSK-8719.jpg', 1, 1, CAST(N'2017-08-30T15:06:57.953' AS DateTime))
INSERT [dbo].[Slider] ([Id], [SliderId], [Baslik], [Url], [Target], [Resim], [Sira], [Aktif], [Tarih]) VALUES (1156, 10, N'KOÇAL KAĞIT', N'www.kocalkağıt.com', N'_blank', N'35356272KC-SK-2983.jpg', 2, 1, CAST(N'2017-08-30T15:08:13.890' AS DateTime))
INSERT [dbo].[Slider] ([Id], [SliderId], [Baslik], [Url], [Target], [Resim], [Sira], [Aktif], [Tarih]) VALUES (1157, 10, N'KOMİLİ BEBE', N'https://www.komilibebe.com.tr/', N'_blank', N'product-banner11SK-3042.jpg', 3, 1, CAST(N'2017-08-30T15:11:34.407' AS DateTime))
INSERT [dbo].[Slider] ([Id], [SliderId], [Baslik], [Url], [Target], [Resim], [Sira], [Aktif], [Tarih]) VALUES (1158, 2, N'AKTİVAL KİMYA AŞ', N'http://aktivalkimya.com', N'_blank', N'AKTIVAL-1KC 2SK-6219.jpg', 14, 1, CAST(N'2017-08-30T15:48:04.957' AS DateTime))
INSERT [dbo].[Slider] ([Id], [SliderId], [Baslik], [Url], [Target], [Resim], [Sira], [Aktif], [Tarih]) VALUES (1159, 2, N'KOROPLAST', N'https://www.koroplast.com', N'_blank', N'kroplast kcsk-2761.jpg', 16, 1, CAST(N'2017-08-30T15:49:48.317' AS DateTime))
INSERT [dbo].[Slider] ([Id], [SliderId], [Baslik], [Url], [Target], [Resim], [Sira], [Aktif], [Tarih]) VALUES (1160, 2, N'PERİL KİMYA', N'http://www.perilkimya.com', N'_blank', N'peril-kimya KCSK-4634.jpg', 17, 1, CAST(N'2017-08-30T15:51:01.083' AS DateTime))
INSERT [dbo].[Slider] ([Id], [SliderId], [Baslik], [Url], [Target], [Resim], [Sira], [Aktif], [Tarih]) VALUES (1161, 17, N'MHC MARMARA KİMYA', N'www.mhcmarmara.com/', N'_blank', N'YAN BANNER copy sk1-7948.jpg', 3, 1, CAST(N'2017-09-07T19:42:51.657' AS DateTime))
INSERT [dbo].[Slider] ([Id], [SliderId], [Baslik], [Url], [Target], [Resim], [Sira], [Aktif], [Tarih]) VALUES (1162, 11, N'MARATEM', N'www.eczacibasiprofesyonel.com/markaya-gore-urunler/maratem/', N'_blank', N'262201413832-SK-2941.jpg', 1, 1, CAST(N'2017-09-07T20:15:03.283' AS DateTime))
INSERT [dbo].[Slider] ([Id], [SliderId], [Baslik], [Url], [Target], [Resim], [Sira], [Aktif], [Tarih]) VALUES (1163, 11, N'ECOLAB', N'http://www.ecolab.com', N'_blank', N'383874KC-SK-787.jpg', 2, 1, CAST(N'2017-09-07T20:18:16.457' AS DateTime))
INSERT [dbo].[Slider] ([Id], [SliderId], [Baslik], [Url], [Target], [Resim], [Sira], [Aktif], [Tarih]) VALUES (1164, 11, N'STAR MAKİNA', N'http://www.starmakina.com.tr', N'_blank', N'STAR (1)SK-7072.jpg', 3, 1, CAST(N'2017-09-07T20:20:18.143' AS DateTime))
INSERT [dbo].[Slider] ([Id], [SliderId], [Baslik], [Url], [Target], [Resim], [Sira], [Aktif], [Tarih]) VALUES (1165, 11, N'İSTASYON MAKİNA', N'http://www.istasyonmakine.com', N'_blank', N'logo SK-7092.jpg', 4, 1, CAST(N'2017-09-07T20:21:32.333' AS DateTime))
INSERT [dbo].[Slider] ([Id], [SliderId], [Baslik], [Url], [Target], [Resim], [Sira], [Aktif], [Tarih]) VALUES (1166, 11, N'GARMAK HALI YIKAMA MAKİNALARI', N'http://gar-mak.com/', N'_blank', N'YeniLogo1SK-4403.jpg', 5, 1, CAST(N'2017-09-07T20:27:04.053' AS DateTime))
INSERT [dbo].[Slider] ([Id], [SliderId], [Baslik], [Url], [Target], [Resim], [Sira], [Aktif], [Tarih]) VALUES (1167, 11, N'FİX KİMYA', N'http://www.fixdeterjan.com/', N'_blank', N'FİX 1SK-4634.jpg', 6, 1, CAST(N'2017-09-07T20:28:30.007' AS DateTime))
INSERT [dbo].[Slider] ([Id], [SliderId], [Baslik], [Url], [Target], [Resim], [Sira], [Aktif], [Tarih]) VALUES (1168, 11, N'NİLCO', N'temizliksektoru.istanbul', N'_blank', N'52a7a9AW629sk-4423.jpg', 7, 1, CAST(N'2017-09-07T20:31:35.897' AS DateTime))
INSERT [dbo].[Slider] ([Id], [SliderId], [Baslik], [Url], [Target], [Resim], [Sira], [Aktif], [Tarih]) VALUES (1169, 11, N'FLOREX ÇÖP TORBASI', N'www.teslaplastik.com', N'_blank', N'FLOREXKC1-8246.jpg', 8, 1, CAST(N'2017-09-07T20:37:36.180' AS DateTime))
INSERT [dbo].[Slider] ([Id], [SliderId], [Baslik], [Url], [Target], [Resim], [Sira], [Aktif], [Tarih]) VALUES (1170, 11, N'BOĞAZİÇİ TEMİZLİK', N'http://www.bogazicitemizlik.com.tr', N'_blank', N'logo28102016SK-3592.jpg', 9, 1, CAST(N'2017-09-07T20:40:32.757' AS DateTime))
INSERT [dbo].[Slider] ([Id], [SliderId], [Baslik], [Url], [Target], [Resim], [Sira], [Aktif], [Tarih]) VALUES (1172, 11, N'ERA HALI ŞAMPUANI SABUNCUOĞLU KİMYA', N'www.era111.com', N'_blank', N'logo-3177.jpg', 10, 1, CAST(N'2017-09-07T20:42:54.990' AS DateTime))
INSERT [dbo].[Slider] ([Id], [SliderId], [Baslik], [Url], [Target], [Resim], [Sira], [Aktif], [Tarih]) VALUES (1173, 11, N'KARCHER', N'www.kaercher.com.tr', N'_blank', N'karcher-logo sk-9961.jpg', 10, 1, CAST(N'2017-09-07T21:47:10.140' AS DateTime))
INSERT [dbo].[Slider] ([Id], [SliderId], [Baslik], [Url], [Target], [Resim], [Sira], [Aktif], [Tarih]) VALUES (1174, 11, N'PARLAX', N'www.parlax.com.tr', N'_blank', N'YAN BANNER copy.pdf45-1sk-2812.jpg', 11, 1, CAST(N'2017-09-07T21:48:28.297' AS DateTime))
INSERT [dbo].[Slider] ([Id], [SliderId], [Baslik], [Url], [Target], [Resim], [Sira], [Aktif], [Tarih]) VALUES (1175, 11, N'TESLA PLASTİK', N'www.teslaplastik.com', N'_blank', N'logo-darkKC2SK-828.jpg', 13, 1, CAST(N'2017-09-07T21:58:42.753' AS DateTime))
INSERT [dbo].[Slider] ([Id], [SliderId], [Baslik], [Url], [Target], [Resim], [Sira], [Aktif], [Tarih]) VALUES (1176, 12, N'AKTİVAL KİMYA AŞ', N'http://aktivalkimya.com/', N'_blank', N'LOGOKCSK-6953.jpg', 1, 1, CAST(N'2017-09-07T22:02:14.707' AS DateTime))
INSERT [dbo].[Slider] ([Id], [SliderId], [Baslik], [Url], [Target], [Resim], [Sira], [Aktif], [Tarih]) VALUES (1178, 7, N'KAZANCI PLASTİK', N'www.kazancplastik.com.tr', N'_blank', N'kazanckc11SK-2325.jpg', 1, 1, CAST(N'2017-09-07T22:15:35.753' AS DateTime))
INSERT [dbo].[Slider] ([Id], [SliderId], [Baslik], [Url], [Target], [Resim], [Sira], [Aktif], [Tarih]) VALUES (1179, 7, N'PORTSİS', N'www.portsisyazilim.com', N'_blank', N'Untitled-SK-3033.jpg', 2, 1, CAST(N'2017-09-07T22:35:52.993' AS DateTime))
INSERT [dbo].[Slider] ([Id], [SliderId], [Baslik], [Url], [Target], [Resim], [Sira], [Aktif], [Tarih]) VALUES (1180, 4, N'ECZACIBAŞI', N'www.eczacibasiprofesyonel.com', N'_blank', N'KC (2)SK-3142.jpg', 1, 1, CAST(N'2017-09-07T22:38:01.350' AS DateTime))
INSERT [dbo].[Slider] ([Id], [SliderId], [Baslik], [Url], [Target], [Resim], [Sira], [Aktif], [Tarih]) VALUES (1181, 8, N'KARCHER', N'www.kaercher.com', N'_blank', N'banner1KC11SK-345.jpg', 1, 1, CAST(N'2017-09-07T22:41:50.243' AS DateTime))
INSERT [dbo].[Slider] ([Id], [SliderId], [Baslik], [Url], [Target], [Resim], [Sira], [Aktif], [Tarih]) VALUES (1182, 3, N'METELER KAĞIT', N'http://www.meteler.com.tr/', N'_blank', N'SK-1682.jpg', 12, 1, CAST(N'2017-09-07T22:44:53.057' AS DateTime))
INSERT [dbo].[Slider] ([Id], [SliderId], [Baslik], [Url], [Target], [Resim], [Sira], [Aktif], [Tarih]) VALUES (1183, 3, N'TMT MAKİNA', N'www.tmtmakine.com', N'_blank', N'KC1TMTSK-7184.jpg', 13, 1, CAST(N'2017-09-07T22:46:53.963' AS DateTime))
INSERT [dbo].[Slider] ([Id], [SliderId], [Baslik], [Url], [Target], [Resim], [Sira], [Aktif], [Tarih]) VALUES (1184, 18, N'SPONSOR1', N'temizliksektoru.istanbul', N'_blank', N'temizlik sponsor 1 copy-1KCSK-391.jpg', 1, 1, CAST(N'2017-09-07T22:54:21.633' AS DateTime))
INSERT [dbo].[Slider] ([Id], [SliderId], [Baslik], [Url], [Target], [Resim], [Sira], [Aktif], [Tarih]) VALUES (1185, 2, N'KARUL KİMYA', N'http://www.krlkimya.com/', N'_blank', N'maxresdefault (1) (1)-5319.jpg', 18, 1, CAST(N'2017-09-07T23:03:23.747' AS DateTime))
INSERT [dbo].[Slider] ([Id], [SliderId], [Baslik], [Url], [Target], [Resim], [Sira], [Aktif], [Tarih]) VALUES (1186, 2, N'PARLAX', N'www.parlax.com.tr', N'_blank', N'extKCSK-3619.jpg', 19, 1, CAST(N'2017-09-07T23:07:17.573' AS DateTime))
SET IDENTITY_INSERT [dbo].[Slider] OFF
SET IDENTITY_INSERT [dbo].[SliderKategori] ON 

INSERT [dbo].[SliderKategori] ([SliderId], [SliderAdi], [Durum], [Kod]) VALUES (1, N'Ana Slider', 1, N'1')
INSERT [dbo].[SliderKategori] ([SliderId], [SliderAdi], [Durum], [Kod]) VALUES (2, N'Alt Slider', 1, N'2')
INSERT [dbo].[SliderKategori] ([SliderId], [SliderAdi], [Durum], [Kod]) VALUES (3, N'Üst 10 Reklam', 1, N'3')
INSERT [dbo].[SliderKategori] ([SliderId], [SliderAdi], [Durum], [Kod]) VALUES (4, N'A1 Tek Reklam', 1, N'4')
INSERT [dbo].[SliderKategori] ([SliderId], [SliderAdi], [Durum], [Kod]) VALUES (5, N'A2-2 Reklam', 1, N'5')
INSERT [dbo].[SliderKategori] ([SliderId], [SliderAdi], [Durum], [Kod]) VALUES (6, N'A3-5 Reklam', 1, N'6')
INSERT [dbo].[SliderKategori] ([SliderId], [SliderAdi], [Durum], [Kod]) VALUES (7, N'A4-2 Reklam', 1, N'7')
INSERT [dbo].[SliderKategori] ([SliderId], [SliderAdi], [Durum], [Kod]) VALUES (8, N'A5 Tek Reklam', 1, N'8')
INSERT [dbo].[SliderKategori] ([SliderId], [SliderAdi], [Durum], [Kod]) VALUES (9, N'A6-2 Reklam', 1, N'9')
INSERT [dbo].[SliderKategori] ([SliderId], [SliderAdi], [Durum], [Kod]) VALUES (10, N'A7-3 Reklam', 1, N'10')
INSERT [dbo].[SliderKategori] ([SliderId], [SliderAdi], [Durum], [Kod]) VALUES (11, N'A8 Tek Reklam', 1, N'11')
INSERT [dbo].[SliderKategori] ([SliderId], [SliderAdi], [Durum], [Kod]) VALUES (12, N'Anket Reklamı', 1, N'12')
INSERT [dbo].[SliderKategori] ([SliderId], [SliderAdi], [Durum], [Kod]) VALUES (13, N'Detay 2 Reklam', 1, N'13')
INSERT [dbo].[SliderKategori] ([SliderId], [SliderAdi], [Durum], [Kod]) VALUES (14, N'Kurum Detay 5 Reklam', 1, N'14')
INSERT [dbo].[SliderKategori] ([SliderId], [SliderAdi], [Durum], [Kod]) VALUES (15, N'Kurum Detay Üst 1 Reklam', 1, N'15')
INSERT [dbo].[SliderKategori] ([SliderId], [SliderAdi], [Durum], [Kod]) VALUES (16, N'Kategori Detay Üst 1 Reklam', 1, N'16')
INSERT [dbo].[SliderKategori] ([SliderId], [SliderAdi], [Durum], [Kod]) VALUES (17, N'A2-3 Reklam', 1, N'17')
INSERT [dbo].[SliderKategori] ([SliderId], [SliderAdi], [Durum], [Kod]) VALUES (18, N'Popup', 1, N'18')
INSERT [dbo].[SliderKategori] ([SliderId], [SliderAdi], [Durum], [Kod]) VALUES (19, N'Sponsor', 1, N'19')
INSERT [dbo].[SliderKategori] ([SliderId], [SliderAdi], [Durum], [Kod]) VALUES (20, N'Ayın En İyi Temizlik Şirketi', 1, N'20')
INSERT [dbo].[SliderKategori] ([SliderId], [SliderAdi], [Durum], [Kod]) VALUES (21, N'Ayın En İyi Tedarikçisi', 1, N'21')
INSERT [dbo].[SliderKategori] ([SliderId], [SliderAdi], [Durum], [Kod]) VALUES (22, N'Ayın En İyi Ürünü', 1, N'22')
INSERT [dbo].[SliderKategori] ([SliderId], [SliderAdi], [Durum], [Kod]) VALUES (23, N'Ayın En İyi İdaresici', 1, N'23')
INSERT [dbo].[SliderKategori] ([SliderId], [SliderAdi], [Durum], [Kod]) VALUES (24, N'Ayın En İyi Medical Firması', 1, N'24')
INSERT [dbo].[SliderKategori] ([SliderId], [SliderAdi], [Durum], [Kod]) VALUES (25, N'Ayın En İyi Diş Laburatuvarı', 1, N'25')
SET IDENTITY_INSERT [dbo].[SliderKategori] OFF
/****** Object:  Index [PK_ELMAH_Error]    Script Date: 9.9.2017 20:43:24 ******/
ALTER TABLE [dbo].[ELMAH_Error] ADD  CONSTRAINT [PK_ELMAH_Error] PRIMARY KEY NONCLUSTERED 
(
	[ErrorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Adminler] ADD  CONSTRAINT [DF_Admin_Aktif]  DEFAULT ((1)) FOR [Aktif]
GO
ALTER TABLE [dbo].[Adminler] ADD  CONSTRAINT [DF_Admin_Owner]  DEFAULT ((0)) FOR [Owner]
GO
ALTER TABLE [dbo].[AltKategoriler] ADD  CONSTRAINT [DF_AltKategoriler_Aktif]  DEFAULT ((1)) FOR [Aktif]
GO
ALTER TABLE [dbo].[AltKategoriler] ADD  CONSTRAINT [DF_AltKategoriler_Area]  DEFAULT ((1)) FOR [Area]
GO
ALTER TABLE [dbo].[AltKategoriler] ADD  CONSTRAINT [DF_AltKategoriler_Depart]  DEFAULT ((1)) FOR [Depart]
GO
ALTER TABLE [dbo].[Bulten] ADD  CONSTRAINT [DF_Bulten_Tarih]  DEFAULT (getdate()) FOR [Tarih]
GO
ALTER TABLE [dbo].[Cozumler] ADD  CONSTRAINT [DF_Cozumler_Aktif]  DEFAULT ((1)) FOR [Aktif]
GO
ALTER TABLE [dbo].[ELMAH_Error] ADD  CONSTRAINT [DF_ELMAH_Error_ErrorId]  DEFAULT (newid()) FOR [ErrorId]
GO
ALTER TABLE [dbo].[HaberKategorileri] ADD  CONSTRAINT [DF_HaberKategorileri_Aktif]  DEFAULT ((1)) FOR [Aktif]
GO
ALTER TABLE [dbo].[Haberler] ADD  CONSTRAINT [DF_Haberler_Aktif]  DEFAULT ((1)) FOR [Aktif]
GO
ALTER TABLE [dbo].[Haberler] ADD  CONSTRAINT [DF_Haberler_Hit]  DEFAULT ((1)) FOR [Hit]
GO
ALTER TABLE [dbo].[Kategoriler] ADD  CONSTRAINT [DF_Kategoriler_Aktif]  DEFAULT ((1)) FOR [Aktif]
GO
ALTER TABLE [dbo].[Kategoriler] ADD  CONSTRAINT [DF_Kategoriler_Area]  DEFAULT ((1)) FOR [Area]
GO
ALTER TABLE [dbo].[Kategoriler] ADD  CONSTRAINT [DF_Kategoriler_Depart]  DEFAULT ((1)) FOR [Depart]
GO
ALTER TABLE [dbo].[Markalar] ADD  CONSTRAINT [DF_Markalar_Aktif]  DEFAULT ((1)) FOR [Aktif]
GO
ALTER TABLE [dbo].[Markalar] ADD  CONSTRAINT [DF_Markalar_Area]  DEFAULT ((1)) FOR [Area]
GO
ALTER TABLE [dbo].[Markalar] ADD  CONSTRAINT [DF_Markalar_Depart]  DEFAULT ((1)) FOR [Depart]
GO
ALTER TABLE [dbo].[Markalar] ADD  CONSTRAINT [DF_Markalar_Sira]  DEFAULT ((1)) FOR [Sira]
GO
ALTER TABLE [dbo].[Sayfalar] ADD  CONSTRAINT [DF_Sayfalar_Aktif]  DEFAULT ((1)) FOR [Aktif]
GO
ALTER TABLE [dbo].[Slider] ADD  CONSTRAINT [DF_Slider_Aktif]  DEFAULT ((1)) FOR [Aktif]
GO
ALTER TABLE [dbo].[Slider] ADD  CONSTRAINT [DF_Slider_Tarih]  DEFAULT (getdate()) FOR [Tarih]
GO
ALTER TABLE [dbo].[AdminRolIliski]  WITH CHECK ADD  CONSTRAINT [FK_AdminRolIliski_Adminler] FOREIGN KEY([AdminId])
REFERENCES [dbo].[Adminler] ([AdminId])
GO
ALTER TABLE [dbo].[AdminRolIliski] CHECK CONSTRAINT [FK_AdminRolIliski_Adminler]
GO
ALTER TABLE [dbo].[AdminRolIliski]  WITH CHECK ADD  CONSTRAINT [FK_AdminRolIliski_AdminRolleri] FOREIGN KEY([RolId])
REFERENCES [dbo].[AdminRolleri] ([RolId])
GO
ALTER TABLE [dbo].[AdminRolIliski] CHECK CONSTRAINT [FK_AdminRolIliski_AdminRolleri]
GO
ALTER TABLE [dbo].[AltKategoriler]  WITH CHECK ADD  CONSTRAINT [FK_AltKategoriler_Kategoriler] FOREIGN KEY([KategoriId])
REFERENCES [dbo].[Kategoriler] ([KategoriId])
GO
ALTER TABLE [dbo].[AltKategoriler] CHECK CONSTRAINT [FK_AltKategoriler_Kategoriler]
GO
ALTER TABLE [dbo].[GaleriResim]  WITH CHECK ADD  CONSTRAINT [FK_GaleriResim_Galeriler] FOREIGN KEY([GaleriId])
REFERENCES [dbo].[Galeri] ([GaleriId])
GO
ALTER TABLE [dbo].[GaleriResim] CHECK CONSTRAINT [FK_GaleriResim_Galeriler]
GO
ALTER TABLE [dbo].[Haberler]  WITH CHECK ADD  CONSTRAINT [FK_Haberler_Galeri] FOREIGN KEY([GaleriId])
REFERENCES [dbo].[Galeri] ([GaleriId])
GO
ALTER TABLE [dbo].[Haberler] CHECK CONSTRAINT [FK_Haberler_Galeri]
GO
ALTER TABLE [dbo].[Haberler]  WITH CHECK ADD  CONSTRAINT [FK_Haberler_HaberKategorileri] FOREIGN KEY([KategoriId])
REFERENCES [dbo].[HaberKategorileri] ([KategoriId])
GO
ALTER TABLE [dbo].[Haberler] CHECK CONSTRAINT [FK_Haberler_HaberKategorileri]
GO
ALTER TABLE [dbo].[HaberlerResim]  WITH CHECK ADD  CONSTRAINT [FK_HaberlerResim_Galeriler] FOREIGN KEY([HaberlerId])
REFERENCES [dbo].[Haberler] ([Id])
GO
ALTER TABLE [dbo].[HaberlerResim] CHECK CONSTRAINT [FK_HaberlerResim_Galeriler]
GO
ALTER TABLE [dbo].[ilceler]  WITH CHECK ADD  CONSTRAINT [FK_Counties_Cities] FOREIGN KEY([ilId])
REFERENCES [dbo].[iller] ([ilId])
GO
ALTER TABLE [dbo].[ilceler] CHECK CONSTRAINT [FK_Counties_Cities]
GO
ALTER TABLE [dbo].[KurumEgitimciler]  WITH CHECK ADD  CONSTRAINT [FK_KurumEgitimciler_Kurumlar] FOREIGN KEY([KurumId])
REFERENCES [dbo].[Kurumlar] ([KurumId])
GO
ALTER TABLE [dbo].[KurumEgitimciler] CHECK CONSTRAINT [FK_KurumEgitimciler_Kurumlar]
GO
ALTER TABLE [dbo].[Kurumlar]  WITH CHECK ADD  CONSTRAINT [FK_Kurumlar_AltKategoriler] FOREIGN KEY([AltKategoriId])
REFERENCES [dbo].[AltKategoriler] ([AltKategoriId])
GO
ALTER TABLE [dbo].[Kurumlar] CHECK CONSTRAINT [FK_Kurumlar_AltKategoriler]
GO
ALTER TABLE [dbo].[Kurumlar]  WITH CHECK ADD  CONSTRAINT [FK_Kurumlar_ilceler] FOREIGN KEY([ilceId])
REFERENCES [dbo].[ilceler] ([ilceId])
GO
ALTER TABLE [dbo].[Kurumlar] CHECK CONSTRAINT [FK_Kurumlar_ilceler]
GO
ALTER TABLE [dbo].[Kurumlar]  WITH CHECK ADD  CONSTRAINT [FK_Kurumlar_iller] FOREIGN KEY([ilId])
REFERENCES [dbo].[iller] ([ilId])
GO
ALTER TABLE [dbo].[Kurumlar] CHECK CONSTRAINT [FK_Kurumlar_iller]
GO
ALTER TABLE [dbo].[Kurumlar]  WITH CHECK ADD  CONSTRAINT [FK_Kurumlar_Kategoriler] FOREIGN KEY([KategoriId])
REFERENCES [dbo].[Kategoriler] ([KategoriId])
GO
ALTER TABLE [dbo].[Kurumlar] CHECK CONSTRAINT [FK_Kurumlar_Kategoriler]
GO
ALTER TABLE [dbo].[KurumResim]  WITH CHECK ADD  CONSTRAINT [FK_KurumResim_Kurumlar] FOREIGN KEY([KurumId])
REFERENCES [dbo].[Kurumlar] ([KurumId])
GO
ALTER TABLE [dbo].[KurumResim] CHECK CONSTRAINT [FK_KurumResim_Kurumlar]
GO
ALTER TABLE [dbo].[Sayfalar]  WITH CHECK ADD  CONSTRAINT [FK_Sayfalar_Galeri] FOREIGN KEY([GaleriId])
REFERENCES [dbo].[Galeri] ([GaleriId])
GO
ALTER TABLE [dbo].[Sayfalar] CHECK CONSTRAINT [FK_Sayfalar_Galeri]
GO
ALTER TABLE [dbo].[Slider]  WITH CHECK ADD  CONSTRAINT [FK_Slider_SliderKategori] FOREIGN KEY([SliderId])
REFERENCES [dbo].[SliderKategori] ([SliderId])
GO
ALTER TABLE [dbo].[Slider] CHECK CONSTRAINT [FK_Slider_SliderKategori]
GO
/****** Object:  StoredProcedure [dbo].[ELMAH_GetErrorsXml]    Script Date: 9.9.2017 20:43:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 


CREATE PROCEDURE [dbo].[ELMAH_GetErrorsXml]
(
    @Application NVARCHAR(60),
    @PageIndex INT = 0,
    @PageSize INT = 15,
    @TotalCount INT OUTPUT
)
AS 

    SET NOCOUNT ON

    DECLARE @FirstTimeUTC DATETIME
    DECLARE @FirstSequence INT
    DECLARE @StartRow INT
    DECLARE @StartRowIndex INT

    SELECT 
        @TotalCount = COUNT(1) 
    FROM 
        [ELMAH_Error]
    WHERE 
        [Application] = @Application

    -- Get the ID of the first error for the requested page

    SET @StartRowIndex = @PageIndex * @PageSize + 1

    IF @StartRowIndex <= @TotalCount
    BEGIN

        SET ROWCOUNT @StartRowIndex

        SELECT  
            @FirstTimeUTC = [TimeUtc],
            @FirstSequence = [Sequence]
        FROM 
            [ELMAH_Error]
        WHERE   
            [Application] = @Application
        ORDER BY 
            [TimeUtc] DESC, 
            [Sequence] DESC

    END
    ELSE
    BEGIN

        SET @PageSize = 0

    END

    -- Now set the row count to the requested page size and get
    -- all records below it for the pertaining application.

    SET ROWCOUNT @PageSize

    SELECT 
        errorId     = [ErrorId], 
        application = [Application],
        host        = [Host], 
        type        = [Type],
        source      = [Source],
        message     = [Message],
        [user]      = [User],
        statusCode  = [StatusCode], 
        time        = CONVERT(VARCHAR(50), [TimeUtc], 126) + 'Z'
    FROM 
        [ELMAH_Error] error
    WHERE
        [Application] = @Application
    AND
        [TimeUtc] <= @FirstTimeUTC
    AND 
        [Sequence] <= @FirstSequence
    ORDER BY
        [TimeUtc] DESC, 
        [Sequence] DESC
    FOR
        XML AUTO





GO
/****** Object:  StoredProcedure [dbo].[ELMAH_GetErrorXml]    Script Date: 9.9.2017 20:43:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ELMAH_GetErrorXml]
(
    @Application NVARCHAR(60),
    @ErrorId UNIQUEIDENTIFIER
)
AS

    SET NOCOUNT ON

    SELECT 
        [AllXml]
    FROM 
        [ELMAH_Error]
    WHERE
        [ErrorId] = @ErrorId
    AND
        [Application] = @Application





GO
/****** Object:  StoredProcedure [dbo].[ELMAH_LogError]    Script Date: 9.9.2017 20:43:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ELMAH_LogError]
(
    @ErrorId UNIQUEIDENTIFIER,
    @Application NVARCHAR(60),
    @Host NVARCHAR(30),
    @Type NVARCHAR(100),
    @Source NVARCHAR(60),
    @Message NVARCHAR(500),
    @User NVARCHAR(50),
    @AllXml NTEXT,
    @StatusCode INT,
    @TimeUtc DATETIME
)
AS

    SET NOCOUNT ON

    INSERT
    INTO
        [ELMAH_Error]
        (
            [ErrorId],
            [Application],
            [Host],
            [Type],
            [Source],
            [Message],
            [User],
            [AllXml],
            [StatusCode],
            [TimeUtc]
        )
    VALUES
        (
            @ErrorId,
            @Application,
            @Host,
            @Type,
            @Source,
            @Message,
            @User,
            @AllXml,
            @StatusCode,
            @TimeUtc
        )





GO
/****** Object:  StoredProcedure [dbo].[Logger]    Script Date: 9.9.2017 20:43:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Logger]
(
	@LogType NVARCHAR(10),
	@Message NVARCHAR(MAX),
	@UrlReferrer NVARCHAR(200),
	@IPAddress NVARCHAR(16)
)
AS
	BEGIN
		INSERT INTO Nlog
		(
			LogDate,
			LogType,
			IPAddress,
			UrlReferrer,
			Message
		)
		VALUES
		(
			GETDATE(),
			@LogType,
			@IPAddress,
			@UrlReferrer,
			@Message
		)
		end


GO
/****** Object:  StoredProcedure [dbo].[sp_EniyiEgitimciler2]    Script Date: 9.9.2017 20:43:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_EniyiEgitimciler2]
as
	BEGIN
		 SELECT  EnSevdiginizEgitimciAdiSoyadi, KurumAdi,EnSevdiginizEgitimciAdiSoyadiResim,UploadYolu, COUNT(KurumId) AS sayi
FROM            dbo.VW_Anketler
GROUP BY EnSevdiginizEgitimciAdiSoyadi, KurumAdi,EnSevdiginizEgitimciAdiSoyadiResim,UploadYolu
ORDER BY sayi DESC
		end





GO
/****** Object:  StoredProcedure [dbo].[sp_Eniyikurumlar]    Script Date: 9.9.2017 20:43:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[sp_Eniyikurumlar]
as
	BEGIN
		 SELECT  KurumId, KurumAdi,Resim,UploadYolu, COUNT(KurumId) AS sayi
FROM            dbo.VW_Anketler
GROUP BY KurumId, KurumAdi,Resim,UploadYolu
ORDER BY sayi DESC
		end






GO
/****** Object:  StoredProcedure [dbo].[sp_EniyiYoneticiler1]    Script Date: 9.9.2017 20:43:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[sp_EniyiYoneticiler1]
as
	BEGIN
		 SELECT  EnSevdiginizYoneticiAdiSoyadi, KurumAdi,EnSevdiginizYoneticiAdiSoyadiResim,UploadYolu, COUNT(KurumId) AS sayi
FROM            dbo.VW_Anketler
GROUP BY EnSevdiginizYoneticiAdiSoyadi, KurumAdi,EnSevdiginizYoneticiAdiSoyadiResim,UploadYolu
ORDER BY sayi DESC
		end






GO
/****** Object:  StoredProcedure [dbo].[spEnSevdiginizEgitimciAdiSoyadi]    Script Date: 9.9.2017 20:43:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spEnSevdiginizEgitimciAdiSoyadi]
as
	BEGIN
		SELECT EnSevdiginizEgitimciAdiSoyadi, KurumAdi, COUNT(KurumId) AS sayi
			FROM            dbo.VW_Anketler
			GROUP BY EnSevdiginizEgitimciAdiSoyadi, KurumAdi
			ORDER BY sayi DESC
		end




GO
/****** Object:  StoredProcedure [dbo].[spVW_Eniyikurum]    Script Date: 9.9.2017 20:43:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spVW_Eniyikurum]
as
	BEGIN
		 SELECT  KurumId, KurumAdi, COUNT(KurumId) AS sayi
FROM            dbo.VW_Anketler
GROUP BY KurumId, KurumAdi
ORDER BY sayi DESC
		end




GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1 iş çözümleri, 2 yazılım çözümleri' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Cozumler', @level2type=N'COLUMN',@level2name=N'KategoriId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1 iş çözümleri, 2 yazılım çözümleri' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Haberler', @level2type=N'COLUMN',@level2name=N'KategoriId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1 iş çözümleri, 2 yazılım çözümleri' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sayfalar', @level2type=N'COLUMN',@level2name=N'KategoriId'
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
         Begin Table = "Anketler"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 279
               Right = 291
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "KurumEgitimciler"
            Begin Extent = 
               Top = 39
               Left = 1141
               Bottom = 253
               Right = 1373
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "KurumEgitimciler_1"
            Begin Extent = 
               Top = 1
               Left = 825
               Bottom = 291
               Right = 1020
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Kurumlar"
            Begin Extent = 
               Top = 6
               Left = 400
               Bottom = 276
               Right = 588
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
      Begin ColumnWidths = 39
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1980
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
 ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VW_Anketler'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'        Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VW_Anketler'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VW_Anketler'
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
         Begin Table = "VW_Anketler"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 307
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
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VW_EniyiEgitimci'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VW_EniyiEgitimci'
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
         Begin Table = "VW_Anketler"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 307
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
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VW_Eniyikurum'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VW_Eniyikurum'
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
         Begin Table = "VW_Anketler"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 307
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
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VW_EniyiYonetici'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VW_EniyiYonetici'
GO
USE [master]
GO
ALTER DATABASE [temizliksektoru] SET  READ_WRITE 
GO
