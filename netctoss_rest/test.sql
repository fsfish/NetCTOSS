
select *
from(select c.*,rownum rn
	from (select * from cost order by id) c
) 
where rn>=1 and rn<4;\
drop sequence cost_seq;
create sequence cost_seq start with 10 increment by 1;
update cost set status='0',startime=sysdate where id=15;
select * from cost where id=15;
select * from cost where cost_type=2 and unit_cost>=0;
delete from account where id=1005;
select * from account;
select * from host;
create sequence account_seq start with 1030 increment by 1;
select * from account where real_name='lxx';
update account set status=1 where id in(1010,1011,1015);
select * from account where id=1010;
select * from service ;
update service set status='0' where id=2005;
create sequence service_seq start with 2010 increment by 1;


		insert into service 
			(id,
			account_id,
			unix_host,
			os_username,
			login_passwd,
			status,
			create_date,
			cost_id)
		values(
			2011,
			1030,
			'192.168.0.20',
			'lxx',
			'lxxlxx',
			0,
			sysdate,
			1);
create table test_emp(
	id number primary key,
	name varchar2(20),
	sex char(1),
	dept_no number
);
create table test_dept(
	dept_no number primary key,
	dname varchar2(20),
	loc varchar2(50)
);
insert into test_dept values(
	1,'dept1','beijing'
);
insert into test_dept values(
	2,'dept2','tianjin'
);
insert into test_emp values(
	001,'lxx','m',1
);
insert into test_emp values(
	002,'zn','f',2
);
insert into test_emp values(
	003,'hsl','f',1
);
insert into test_emp values(
	004,'sss','f',1
);
insert into test_emp values(
	005,'ssz','m',2
);

select * from test_emp e join test_dept d on (d.dept_no=e.dept_no)
	where e.dept_no=1;


select * from role_info;
select * from admin_info;
select * from admin_role;
select * from role_privilege;
select * from role_privilege
		where role_id=1;

drop table admin_info;

select * from role_info r 
join role_privilege p on(r.id=p.role_id);

select * from
	(select *
	from (select r.*,rownum rn from role_info r)
	where rn>=3 and rn<5
	) t
	left outer join role_privilege p on (t.id=p.role_id);
	
select r.*, rownum rn
				 from role_info r
select * 
			from (select r.*, rownum rn
				 from role_info r)
			where rn>=1 and rn<3;
select *
	from   (select * 
			from (select r.*, rownum rn
				 from role_info r)
			where rn>=1 and rn<3
			) t
	left outer	join role_privilege p on(t.id=p.role_id);