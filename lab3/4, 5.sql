-- Lab 3 Aleev

-- Создать и вызвать хранимую процедуру с входным, выходным формальным параметром и входным параметром, имеющим значение по умолчанию. 
-- Реализовать вызов процедуры, используя позиционный, ключевой, смешанный виды передачи параметров.

CREATE PROCEDURE  [квадрат суммы]
	@param1 real=0,
	@param2 real=0
AS
BEGIN
	SET NOCOUNT ON;
	SELECT 'квадрат суммы' = (@param1+@param2)*(@param1+@param2)
END
GO

--вызов
declare @fn_ret real;
exec @fn_ret = [квадрат суммы] 2,3;

declare @arg1 real;
declare @arg2 real;
set @arg1=2;
set @arg2=3;
exec @fn_ret = [квадрат суммы] @arg1,@arg2;

exec @fn_ret = [квадрат суммы] @param1=@arg1, @param2=@arg2;


-- Создать и вызвать скалярную хранимую функцию

CREATE FUNCTION КолвоАптек()
RETURNS int
 BEGIN
  DECLARE @count int;
  SELECT @count = count(*)
  FROM Аптека
  RETURN @count
 END
 GO
 
--вызов
 declare @fn_ret int;
 exec @fn_ret = КолвоАптек;
 print @fn_ret;
-- Создать и вызвать функцию, возвращающую табличное значение.

CREATE FUNCTION АдресаПоТелефону
	( @НомерТелефона varchar(12) )
RETURNS Table
	return 
		select Район,Улица,Дом,Этаж,Секция, ph.ТелефонАптеки
		from АдресАптеки adr, Аптека ph
		where adr.КодАдреса = ph.КодАдреса and ph.ТелефонАптеки = @НомерТелефона;
 GO

select * from АдресаПоТелефону('88002029035');
