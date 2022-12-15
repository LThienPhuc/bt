--Cau 1
create table MonHoc(
MaMon char(5) not null primary key,
TenMon nvarchar(20),
SoTC int)
create table SinhVien(
MaSV char(5) not null primary key,
HoTen nvarchar(30),
NgaySinh smalldatetime)
create table Diem(
MaSV char(5) not null,
MaMon char(5) not null,
Diemthi float,
constraint fk_Masv foreign key(MaSV) references SinhVien(MaSV),
constraint fk_Mamh foreign key(MaMon) references Monhoc(MaMon),
constraint pk_Masv_Mamh primary key(MaSV, MaMon))
 
 go 
 insert into MonHoc values
 ('MM1','Hoa Cao Cap',3),
 ('MM2','Lap Trinh Wed',3),
 ('MM3','BigData',3)
 insert into SinhVien values
 ('SV5','Le Thien Phuc','2002-12-22'),
 ('SV6','Dang Pham Gia Hung','2002-12-6'),
 ('SV7','Pham Thuy Phuong Vy','2002-9-5')
 insert into Diem values
 ('SV5','MM1',4),
 ('SV6','MM3',5),
 ('SV7','MM2',1),
 ('SV7','MM2',2),
 ('SV5','MM1',5)
 go

 select *
 from MonHoc

 go

 select *
 from SinhVien

 go
 select *
 from Diem

--Cau 2
go
create function thongke (@tmh nvarchar(20))
returns int
as
begin
 declare @dem int
 set @dem = (select count(@tmh) from Diem join MonHoc on MonHoc.MaMON = Diem.MaMON where Diem.DiemThi<5)
 return @dem
end
go
select dbo.thongke('MM1')

--Cau 3 
go
create procedure Diem(@MaSV char(5),@MaMon char(5), @DiemThi float)
as
insert into Diem(MaSV,MaMon,Diemthi) values(@MaSV,@MaMon,@DiemThi)
go
Diem 'SV5','MM1',4

--Cau 4
go
create trigger them_sua
on Diem
for  insert, update
as
if(select DiemThi From inserted)>10 and (select DiemThi From inserted)<0
begin
print
'khong cho phep'
rollback transaction
end
insert into Diem
values ('SV5','MM3','4')



