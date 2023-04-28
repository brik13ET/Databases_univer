use sdfghjkl

update Аптека set КодДиректора = (
	select top(1) КодДиректора from ДиректорФИО where Фамилия like '%ко'
) where ТелефоАптеки like 88005553535;

update ДиректорФИО set Фамилия = 'Куценко', Имя = 'Гоша' where КодДиректора = 'o9r23-f3';