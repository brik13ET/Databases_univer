-- Lab 3 Aleev

-- ������� � ������� �������� ��������� � �������, �������� ���������� ���������� � ������� ����������, ������� �������� �� ���������. 
-- ����������� ����� ���������, ��������� �����������, ��������, ��������� ���� �������� ����������.

CREATE PROCEDURE  [������� �����]
	@param1 real=0,
	@param2 real=0
AS
BEGIN
	SET NOCOUNT ON;
	SELECT '������� �����' = (@param1+@param2)*(@param1+@param2)
END
GO

--�����
declare @fn_ret real;
exec @fn_ret = [������� �����] 2,3;

declare @arg1 real;
declare @arg2 real;
set @arg1=2;
set @arg2=3;
exec @fn_ret = [������� �����] @arg1,@arg2;

exec @fn_ret = [������� �����] @param1=@arg1, @param2=@arg2;


-- ������� � ������� ��������� �������� �������

CREATE FUNCTION ����������()
RETURNS int
 BEGIN
  DECLARE @count int;
  SELECT @count = count(*)
  FROM ������
  RETURN @count
 END
 GO
 
--�����
 declare @fn_ret int;
 exec @fn_ret = ����������;
 print @fn_ret;
-- ������� � ������� �������, ������������ ��������� ��������.

CREATE FUNCTION ����������������
	( @������������� varchar(12) )
RETURNS Table
	return 
		select �����,�����,���,����,������, ph.�������������
		from ����������� adr, ������ ph
		where adr.��������� = ph.��������� and ph.������������� = @�������������;
 GO

select * from ����������������('88002029035');
