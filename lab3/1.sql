-- Lab 3 Aleev


-- Создать и отобразить все записи из динамического, ключевого и статического курсоров.
-- Обосновать разницу отображения обновленных данных в различных видах курсоров.

update  Прайслист set ЦенаПродажи = 200 where Прайслист.КодТовара in (
	select КодТовара  from Товар where Товар.НазваниеТовара = 'Кетарол'
);

DECLARE dynamic_cursor CURSOR LOCAL SCROLL DYNAMIC FOR
select
	НазваниеТовара	as 'Название товара',
	ЦенаПродажи		as 'Цена продажи',
	МетодОплаты		as 'Метод оплаты'
from Прайслист p
	inner join Товар ON p.КодТовара = Товар.КодТовара
	where p.ЦенаПродажи < 800;

DECLARE keyset_cursor CURSOR LOCAL SCROLL KEYSET FOR
select
	НазваниеТовара as 'Название товара',
	ЦенаПродажи as 'Цена продажи',
	МетодОплаты as 'Метод оплаты'
from Прайслист p
	inner join Товар ON p.КодТовара = Товар.КодТовара
	where p.ЦенаПродажи < 800;

DECLARE static_cursor CURSOR LOCAL SCROLL STATIC FOR
select
	НазваниеТовара as 'Название товара',
	ЦенаПродажи as 'Цена продажи',
	МетодОплаты as 'Метод оплаты'
from Прайслист p
	inner join Товар ON p.КодТовара = Товар.КодТовара
	where p.ЦенаПродажи < 800;

	
open dynamic_cursor;
open keyset_cursor;
open static_cursor;
declare @НазваниеТовара		varchar(20);
declare @ЦенаПродажи		money;
declare @МетодОплаты		varchar(20);

print  CHAR(13) + 'dynamic_cursor';
	fetch from dynamic_cursor into 
		@НазваниеТовара	,
		@ЦенаПродажи,	
		@МетодОплаты;
	while @@FETCH_STATUS = 0
	begin
		print
			@НазваниеТовара	+ '    ' +
			convert(varchar(30), @ЦенаПродажи, 1)	+ '    ' +
			@МетодОплаты	+ '    ' ;
			
		fetch next from dynamic_cursor into 
			@НазваниеТовара	,
			@ЦенаПродажи	,	
			@МетодОплаты	;
	end;


print  CHAR(13) + 'keyset_cursor';
	fetch from keyset_cursor into 
		@НазваниеТовара	,
		@ЦенаПродажи,	
		@МетодОплаты;
	while @@FETCH_STATUS = 0
	begin
		print
			@НазваниеТовара	+ '    ' +
			convert(varchar(30), @ЦенаПродажи, 1)	+ '    ' +
			@МетодОплаты	+ '    ' ;
			
		fetch next from keyset_cursor into 
			@НазваниеТовара	,
			@ЦенаПродажи	,	
			@МетодОплаты	;
	end;


print CHAR(13) + 'static_cursor';
	fetch from static_cursor into 
		@НазваниеТовара	,
		@ЦенаПродажи,	
		@МетодОплаты;
	while @@FETCH_STATUS = 0
	begin
		print
			@НазваниеТовара	+ '    ' +
			convert(varchar(30), @ЦенаПродажи, 1)	+ '    ' +
			@МетодОплаты	+ '    ' ;
			
		fetch next from static_cursor into 
			@НазваниеТовара	,
			@ЦенаПродажи	,	
			@МетодОплаты	;
	end;

print CHAR(13) + 'UPDATE()' + CHAR(13);

--close keyset_cursor;
--close static_cursor;
--close dynamic_cursor;
update  Прайслист set ЦенаПродажи = 300 where Прайслист.КодТовара in (
	select КодТовара  from Товар where Товар.НазваниеТовара = 'Кетарол'
);

delete from Прайслист where МетодОплаты = 'Расчёт' and КодТовара = 11115;
insert into Прайслист (КодАптеки,КодТовара,Месяц,Год,ЦенаПродажи,МетодОплаты)
	values
		(77773,11115,2,2019,1000,'Расчёт');

--open dynamic_cursor;
--open keyset_cursor;
--open static_cursor;


print  CHAR(13) + 'dynamic_cursor';
	fetch first from dynamic_cursor into 
		@НазваниеТовара	,
		@ЦенаПродажи,	
		@МетодОплаты;
	while @@FETCH_STATUS = 0
	begin
		print
			@НазваниеТовара	+ '    ' +
			convert(varchar(30), @ЦенаПродажи, 1)	+ '    ' +
			@МетодОплаты	+ '    ' ;
			
		fetch next from dynamic_cursor into 
			@НазваниеТовара	,
			@ЦенаПродажи	,	
			@МетодОплаты	;
	end;


print  CHAR(13) + 'keyset_cursor';
	fetch first from keyset_cursor into 
		@НазваниеТовара	,
		@ЦенаПродажи,	
		@МетодОплаты;
	while @@FETCH_STATUS = 0
	begin
		print
			@НазваниеТовара	+ '    ' +
			convert(varchar(30), @ЦенаПродажи, 1)	+ '    ' +
			@МетодОплаты	+ '    ' ;
			
		fetch next from keyset_cursor into 
			@НазваниеТовара	,
			@ЦенаПродажи	,	
			@МетодОплаты	;
	end;


print CHAR(13) + 'static_cursor';
	fetch first from static_cursor into 
		@НазваниеТовара	,
		@ЦенаПродажи,	
		@МетодОплаты;
	while @@FETCH_STATUS = 0
	begin
		print
			@НазваниеТовара	+ '    ' +
			convert(varchar(30), @ЦенаПродажи, 1)	+ '    ' +
			@МетодОплаты	+ '    ' ;
			
		fetch next from static_cursor into 
			@НазваниеТовара	,
			@ЦенаПродажи	,	
			@МетодОплаты	;
	end;
	
close keyset_cursor;
close static_cursor;
close dynamic_cursor;
deallocate dynamic_cursor;
deallocate keyset_cursor;
deallocate static_cursor;