-- drop table UTR_REGISTER;
-- drop table CASH_TRANSACTION;

create table if not exists UTR_REGISTER (
	ID bigint generated by default as identity (start with 100),
	REF varchar(10) not null,
	constraint PK_UTR_REGISTER_ID primary key (ID),
	constraint REF_CONST unique (REF)
);

create table if not exists CASH_TRANSACTION (
	ID bigint not null,
	SONIC_REF varchar(10) not null,
	ACCOUNT varchar(10) not null,
	AMOUNT bigint,
	CURRENCY varchar(3),
	UTR_REGISTER_ID bigint,
	constraint UNIQUE_ID unique (ID),
	constraint FK_UTR_REGISTER foreign key (UTR_REGISTER_ID) references UTR_REGISTER(ID) 
);

create table if not exists UTR_SNAPSHOT (
	UTR_REGISTER_ID bigint not null,
	VERSION integer not null,
	ACCOUNT varchar(10) not null,
	AMOUNT bigint,
	CURRENCY varchar(3),
	constraint PK_UTR_SNAPSHOT_ID primary key (UTR_REGISTER_ID, VERSION)
);

-- alter table CASH_TRANSACTION add constraint FK_UTR_REGISTER foreign key(UTR_REGISTER_ID) references UTR_REGISTER(ID); 

create table if not exists UTR_MESSAGE (
	UTR_REGISTER_ID bigint not null,
	VERSION integer not null,
	SNAPSHOT_VERSION integer not null,
	SIGNATURE bigint not null,
	constraint PK_UTR_MESSAGE_ID primary key (UTR_REGISTER_ID, VERSION),
	constraint FK_UTR_SNAPSHOT foreign key (UTR_REGISTER_ID, SNAPSHOT_VERSION) references UTR_SNAPSHOT(UTR_REGISTER_ID, VERSION)
);