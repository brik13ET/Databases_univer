
CREATE TABLE ��������������(
	����������������� int primary key,
	���������������������� varchar(20) unique
);
CREATE TABLE �������������(
	���������������� int primary key,
	���������������� varchar(18) not null
);
CREATE TABLE �����(
	��������� int primary key,
	�������������� varchar(20) not null

);

CREATE TABLE �����������(
	������������� varchar(18) primary key
);
CREATE TABLE �����������(
	������������ int primary key,
	��� char(12) not null,
	������� varchar(18) not null,
	��� varchar(18) not null,
	�������� varchar(18) null
);
CREATE TABLE ������������������(
	���������������������� int not null,
	���������������� int
		references �������������(����������������),
	primary key (
		����������������������,
		����������������
	),
	����������������� int
		references ��������������(�����������������)
);
CREATE TABLE ����������� (
	��������� int primary key,

	����� varchar(18) not null,
	����� varchar(18) not null,
	��� varchar(5) not null,
	���� int null,
	������ varchar(5) null,

	unique(
		�����,
		�����,
		���,
		����,
		������
	),
	
	������������� varchar(18)
		references �����������(�������������)
);
CREATE TABLE �����_������(
	���������������������� int not null,
	���������������� int not null,
	��������� int
		references �����(���������),
	foreign key (
		����������������������,
		����������������
	)
	references ������������������(
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
	��������� int primary key,
	������������� varchar(12),
	������������ int
		references �����������(������������) unique,
	��������� int
		references �����������(���������) unique
);
CREATE TABLE ���������(
	��������� int
		references ������(���������),
	��������� int
		references �����(���������),
	����� int not null,
	��� int not null,
	����������� money not null,
	����������� varchar(20) not null
	primary key (
		���������,
		���������,
		�����,
		���
	)
);
