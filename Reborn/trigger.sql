ALTER TRIGGER dbo.RebornTrigger
ON dbo.cabal_character_table
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @Login INT, @point INT, @PNT INT, @CharacterIdx INT;

    SELECT @Login = Login
    FROM inserted;

    SELECT @point = point, @CharacterIdx = characteridx
    FROM NewLife.dbo.Reborn
    WHERE CharacterIdx IN (SELECT CharacterIdx FROM inserted);

    SELECT @PNT = PNT, @CharacterIdx = characteridx
    FROM Server01.dbo.cabal_character_table
    WHERE CharacterIdx IN (SELECT CharacterIdx FROM inserted);

    IF (@Login = 0 AND @point IS NOT NULL AND @CharacterIdx IS NOT NULL)
    BEGIN
        UPDATE cct
        SET PNT = @PNT + @point
        FROM dbo.cabal_character_table cct
        INNER JOIN inserted i ON cct.CharacterIdx = i.CharacterIdx;

        DELETE FROM NewLife.dbo.Reborn
        WHERE CharacterIdx IN (SELECT CharacterIdx FROM inserted);
    END
END;
