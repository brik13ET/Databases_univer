-- Lab 3 Aleev

-- ������� � ��������� ������ ��������, ������������ ������������ ����, �� ����������� ��������� ������.
CREATE TRIGGER Uniq���
ON �����������
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
            from �����������
            where ��� = inserted.���
                and ������������ <> inserted.������������
        ))
    begin
        raiserror('Duplicate ���', 15, 99)
    end
    else
    begin

        -- Perform data changes
        if exists(select * from inserted)
        begin
            if exists(select * from deleted)
            begin                               -- its an update query
                update �����������
                set 
					��� = inserted.���,
					������� = inserted.�������,
					��� = inserted.���,
					�������� = inserted.�������� 
                from inserted 
                inner join ����������� on inserted.������������ = �����������.������������;
            end             
            else
                insert into �����������(
					������������,
					���,
					�������,
					���,
					��������
				) 
                    select 
						������������,
						���,
						�������,
						���,
						��������
                    from inserted;
        end
        else
        begin
            delete ����������� where ������������ in (select ������������ from deleted)
        end
    end
end

insert �����������(
	������������,
	���,
	�������,
	���,
	��������
)
	values
	(44447,7742332352,'�������','����2','����������')

-- ������� � ��������� ������ ��������, ������������ ��������� ����������� restrict.
create trigger restr��������������
on ��������������
for delete, update
as
begin
	if(exists(
		select p.�����������������
		from deleted del
		join ������������������ p on del.����������������� = p.�����������������
	))
	begin
		RAISERROR('������ ������� ��� �������� �������� ��������������, ���� �� �� ��������� ����� �������������',16,10)
		ROLLBACK TRAN
	END
end
RETURN

--update �������������� set ���������������������� = '�����' where ���������������������� like '����%';
update �������������� set ���������������������� = '�������' where ���������������������� like '��%';


-- ������� � ��������� ������ ��������, ������������ ��������� ����������� cascade.
CREATE TRIGGER cascDel������
ON ������
FOR DELETE
AS
	BEGIN
		select *
		FROM ���������
		WHERE ���������
		in ( select ��������� from deleted );
	END
RETURN

insert ����������� values (555599, '','',0,0,'','������+');
insert ����������� values (444499, '','','','');
insert ������ values (777799,'79998887766', 444499,555599);
insert ��������� values (777799,11113,9,2023,500,'�������');

delete from ��������� where ��������� = 777799;
delete from ������ where ��������� = 777799;

select top(10) * from ���������;
select top(10) * from ������;
select top(10) * from �����������;
select top(10) * from �����������;


CREATE TRIGGER cascUpd��������������
ON ��������������
FOR update
AS
	UPDATE ������������������
	SET ���������������� = (
		select ����������������� from inserted
	) where ���������������� in (
		select ����������������� from deleted
	)
RETURN

update ������ set ��������� = 777710 where ��������� = 777799;