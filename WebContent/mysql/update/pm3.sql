CREATE TABLE admin (
  id integer primary key auto_increment,   -- ��ʶ
  guid varchar(36),												 -- Ψһ��ʶ
  name varchar(10),
  password varchar(15),
  isdelete integer                       -- �Ƿ����ϣ�0:ʹ�ã�1:���ϣ� 
);

INSERT INTO admin(guid, name, password) VALUES (UUID(),'xiaxuan', '3');

CREATE TABLE dorm (
  guid varchar(36),								-- Ψһ��ʶ
  id varchar(15) primary key,   -- ¥��+�����
  building char(1),								-- ¥��			
  num_id integer,									-- �����
  name varchar(15),								-- �᳤����
  phone varchar(15),							-- ��ϵ�绰
  remain_power DOUBLE,							-- �õ�����
  isdelete integer               -- �Ƿ����ϣ�0:ʹ�ã�1:���ϣ�
);

INSERT INTO dorm(guid,id,building,num_id,name,phone,remain_power) 
VALUES (UUID(),concat('A','311'),'A','311','Lin','13423455533','0'),
       (UUID(),concat('B','322'),'B','322','Jack','15323347853','1.1');

CREATE TABLE meter_reader (
  id integer primary key auto_increment,   -- ��ʶ
  guid varchar(36),												 -- Ψһ��ʶ
  name varchar(10),
  password varchar(15),
  phone varchar(15),							-- ��ϵ�绰
  isdelete integer                       -- �Ƿ����ϣ�0:ʹ�ã�1:���ϣ� 
);

INSERT INTO meter_reader(guid,name,password,phone) 
VALUES (UUID(),'CXX', '1', '15113991910');

CREATE TABLE meter_reading_problem (
  id integer primary key auto_increment,   -- ��ʶ
  guid varchar(36),												 -- Ψһ��ʶ
  dorm_id varchar(15),										
  mreader_id integer,
  mreader_month VARCHAR(12),
  problem varchar(50),
  isdelete integer,                       -- �Ƿ����ϣ�0:ʹ�ã�1:���ϣ� 
  foreign key(dorm_id) references dorm(id),
	foreign key(mreader_id) references meter_reader(id)
);

CREATE TABLE meter_reading_result (
  id integer primary key auto_increment,   -- ��ʶ
  guid varchar(36),												 -- Ψһ��ʶ	
  dorm_id varchar(15),
  mreader_id integer,
  mread_date VARCHAR(12),										-- ��������
	power_read double,									-- ������
  is_exception tinyint(1) default '0',		-- �Ƿ��쳣��1��0��
  isdelete integer,                       -- �Ƿ����ϣ�0:ʹ�ã�1:���ϣ�
  foreign key(dorm_id) references dorm(id),
  foreign key(mreader_id) references meter_reader(id)
);

CREATE TABLE meter_reading_task (
  id integer primary key auto_increment,   -- ��ʶ
  guid varchar(36),												 -- Ψһ��ʶ
  dorm_id varchar(15),
  mread_month VARCHAR(12),
  mreader_id integer,
  is_read tinyint(1) default '0',					-- �Ƿ��ѳ���1��0��
  isdelete integer,                       -- �Ƿ����ϣ�0:ʹ�ã�1:���ϣ�
  foreign key(dorm_id) references dorm(id),
  foreign key(mreader_id) references meter_reader(id)
);

CREATE TABLE power_toll (
  id integer primary key auto_increment,   -- ��ʶ
  guid varchar(36),												 -- Ψһ��ʶ
  dorm_id varchar(15),	
  pay_date VARCHAR(12),							-- ֧������
  actual_pay double,
  power_state tinyint(1) default '0',				-- �õ�״̬ 1Ƿ��0����
  isdelete integer,                       -- �Ƿ����ϣ�0:ʹ�ã�1:���ϣ�
  foreign key(dorm_id) references dorm(id)
);


CREATE TABLE traiff_param (
  id integer primary key auto_increment,   -- ��ʶ
  guid varchar(36),												 -- Ψһ��ʶ
  issue_date VARCHAR(12),												-- ��ѷ�������
  unit_price double,											-- ��ѵ���
  basic_power double,											-- ��������
  isdelete integer                       -- �Ƿ����ϣ�0:ʹ�ã�1:���ϣ�
);

CREATE TABLE power_used (
  id integer primary key auto_increment,   -- ��ʶ
  guid varchar(36),												 -- Ψһ��ʶ
  dorm_id varchar(15),	
	mread_month VARCHAR(12),
	last_power_read double,
  this_power_read double,
	power_use double,
	isdelete integer,                       -- �Ƿ����ϣ�0:ʹ�ã�1:���ϣ�
	foreign key(dorm_id) references dorm(id)
);



