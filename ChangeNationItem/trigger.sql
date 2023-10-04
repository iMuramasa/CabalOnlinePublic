alter TRIGGER dbo.ChangeNationTrigger
ON dbo.cabal_character_table
AFTER UPDATE
AS
BEGIN
    DECLARE @Login INT, @nation INT, @characteridx INT;

    SELECT @Login = Login
    FROM inserted;

    SELECT @nation = nation, @characteridx = characteridx
    FROM NewLife.dbo.NationChange
    WHERE characteridx IN (SELECT CharacterIdx FROM inserted);

    IF (@Login = 1 AND @nation IS NOT NULL AND @characteridx IS NOT NULL)
    BEGIN
        -- Обновление значения столбца Nation
        UPDATE cct
        SET Nation = CASE WHEN cct.Nation = 1 THEN 2 ELSE 1 END
        FROM dbo.cabal_character_table cct
        INNER JOIN inserted i ON cct.CharacterIdx = i.CharacterIdx;
		DELETE FROM NewLife.dbo.NationChange
        WHERE CharacterIdx = @CharacterIdx;
    END
END;
