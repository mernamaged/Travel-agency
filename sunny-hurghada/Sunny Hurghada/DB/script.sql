USE [SunnyHurghada]
GO
/****** Object:  Table [dbo].[Destination]    Script Date: 06/05/2025 19:55:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Destination](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](20) NOT NULL,
	[Photo] [nvarchar](200) NOT NULL,
	[Dicount] [int] NOT NULL,
 CONSTRAINT [PK_Destination] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Guest]    Script Date: 06/05/2025 19:55:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Guest](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FullName] [varchar](30) NOT NULL,
	[Email] [varchar](100) NOT NULL,
	[Phone] [varchar](20) NOT NULL,
 CONSTRAINT [PK_Guest] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Language]    Script Date: 06/05/2025 19:55:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Language](
	[Id] [int] NOT NULL,
	[Name] [varchar](10) NOT NULL,
 CONSTRAINT [PK_Language] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tour]    Script Date: 06/05/2025 19:55:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tour](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DestinationId] [int] NOT NULL,
	[TourTypeId] [int] NOT NULL,
	[Duration] [char](3) NOT NULL,
	[AdultPrice] [decimal](6, 2) NOT NULL,
	[ChildPrice] [decimal](6, 2) NOT NULL,
	[Discount] [int] NOT NULL,
	[MainPhoto] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_Tour] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TourBooking]    Script Date: 06/05/2025 19:55:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TourBooking](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TourId] [int] NOT NULL,
	[GuestId] [int] NOT NULL,
	[TripDate] [date] NOT NULL,
	[Adults] [int] NOT NULL,
	[Children] [int] NOT NULL,
	[Nationality] [varchar](50) NOT NULL,
	[SpecialRequest] [nchar](10) NULL,
	[TotalAmount] [decimal](10, 2) NOT NULL,
	[Status] [nvarchar](20) NOT NULL,
	[CreatedAt] [smalldatetime] NOT NULL,
 CONSTRAINT [PK_TourBooking] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TourLocalized]    Script Date: 06/05/2025 19:55:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TourLocalized](
	[LanguageId] [int] NOT NULL,
	[TourId] [int] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](255) NOT NULL,
	[includes] [nvarchar](500) NOT NULL,
	[Excludes] [nvarchar](500) NOT NULL,
	[WhatToBring] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_TourLocalized] PRIMARY KEY CLUSTERED 
(
	[LanguageId] ASC,
	[TourId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TourPhoto]    Script Date: 06/05/2025 19:55:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TourPhoto](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TourId] [int] NOT NULL,
	[Photo] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_TourPhoto] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TourType]    Script Date: 06/05/2025 19:55:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TourType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Photo] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_TourType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TourTypeLocalized]    Script Date: 06/05/2025 19:55:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TourTypeLocalized](
	[LanguageId] [int] NOT NULL,
	[TourTypeId] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_TourTypeLocalized] PRIMARY KEY CLUSTERED 
(
	[LanguageId] ASC,
	[TourTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TransferBooking]    Script Date: 06/05/2025 19:55:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TransferBooking](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[GuestId] [int] NOT NULL,
	[Destination] [varchar](50) NOT NULL,
	[PickUpLocation] [nvarchar](200) NOT NULL,
	[Adults] [int] NOT NULL,
	[Children] [int] NOT NULL,
	[PickUpDateTime] [smalldatetime] NOT NULL,
	[SpecialRequest] [nvarchar](250) NULL,
	[TotalAmount] [decimal](10, 2) NOT NULL,
	[Status] [nvarchar](20) NOT NULL,
	[CreatedAt] [smalldatetime] NOT NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Destination] ON 

INSERT [dbo].[Destination] ([Id], [Name], [Photo], [Dicount]) VALUES (1, N'Hurghada', N'hurghada.jpg', 50)
INSERT [dbo].[Destination] ([Id], [Name], [Photo], [Dicount]) VALUES (2, N'Marsa Alam', N'marsaalam.jpg', 40)
INSERT [dbo].[Destination] ([Id], [Name], [Photo], [Dicount]) VALUES (3, N'Cairo & Giza', N'cairo-giza.jpg', 20)
SET IDENTITY_INSERT [dbo].[Destination] OFF
GO
INSERT [dbo].[Language] ([Id], [Name]) VALUES (7, N'DE')
INSERT [dbo].[Language] ([Id], [Name]) VALUES (1049, N'RU')
INSERT [dbo].[Language] ([Id], [Name]) VALUES (2057, N'EN')
GO
SET IDENTITY_INSERT [dbo].[Tour] ON 

INSERT [dbo].[Tour] ([Id], [DestinationId], [TourTypeId], [Duration], [AdultPrice], [ChildPrice], [Discount], [MainPhoto]) VALUES (1, 1, 1, N'8  ', CAST(30.00 AS Decimal(6, 2)), CAST(15.00 AS Decimal(6, 2)), 10, N'gifton-island.jpg')
INSERT [dbo].[Tour] ([Id], [DestinationId], [TourTypeId], [Duration], [AdultPrice], [ChildPrice], [Discount], [MainPhoto]) VALUES (2, 2, 1, N'7  ', CAST(90.00 AS Decimal(6, 2)), CAST(15.00 AS Decimal(6, 2)), 32, N'wadi-qulan.jpg')
INSERT [dbo].[Tour] ([Id], [DestinationId], [TourTypeId], [Duration], [AdultPrice], [ChildPrice], [Discount], [MainPhoto]) VALUES (3, 1, 1, N'12 ', CAST(64.00 AS Decimal(6, 2)), CAST(15.00 AS Decimal(6, 2)), 29, N'mount-sinai.jpg')
INSERT [dbo].[Tour] ([Id], [DestinationId], [TourTypeId], [Duration], [AdultPrice], [ChildPrice], [Discount], [MainPhoto]) VALUES (4, 3, 1, N'8  ', CAST(50.00 AS Decimal(6, 2)), CAST(15.00 AS Decimal(6, 2)), 30, N'pyramids-of-giza.jpg')
INSERT [dbo].[Tour] ([Id], [DestinationId], [TourTypeId], [Duration], [AdultPrice], [ChildPrice], [Discount], [MainPhoto]) VALUES (5, 1, 1, N'4  ', CAST(20.00 AS Decimal(6, 2)), CAST(15.00 AS Decimal(6, 2)), 50, N'desert-safari.jpg')
INSERT [dbo].[Tour] ([Id], [DestinationId], [TourTypeId], [Duration], [AdultPrice], [ChildPrice], [Discount], [MainPhoto]) VALUES (6, 1, 1, N'9  ', CAST(25.00 AS Decimal(6, 2)), CAST(15.00 AS Decimal(6, 2)), 40, N'dolphins.jpg')
SET IDENTITY_INSERT [dbo].[Tour] OFF
GO
INSERT [dbo].[TourLocalized] ([LanguageId], [TourId], [Name], [Description], [includes], [Excludes], [WhatToBring]) VALUES (7, 1, N'Giftun Island', N'Breng een dag door met cruisen rond de eilanden van Orange en Giftun en ervaar de schoonheid van het gebied en het onderwaterleven van de Rode Zee. Je stopt bij 2 verschillende snorkelplekken waar je prachtige koralen en vissen kunt zien.', N'Toegangskosten voor het eiland/ Natuurbeveiligingskosten/ Retour hoteltransfers/ Transfers per airconditioned voertuig/ Professionele gids/ 2 uur op de eilanden/ Ferryboot rit/ Gratis WiFi/ Fooien/ EHBO-doos/ Snorkelen op twee locaties/ Lunch, fruit, frisdranken/ Snorkeluitrusting, vinnen en reddingsvesten', N'Toegangskosten voor het eiland/ Natuurbeveiligingskosten/ Retour hoteltransfers/ Transfers per airconditioned voertuig/ Professionele gids/ 2 uur op de eilanden/ Ferryboot rit/ Gratis WiFi/ Fooien/ EHBO-doos/ Snorkelen op twee locaties/ Lunch, fruit, frisdranken/ Snorkeluitrusting, vinnen en reddingsvesten', N'Zonnebril/ Zonhoed/ Handdoek/ Camera/ Zonnebrandcrème')
INSERT [dbo].[TourLocalized] ([LanguageId], [TourId], [Name], [Description], [includes], [Excludes], [WhatToBring]) VALUES (7, 2, N'Wadi El Qulan', N'Breng een dag door met varen rond de eilanden Orange en Giftun en ervaar de schoonheid van het gebied en het onderwaterleven van de Rode Zee. Je stopt bij 2 verschillende snorkellocaties met de kans om prachtige koralen en vissen te zien.', N'Toegang tot het eiland / Natuurbeschermingskosten / Retourtransfers hotel / Transfers met een voertuig met airconditioning / Professionele gids / 2 uur op de eilanden / Veerboottocht / Gratis WiFi / Fooien / EHBO-doos / Snorkelen op twee locaties / Lunch, fruit, frisdranken / Snorkeluitrusting, vinnen en reddingsvesten', N'Toegang tot het eiland / Natuurbeschermingskosten / Retourtransfers hotel / Transfers met een voertuig met airconditioning / Professionele gids / 2 uur op de eilanden / Veerboottocht / Gratis WiFi / Fooien / EHBO-doos / Snorkelen op twee locaties / Lunch, fruit, frisdranken / Snorkeluitrusting, vinnen en reddingsvesten', N'Zonnebril / Zonnehoed / Handdoek / Camera / Zonnebrandcrème')
INSERT [dbo].[TourLocalized] ([LanguageId], [TourId], [Name], [Description], [includes], [Excludes], [WhatToBring]) VALUES (7, 3, N'Sinaïberg', N'Beklim de Sinaïberg ''s nachts en ervaar een adembenemende zonsopgang vanaf de top. Bezoek het Klooster van Sint-Catharina en dompel jezelf onder in de spirituele sfeer van deze heilige plaats.', N'Ophalen en afzetten bij hotel / Professionele gids / Voertuig met airconditioning / Toegang tot het Klooster van Sint-Catharina', N'Eten en drinken / Persoonlijke uitgaven / Fooien', N'Warme kleding / Wandelschoenen / Zaklamp / Water / Camera')
INSERT [dbo].[TourLocalized] ([LanguageId], [TourId], [Name], [Description], [includes], [Excludes], [WhatToBring]) VALUES (7, 4, N'Piramides van Gizeh', N'Ontdek de oude wonderen van de Piramides van Gizeh tijdens een dagtour. Bezoek de Grote Piramide, de Sfinx, en verken de fascinerende geschiedenis van het oude Egypte met een professionele gids.', N'Toegangsprijzen / Professionele Egyptoloog-gids / Voertuig met airconditioning / Ophalen en afzetten bij hotel / Lunch', N'Persoonlijke uitgaven / Drankjes / Fooien', N'Comfortabele schoenen / Zonnebril / Camera / Hoed / Zonnebrandcrème')
INSERT [dbo].[TourLocalized] ([LanguageId], [TourId], [Name], [Description], [includes], [Excludes], [WhatToBring]) VALUES (7, 5, N'Woestijnsafari', N'Geniet van een spannende woestijnsafari met dune bashing, quadrijden en een traditioneel bedoeïenenkamp. Bewonder de zonsondergang in de woestijn en geniet van lokaal eten en live entertainment.', N'Ophalen en afzetten bij hotel / Quadrijden / 4x4 dune bashing / Rit op een kameel / Diner in bedoeïenenkamp / Live entertainment', N'Persoonlijke uitgaven / Fooien / Drankjes', N'Zonnebril / Sjaal / Comfortabele kleding / Camera / Zonnebrandcrème')
INSERT [dbo].[TourLocalized] ([LanguageId], [TourId], [Name], [Description], [includes], [Excludes], [WhatToBring]) VALUES (7, 6, N'Zwemmen met Dolfijnen', N'Breng een dag door met cruisen rond de eilanden van Orange en Giftun en ervaar de schoonheid van het gebied en het onderwaterleven van de Rode Zee. Je stopt op 2 verschillende snorkelplekken met de kans om prachtige koralen en vissen te zien.', N'Toegang tot de eilanden / Natuurbeheerskosten / Retour hoteltransfers / Vervoer per airconditioned voertuig / Professionele gids / 2 uur op de eilanden / Veerbootrit / Gratis WiFi / Fooien / Eerste hulp medische doos / Snorkelen op twee plekken / Lunch, fruit, frisdranken / Snorkeluitrusting, vinnen en reddingsvesten', N'Toegang tot de eilanden / Natuurbeheerskosten / Retour hoteltransfers / Vervoer per airconditioned voertuig / Professionele gids / 2 uur op de eilanden / Veerbootrit / Gratis WiFi / Fooien / Eerste hulp medische doos / Snorkelen op twee plekken / Lunch, fruit, frisdranken / Snorkeluitrusting, vinnen en reddingsvesten', N'Zonnebril / Zonnehoed / Handdoek / Camera / Zonnebrandcrème')
INSERT [dbo].[TourLocalized] ([LanguageId], [TourId], [Name], [Description], [includes], [Excludes], [WhatToBring]) VALUES (1049, 1, N'Giftun Island', N'????????? ????, ??????????? ?????? ???????? ????? ? ??????, ??????????? ????????? ?????? ? ????????? ????? ???????? ????. ?? ???????????? ? ???? ?????? ??? ??????????? ? ???????????? ??????? ???????? ??????? ? ???.', N'???? ?? ??????/ ???? ?? ?????? ???????/ ???????? ??/?? ?????/ ??????? ?? ???????????????? ??????????/ ???????????????? ???/ 2 ???? ?? ????????/ ??????? ?? ??????/ ?????????? Wi-Fi/ ??????/ ??????? ?????? ??????/ ?????????? ? ???? ??????/ ????, ??????, ?????????????? ???????/ ?????????? ??? ???????????, ????? ? ???????????? ??????', N'???? ?? ??????/ ???? ?? ?????? ???????/ ???????? ??/?? ?????/ ??????? ?? ???????????????? ??????????/ ???????????????? ???/ 2 ???? ?? ????????/ ??????? ?? ??????/ ?????????? Wi-Fi/ ??????/ ??????? ?????? ??????/ ?????????? ? ???? ??????/ ????, ??????, ?????????????? ???????/ ?????????? ??? ???????????, ????? ? ???????????? ??????', N'?????????????? ????/ ????? ?? ??????/ ?????????/ ??????/ ?????????????? ????')
INSERT [dbo].[TourLocalized] ([LanguageId], [TourId], [Name], [Description], [includes], [Excludes], [WhatToBring]) VALUES (2057, 1, N'Giftun Island', N'Spend a day cruising on and around the islands of Orange and Giftun and experience the beauty of the area and the underwater life of the Red Sea. You’ll stop at 2 different snorkeling spots with a chance to see beautiful corals and fish.', N'Island entrance fee/ Nature protection fees/ Round-trip hotel transfers/ Transfers by an AC vehicle/ Professional guide/ 2 hours at the islands/ Ferry boat ride/ Free WiFi/ Tips/ First Aid medical box/ Snorkeling in two spots/ Lunch, fruits, soft drinks/ Snorkeling equipment, Fins, and life jackets', N'Island entrance fee/ Nature protection fees/ Round-trip hotel transfers/ Transfers by an AC vehicle/ Professional guide/ 2 hours at the islands/ Ferry boat ride/ Free WiFi/ Tips/ First Aid medical box/ Snorkeling in two spots/ Lunch, fruits, soft drinks/ Snorkeling equipment, Fins, and life jackets', N'Sunglasses/ Sun hat/ Towel/ Camera/ Sunscreen')
INSERT [dbo].[TourLocalized] ([LanguageId], [TourId], [Name], [Description], [includes], [Excludes], [WhatToBring]) VALUES (2057, 2, N'Wadi El Qulan', N'Spend a day cruising on and around the islands of Orange and Giftun and experience the beauty of the area and the underwater life of the Red Sea. You’ll stop at 2 different snorkeling spots with a chance to see beautiful corals and fish.', N'Island entrance fee/ Nature protection fees/ Round-trip hotel transfers/ Transfers by an AC vehicle/ Professional guide/ 2 hours at the islands/ Ferry boat ride/ Free WiFi/ Tips/ First Aid medical box/ Snorkeling in two spots/ Lunch, fruits, soft drinks/ Snorkeling equipment, Fins, and life jackets', N'Island entrance fee/ Nature protection fees/ Round-trip hotel transfers/ Transfers by an AC vehicle/ Professional guide/ 2 hours at the islands/ Ferry boat ride/ Free WiFi/ Tips/ First Aid medical box/ Snorkeling in two spots/ Lunch, fruits, soft drinks/ Snorkeling equipment, Fins, and life jackets', N'Sunglasses/ Sun hat/ Towel/ Camera/ Sunscreen')
INSERT [dbo].[TourLocalized] ([LanguageId], [TourId], [Name], [Description], [includes], [Excludes], [WhatToBring]) VALUES (2057, 3, N'Mount Sinai', N'Spend a day cruising on and around the islands of Orange and Giftun and experience the beauty of the area and the underwater life of the Red Sea. You’ll stop at 2 different snorkeling spots with a chance to see beautiful corals and fish.', N'Island entrance fee/ Nature protection fees/ Round-trip hotel transfers/ Transfers by an AC vehicle/ Professional guide/ 2 hours at the islands/ Ferry boat ride/ Free WiFi/ Tips/ First Aid medical box/ Snorkeling in two spots/ Lunch, fruits, soft drinks/ Snorkeling equipment, Fins, and life jackets', N'Island entrance fee/ Nature protection fees/ Round-trip hotel transfers/ Transfers by an AC vehicle/ Professional guide/ 2 hours at the islands/ Ferry boat ride/ Free WiFi/ Tips/ First Aid medical box/ Snorkeling in two spots/ Lunch, fruits, soft drinks/ Snorkeling equipment, Fins, and life jackets', N'Sunglasses/ Sun hat/ Towel/ Camera/ Sunscreen')
INSERT [dbo].[TourLocalized] ([LanguageId], [TourId], [Name], [Description], [includes], [Excludes], [WhatToBring]) VALUES (2057, 4, N'Pyramids Of Giza', N'Spend a day cruising on and around the islands of Orange and Giftun and experience the beauty of the area and the underwater life of the Red Sea. You’ll stop at 2 different snorkeling spots with a chance to see beautiful corals and fish.', N'Island entrance fee/ Nature protection fees/ Round-trip hotel transfers/ Transfers by an AC vehicle/ Professional guide/ 2 hours at the islands/ Ferry boat ride/ Free WiFi/ Tips/ First Aid medical box/ Snorkeling in two spots/ Lunch, fruits, soft drinks/ Snorkeling equipment, Fins, and life jackets', N'Island entrance fee/ Nature protection fees/ Round-trip hotel transfers/ Transfers by an AC vehicle/ Professional guide/ 2 hours at the islands/ Ferry boat ride/ Free WiFi/ Tips/ First Aid medical box/ Snorkeling in two spots/ Lunch, fruits, soft drinks/ Snorkeling equipment, Fins, and life jackets', N'Sunglasses/ Sun hat/ Towel/ Camera/ Sunscreen')
INSERT [dbo].[TourLocalized] ([LanguageId], [TourId], [Name], [Description], [includes], [Excludes], [WhatToBring]) VALUES (2057, 5, N'Desert Safari', N'Spend a day cruising on and around the islands of Orange and Giftun and experience the beauty of the area and the underwater life of the Red Sea. You’ll stop at 2 different snorkeling spots with a chance to see beautiful corals and fish.', N'Island entrance fee/ Nature protection fees/ Round-trip hotel transfers/ Transfers by an AC vehicle/ Professional guide/ 2 hours at the islands/ Ferry boat ride/ Free WiFi/ Tips/ First Aid medical box/ Snorkeling in two spots/ Lunch, fruits, soft drinks/ Snorkeling equipment, Fins, and life jackets', N'Island entrance fee/ Nature protection fees/ Round-trip hotel transfers/ Transfers by an AC vehicle/ Professional guide/ 2 hours at the islands/ Ferry boat ride/ Free WiFi/ Tips/ First Aid medical box/ Snorkeling in two spots/ Lunch, fruits, soft drinks/ Snorkeling equipment, Fins, and life jackets', N'Sunglasses/ Sun hat/ Towel/ Camera/ Sunscreen')
INSERT [dbo].[TourLocalized] ([LanguageId], [TourId], [Name], [Description], [includes], [Excludes], [WhatToBring]) VALUES (2057, 6, N'Swimming With Dolphins', N'Spend a day cruising on and around the islands of Orange and Giftun and experience the beauty of the area and the underwater life of the Red Sea. You’ll stop at 2 different snorkeling spots with a chance to see beautiful corals and fish.', N'Island entrance fee/ Nature protection fees/ Round-trip hotel transfers/ Transfers by an AC vehicle/ Professional guide/ 2 hours at the islands/ Ferry boat ride/ Free WiFi/ Tips/ First Aid medical box/ Snorkeling in two spots/ Lunch, fruits, soft drinks/ Snorkeling equipment, Fins, and life jackets', N'Island entrance fee/ Nature protection fees/ Round-trip hotel transfers/ Transfers by an AC vehicle/ Professional guide/ 2 hours at the islands/ Ferry boat ride/ Free WiFi/ Tips/ First Aid medical box/ Snorkeling in two spots/ Lunch, fruits, soft drinks/ Snorkeling equipment, Fins, and life jackets', N'Sunglasses/ Sun hat/ Towel/ Camera/ Sunscreen')
GO
SET IDENTITY_INSERT [dbo].[TourPhoto] ON 

INSERT [dbo].[TourPhoto] ([Id], [TourId], [Photo]) VALUES (1, 1, N'g-1.jpg')
INSERT [dbo].[TourPhoto] ([Id], [TourId], [Photo]) VALUES (2, 1, N'g-2.jpg')
INSERT [dbo].[TourPhoto] ([Id], [TourId], [Photo]) VALUES (3, 1, N'g-3.jpg')
INSERT [dbo].[TourPhoto] ([Id], [TourId], [Photo]) VALUES (4, 1, N'g-4.jpg')
SET IDENTITY_INSERT [dbo].[TourPhoto] OFF
GO
SET IDENTITY_INSERT [dbo].[TourType] ON 

INSERT [dbo].[TourType] ([Id], [Photo]) VALUES (1, N'banner-1.jpg')
INSERT [dbo].[TourType] ([Id], [Photo]) VALUES (2, N'banner-1.jpg')
INSERT [dbo].[TourType] ([Id], [Photo]) VALUES (3, N'banner-1.jpg')
INSERT [dbo].[TourType] ([Id], [Photo]) VALUES (4, N'banner-1.jpg')
INSERT [dbo].[TourType] ([Id], [Photo]) VALUES (5, N'banner-1.jpg')
SET IDENTITY_INSERT [dbo].[TourType] OFF
GO
INSERT [dbo].[TourTypeLocalized] ([LanguageId], [TourTypeId], [Name]) VALUES (7, 1, N'Meerestouren')
INSERT [dbo].[TourTypeLocalized] ([LanguageId], [TourTypeId], [Name]) VALUES (7, 2, N'Wüstensafari')
INSERT [dbo].[TourTypeLocalized] ([LanguageId], [TourTypeId], [Name]) VALUES (7, 3, N'Kulturreisen')
INSERT [dbo].[TourTypeLocalized] ([LanguageId], [TourTypeId], [Name]) VALUES (7, 4, N'Familienausflüge')
INSERT [dbo].[TourTypeLocalized] ([LanguageId], [TourTypeId], [Name]) VALUES (7, 5, N'Private Touren')
INSERT [dbo].[TourTypeLocalized] ([LanguageId], [TourTypeId], [Name]) VALUES (1049, 1, N'??????? ???????')
INSERT [dbo].[TourTypeLocalized] ([LanguageId], [TourTypeId], [Name]) VALUES (1049, 2, N'????????? ??????')
INSERT [dbo].[TourTypeLocalized] ([LanguageId], [TourTypeId], [Name]) VALUES (1049, 3, N'?????????? ????')
INSERT [dbo].[TourTypeLocalized] ([LanguageId], [TourTypeId], [Name]) VALUES (1049, 4, N'????????')
INSERT [dbo].[TourTypeLocalized] ([LanguageId], [TourTypeId], [Name]) VALUES (1049, 5, N'??????? ????')
INSERT [dbo].[TourTypeLocalized] ([LanguageId], [TourTypeId], [Name]) VALUES (2057, 1, N'Sea Trips')
INSERT [dbo].[TourTypeLocalized] ([LanguageId], [TourTypeId], [Name]) VALUES (2057, 2, N'Desert Safari')
INSERT [dbo].[TourTypeLocalized] ([LanguageId], [TourTypeId], [Name]) VALUES (2057, 3, N'Cultural Trips')
INSERT [dbo].[TourTypeLocalized] ([LanguageId], [TourTypeId], [Name]) VALUES (2057, 4, N'Family')
INSERT [dbo].[TourTypeLocalized] ([LanguageId], [TourTypeId], [Name]) VALUES (2057, 5, N'Private Tours')
GO
ALTER TABLE [dbo].[Tour]  WITH CHECK ADD  CONSTRAINT [FK_Tour_Destination] FOREIGN KEY([DestinationId])
REFERENCES [dbo].[Destination] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Tour] CHECK CONSTRAINT [FK_Tour_Destination]
GO
ALTER TABLE [dbo].[Tour]  WITH CHECK ADD  CONSTRAINT [FK_Tour_TourType] FOREIGN KEY([TourTypeId])
REFERENCES [dbo].[TourType] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Tour] CHECK CONSTRAINT [FK_Tour_TourType]
GO
ALTER TABLE [dbo].[TourBooking]  WITH CHECK ADD  CONSTRAINT [FK_TourBooking_Guest] FOREIGN KEY([GuestId])
REFERENCES [dbo].[Guest] ([Id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[TourBooking] CHECK CONSTRAINT [FK_TourBooking_Guest]
GO
ALTER TABLE [dbo].[TourBooking]  WITH CHECK ADD  CONSTRAINT [FK_TourBooking_Tour] FOREIGN KEY([TourId])
REFERENCES [dbo].[Tour] ([Id])
GO
ALTER TABLE [dbo].[TourBooking] CHECK CONSTRAINT [FK_TourBooking_Tour]
GO
ALTER TABLE [dbo].[TourLocalized]  WITH CHECK ADD  CONSTRAINT [FK_TourLocalized_Language] FOREIGN KEY([LanguageId])
REFERENCES [dbo].[Language] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TourLocalized] CHECK CONSTRAINT [FK_TourLocalized_Language]
GO
ALTER TABLE [dbo].[TourLocalized]  WITH CHECK ADD  CONSTRAINT [FK_TourLocalized_Tour] FOREIGN KEY([TourId])
REFERENCES [dbo].[Tour] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TourLocalized] CHECK CONSTRAINT [FK_TourLocalized_Tour]
GO
ALTER TABLE [dbo].[TourPhoto]  WITH CHECK ADD  CONSTRAINT [FK_TourPhoto_Tour] FOREIGN KEY([TourId])
REFERENCES [dbo].[Tour] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TourPhoto] CHECK CONSTRAINT [FK_TourPhoto_Tour]
GO
ALTER TABLE [dbo].[TourTypeLocalized]  WITH CHECK ADD  CONSTRAINT [FK_TourTypeLocalized_Language] FOREIGN KEY([LanguageId])
REFERENCES [dbo].[Language] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TourTypeLocalized] CHECK CONSTRAINT [FK_TourTypeLocalized_Language]
GO
ALTER TABLE [dbo].[TourTypeLocalized]  WITH CHECK ADD  CONSTRAINT [FK_TourTypeLocalized_TourType] FOREIGN KEY([TourTypeId])
REFERENCES [dbo].[TourType] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TourTypeLocalized] CHECK CONSTRAINT [FK_TourTypeLocalized_TourType]
GO
ALTER TABLE [dbo].[TransferBooking]  WITH CHECK ADD  CONSTRAINT [FK_TransferBooking_Guest] FOREIGN KEY([GuestId])
REFERENCES [dbo].[Guest] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TransferBooking] CHECK CONSTRAINT [FK_TransferBooking_Guest]
GO
