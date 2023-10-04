USE [NewLife]
GO

/****** Object:  Table [dbo].[daily_rewards]    Script Date: 06.07.2023 20:55:55 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[daily_rewards](
	[id] [int] NULL,
	[item] [int] NULL,
	[options] [varchar](50) NULL,
	[duration] [int] NULL
) ON [PRIMARY]
GO
