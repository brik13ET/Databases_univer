
CREATE TABLE ��������������(
	����������������� varchar(18) not null primary key,
	���������������������� varchar(20) null

);
CREATE TABLE �������������(
	���������������� varchar(18) not null primary key,
	���������������� varchar(18) not null
);
CREATE TABLE �����(
	��������� uniqueidentifier not null  primary key,
	�������������� varchar(20) null

);

CREATE TABLE �����������(
	������������� varchar(18) not null primary key
);
CREATE TABLE �����������(
	������������ varchar(18) not null primary key,
	��� varchar(18) not null,
	������� varchar(18) not null,
	��� varchar(18) not null,
	�������� varchar(18) null
);
CREATE TABLE ������������������(
	���������������������� varchar(18)  not null,
	���������������� varchar(18) references �������������(����������������) not null,
	primary key (
		����������������������,
		����������������
	),
	����������������� varchar(18) references ��������������(�����������������) not null
);
CREATE TABLE ����������� (
	��������� varchar(18) not null primary key,

	����� varchar(18) null,
	����� varchar(18) null,
	��� varchar(18) null,
	���� varchar(18) null,
	������ varchar(18) null,

	unique(
		�����,
		�����,
		���,
		����,
		������
	),
	
	������������� varchar(18) references �����������(�������������) not null
);
CREATE TABLE �����_������(
	���������������������� varchar(18)  not null,
	���������������� varchar(18) not null,
	��������� uniqueidentifier references �����(���������) not null,
	foreign key (
		����������������������,
		����������������
	)	references ������������������(
		����������������������,
		����������������
	),
	primary key (
		����������������������,
		����������������,
		���������
	)

);
CREATE TABLE ������(
	��������� int not null primary key,
	������������ decimal,
	������������ varchar(18) references �����������(������������) not null,
	��������� varchar(18) references �����������(���������) not null
);
CREATE TABLE ���������(
	��������� int references ������(���������) not null primary key,
	��������� uniqueidentifier references �����(���������) not null,
	����� datetime not null,
	��� datetime not null,
	����������� int null,
	����������� varchar(20) null
);

alter table ������
add unique  (���������);
go

alter table ��������� 
drop constraint PK__��������__B04190C9ACF60A66 ;
go

alter table ��������� 
add primary key(���������,���������,�����,���);
go