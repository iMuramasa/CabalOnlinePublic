USE [Server01]
GO

/****** Object:  Table [dbo].[Dungeonrewards]    Script Date: 4/5/2023 5:05:24 PM ******/
SET ANSI_NULLS ON
GO
-- =============================================
-- Author: Muramasa
-- Create date: 04/05/2023
-- Description: CooperativeQuest
-- =============================================
SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Dungeonrewards](
	[DungeonName] [nchar](50) NOT NULL,
	[Dungeonidx] [int] NOT NULL,
	[Coins] [int] NOT NULL,
	[Wpoint] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Dungeonidx] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

