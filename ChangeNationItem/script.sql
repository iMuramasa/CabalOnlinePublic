ALTER PROCEDURE [dbo].[cabal_NationChange]
    @CharacterIdx INT,
    @Option INT
AS
BEGIN
    DECLARE @nation INT;

    SELECT @nation = nation
    FROM Server01.dbo.cabal_character_table
    WHERE CharacterIdx = @CharacterIdx;

    IF (@Option = 23333333)
    BEGIN
        IF NOT EXISTS (SELECT * FROM Database.dbo.NationChange WHERE CharacterIdx = @CharacterIdx)
        BEGIN
            INSERT INTO Database.dbo.NationChange (CharacterIdx, nation)
            VALUES (@CharacterIdx, @nation);
		END
    END
END;
