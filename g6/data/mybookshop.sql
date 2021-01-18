-- �������ݿ�
create database  bookShop
go

use bookShop;

-- ��������Ա��
create table book_admin
 (
    [uid] int identity ,	 -- '����ID'
    [user] varchar(32) not null,		 --'����Ա�˺�',
    [password] varchar(16) not null,	 --'����Ա����',
	state int default 1 not null,			--״̬��1 ��ʾ������0 ��ʾɾ��
    createtimei datetime default getdate() not null,-- '����ʱ��'
    primary key (uid),
	unique([user])
);

-- �û���
create table  book_user
 (
	userno int identity, --'����id'
    username varchar(100) not null,  --'�û���'
    userpass varchar(16) not null, -- '�û�����',
	phone varchar(13) not null,		--�ֻ��ţ�Ψһ
	state int default 1 not null,			--״̬��1 ��ʾ������0 ��ʾɾ��
    createtime datetime default getdate() not null, --'����ʱ��'
    primary key (userno),

    unique (phone),
);

-- ��Ա��ϸ��Ϣ
create table book_member
 (
    profileNo int identity,			-- '����id'
	userNo int,						--'������û����'
	phone varchar(13) not null,
	name varchar(100) not null,		--'����'
	sex char(2) not null,			--	'�Ա�',
	birthday date not null,			--'����'
	grade int default 1 not null ,	--'�ȼ� Ĭ�� lv1 ����
	state int default 1 not null,			--״̬��1 ��ʾ������0 ��ʾɾ��
    createtime datetime default getDate() -- '����ʱ��',
    primary key (profileNo),
   foreign key (userNO) references book_user(userNO),
)
-- �鼮������
create table book_region
(
	rid int identity primary key,	--���
	region varchar(100) not null,	--����
	created datetime default getdate()	--����ʱ��
);
-- �鼮���ͱ�
create table book_type
(
    typeNo int identity,			 --'����id',
    name varchar(32) not null,		-- '��������',
    createtime datetime default getDate() not null -- '����ʱ��',
    primary key (typeNO)
) 
-- �鼮��Ʒ��
create table book_commodity
(
    productNo int identity,			--'���id'
    typeNo int,						--'����id',
	rid int,						--�������id
    bookName varchar(200) not null,	-- 'ͼ������',
	author varchar(100) not null,	--'����'
    price money not null,			--'���ۼ۸�'
	buyCount int,					-- '��������'
	stock int not null,				-- '���',
    cover varchar(200) not null	,	 --'����ͼ',
	content varchar(2000),			--'ͼ����'
	state int default 2 not null,			--״̬��1 ��ʾ�ϼܣ�2 ��ʾ�¼� 0 ��ʾɾ��
    createtime datetime default getdate() --'����ʱ��',
   
    PRIMARY KEY (productNO),
    foreign key (typeNO) references book_type(typeNo),
	 foreign key (rid) references book_region(rid),
) 
update book_user 
set username='tom',userpass ='123456'

--��������

insert into book_admin([user], password) values('admin', '123456');

insert into book_user(username,userpass,phone) values('tom','123456','110');
insert into book_user(username,userpass,phone) values('jok','123456','120');

insert into book_member(userNO,phone,name,sex,birthday,grade) values(1,'110','����','��','2020-01-01',1);

insert into book_region(region) values('��½')
insert into book_region(region) values('����')

insert into book_type(name) values('��־');
insert into book_type(name) values('��ʷ');

insert into book_commodity(typeNo,rid,bookName,author,price,buyCount,stock,cover,content)
values(1,1,'ѧϰ����','����Զ',23,100,200,'/img/a.jpg','��μ��䣬�����ι�����֪ʶ�㣿 ��θ�ϰ�����ܺ�ʵ����֪ʶ��ϵ�������ѧ������ʵ��������ɳ�����Щ���⣬��ѧϰ���֡��ﶼ�д𰸡�������һ��д�����ѧ���ͼҳ��ģ�������Чѧϰ�����ķ��������顣������Ϊ����Ү³�߷ֱ�ҵ��������Ƚ�������֪ʶ�������ѧϰ���飬ϵͳ�����˳�ʵ�õ�ѧϰ����ȫ���Ϊ5��ģ�顢30�ڴ�Ρ�100+���������������ѧϰ�ɼ�����������֡�');

