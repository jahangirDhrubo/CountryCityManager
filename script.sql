USE [master]
GO
/****** Object:  Database [CCM]    Script Date: 9/6/2015 3:04:58 PM ******/
CREATE DATABASE [CCM]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CCM', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\CCM.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'CCM_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\CCM_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [CCM] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CCM].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CCM] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CCM] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CCM] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CCM] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CCM] SET ARITHABORT OFF 
GO
ALTER DATABASE [CCM] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CCM] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CCM] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CCM] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CCM] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CCM] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CCM] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CCM] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CCM] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CCM] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CCM] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CCM] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CCM] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CCM] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CCM] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CCM] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CCM] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CCM] SET RECOVERY FULL 
GO
ALTER DATABASE [CCM] SET  MULTI_USER 
GO
ALTER DATABASE [CCM] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CCM] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CCM] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CCM] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [CCM] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'CCM', N'ON'
GO
USE [CCM]
GO
/****** Object:  Table [dbo].[City]    Script Date: 9/6/2015 3:04:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[City](
	[CityID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](256) NULL,
	[About] [varchar](8000) NULL,
	[NoOfDwellers] [int] NULL,
	[Location] [varchar](256) NULL,
	[Weather] [varchar](100) NULL,
	[CountryID] [int] NOT NULL,
 CONSTRAINT [PK_City] PRIMARY KEY CLUSTERED 
(
	[CityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Country]    Script Date: 9/6/2015 3:04:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Country](
	[CountryID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](256) NOT NULL,
	[About] [varchar](8000) NULL,
 CONSTRAINT [PK_Country] PRIMARY KEY CLUSTERED 
(
	[CountryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[City] ON 

INSERT [dbo].[City] ([CityID], [Name], [About], [NoOfDwellers], [Location], [Weather], [CountryID]) VALUES (1, N'Dhaka', N'<span style="font-family: arial, sans-serif; font-size: 13px; line-height: 16.12px;"><font color="#0000cc"><b>Dhaka</b></font></span><span style="font-family: arial, sans-serif; font-size: 13px; line-height: 16.12px;"><font color="#222222"> is the capital of </font><b style="color: #222222;">Bangladesh</b><font color="#222222">. It is the principal city of Dhaka District and Dhaka Division. The Dhaka Metropolitan Area is the </font><u style="color: #222222;">11th largest city</u><font color="#222222"> proper in the world, with a population of </font><b><font color="#cc0000">14 million people</font></b><font color="#222222">.</font></span>', 14400000, N'Located in central Bangladesh at 23°42''N 90°22''E', N' 34°C, Wind W at 14 km/h, 56% Humidity', 1)
INSERT [dbo].[City] ([CityID], [Name], [About], [NoOfDwellers], [Location], [Weather], [CountryID]) VALUES (2, N'Dinajpur', N'<span style="line-height: 16.12px;"><font face="verdana, arial, helvetica, sans-serif" size="2"><font color="#009933"><b>Dinajpu</b><b>r</b></font><font color="#222222"> is a district in Northern <u>Rangpu</u>r, Bangladesh. It is part of the Rangpur Division.</font></font></span>', 2990128, N'25.63°N 88.65°E', N'33°C, Wind W at 11 km/h, 66% Humidity', 1)
INSERT [dbo].[City] ([CityID], [Name], [About], [NoOfDwellers], [Location], [Weather], [CountryID]) VALUES (3, N'Rangpur', N'<font face="tahoma, arial, helvetica, sans-serif" size="3"><span style="line-height: 16.12px;"><font color="#006699"><b>Rangpur</b></font></span><span style="color: #222222; line-height: 16.12px;"><i> is a district in Northern <u>Bangladesh</u>. It is a part of the Rangpur Division.</i></span></font>', 2881086, N'25°44''N 89°15''E', N'31°C, Wind SW at 3 km/h, 77% Humidity', 1)
INSERT [dbo].[City] ([CityID], [Name], [About], [NoOfDwellers], [Location], [Weather], [CountryID]) VALUES (4, N'Berlin', N'&lt;span style=&quot;font&amp;#x2D;family&amp;#x3A;&amp;#x20;arial&amp;#x2C;&amp;#x20;sans&amp;#x2D;serif&amp;#x3B;&amp;#x20;font&amp;#x2D;size&amp;#x3A;&amp;#x20;13px&amp;#x3B;&amp;#x20;line&amp;#x2D;height&amp;#x3A;&amp;#x20;16&amp;#x2E;12px&amp;#x3B;&quot;&gt;&lt;font color=&quot;&amp;#x23;996666&quot;&gt;&lt;b&gt;Berlin&lt;/b&gt;&lt;/font&gt;&lt;/span&gt;&lt;span style=&quot;font&amp;#x2D;family&amp;#x3A;&amp;#x20;arial&amp;#x2C;&amp;#x20;sans&amp;#x2D;serif&amp;#x3B;&amp;#x20;font&amp;#x2D;size&amp;#x3A;&amp;#x20;13px&amp;#x3B;&amp;#x20;line&amp;#x2D;height&amp;#x3A;&amp;#x20;16&amp;#x2E;12px&amp;#x3B;&quot;&gt;&lt;font color=&quot;&amp;#x23;222222&quot;&gt;, Germany’s capital and cultural center, dates to the 13th century. Divided during the &lt;/font&gt;&lt;b&gt;&lt;u&gt;&lt;font color=&quot;&amp;#x23;ff0000&quot;&gt;Cold War&lt;/font&gt;&lt;/u&gt;&lt;/b&gt;&lt;font color=&quot;&amp;#x23;222222&quot;&gt;, today it&#39;s known for its art scene, nightlife and modern architecture, such as &lt;b&gt;&lt;u&gt;Mies van der Rohe’s&lt;/u&gt;&lt;/b&gt; landmark Neue Nationalgalerie. Reminders of the city&#39;s turbulent 20th-century history include its Holocaust Memorial and the Berlin Wall&#39;s graffitied remains. Its 18th-century &lt;b&gt;&lt;u&gt;Brandenburg Gate&lt;/u&gt;&lt;/b&gt; has become an iconic symbol of reunification.&lt;/font&gt;&lt;/span&gt;', 3375000, N'52°31''N 13°23''E', N'11°C, Wind W at 29 km/h, 95% Humidity', 5)
INSERT [dbo].[City] ([CityID], [Name], [About], [NoOfDwellers], [Location], [Weather], [CountryID]) VALUES (5, N'Beijing', N'&lt;span style=&quot;font&amp;#x2D;family&amp;#x3A;&amp;#x20;arial&amp;#x2C;&amp;#x20;sans&amp;#x2D;serif&amp;#x3B;&amp;#x20;font&amp;#x2D;size&amp;#x3A;&amp;#x20;13px&amp;#x3B;&amp;#x20;line&amp;#x2D;height&amp;#x3A;&amp;#x20;16&amp;#x2E;12px&amp;#x3B;&quot;&gt;&lt;font color=&quot;&amp;#x23;006666&quot;&gt;&lt;b&gt;Beijing&lt;/b&gt;&lt;/font&gt;&lt;/span&gt;&lt;span style=&quot;font&amp;#x2D;family&amp;#x3A;&amp;#x20;arial&amp;#x2C;&amp;#x20;sans&amp;#x2D;serif&amp;#x3B;&amp;#x20;font&amp;#x2D;size&amp;#x3A;&amp;#x20;13px&amp;#x3B;&amp;#x20;line&amp;#x2D;height&amp;#x3A;&amp;#x20;16&amp;#x2E;12px&amp;#x3B;&quot;&gt;&lt;font color=&quot;&amp;#x23;222222&quot;&gt;, China’s massive capital, has history stretching back 3 millennia. Yet it’s known as much for its modern architecture as its ancient sites such as the grand&lt;/font&gt;&lt;b&gt;&lt;i&gt; &lt;font color=&quot;&amp;#x23;6666cc&quot;&gt;Forbidden City complex&lt;/font&gt;&lt;/i&gt;&lt;/b&gt;&lt;font color=&quot;&amp;#x23;222222&quot;&gt;, the imperial palace during the &lt;/font&gt;&lt;u style=&quot;color&amp;#x3A;&amp;#x20;&amp;#x23;222222&amp;#x3B;&quot;&gt;Ming and Qing dynasties&lt;/u&gt;&lt;font color=&quot;&amp;#x23;222222&quot;&gt;. Nearby, the massive Tiananmen Square pedestrian plaza is site of Mao Zedong’s mausoleum and the National Museum of China, displaying a vast collection of cultural relics.&lt;/font&gt;&lt;/span&gt;', 11510000, N'39°55''N 116°23''E', N'28°C, Wind W at 6 km/h, 39% Humidity', 3)
INSERT [dbo].[City] ([CityID], [Name], [About], [NoOfDwellers], [Location], [Weather], [CountryID]) VALUES (6, N'Tokyo', N'&lt;span style=&quot;font&amp;#x2D;family&amp;#x3A;&amp;#x20;arial&amp;#x2C;&amp;#x20;sans&amp;#x2D;serif&amp;#x3B;&amp;#x20;font&amp;#x2D;size&amp;#x3A;&amp;#x20;13px&amp;#x3B;&amp;#x20;line&amp;#x2D;height&amp;#x3A;&amp;#x20;16&amp;#x2E;12px&amp;#x3B;&quot;&gt;&lt;font color=&quot;&amp;#x23;993399&quot;&gt;&lt;b&gt;Tokyo&lt;/b&gt;&lt;/font&gt;&lt;/span&gt;&lt;span style=&quot;font&amp;#x2D;family&amp;#x3A;&amp;#x20;arial&amp;#x2C;&amp;#x20;sans&amp;#x2D;serif&amp;#x3B;&amp;#x20;font&amp;#x2D;size&amp;#x3A;&amp;#x20;13px&amp;#x3B;&amp;#x20;line&amp;#x2D;height&amp;#x3A;&amp;#x20;16&amp;#x2E;12px&amp;#x3B;&quot;&gt;&lt;font color=&quot;&amp;#x23;222222&quot;&gt;, Japan’s bustling capital, mixes the ultramodern and the traditional, from neon-lit skyscrapers and&lt;/font&gt;&lt;b style=&quot;color&amp;#x3A;&amp;#x20;&amp;#x23;222222&amp;#x3B;&quot;&gt;&lt;u&gt;&lt;i&gt; anime shops&lt;/i&gt;&lt;/u&gt;&lt;/b&gt;&lt;font color=&quot;&amp;#x23;222222&quot;&gt; to cherry trees and temples. The opulent Meiji Shinto &lt;/font&gt;&lt;b&gt;&lt;u&gt;&lt;font color=&quot;&amp;#x23;cc33ff&quot;&gt;Shrine&lt;/font&gt;&lt;/u&gt;&lt;/b&gt;&lt;font color=&quot;&amp;#x23;222222&quot;&gt; is known for its towering gate and surrounding forests. The Imperial Palace sits amid sprawling public gardens. The city is famed for its &lt;/font&gt;&lt;u&gt;&lt;font color=&quot;&amp;#x23;cc9933&quot;&gt;vibrant food scene&lt;/font&gt;&lt;/u&gt;&lt;font color=&quot;&amp;#x23;222222&quot;&gt;, and its &lt;b&gt;Shibuya&lt;/b&gt; and &lt;b&gt;Harajuku&lt;/b&gt; districts are the heart of its trendy teen fashion scene.&lt;/font&gt;&lt;/span&gt;', 13530000, N'35°41''N 139°41''E', N'24°C, Wind S at 14 km/h, 82% Humidity', 4)
INSERT [dbo].[City] ([CityID], [Name], [About], [NoOfDwellers], [Location], [Weather], [CountryID]) VALUES (7, N'London', N'&lt;span style=&quot;font&amp;#x2D;family&amp;#x3A;&amp;#x20;arial&amp;#x2C;&amp;#x20;sans&amp;#x2D;serif&amp;#x3B;&amp;#x20;font&amp;#x2D;size&amp;#x3A;&amp;#x20;13px&amp;#x3B;&amp;#x20;line&amp;#x2D;height&amp;#x3A;&amp;#x20;16&amp;#x2E;12px&amp;#x3B;&quot;&gt;&lt;b&gt;&lt;font color=&quot;&amp;#x23;ff0000&quot;&gt;London&lt;/font&gt;&lt;/b&gt;&lt;font color=&quot;&amp;#x23;222222&quot;&gt;, England’s capital, set on the River &lt;/font&gt;&lt;b style=&quot;color&amp;#x3A;&amp;#x20;&amp;#x23;222222&amp;#x3B;&quot;&gt;Thames&lt;/b&gt;&lt;font color=&quot;&amp;#x23;222222&quot;&gt;, is a 21st-century city with history stretching back to &lt;/font&gt;&lt;u&gt;&lt;font color=&quot;&amp;#x23;333399&quot;&gt;Roman times&lt;/font&gt;&lt;/u&gt;&lt;font color=&quot;&amp;#x23;222222&quot;&gt;. At its centre stand the imposing Houses of Parliament, the iconic ‘&lt;/font&gt;&lt;b&gt;&lt;i&gt;&lt;font color=&quot;&amp;#x23;000066&quot;&gt;Big Ben&lt;/font&gt;&lt;/i&gt;&lt;/b&gt;&lt;font color=&quot;&amp;#x23;222222&quot;&gt;’ clock tower and Westminster Abbey, site of British monarch coronations. Across the Thames, the &lt;i&gt;London Eye&lt;/i&gt; observation wheel provides panoramic views of the South Bank cultural complex, and the entire city.&lt;/font&gt;&lt;/span&gt;', 8630000, N'51°30''26?N 0°7''39?W', N'2°C, Wind W at 8 km/h, 70% Humidity', 6)
INSERT [dbo].[City] ([CityID], [Name], [About], [NoOfDwellers], [Location], [Weather], [CountryID]) VALUES (8, N'New Delhi', N'&lt;span style=&quot;font&amp;#x2D;family&amp;#x3A;&amp;#x20;arial&amp;#x2C;&amp;#x20;sans&amp;#x2D;serif&amp;#x3B;&amp;#x20;font&amp;#x2D;size&amp;#x3A;&amp;#x20;13px&amp;#x3B;&amp;#x20;line&amp;#x2D;height&amp;#x3A;&amp;#x20;16&amp;#x2E;12px&amp;#x3B;&quot;&gt;&lt;font color=&quot;&amp;#x23;330000&quot;&gt;&lt;b&gt;Delhi&lt;/b&gt;&lt;/font&gt;&lt;/span&gt;&lt;span style=&quot;font&amp;#x2D;family&amp;#x3A;&amp;#x20;arial&amp;#x2C;&amp;#x20;sans&amp;#x2D;serif&amp;#x3B;&amp;#x20;font&amp;#x2D;size&amp;#x3A;&amp;#x20;13px&amp;#x3B;&amp;#x20;line&amp;#x2D;height&amp;#x3A;&amp;#x20;16&amp;#x2E;12px&amp;#x3B;&quot;&gt;&lt;font color=&quot;&amp;#x23;222222&quot;&gt;, India’s capital territory, is a massive metropolitan area in the country’s north. In Old Delhi, a neighborhood dating to the 1600s, stands the imposing &lt;/font&gt;&lt;b&gt;&lt;i&gt;&lt;font color=&quot;&amp;#x23;003300&quot;&gt;Mughal-era Red Fort&lt;/font&gt;&lt;/i&gt;&lt;/b&gt;&lt;font color=&quot;&amp;#x23;222222&quot;&gt;, a symbol of India, and the sprawling &lt;/font&gt;&lt;b&gt;&lt;i&gt;&lt;font color=&quot;&amp;#x23;0033cc&quot;&gt;Jama Masjid mosque&lt;/font&gt;&lt;/i&gt;&lt;/b&gt;&lt;font color=&quot;&amp;#x23;222222&quot;&gt;, whose courtyard accommodates 25,000. Nearby is &lt;u&gt;Chandni Chowk&lt;/u&gt;, a vibrant bazaar filled with food carts, sweets shops and spice stalls.&lt;/font&gt;&lt;/span&gt;', 302363, N'28°36''50?N 77°12''32?E', N'35°C, Wind NW at 14 km/h, 36% Humidity', 2)
SET IDENTITY_INSERT [dbo].[City] OFF
SET IDENTITY_INSERT [dbo].[Country] ON 

INSERT [dbo].[Country] ([CountryID], [Name], [About]) VALUES (1, N'Bangladesh', N'&lt;span style=&quot;font&amp;#x2D;family&amp;#x3A;&amp;#x20;arial&amp;#x2C;&amp;#x20;sans&amp;#x2D;serif&amp;#x3B;&amp;#x20;font&amp;#x2D;size&amp;#x3A;&amp;#x20;13px&amp;#x3B;&amp;#x20;line&amp;#x2D;height&amp;#x3A;&amp;#x20;16&amp;#x2E;12px&amp;#x3B;&quot;&gt;&lt;b&gt;&lt;font color=&quot;&amp;#x23;006633&quot;&gt;Bangladesh&lt;/font&gt;&lt;/b&gt;&lt;font color=&quot;&amp;#x23;222222&quot;&gt;, east of India on the &lt;/font&gt;&lt;font color=&quot;&amp;#x23;0099cc&quot;&gt;Bay of Bengal,&lt;/font&gt;&lt;font color=&quot;&amp;#x23;222222&quot;&gt; is South Asian country of lush greenery and many waterways. Its Padma (Ganges), Meghna and Jamuna rivers create fertile alluvial plains, and travel by boat is common. On the southern coast, the&lt;b&gt; Sundarbans&lt;/b&gt;, an enormous mangrove forest shared with India, are home to the &lt;/font&gt;&lt;font color=&quot;&amp;#x23;cc0000&quot;&gt;&lt;b&gt;Royal Bengal tiger&lt;/b&gt;&lt;/font&gt;&lt;font color=&quot;&amp;#x23;222222&quot;&gt;.&lt;/font&gt;&lt;/span&gt;')
INSERT [dbo].[Country] ([CountryID], [Name], [About]) VALUES (2, N'India', N'&lt;span style=&quot;font&amp;#x2D;family&amp;#x3A;&amp;#x20;arial&amp;#x2C;&amp;#x20;sans&amp;#x2D;serif&amp;#x3B;&amp;#x20;font&amp;#x2D;size&amp;#x3A;&amp;#x20;13px&amp;#x3B;&amp;#x20;line&amp;#x2D;height&amp;#x3A;&amp;#x20;16&amp;#x2E;12px&amp;#x3B;&quot;&gt;&lt;font color=&quot;&amp;#x23;cc0000&quot;&gt;India&lt;/font&gt;&lt;/span&gt;&lt;span style=&quot;font&amp;#x2D;family&amp;#x3A;&amp;#x20;arial&amp;#x2C;&amp;#x20;sans&amp;#x2D;serif&amp;#x3B;&amp;#x20;font&amp;#x2D;size&amp;#x3A;&amp;#x20;13px&amp;#x3B;&amp;#x20;line&amp;#x2D;height&amp;#x3A;&amp;#x20;16&amp;#x2E;12px&amp;#x3B;&quot;&gt;&lt;font color=&quot;&amp;#x23;222222&quot;&gt; is a vast South Asian country with diverse terrain – from Himalayan peaks to Indian Ocean coastline – and history reaching back 5 millennia. In the north,&lt;/font&gt;&lt;b style=&quot;color&amp;#x3A;&amp;#x20;&amp;#x23;222222&amp;#x3B;&quot;&gt; Mughal Empire&lt;/b&gt;&lt;font color=&quot;&amp;#x23;222222&quot;&gt; landmarks include &lt;/font&gt;&lt;b&gt;&lt;font color=&quot;&amp;#x23;cc0000&quot;&gt;Delhi’s Red Fort complex&lt;/font&gt;&lt;/b&gt;&lt;font color=&quot;&amp;#x23;222222&quot;&gt;, massive Jama Masjid mosque and Agra’s iconic &lt;/font&gt;&lt;b style=&quot;color&amp;#x3A;&amp;#x20;&amp;#x23;222222&amp;#x3B;&quot;&gt;Taj Mahal&lt;/b&gt;&lt;font color=&quot;&amp;#x23;222222&quot;&gt; mausoleum.&lt;/font&gt;&lt;/span&gt;')
INSERT [dbo].[Country] ([CountryID], [Name], [About]) VALUES (3, N'China', N'&lt;span style=&quot;font&amp;#x2D;family&amp;#x3A;&amp;#x20;arial&amp;#x2C;&amp;#x20;sans&amp;#x2D;serif&amp;#x3B;&amp;#x20;font&amp;#x2D;size&amp;#x3A;&amp;#x20;13px&amp;#x3B;&amp;#x20;line&amp;#x2D;height&amp;#x3A;&amp;#x20;16&amp;#x2E;12px&amp;#x3B;&quot;&gt;&lt;font color=&quot;&amp;#x23;ff0000&quot;&gt;&lt;b&gt;China&lt;/b&gt;&lt;/font&gt;&lt;/span&gt;&lt;span style=&quot;font&amp;#x2D;family&amp;#x3A;&amp;#x20;arial&amp;#x2C;&amp;#x20;sans&amp;#x2D;serif&amp;#x3B;&amp;#x20;font&amp;#x2D;size&amp;#x3A;&amp;#x20;13px&amp;#x3B;&amp;#x20;line&amp;#x2D;height&amp;#x3A;&amp;#x20;16&amp;#x2E;12px&amp;#x3B;&quot;&gt;&lt;font color=&quot;&amp;#x23;222222&quot;&gt;, a communist nation in East Asia, is &lt;/font&gt;&lt;u&gt;&lt;font color=&quot;&amp;#x23;ff9933&quot;&gt;the world’s most populous country&lt;/font&gt;&lt;/u&gt;&lt;font color=&quot;&amp;#x23;222222&quot;&gt;. &lt;/font&gt;&lt;b style=&quot;color&amp;#x3A;&amp;#x20;&amp;#x23;222222&amp;#x3B;&quot;&gt;Beijing&lt;/b&gt;&lt;font color=&quot;&amp;#x23;222222&quot;&gt;, the ancient capital, mixes modern architecture with historic sites including sprawling &lt;/font&gt;&lt;b&gt;&lt;font color=&quot;&amp;#x23;000099&quot;&gt;Tiananmen Square&lt;/font&gt;&lt;/b&gt;&lt;font color=&quot;&amp;#x23;222222&quot;&gt;. Its largest city, Shanghai, is a skyscraper-studded global financial center. The iconic &lt;b&gt;&lt;i&gt;Great Wall of China&lt;/i&gt;&lt;/b&gt; fortification runs east-west across the country&#39;s north.&lt;/font&gt;&lt;/span&gt;')
INSERT [dbo].[Country] ([CountryID], [Name], [About]) VALUES (4, N'Japan', N'&lt;span style=&quot;font&amp;#x2D;family&amp;#x3A;&amp;#x20;arial&amp;#x2C;&amp;#x20;sans&amp;#x2D;serif&amp;#x3B;&amp;#x20;font&amp;#x2D;size&amp;#x3A;&amp;#x20;13px&amp;#x3B;&amp;#x20;line&amp;#x2D;height&amp;#x3A;&amp;#x20;16&amp;#x2E;12px&amp;#x3B;&quot;&gt;&lt;span style=&quot;background&amp;#x2D;color&amp;#x3A;&amp;#x20;&amp;#x23;ccccff&amp;#x3B;&quot;&gt;&lt;font color=&quot;&amp;#x23;ff0000&quot;&gt;&lt;b&gt;Japan&lt;/b&gt;&lt;/font&gt;&lt;/span&gt;&lt;font color=&quot;&amp;#x23;222222&quot;&gt;&lt;b&gt; &lt;/b&gt;is an island nation in the &lt;u&gt;Pacific Ocean&lt;/u&gt; with high-rise-filled cities, imperial palaces, mountainous national parks and thousands of shrines and temples. &lt;b&gt;Tokyo&lt;/b&gt;, the crowded capital, is known for its neon skyscrapers and pop culture. In contrast, Kyoto offers &lt;u&gt;Buddhist temples&lt;/u&gt;, Shinto shrines, gardens and cherry blossoms. &lt;/font&gt;&lt;font color=&quot;&amp;#x23;cc0000&quot;&gt;&lt;b&gt;Sushi&lt;/b&gt;&lt;/font&gt;&lt;font color=&quot;&amp;#x23;222222&quot;&gt;&lt;b&gt;,&lt;/b&gt; the national dish, is served everywhere from casual pubs to gourmet restaurants.&lt;/font&gt;&lt;/span&gt;')
INSERT [dbo].[Country] ([CountryID], [Name], [About]) VALUES (5, N'Germany', N'&lt;span style=&quot;font&amp;#x2D;family&amp;#x3A;&amp;#x20;arial&amp;#x2C;&amp;#x20;sans&amp;#x2D;serif&amp;#x3B;&amp;#x20;font&amp;#x2D;size&amp;#x3A;&amp;#x20;13px&amp;#x3B;&amp;#x20;line&amp;#x2D;height&amp;#x3A;&amp;#x20;16&amp;#x2E;12px&amp;#x3B;&quot;&gt;&lt;span style=&quot;background&amp;#x2D;color&amp;#x3A;&amp;#x20;&amp;#x23;0&amp;#x3B;&quot;&gt;&lt;font color=&quot;&amp;#x23;ffff33&quot;&gt;&lt;b&gt;Germany&lt;/b&gt;&lt;/font&gt;&lt;/span&gt;&lt;font color=&quot;&amp;#x23;222222&quot;&gt; is a Western European country with a terrain of vast forests, rivers and mountain ranges, and 2 millennia of history.&lt;/font&gt;&lt;b style=&quot;color&amp;#x3A;&amp;#x20;&amp;#x23;222222&amp;#x3B;&quot;&gt; Berlin,&lt;/b&gt;&lt;font color=&quot;&amp;#x23;222222&quot;&gt; its capital, is home to thriving art and nightlife scenes, iconic &lt;/font&gt;&lt;b&gt;&lt;i&gt;&lt;font color=&quot;&amp;#x23;999933&quot;&gt;Brandenburg Gate &lt;/font&gt;&lt;/i&gt;&lt;/b&gt;&lt;font color=&quot;&amp;#x23;222222&quot;&gt;and many sites relating to &lt;b&gt;WWII&lt;/b&gt;. Munich is known for its Oktoberfest and cavernous beer halls, including 16th-century Hofbr&#228;uhaus. &lt;b&gt;Frankfurt&lt;/b&gt;, with its &lt;u&gt;skyscrapers&lt;/u&gt;, houses the &lt;u&gt;European Central Bank&lt;/u&gt;.&lt;/font&gt;&lt;/span&gt;')
INSERT [dbo].[Country] ([CountryID], [Name], [About]) VALUES (6, N'England', N'&lt;span style=&quot;font&amp;#x2D;family&amp;#x3A;&amp;#x20;arial&amp;#x2C;&amp;#x20;sans&amp;#x2D;serif&amp;#x3B;&amp;#x20;font&amp;#x2D;size&amp;#x3A;&amp;#x20;13px&amp;#x3B;&amp;#x20;line&amp;#x2D;height&amp;#x3A;&amp;#x20;16&amp;#x2E;12px&amp;#x3B;&quot;&gt;&lt;font color=&quot;&amp;#x23;ff3300&quot;&gt;&lt;b&gt;England&lt;/b&gt;&lt;/font&gt;&lt;/span&gt;&lt;span style=&quot;font&amp;#x2D;family&amp;#x3A;&amp;#x20;arial&amp;#x2C;&amp;#x20;sans&amp;#x2D;serif&amp;#x3B;&amp;#x20;font&amp;#x2D;size&amp;#x3A;&amp;#x20;13px&amp;#x3B;&amp;#x20;line&amp;#x2D;height&amp;#x3A;&amp;#x20;16&amp;#x2E;12px&amp;#x3B;&quot;&gt;&lt;b style=&quot;color&amp;#x3A;&amp;#x20;&amp;#x23;222222&amp;#x3B;&quot;&gt; &lt;/b&gt;&lt;font color=&quot;&amp;#x23;222222&quot;&gt;– birthplace of &lt;/font&gt;&lt;b&gt;&lt;u&gt;&lt;i&gt;&lt;font color=&quot;&amp;#x23;0000ff&quot;&gt;Shakespeare and The Beatles&lt;/font&gt;&lt;/i&gt;&lt;/u&gt;&lt;/b&gt;&lt;font color=&quot;&amp;#x23;222222&quot;&gt; – is a country in the British Isles bordering Scotland and Wales. The capital, &lt;/font&gt;&lt;b style=&quot;color&amp;#x3A;&amp;#x20;&amp;#x23;222222&amp;#x3B;&quot;&gt;London&lt;/b&gt;&lt;font color=&quot;&amp;#x23;222222&quot;&gt;, on the River Thames, is home of Parliament and the 11th-century Tower of London, but is also a multicultural, 21st-century hub for the arts and business in &quot;&lt;/font&gt;&lt;u style=&quot;color&amp;#x3A;&amp;#x20;&amp;#x23;222222&amp;#x3B;&quot;&gt;The City&lt;/u&gt;&lt;font color=&quot;&amp;#x23;222222&quot;&gt;.&quot; Other large cities are &lt;/font&gt;&lt;u style=&quot;color&amp;#x3A;&amp;#x20;&amp;#x23;222222&amp;#x3B;&quot;&gt;Manchester, Birmingham, Liverpool, Bristol&lt;/u&gt;&lt;font color=&quot;&amp;#x23;222222&quot;&gt; and the university centres of &lt;/font&gt;&lt;b&gt;&lt;font color=&quot;&amp;#x23;000033&quot;&gt;Oxford and Cambridge&lt;/font&gt;&lt;/b&gt;&lt;font color=&quot;&amp;#x23;222222&quot;&gt;.&lt;/font&gt;&lt;/span&gt;')
SET IDENTITY_INSERT [dbo].[Country] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_City]    Script Date: 9/6/2015 3:04:58 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_City] ON [dbo].[City]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Country]    Script Date: 9/6/2015 3:04:58 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Country] ON [dbo].[Country]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[City]  WITH CHECK ADD  CONSTRAINT [FK_City_Country] FOREIGN KEY([CountryID])
REFERENCES [dbo].[Country] ([CountryID])
GO
ALTER TABLE [dbo].[City] CHECK CONSTRAINT [FK_City_Country]
GO
USE [master]
GO
ALTER DATABASE [CCM] SET  READ_WRITE 
GO
