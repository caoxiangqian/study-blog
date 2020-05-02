create table test_tbl(
id int auto_increment primary key,
a varchar(32),
b varchar(32),
c varchar(32),
d varchar(32),
aa varchar(32),
bb varchar(32),
cc varchar(32),
dd varchar(32)
);


insert into test_tbl values (null, 'a','b','c','d','aa','bb','cc','dd')

update test_tbl set a = 'a2' where (a = 'a' and b = 'b')


update test_tbl t1 left join (
-- 查出所有符合条件一的id,并更新
select b.id from test_tbl b where b.aa = 'aa'
) t2 
on t1.id = t2.id
set t1.a = 'a1'
 

update test_tbl t1 left join (
-- 查出所有符合条件二的id,并更新
select b.id from test_tbl b where b.a = 'a1' and b.bb = 'bb'
) t2 
on t1.id = t2.id
set t1.b = 'b1'
