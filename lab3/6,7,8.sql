-- Lab 3 Aleev

-- Создать и проверить работу триггера, реализующего уникальность поля, не являющегося первичным ключом.
CREATE TRIGGER UniqИНН
ON ДиректорФИО
instead of insert, update, delete
as
begin
    declare @permission bit

    -- Verify no duplicate
    if exists(
        select *
        from inserted
        where exists (
            select *
            from ДиректорФИО
            where ИНН = inserted.ИНН
                and КодДиректора <> inserted.КодДиректора
        ))
    begin
        raiserror('Duplicate ИНН', 15, 99)
    end
    else
    begin

        -- Perform data changes
        if exists(select * from inserted)
        begin
            if exists(select * from deleted)
            begin                               -- its an update query
                update ДиректорФИО
                set 
					ИНН = inserted.ИНН,
					Фамилия = inserted.Фамилия,
					Имя = inserted.Имя,
					Отчество = inserted.Отчество 
                from inserted 
                inner join ДиректорФИО on inserted.КодДиректора = ДиректорФИО.КодДиректора;
            end             
            else
                insert into ДиректорФИО(
					КодДиректора,
					ИНН,
					Фамилия,
					Имя,
					Отчество
				) 
                    select 
						КодДиректора,
						ИНН,
						Фамилия,
						Имя,
						Отчество
                    from inserted;
        end
        else
        begin
            delete ДиректорФИО where КодДиректора in (select КодДиректора from deleted)
        end
    end
end

insert ДиректорФИО(
	КодДиректора,
	ИНН,
	Фамилия,
	Имя,
	Отчество
)
	values
	(44447,7742332352,'Куценко','Гоша2','Дмитриевич')

-- Создать и проверить работу триггера, реализующего ссылочную целостность restrict.
create trigger restrХарактеристика
on Характеристика
for delete, update
as
begin
	if(exists(
		select p.КодХарактеристики
		from deleted del
		join НаборХарактеристик p on del.КодХарактеристики = p.КодХарактеристики
	))
	begin
		RAISERROR('Нельзя удалить или изменить название характеристики, если на неё ссылается набор характеристик',16,10)
		ROLLBACK TRAN
	END
end
RETURN

--update Характеристика set НазваниеХарактеристики = 'Объём' where НазваниеХарактеристики like 'Дози%';
update Характеристика set НазваниеХарактеристики = 'Сколько' where НазваниеХарактеристики like 'Об%';


-- Создать и проверить работу триггера, реализующего ссылочную целостность cascade.
CREATE TRIGGER cascDelАптека
ON Аптека
FOR DELETE
AS
	BEGIN
		select *
		FROM Прайслист
		WHERE КодАптеки
		in ( select КодАптеки from deleted );
	END
RETURN

insert АдресАптеки values (555599, '','',0,0,'','Аптека+');
insert ДиректорФИО values (444499, '','','','');
insert Аптека values (777799,'79998887766', 444499,555599);
insert Прайслист values (777799,11113,9,2023,500,'Перевод');

delete from Прайслист where КодАптеки = 777799;
delete from Аптека where КодАптеки = 777799;

select top(10) * from Прайслист;
select top(10) * from Аптека;
select top(10) * from АдресАптеки;
select top(10) * from ДиректорФИО;


CREATE TRIGGER cascUpdХарактеристика
ON Характеристика
FOR update
AS
	UPDATE НаборХарактеристик
	SET КодГруппыТоваров = (
		select КодХарактеристики from inserted
	) where КодГруппыТоваров in (
		select КодХарактеристики from deleted
	)
RETURN

update Аптека set КодАптеки = 777710 where КодАптеки = 777799;