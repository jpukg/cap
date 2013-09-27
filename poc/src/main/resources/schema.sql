create table if not exists tuser (
    userId varchar(255) not null,
    admin bit not null,
    primary key (userId)
);

create table if not exists UTR_REGISTER (
	ID INTEGER GENERATED BY DEFAULT AS IDENTITY (START WITH 100),
	REF VARCHAR(10),
	CONSTRAINT REF_CONST UNIQUE (REF)
);