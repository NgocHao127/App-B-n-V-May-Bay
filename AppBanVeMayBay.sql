create database QLMayBay

use QLMayBay;

create table khachhang(
	makhachhang int,
	tentaikhoan nvarchar(50),
	tenkhachhang nvarchar(50),
	CCCD char(20),
	sdt char(10),
	gioitinh char(5),
	email nvarchar(50),
	ngaysinh date,
	quoctich nvarchar(50),
	diachi nvarchar(50),
	matkhau nvarchar(50),
	primary key (makhachhang),
)

create table quanly(
	maquanly int,
	tenquanly nvarchar(50),
	sdt char(10),
	gioitinh char(5),
	email nvarchar(50),
	ngaysinh date,
	matkhau nvarchar(50),
	primary key (maquanly),
)

create table nhanvien(
	manhanvien char(5),
	tennhanvien nvarchar(50),
	sdt char(10),
	gioitinh char(5),
	email nvarchar(50),
	ngaysinh date,
	tinhtrang nvarchar(50),
	loainhanvien nvarchar(50),
	maquanly int,
	primary key (manhanvien),
	foreign key (maquanly) references quanly (maquanly)
)

create table maybay(
	mamaybay nvarchar(50),
	hangbay nvarchar(50),
	primary key (mamaybay)
)

create table ve(
	mave varchar(50),
	loaive nvarchar(50),
	sovecon int,
	giave int,
	ngaydi date,
	ngayve date,
	tu nvarchar(50),
	den nvarchar(50),
	mamaybay nvarchar(50),
	maquanly int,
	primary key (mave),
	foreign key (mamaybay) references maybay (mamaybay),
	foreign key (maquanly) references quanly (maquanly)
)

create table datve(
	madatve varchar(50),
	mave varchar(50),
	loaikhach nvarchar(50),
	ghe varchar(10),
	loaighe nvarchar(50),
	mamaybay varchar(50),
	makhachhang int,
	primary key (mave),
	foreign key (mave) references ve (mave),
	foreign key (makhachhang) references khachhang (makhachhang)
)

create table hoadon(
	mahoadon varchar(50),
	tienthanhtoan int,
	makhachhang int,
	mave varchar(50),
	phuongthucthanhtoan nvarchar(50),
	manhanvien char(5),
	primary key (mahoadon),
	foreign key (makhachhang) references khachhang (makhachhang),
	foreign key (mave) references ve (mave),
	foreign key (manhanvien) references nhanvien (manhanvien)
)