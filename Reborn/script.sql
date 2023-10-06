USE [Database]
GO

/****** Object:  StoredProcedure [dbo].[cabal_Reborn]    Script Date: 29.07.2023 17:28:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[cabal_Reborn]
    @CharacterIdx INT,
    @Option INT
AS
BEGIN
    IF (@Option = 21111111)
    BEGIN
        IF NOT EXISTS (SELECT * FROM NewLife.dbo.Reborn WHERE CharacterIdx = @CharacterIdx)
        BEGIN
            INSERT INTO NewLife.dbo.Reborn (CharacterIdx, Point)
            VALUES (@CharacterIdx, 50);
        END
        ELSE
        BEGIN
            UPDATE NewLife.dbo.Reborn SET Point = 50 + Point WHERE CharacterIdx = @CharacterIdx;
        END
    END
END;
