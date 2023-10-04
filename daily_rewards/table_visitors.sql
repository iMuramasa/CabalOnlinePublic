USE [NewLife]
GO

/****** Object:  Table [dbo].[Visits]    Script Date: 06.07.2023 20:56:44 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Visits](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserNum] [int] NULL,
	[LoginTime] [datetime] NULL,
	[StatusReward] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


