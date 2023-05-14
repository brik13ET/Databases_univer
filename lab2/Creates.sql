
CREATE TABLE Характеристика(
	КодХарактеристики int primary key,
	НазваниеХарактеристики varchar(20) unique
);
CREATE TABLE ГруппаТоваров(
	КодГруппыТоваров int primary key,
	ИмяГруппыТоваров varchar(18) not null
);
CREATE TABLE Товар(
	КодТовара int primary key,
	НазваниеТовара varchar(20) not null

);

CREATE TABLE Организация(
	НазваниеФирмы varchar(18) primary key
);
CREATE TABLE ДиректорФИО(
	КодДиректора int primary key,
	ИНН char(12) not null,
	Фамилия varchar(18) not null,
	Имя varchar(18) not null,
	Отчество varchar(18) null
);
CREATE TABLE НаборХарактеристик(
	КодНабораХарактеристик int not null,
	КодГруппыТоваров int
		references ГруппаТоваров(КодГруппыТоваров),
	primary key (
		КодНабораХарактеристик,
		КодГруппыТоваров
	),
	КодХарактеристики int
		references Характеристика(КодХарактеристики)
);
CREATE TABLE АдресАптеки (
	КодАдреса int primary key,

	Район varchar(18) not null,
	Улица varchar(18) not null,
	Дом varchar(5) not null,
	Этаж int null,
	Секция varchar(5) null,

	unique(
		Район,
		Улица,
		Дом,
		Этаж,
		Секция
	),
	
	НазваниеФирмы varchar(18)
		references Организация(НазваниеФирмы)
);
CREATE TABLE Номер_товара(
	КодНабораХарактеристик int not null,
	КодГруппыТоваров int not null,
	КодТовара int
		references Товар(КодТовара),
	foreign key (
		КодНабораХарактеристик,
		КодГруппыТоваров
	)
	references НаборХарактеристик(
		КодНабораХарактеристик,
		КодГруппыТоваров
	),
	primary key (
		КодНабораХарактеристик,
		КодГруппыТоваров,
		КодТовара
	)

);
CREATE TABLE Аптека(
	КодАптеки int primary key,
	ТелефонАптеки varchar(12),
	КодДиректора int
		references ДиректорФИО(КодДиректора) unique,
	КодАдреса int
		references АдресАптеки(КодАдреса) unique
);
CREATE TABLE Прайслист(
	КодАптеки int
		references Аптека(КодАптеки),
	КодТовара int
		references Товар(КодТовара),
	Месяц int not null,
	Год int not null,
	ЦенаПродажи money not null,
	МетодОплаты varchar(20) not null
	primary key (
		КодАптеки,
		КодТовара,
		Месяц,
		Год
	)
);
