--use ananthi
delete from tbl_Demo where id=4
drop table tbl_Demo
                        /*TRIGGERS*/
Create table tbl_Demo(id int identity,name varchar(30),age int)
insert into tbl_Demo values('sairam',15),
('baa',5),
('ccaa',35),
('dfaa',55),
('keerthi',75)
select * from tbl_Demo
exec update_count
select * from ageband


select * from ageband
select * from tbl_Demo
exec update_count
use Ananthi  --- update trigger by stored procedures
create alter procedure update_count
as declare @count1 int, @count2 int, @count3 int,@count4 int,@count5 int
begin
set @count1=(select sum(count) from(select age,count(age) as count from tbl_demo group by age having age<19 and age>0)as name)
set @count2=(select sum(count) from(select age,count(age) as count from tbl_demo group by age having age>18 and age<31)as name)
set @count3=(select sum(count) from(select age,count(age) as count from tbl_demo group by age having age>30 and age<46)as name)
set @count4=(select sum(count) from(select age,count(age) as count from tbl_demo group by age having age>45 and age<60)as name)
set @count5=(select sum(count) from(select age,count(age) as count from tbl_demo group by age having age>59 and age<101)as name)
update ageband set band1=@count1 where id=1
update ageband set band2=@count2 where id=1
update ageband set band3=@count3 where id=1
update ageband set band4=@count4 where id=1
update ageband set band5=@count5 where id=1
select * from ageband
end

.....
drop trigger tr_tbl_Demo_insert 
create trigger tr_tbl_Demo_insert
on tbl_Demo for insert
as
begin
Declare @age int
select @age=age from inserted
if((select @age)>0 and (select @age)<19)
begin
update ageband set Band1=Band1+1
print('Your data will be added in Band1')
end
else if((select @age)>18 and (select @age)<31)
begin
update ageband set Band2=Band2+1
print('Your data will be added in Band2')
end
else if((select @age)>30 and (select @age)<46)
begin
update ageband set Band3=Band3+1
print('Your data will be added in Band3')
end
else if((select @age)>45 and (select @age)<61)
begin
update ageband set Band4=Band4+1
print('Your data will be added in Band4')
end
else if((select @age)>60 and (select @age)<101)
begin
update ageband set Band5=Band5+1
print('Your data will be added in Band5')
end
else
begin
print('You have Exceeded the band limit')
rollback transaction
end
end

............
/* delete trigger*/

create trigger tr_tbl_Demo_delete
on tbl_Demo for delete
as
begin
Declare @age int
select @age=age from deleted
if((select @age)>0 and (select @age)<19)
begin
update agebands set Band1=Band1-1
print('Your data will be deleted in Band1')
end
else if((select @age)>18 and (select @age)<31)
begin
update agebands set Band2=Band2-1
print('Your data will be deleted in Band2')
end
else if((select @age)>30 and (select @age)<46)
begin
update agebands set Band3=Band3-1
print('Your data will be deleted in Band3')
end
else if((select @age)>45 and (select @age)<61)
begin
update agebands set Band4=Band4-1
print('Your data will be deleted in Band4')
end
else if((select @age)>60 and (select @age)<101)
begin
update agebands set Band5=Band5-1
print('Your data will be deleted in Band5')
end
else
begin
print('You have Exceeded the band limit')
rollback transaction
end
end