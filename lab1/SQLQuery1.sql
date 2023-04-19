
CREATE TABLE Характеристика(
	КодХарактеристики varchar(18) not null primary key,
	НазваниеХарактеристики varchar(20) null

);
CREATE TABLE ГруппаТоваров(
	КодГруппыТоваров varchar(18) not null primary key,
	ИмяГруппыТоваров varchar(18) not null
);
CREATE TABLE Товар(
	КодТовара uniqueidentifier not null  primary key,
	НазваниеТовара varchar(20) null

);

CREATE TABLE Организация(
	НазваниеФирмы varchar(18) not null primary key
);
CREATE TABLE ДиректорФИО(
	КодДиректора varchar(18) not null primary key,
	ИНН varchar(18) not null,
	Фамилия varchar(18) not null,
	Имя varchar(18) not null,
	Отчество varchar(18) null
);
CREATE TABLE НаборХарактеристик(
	КодНабораХарактеристик varchar(18)  not null,
	КодГруппыТоваров varchar(18) references ГруппаТоваров(КодГруппыТоваров) not null,
	primary key (
		КодНабораХарактеристик,
		КодГруппыТоваров
	),
	КодХарактеристики varchar(18) references Характеристика(КодХарактеристики) not null
);
CREATE TABLE АдресАптеки (
	КодАдреса varchar(18) not null primary key,

	Район varchar(18) null,
	Улица varchar(18) null,
	Дом varchar(18) null,
	Этаж varchar(18) null,
	Секция varchar(18) null,

	unique(
		Район,
		Улица,
		Дом,
		Этаж,
		Секция
	),
	
	НазваниеФирмы varchar(18) references Организация(НазваниеФирмы) not null
);
CREATE TABLE Номер_товара(
	КодНабораХарактеристик varchar(18)  not null,
	КодГруппыТоваров varchar(18) not null,
	КодТовара uniqueidentifier references Товар(КодТовара) not null,
	foreign key (
		КодНабораХарактеристик,
		КодГруппыТоваров
	)	references НаборХарактеристик(
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
	КодАптеки int not null primary key,
	ТелефоАптеки decimal,
	КодДиректора varchar(18) references ДиректорФИО(КодДиректора) not null,
	КодАдреса varchar(18) references АдресАптеки(КодАдреса) not null
);
CREATE TABLE Прайслист(
	КодАптеки int references Аптека(КодАптеки) not null primary key,
	КодТовара uniqueidentifier references Товар(КодТовара) not null,
	Месяц datetime not null,
	Год datetime not null,
	ЦенаПродажи int null,
	МетодОплаты varchar(20) null
);

alter table Аптека
add unique  (КодАдреса);
go

alter table Прайслист 
drop constraint PK__Прайслис__B04190C9ACF60A66 ;
go

alter table Прайслист 
add primary key(КодАптеки,КодТовара,Месяц,Год);
go