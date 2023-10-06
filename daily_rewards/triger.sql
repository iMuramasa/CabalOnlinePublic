ALTER TRIGGER LoginTrackingTrigger
ON dbo.cabal_auth_table
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    -- Проверяем, было ли изменение поля LoginTime
    IF UPDATE(LoginTime)
    BEGIN
        -- Получаем текущую дату и начало текущего дня
        DECLARE @CurrentDate DATE = CAST(GETDATE() AS DATE);
        DECLARE @StartOfDay DATETIME = CAST(GETDATE() AS DATE);

        -- Проверяем, были ли уже записи на сегодняшний день для конкретного UserNum
        IF NOT EXISTS (SELECT * FROM Database.dbo.Visits WHERE LoginTime >= @StartOfDay AND UserNum = (SELECT UserNum FROM inserted))
        BEGIN
            -- Вставляем новую запись с UserNum, LoginTime и StatusReward
            INSERT INTO Database.dbo.Visits (UserNum, LoginTime, StatusReward)
            SELECT UserNum, LoginTime, 0
            FROM inserted;

            -- Выполняем запрос на получение награды из таблицы Rewards
            DECLARE @id INT;
            DECLARE @item INT;
            DECLARE @options INT;
            DECLARE @duration INT;
            DECLARE @UserNum INT;

            -- Получаем значение UserNum из таблицы inserted
            SELECT @UserNum = UserNum FROM inserted;

            DECLARE @VisitCount INT;
            SELECT @VisitCount = COUNT(*) FROM Database.dbo.Visits WHERE UserNum = @UserNum;

            -- Проверяем, была ли найдена награда в таблице Rewards и присваем переменную @VisitCount
            IF EXISTS (SELECT * FROM Database.dbo.daily_rewards WHERE id = @VisitCount)
            BEGIN
                -- Выполняем выборку награды из таблицы daily_rewards
                SELECT @id = id, @item = item, @options = options, @duration = duration
                FROM Database.dbo.daily_rewards WHERE id = @VisitCount;

                -- Выдаем награду игроку
                INSERT INTO cabalcash.dbo.MyCashItem (UserNum, TranNo, ServerIdx, ItemKindIdx, ItemOpt, DurationIdx)
                VALUES (@UserNum, '1', 1, @item, @options, @duration);

                -- Увеличиваем значение StatusReward на 1
                UPDATE Database.dbo.Visits SET StatusReward = StatusReward+1 WHERE UserNum = @UserNum;
            END
        END
    END
END;
