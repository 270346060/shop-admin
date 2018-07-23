create table CELLPHONE(
  ID identity,
  BRAND varchar(64) not null,
  MODEL varchar(64) not null,
  OS varchar(64) not null,
  CPU_BRAND varchar(64) not null,
  CPU_CORE_COUNT integer not null,
  RAM integer not null, -- 单位：GB
  STORAGE integer not null, -- 单位：GB
  COLOR varchar(64) not null,
  DESCRIPTION varchar(128),
  PRICE integer not null -- 单位：分
);

create table USER(
  ID identity,
  USERNAME varchar(64) not null,
  PASSWORD varchar(64) not null,
  LAST_LOGIN_TIME timestamp
  constraint USER_UQ_USERNAME unique (USERNAME)
);

create table SHOPPING_CART_ITEM(
  USER_ID bigint not null,
  CELLPHONE_ID bigint not null,
  AMOUNT integer, 
  constraint SHOPPING_CART_ITEM_FK_USER_ID_USER foreign key (USER_ID) references USER (ID),
  constraint SHOPPING_CART_ITEM_FK_CELLPHONE_ID_CELLPHONE foreign key (CELLPHONE_ID) references CELLPHONE (ID),
  constraint SHOPPING_CART_ITEM_PK primary key (USER_ID, CELLPHONE_ID)
);
