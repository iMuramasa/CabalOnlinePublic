USE [Server01]
GO
/****** Object:  StoredProcedure [dbo].[cabal_DungeonReward_Update]    Script Date: 4/5/2023 4:32:23 PM ******/
SET ANSI_NULLS ON
GO
-- =============================================
-- Author: Muramasa
-- Create date: 04/05/2023
-- Description: CooperativeQuest
-- =============================================
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[cabal_DungeonReward_Update]
			( @Charidx int, @Dungeonidx int)
AS
BEGIN
-------------------------------Cash--------------------------------------------
DECLARE @Rew int
SELECT @Rew = [Coins] from Server01.dbo.Dungeonrewards WHERE Dungeonidx = @Dungeonidx
IF (@@ROWCOUNT = 0)	BEGIN SET @Rew = 0 END
UPDATE CabalCash..CashAccount SET Cash = Cash + @Rew WHERE UserNum = @Charidx/8
-------------------------------World Point--------------------------------------------
DECLARE @Wp int
SELECT @Wp = [Wpoint] from Server01.dbo.Dungeonrewards WHERE Dungeonidx = @Dungeonidx
IF (@@ROWCOUNT = 0)	BEGIN SET @Wp = 0 END
UPDATE CoopQuest..cabal_world_event_table SET WorldPoint = WorldPoint + @Wp WHERE UserNum = @Charidx/8
END
--------------------------------Reward World Event-------------------------------------------
DECLARE @TotalPoints int;
DECLARE @AwardGiven int;
DECLARE @UserNum TABLE (UserNum int);
SET @TotalPoints = (SELECT SUM(WorldPoint) FROM CoopQuest.dbo.cabal_world_event_table);
SET @AwardGiven = (SELECT AwardGiven FROM CoopQuest.dbo.cabal_world_event_status WHERE EventName = 'Global Reward 1');

    IF @TotalPoints >= 100 AND EXISTS(SELECT * FROM CoopQuest.dbo.cabal_world_event_table WHERE WorldPoint >= 10) AND @AwardGiven = 0
BEGIN
    INSERT INTO @UserNum(UserNum)
    SELECT UserNum FROM CoopQuest.dbo.cabal_world_event_table WHERE WorldPoint >= 10; 
    INSERT INTO cabalcash.dbo.MyCashItem( UserNum, TranNo, ServerIdx, ItemKindIdx, ItemOpt, DurationIdx ) SELECT UserNum, '1', 1, 2849, 1000, 0 FROM @UserNum;
    INSERT INTO cabalcash.dbo.MyCashItem( UserNum, TranNo, ServerIdx, ItemKindIdx, ItemOpt, DurationIdx ) SELECT UserNum, '1', 1, 2842, 1000000000, 0 FROM @UserNum;
    INSERT INTO cabalcash.dbo.MyCashItem( UserNum, TranNo, ServerIdx, ItemKindIdx, ItemOpt, DurationIdx ) SELECT UserNum, '1', 1, 1, 0, 0 FROM @UserNum;
    UPDATE CoopQuest.dbo.cabal_world_event_status SET AwardGiven = 1 WHERE EventName = 'Global Reward 1';
    UPDATE CoopQuest.dbo.cabal_world_event_table  SET WorldPoint = 0 where UserNum = UserNum
END

SET @AwardGiven = (SELECT AwardGiven FROM CoopQuest.dbo.cabal_world_event_status WHERE EventName = 'Global Reward 2');
    IF @TotalPoints >= 300 AND EXISTS(SELECT * FROM CoopQuest.dbo.cabal_world_event_table WHERE WorldPoint >= 15) AND @AwardGiven = 0
BEGIN
    INSERT INTO @UserNum(UserNum)
    SELECT UserNum FROM CoopQuest.dbo.cabal_world_event_table WHERE WorldPoint >= 15; 
    INSERT INTO cabalcash.dbo.MyCashItem( UserNum, TranNo, ServerIdx, ItemKindIdx, ItemOpt, DurationIdx )
    SELECT UserNum, '1', 1, 1000, 55, 13 FROM @UserNum;     
    UPDATE CoopQuest.dbo.cabal_world_event_status SET AwardGiven = 1 WHERE EventName = 'Global Reward 2';
    UPDATE CoopQuest.dbo.cabal_world_event_table  SET WorldPoint = 0 where UserNum = UserNum
END
