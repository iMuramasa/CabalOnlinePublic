USE [CooperativeQuest]
GO

/****** Object:  Table [dbo].[cabal_world_event_table]    Script Date: 4/5/2023 5:03:46 PM ******/
SET ANSI_NULLS ON
GO
-- =============================================
-- Author: Muramasa
-- Create date: 04/05/2023
-- Description: CooperativeQuest
-- =============================================
SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[cabal_world_event_table](
	[UserNum] [bigint] NULL,
	[WorldPoint] [bigint] NULL,
	[WorldType] [int] NULL
) ON [PRIMARY]
GO

