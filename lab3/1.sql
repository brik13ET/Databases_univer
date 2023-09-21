-- Lab 3 Aleev


-- ������� � ���������� ��� ������ �� �������������, ��������� � ������������ ��������.
-- ���������� ������� ����������� ����������� ������ � ��������� ����� ��������.

update  ��������� set ����������� = 200 where ���������.��������� in (
	select ���������  from ����� where �����.�������������� = '�������'
);

DECLARE dynamic_cursor CURSOR LOCAL SCROLL DYNAMIC FOR
select
	��������������	as '�������� ������',
	�����������		as '���� �������',
	�����������		as '����� ������'
from ��������� p
	inner join ����� ON p.��������� = �����.���������
	where p.����������� < 800;

DECLARE keyset_cursor CURSOR LOCAL SCROLL KEYSET FOR
select
	�������������� as '�������� ������',
	����������� as '���� �������',
	����������� as '����� ������'
from ��������� p
	inner join ����� ON p.��������� = �����.���������
	where p.����������� < 800;

DECLARE static_cursor CURSOR LOCAL SCROLL STATIC FOR
select
	�������������� as '�������� ������',
	����������� as '���� �������',
	����������� as '����� ������'
from ��������� p
	inner join ����� ON p.��������� = �����.���������
	where p.����������� < 800;

	
open dynamic_cursor;
open keyset_cursor;
open static_cursor;
declare @��������������		varchar(20);
declare @�����������		money;
declare @�����������		varchar(20);

print  CHAR(13) + 'dynamic_cursor';
	fetch from dynamic_cursor into 
		@��������������	,
		@�����������,	
		@�����������;
	while @@FETCH_STATUS = 0
	begin
		print
			@��������������	+ '    ' +
			convert(varchar(30), @�����������, 1)	+ '    ' +
			@�����������	+ '    ' ;
			
		fetch next from dynamic_cursor into 
			@��������������	,
			@�����������	,	
			@�����������	;
	end;


print  CHAR(13) + 'keyset_cursor';
	fetch from keyset_cursor into 
		@��������������	,
		@�����������,	
		@�����������;
	while @@FETCH_STATUS = 0
	begin
		print
			@��������������	+ '    ' +
			convert(varchar(30), @�����������, 1)	+ '    ' +
			@�����������	+ '    ' ;
			
		fetch next from keyset_cursor into 
			@��������������	,
			@�����������	,	
			@�����������	;
	end;


print CHAR(13) + 'static_cursor';
	fetch from static_cursor into 
		@��������������	,
		@�����������,	
		@�����������;
	while @@FETCH_STATUS = 0
	begin
		print
			@��������������	+ '    ' +
			convert(varchar(30), @�����������, 1)	+ '    ' +
			@�����������	+ '    ' ;
			
		fetch next from static_cursor into 
			@��������������	,
			@�����������	,	
			@�����������	;
	end;

print CHAR(13) + 'UPDATE()' + CHAR(13);

--close keyset_cursor;
--close static_cursor;
--close dynamic_cursor;
update  ��������� set ����������� = 300 where ���������.��������� in (
	select ���������  from ����� where �����.�������������� = '�������'
);

delete from ��������� where ����������� = '������' and ��������� = 11115;
insert into ��������� (���������,���������,�����,���,�����������,�����������)
	values
		(77773,11115,2,2019,1000,'������');

--open dynamic_cursor;
--open keyset_cursor;
--open static_cursor;


print  CHAR(13) + 'dynamic_cursor';
	fetch first from dynamic_cursor into 
		@��������������	,
		@�����������,	
		@�����������;
	while @@FETCH_STATUS = 0
	begin
		print
			@��������������	+ '    ' +
			convert(varchar(30), @�����������, 1)	+ '    ' +
			@�����������	+ '    ' ;
			
		fetch next from dynamic_cursor into 
			@��������������	,
			@�����������	,	
			@�����������	;
	end;


print  CHAR(13) + 'keyset_cursor';
	fetch first from keyset_cursor into 
		@��������������	,
		@�����������,	
		@�����������;
	while @@FETCH_STATUS = 0
	begin
		print
			@��������������	+ '    ' +
			convert(varchar(30), @�����������, 1)	+ '    ' +
			@�����������	+ '    ' ;
			
		fetch next from keyset_cursor into 
			@��������������	,
			@�����������	,	
			@�����������	;
	end;


print CHAR(13) + 'static_cursor';
	fetch first from static_cursor into 
		@��������������	,
		@�����������,	
		@�����������;
	while @@FETCH_STATUS = 0
	begin
		print
			@��������������	+ '    ' +
			convert(varchar(30), @�����������, 1)	+ '    ' +
			@�����������	+ '    ' ;
			
		fetch next from static_cursor into 
			@��������������	,
			@�����������	,	
			@�����������	;
	end;
	
close keyset_cursor;
close static_cursor;
close dynamic_cursor;
deallocate dynamic_cursor;
deallocate keyset_cursor;
deallocate static_cursor;