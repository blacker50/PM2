CREATE TABLE admin (
  id integer primary key auto_increment,   -- 标识
  guid varchar(36),												 -- 唯一标识
  name varchar(10),
  password varchar(15),
  isdelete integer                       -- 是否作废（0:使用，1:作废） 
);

INSERT INTO admin(guid, name, password) VALUES (UUID(),'xiaxuan', '3');

CREATE TABLE dorm (
  guid varchar(36),								-- 唯一标识
  id varchar(15) primary key,   -- 楼号+宿舍号
  building char(1),								-- 楼号			
  num_id integer,									-- 宿舍号
  name varchar(15),								-- 舍长姓名
  phone varchar(15),							-- 联系电话
  remain_power DOUBLE,							-- 用电余量
  isdelete integer               -- 是否作废（0:使用，1:作废）
);

INSERT INTO dorm(guid,id,building,num_id,name,phone,remain_power) 
VALUES (UUID(),concat('A','311'),'A','311','Lin','13423455533','0'),
       (UUID(),concat('B','322'),'B','322','Jack','15323347853','1.1');

CREATE TABLE meter_reader (
  id integer primary key auto_increment,   -- 标识
  guid varchar(36),												 -- 唯一标识
  name varchar(10),
  password varchar(15),
  phone varchar(15),							-- 联系电话
  isdelete integer                       -- 是否作废（0:使用，1:作废） 
);

INSERT INTO meter_reader(guid,name,password,phone) 
VALUES (UUID(),'CXX', '1', '15113991910');

CREATE TABLE meter_reading_problem (
  id integer primary key auto_increment,   -- 标识
  guid varchar(36),												 -- 唯一标识
  dorm_id varchar(15),										
  mreader_id integer,
  mreader_month VARCHAR(12),
  problem varchar(50),
  isdelete integer,                       -- 是否作废（0:使用，1:作废） 
  foreign key(dorm_id) references dorm(id),
	foreign key(mreader_id) references meter_reader(id)
);

CREATE TABLE meter_reading_result (
  id integer primary key auto_increment,   -- 标识
  guid varchar(36),												 -- 唯一标识	
  dorm_id varchar(15),
  mreader_id integer,
  mread_date VARCHAR(12),										-- 抄表日期
	power_read double,									-- 电表读数
  is_exception tinyint(1) default '0',		-- 是否异常，1是0否
  isdelete integer,                       -- 是否作废（0:使用，1:作废）
  foreign key(dorm_id) references dorm(id),
  foreign key(mreader_id) references meter_reader(id)
);

CREATE TABLE meter_reading_task (
  id integer primary key auto_increment,   -- 标识
  guid varchar(36),												 -- 唯一标识
  dorm_id varchar(15),
  mread_month VARCHAR(12),
  mreader_id integer,
  is_read tinyint(1) default '0',					-- 是否已抄表，1是0否
  isdelete integer,                       -- 是否作废（0:使用，1:作废）
  foreign key(dorm_id) references dorm(id),
  foreign key(mreader_id) references meter_reader(id)
);

CREATE TABLE power_toll (
  id integer primary key auto_increment,   -- 标识
  guid varchar(36),												 -- 唯一标识
  dorm_id varchar(15),	
  pay_date VARCHAR(12),							-- 支付日期
  actual_pay double,
  power_state tinyint(1) default '0',				-- 用电状态 1欠费0正常
  isdelete integer,                       -- 是否作废（0:使用，1:作废）
  foreign key(dorm_id) references dorm(id)
);


CREATE TABLE traiff_param (
  id integer primary key auto_increment,   -- 标识
  guid varchar(36),												 -- 唯一标识
  issue_date VARCHAR(12),												-- 电费发行日期
  unit_price double,											-- 电费单价
  basic_power double,											-- 基本电量
  isdelete integer                       -- 是否作废（0:使用，1:作废）
);

CREATE TABLE power_used (
  id integer primary key auto_increment,   -- 标识
  guid varchar(36),												 -- 唯一标识
  dorm_id varchar(15),	
	mread_month VARCHAR(12),
	last_power_read double,
  this_power_read double,
	power_use double,
	isdelete integer,                       -- 是否作废（0:使用，1:作废）
	foreign key(dorm_id) references dorm(id)
);



