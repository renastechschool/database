drop table login_trace;
drop table portal_users;


create table portal_users
(
    id varbinary(100) not null,
    user_name varchar(50) not null,
    first_name varchar(50) not null,
    last_name varchar(50) not null,
    password varbinary(100) not null
);

create unique index idx_portal_users on portal_users (id);
create unique index idx_portal_users on portal_users (user_name);
alter table portal_users add constraint pk_portal_users primary key (id);
alter table portal_users add constraint unq_portal_users_1 unique (user_name);

create table login_trace
(
    id varbinary(100) not null primary key,
    last_login datetime
);
alter table login_trace add constraint fk_port_users foreign key (id) references portal_users (id);

select * from information_Schema.columns where table_name = 'portal_users' order by ordinal_position;
select * from portal_users;