insert into book_commodity(typeNo,rid,bookName,author,price,buyCount,stock,cover,content)
values(2,1,'��ս����','���',19,100,200,'/img/b.jpg','������һ��ȫ��ʽ���ֳ���ս����ʷ���˵ľ�����Ʒ���Իֺ�����ơ����������ԡ���ά�ȵ��ӽǼ����ͷ����˳���ս�����򡢾��߹��̡����ս�ۼ����ŵ�ͣս̸�е��ش��¼�������սǰ���ʹ������ơ���Ҫս��ս����˫����˧���߹��̼��ⳡս����ӿ�ֵĿ��ơ����񡱼����������һ�����Ը���������������ͬʱ������ͨ����ʵ��ʷ��ȫ��ҿ�����ս��̨ǰĻ��������ʷ���࣬�������ճ�����쵼��Ĳ��Ľ�����������������������࣬�й������������࣬������ս����ʵ�Աȣ������Ի���Ԯ���վ���ս����Ļ��־Ը��ս������ʵ���������ŵ�̸�й��̵ȵȣ��Ƴ����йس���ս����������˼����⣬�ǳ���ʵ����')

update book_type set region ='��½' 

select * from book_admin
select * from book_user 

select typeNo  from book_type
group by typeNo
select * from book_type 
left join book_commodity on book_type.typeNo= book_commodity.typeNo


 select book_commodity.state from book_commodity
 left join book_type on book_type.typeNo= book_commodity.typeNo
 join book_region on book_commodity.rid = book_region.rid
 	 order by book_type.typeNo
                offset 0 rows
                fetch next 5 rows only 


--���ﳵ��
create table book_cart
(
	cartNo int identity,	-- ���ﳵid
	productNo int,			-- ��Ʒid(�鼮���)
	userNo int,				-- �û�id
	booknum int not null default 0,	--���빺�ﳵ����Ʒ����
	cPrice money not null default 0.00,	--���빺�ﳵʱ�ļ۸�
	created date not null default getdate(),	--����ʱ��
	
	primary key (cartNo),
    foreign key (productNo) references book_commodity(productNo),
	foreign key (userNo) references book_user(userNo),
)
	insert into book_cart(productNo,userNo,booknum,cPrice) values(1,1,2,23)
--�û��ջ���ַ��
create table user_address
(
	addressNo int identity,		--��ַ���
	userNo int,					--�û� id
	consignee varchar(100)not null, --�ջ���
	detail_address varchar(300)not null, --�ջ���ϸ��ַ
	tel varchar(11) not null,		--�ջ����ֻ���
	created datetime not null default getdate(),

	primary key (addressNo),
	foreign key (userNo) references book_user(userNo),

);

insert into user_address(userno,consignee,detail_address,tel) values(1,'admin','�㶫ʡ�麣�ж������׽����Ϸ�ITѧԺ',110);

--������
create table book_order
(
	orderNo int identity,	--�������
	userNo int,				--�û����
	productNo int,			--�鼮��Ʒ���
	addressNo int,			--�ջ���ַ���
	payment_number int not null,	--֧����ʽ ,1 ΢�ţ�2 ֧����
	productnum int not null,		--�鼮��Ʒ����
	amount money default 0,		--�����ܼ�
	status int not null,		--����״̬ 0ȡ�����1��������2���ջ���3�����
	remarks varchar(1000),		--������ע
	createTime datetime default getdate() --����ʱ��	

	primary key (orderNo),
    foreign key (productNo) references book_commodity(productNo),
	foreign key (userNo) references book_user(userNo),
    foreign key (addressNo) references user_address(addressNo),
)

insert into book_order(userno,productNo,addressNo,payment_number,productnum,amount,status)
values(1,1,1,1,1,23,1);
select * from book_order
select * from user_address