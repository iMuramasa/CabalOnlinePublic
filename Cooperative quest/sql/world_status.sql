USE [CooperativeQuest]
GO

/****** Object:  Table [dbo].[cabal_world_event_status]    Script Date: 4/5/2023 5:04:22 PM ******/
SET ANSI_NULLS ON
GO
-- =============================================
-- Author: Muramasa
-- Create date: 04/05/2023
-- Description: CooperativeQuest
-- =============================================
SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[cabal_world_event_status](
	[EventName] [varchar](50) NOT NULL,
	[AwardGiven] [int] NOT NULL
) ON [PRIMARY]
GO

