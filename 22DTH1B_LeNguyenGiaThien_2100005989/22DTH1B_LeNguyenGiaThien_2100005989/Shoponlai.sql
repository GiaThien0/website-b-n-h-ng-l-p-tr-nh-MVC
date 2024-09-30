use master
go

drop database ShopOnline_Demo
go
-- Tạo database ShopOnline_Demo
create database ShopOnline_Demo
go
use ShopOnline_Demo
go
create table TaiKhoan
(
	taiKhoan varchar(20) primary key not null,
	matKhau varchar(20) not null,
	hoDem nvarchar(50) null,
	tenTV nvarchar(30) not null,
	ngaysinh datetime ,
	gioiTinh bit default 1,
	soDT nvarchar(20),
	email nvarchar(50),
	diaChi nvarchar(250),
	trangThai bit default 0,
	ghiChu ntext
)
create table KhachHang
(
	maKH varchar(10) primary key not null,
	tenKH nvarchar(50) not null,
	soDT varchar(20) ,
	email varchar(50),
	diaChi nvarchar(250),
	ngaySinh datetime ,
	gioiTinh bit default 1,
	ghiChu ntext
)
go
create table BaiViet
(
	maBV varchar(10) primary key not null,
	tenBV nvarchar(250) not null,
	hinhDD varchar(max),
	ndTomTat nvarchar(2000),
	ngayDang datetime ,
	loaiTin nvarchar(30),
	noiDung nvarchar(4000),
	taiKhoan varchar(20) not null ,
	daDuyet bit default 0,
	foreign key (taiKhoan) references taiKhoan(taiKhoan) on update cascade 
)
go
create table LoaiSP
(
	maLoai int primary key not null identity,
	tenLoai nvarchar(88) not null,
	ghiChu ntext default ''
)
go
create table SanPham
(
	maSP varchar(10) primary key not null,
	tenSP nvarchar(500) not NULL,
	hinhDD varchar(max) DEFAULT '',
	ndTomTat nvarchar(2000) DEFAULT '',
	ngayDang DATETIME DEFAULT CURRENT_TIMESTAMP,
	maLoai int not null references LoaiSP(maLoai),
	noiDung nvarchar(4000) DEFAULT '',
	taiKhoan varchar(20) not null foreign key references taiKhoan(taiKhoan) on update cascade,
	dvt nvarchar(32) default N'Cái',
	daDuyet bit default 0,
	giaBan float DEFAULT 0,
	giamGia INTEGER DEFAULT 0 CHECK (giamGia>=0 AND giamGia<=100),
	nhaSanXuat nvarchar(168) default ''
)
go
create table DonHang
(
	soDH varchar(10) primary key not null ,
	maKH varchar(10) not null foreign key references khachHang(maKH),
	taiKhoan varchar(20) not null foreign key references taiKhoan(taiKhoan) on update cascade ,
	ngayDat datetime,
	daKichHoat bit default 1,
	ngayGH datetime,
	diaChiGH nvarchar(250),
	ghiChu ntext
)
go	
create table CtDonHang	
(
	soDH varchar(10) not null foreign key references donHang(soDH),
	maSP varchar(10) not null foreign key references sanPham(maSP),
	soLuong int,
	giaBan bigint,
	giamGia BIGINT,
	PRIMARY KEY (soDH, maSP)
)
go

insert into taiKhoan(taiKhoan,matKhau,hoDem,tenTV,ngaysinh,gioiTinh,soDT,email,diaChi,trangThai,ghiChu)
values('thien','8D-96-9E-EF-6E-CA-D3-C2-9A-3A-62-92-80-E6-86-CF-0C-3F-5D-5A-86-AF-F3-CA-12-02-0C-92-3A-DC-6C-92',N'Lê Nguyễn Gia ','Thiện',08/10/2003,1,0793274633,'lenguyengiathien0@gmail.com','472 CMT8, P.11,Q3, TP.HCM',1,'')
insert into taiKhoan(taiKhoan,matKhau,hoDem,tenTV,ngaysinh,gioiTinh,soDT,email,diaChi,trangThai,ghiChu)
values('admin','8D-96-9E-EF-6E-CA-D3-C2-9A-3A-62-92-80-E6-86-CF-0C-3F-5D-5A-86-AF-F3-CA-12-02-0C-92-3A-DC-6C-92',N'Nguyễn Quang',N'Hưng',06/12/1996,1,0935694223,'nqhung@gmail.com','472 CMT8, P.11,Q3, TP.HCM',1,'')
insert into taiKhoan(taiKhoan,matKhau,hoDem,tenTV,ngaysinh,gioiTinh,soDT,email,diaChi,trangThai,ghiChu)
values('minh','8D-96-9E-EF-6E-CA-D3-C2-9A-3A-62-92-80-E6-86-CF-0C-3F-5D-5A-86-AF-F3-CA-12-02-0C-92-3A-DC-6C-92',N'Nguyễn Minh',N'Quang',06/12/1996,1,0935694223,'minhminh@gmail.com','472 CMT8, P.11,Q3, TP.HCM',1,'')



GO


insert into LoaiSP(tenLoai) values(N'XIAOMI')
insert into LoaiSP(tenLoai) values(N'IPHONE (APPPLE)')
insert into LoaiSP(tenLoai) values(N'SAMSUNG')
insert into LoaiSP(tenLoai) values(N'ASUS')
insert into LoaiSP(tenLoai) values(N'OPPO')
insert into LoaiSP(tenLoai) values(N'MACBOOK')
insert into LoaiSP(tenLoai) values(N'LAPTOP ACER')
insert into LoaiSP(tenLoai) values(N'LAPTOP ASUS')
insert into LoaiSP(tenLoai) values(N'LAPTOP DELL')
insert into LoaiSP(tenLoai) values(N'LAPTOP LENOVO')
insert into LoaiSP(tenLoai) values(N'LAPTOP HP')
insert into LoaiSP(tenLoai) values(N'LAPTOP MSI')
go

---------Xiaomi--------------------
insert into sanPham (maSP, tenSP, hinhDD, ndTomTat, taiKhoan, giaBan, giamGia, maLoai, nhaSanXuat, dvt) 
              values('XM1', N'Xiaomi Redmi Note 11 Pro 5G Cũ chính hãng', '/Asset/Images/Xaomi/Hình xaomi 1.jpeg',
			          N'Xiaomi Redmi Note 11 Pro 5G là một trong siêu phẩm điện thoại nổi bật nhất trong dòng Series Redmi Note 11 được nhiều tín đồ công nghệ quan tâm. Với hiệu năng cực kỳ ấn tượng trong tầm giá và viên pin khủng sẽ giúp sản phẩm này trở thành một phần không thể thiếu trong cuộc sống của bạn. Cùng 24hStore tìm hiểu thông tin Xiaomi Redmi Note 11 Pro 5G Cũ chi tiết hơn qua bài viết này nhé! '
					 , 'admin', 6090000,10,1,N'Xiaomi',N'Cái');



insert into sanPham (maSP, tenSP, hinhDD, ndTomTat, taiKhoan, giaBan, giamGia, maLoai, nhaSanXuat, dvt) 
              values('XM2', N'Xiaomi Redmi Note 11 Pro Chính hãng', '/Asset/Images/Xaomi/Hình xaomi 2.jpg','
			         Xiaomi Redmi Note 11 Pro được Xiaomi cho biết là một phiên bản nâng cấp của Redmi Note 11. Tuy nhiên, phiên bản này đã được rất nhiều người dùng công nghệ đánh giá cao vì hiệu năng ấn tượng với thiết kế cao cấp, sang trọng cùng chất lượng camera công nghệ cao.
 

', 'admin',595000,10,1,N'Xiaomi',
					  N'Cái');




insert into sanPham (maSP, tenSP, hinhDD, ndTomTat, taiKhoan, giaBan, giamGia, maLoai, nhaSanXuat, dvt) 
              values('XM3', N'Xiaomi Redmi Note 11S Chính hãng', '/Asset/Images/Xaomi/Hình xaomi 3.jpg',N'
			         Xiaomi Redmi Note 11S không những sở hữu ngôn ngữ thiết kế ấn tượng với ngoại hình bắt mắt mà bên trong còn chứa rất nhiều tính năng toàn diện và các thông số kỹ thuật ấn tượng. Khi smartphone này ra mắt liền đón nhận được rất nhiều phản hồi tích cực từ phía người dùng. Vậy, thiết kế ấn tượng như thế nào, tính năng toàn diện ra sao? Hãy cùng 24hStore đi tìm hiểu chi tiết về sản phẩm Xiaomi Redmi Note 11S trong bài viết sau đây nhé!

 

', 'admin',5290000 ,10,1,N'Xiaomi',
					  N'Cái');


insert into sanPham (maSP, tenSP, hinhDD, ndTomTat, taiKhoan, giaBan, giamGia, maLoai, nhaSanXuat, dvt) 
              values('XM4', N'Xiaomi Redmi 10C Chính hãng', '/Asset/Images/Xaomi/Hình xaomi 4.jpg',
			  
			  
			  N'Mới đây, nhà Xiaomi đã trình làng sản phẩm Xiaomi Redmi 10C tại thị trường Việt Nam vào tháng 07/2022. Với loạt điểm nổi trội là sở hữu viên pin trâu cùng một màn hình lớn giúp thiết bị này trở thành một smartphone hàng đầu ở phân khúc bình dân và là sự lựa chọn lý tưởng cho những bạn đang tìm mua một sản phẩm phục vụ nghe gọi và xem phim. Cùng với đó là mức giá hợp lý để người dùng có thể dễ dàng sở hữu. Sau đây là tất tần tật thông tin về Xiaomi Redmi 10C
			  
			  ', 'admin',3050000 ,10,1,N'Xiaomi',
					  N'Cái');




---------Iphone--------------------



insert into sanPham (maSP, tenSP, hinhDD, ndTomTat, taiKhoan, giaBan, giamGia, maLoai, nhaSanXuat, dvt) 
              values('Ip1', N'iPhone 14 Pro Max 1TB | Chính hãng VN/A', '/Asset/Images/Iphone/Hình 1.jpg',N'
			     iPhone 14 Pro Max 1TB chắc chắn là flagship chất nhất và đáng mong đợi nhất trong năm 2022. Gây ấn tượng mạnh mẽ trong sự kiện Far Out của Apple với tính năng Dynamic Island, thiết kế có màu sắc đặc biệt ấn tượng nhất. Cùng di động Store-GT tìm hiểu về chiếc điện thoại siêu đỉnh này để nhanh chóng sở hữu sự nâng cấp vượt trội cuản nhà Apple cùng với tính năng ấn tượng trên màn hình.


', 'admin',45490000 ,10,2,N'Iphone',
					  N'Cái');





insert into sanPham (maSP, tenSP, hinhDD, ndTomTat, taiKhoan, giaBan, giamGia, maLoai, nhaSanXuat, dvt) 
              values('Ip2', N'iPhone 13 Pro Max 1TB | Chính hãng VN/A', '/Asset/Images/Iphone/Hình 2.jpg',N'
			     iPhone 13 Pro Max Apple chính là dòng điện thoại được đánh giá nổi bật và cuốn hút người dùng iPhone nhất. Không chỉ sở hữu thiết kế cao cấp, thời gian sử dụng pin dài hơn cùng bộ nhớ khủng, iPhone Pro Max năm nay còn nâng cấp nhiều tính năng giúp người dùng có những trải nghiệm đầy ấn tượng.


', 'admin',38190000 ,10,2,N'Iphone',
					  N'Cái');

insert into sanPham (maSP, tenSP, hinhDD, ndTomTat, taiKhoan, giaBan, giamGia, maLoai, nhaSanXuat, dvt) 
              values('Ip3', N'iPhone 14 Plus 128GB | Chính hãng VN/A', '/Asset/Images/Iphone/Hình 3.png',N'
			     Trong sự kiện Far Out 2022, Apple đã cho ra mắt những siêu phẩm mang tính đột phá mới. Thay thế phiên bản mini trước đó, iPhone 14 Plus 128GB hứa hẹn sẽ mang tới cho người dùng những trải nghiệm trên cả tuyệt vời.




', 'admin',21490000 ,10,2,N'Iphone',
					  N'Cái');

insert into sanPham (maSP, tenSP, hinhDD, ndTomTat, taiKhoan, giaBan, giamGia, maLoai, nhaSanXuat, dvt) 
              values('Ip4', N'iPhone 8 64GB Cũ chính hãng', '/Asset/Images/Iphone/Hình 4.jpg',N'
			     Trong sự kiện Far Out 2022, Apple đã cho ra mắt những siêu phẩm mang tính đột phá mới. Thay thế phiên bản mini trước đó, iPhone 14 Plus 128GB hứa hẹn sẽ mang tới cho người dùng những trải nghiệm trên cả tuyệt vời.




', 'admin',3190000,10,2,N'Iphone',
					  N'Cái');



--------------SAMSUNG--------------

insert into sanPham (maSP, tenSP, hinhDD, ndTomTat, taiKhoan, giaBan, giamGia, maLoai, nhaSanXuat, dvt) 
              values('Ss1', N'Samsung Galaxy S22 Ultra - Phiên bản giới hạn', '/Asset/Images/Samsung/hình samsung 1.jpg',N'
			  Samsung ra mắt bộ sản phẩm giới hạn Sống đậm chất đêm Galaxy S22 Ultra, giúp người dùng mở rộng thế giới trong màn đêm và chia sẻ vẻ đẹp đó đến bạn bè, người thân thông qua những chế độ sáng tạo vượt bậc trên điện thoại. Cùng khám phá cuộc sống rực rỡ trong màn đêm với Samsung Galaxy S22 Ultra Limited Edition, lan tỏa rộng rãi thông điệp Sống đậm chất đêm. Bùng nổ khả năng sáng tạo của bạn, biến màn đêm trở thành một sân khấu tuyệt vời để bộc lộ hết tiềm năng với S22 Ultra Limited Edition. 



', 'admin',28990000 ,10,3,N'Samsung',
					  N'Cái');




insert into sanPham (maSP, tenSP, hinhDD, ndTomTat, taiKhoan, giaBan, giamGia, maLoai, nhaSanXuat, dvt) 
              values('Ss2', N'Samsung Galaxy S22 Plus', '/Asset/Images/Samsung/hình samsung 2.jpg',N'
			Trong sự kiện Galaxy Unpacked vừa qua được Samsung tổ chức, hãng đã chính thức ra mắt bộ ba dòng sản phẩm Samsung Galaxy S thế hệ tiếp theo. Ngoài hai mẫu Galaxy S22 và S22 Ultra, chiếc smartphone có tên Samsung Galaxy S22 Plus cũng rất được đại đa số người dùng công nghệ quan tâm và chú ý.

', 'admin',18390000 ,10,3,N'Samsung',
					  N'Cái');



insert into sanPham (maSP, tenSP, hinhDD, ndTomTat, taiKhoan, giaBan, giamGia, maLoai, nhaSanXuat, dvt) 
              values('Ss3', N'Samsung Galaxy Z Fold3 5G cũ ', '/Asset/Images/Samsung/hình samsung 3.jpg',N'
Vào tháng 8 năm 2021, Galaxy Z Fold 3 - siêu phẩm điện thoại màn hình gập đáng mong chờ nhất đã được ra mắt tại sự kiện Galaxy Unpacked 2021. Liệu sản phẩm này có những cải tiến mới gì xứng đáng với kỳ vọng của SamFans mong đợi hay không? Cùng 24hStore tìm hiểu nhé! 
			
', 'admin',19190000 ,10,3,N'Samsung',
					  N'Cái');



insert into sanPham (maSP, tenSP, hinhDD, ndTomTat, taiKhoan, giaBan, giamGia, maLoai, nhaSanXuat, dvt) 
              values('Ss4', N'Samsung Galaxy S21 Ultra 5G', '/Asset/Images/Samsung/hình samsung 4.jpg',N'
Samsung Galaxy S21 Ultra được xem là một quả “bom tấn” thực thụ của hãng công nghệ Hàn Quốc trong dịp đầu năm 2021. Với những cải tiến về camera, hiệu năng mẫu điện thoại này có gì hấp dẫn để thu hút người dùng.
', 'admin',17977000 ,10,3,N'Samsung',
					  N'Cái');





insert into sanPham (maSP, tenSP, hinhDD, ndTomTat, taiKhoan, giaBan, giamGia, maLoai, nhaSanXuat, dvt) 
              values('Ss5', N'Samsung Galaxy Z Flip4 5G', '/Asset/Images/Samsung/hình samsung 5.jpg',N'
Tin vui dành cho fan của điện thoại gập nhà Samsung, siêu phẩm Galaxy Z Flip4 sắp được trình làng sau thời gian dài hoàn thiện từ công nghệ đến thiết kế. Hứa hẹn đây sẽ là chiếc smartphone bùng nổ trong năm nay và thu hút được sự quan tâm đông đảo người dùng công nghệ. Cùng 24hStore đi tìm hiểu thông tin chi tiết về siêu phẩm điện thoại gập Samsung Galaxy Z Flip 4 mới nhất này nhé.    


', 'admin',15590000 ,10,3,N'Samsung',
					  N'Cái');



insert into sanPham (maSP, tenSP, hinhDD, ndTomTat, taiKhoan, giaBan, giamGia, maLoai, nhaSanXuat, dvt) 
              values('Ss6', N'Samsung Galaxy Note 20 Ultra 5G', '/Asset/Images/Samsung/hình samsung 6.jpg',N'
Tin vui dành cho fan của điện thoại gập nhà Samsung, siêu phẩm  Galaxy Note 20 Ultra 5G sắp được trình làng sau thời gian dài hoàn thiện từ công nghệ đến thiết kế. Hứa hẹn đây sẽ là chiếc smartphone bùng nổ trong năm nay và thu hút được sự quan tâm đông đảo người dùng công nghệ. Cùng 24hStore đi tìm hiểu thông tin chi tiết về siêu phẩm điện thoại gập Samsung Galaxy Z Flip 4 mới nhất này nhé.    


', 'admin',20490000 ,10,3,N'Samsung',
					  N'Cái');



insert into sanPham (maSP, tenSP, hinhDD, ndTomTat, taiKhoan, giaBan, giamGia, maLoai, nhaSanXuat, dvt) 
              values('Ss7', N'Samsung Galaxy A73 5G', '/Asset/Images/Samsung/hình samsung 7.jpg',N'
Năm 2022 là một năm đầy hào hứng đối với Samfan khi hàng loạt sản phẩm của Samsung đã và đang trong quá trình chuẩn bị ra mắt. Phải kể đến sự kiện Galaxy A diễn ra vào ngày 17/3 năm nay, Samsung đã chính thức trình làng Samsung A73, siêu phẩm smartphone thế hệ mới. Sở hữu thiết kế đẳng cấp cùng sức mạnh đáng kinh ngạc, Samsung Galaxy A73 5G có nhiều cải tiến mạnh mẽ, mới lạ, đảm bảo xứng đáng với sự đầu tư của bạn. Cùng 24hStore đi tìm hiểu thông tin chi tiết về siêu phẩm mới ra mắt này nhé!  

', 'admin',9590000 ,10,3,N'Samsung',
					  N'Cái');


insert into sanPham (maSP, tenSP, hinhDD, ndTomTat, taiKhoan, giaBan, giamGia, maLoai, nhaSanXuat, dvt) 
              values('Ss8', N'Samsung Galaxy S20 FE', '/Asset/Images/Samsung/hình samsung 8.jpg',N'
Samsung Galaxy S20 FE là mẫu flagship cao cấp quy tụ rất nhiều tính năng mà Samfan yêu thích, hứa hẹn sẽ mang lại trải nghiệm cao cấp của dòng Galaxy S với mức giá vô cùng dễ chịu.
', 'admin',10390000 ,10,3,N'Samsung',
					  N'Cái');



--------------ASUS--------------


insert into sanPham (maSP, tenSP, hinhDD, ndTomTat, taiKhoan, giaBan, giamGia, maLoai, nhaSanXuat, dvt) 
              values('As1', N'Asus ROG Phone 5 Cũ ', '/Asset/Images/Laptop Asus/hình 1.jpg',N'
Asus ROG Phone 5 cũ là phiên bản sở hữu hiệu năng đẳng cấp, sẵn sàng xử lý mọi game mobile đòi hỏi cấu hình phần cứng cao. Ngoài ra, với thiết kế khá hầm hố, độc đáo, dòng sản phẩm ROG Phone cũng được rất nhiều sự quan tâm và chú ý từ giới mộ điệu công nghệ.
', 'admin',7990000 ,10,4,N'Asus',
					  N'Cái');




insert into sanPham (maSP, tenSP, hinhDD, ndTomTat, taiKhoan, giaBan, giamGia, maLoai, nhaSanXuat, dvt) 
              values('As2', N'Asus ROG Phone 3 Tencent Cũ ', '/Asset/Images/Laptop Asus/hình 2.jpg',N'
Asus ROG Phone 3 Tencent được mệnh danh là “quái vật" với khả năng xử lý đa tác vụ, dễ dàng chạy đồ hoạ game một cách vượt trội. Nếu người dùng là một fan của các game trên điện thoại di động, thì đây là mẫu điện thoại thông minh không nên bỏ qua.

', 'admin',8990000 ,10,4,N'Asus',
					  N'Cái');



insert into sanPham (maSP, tenSP, hinhDD, ndTomTat, taiKhoan, giaBan, giamGia, maLoai, nhaSanXuat, dvt) 
              values('As3', N'Asus ROG Phone 3 Strix Edition Cũ','/Asset/Images/Laptop Asus/hình 3.jpg',N'

Asus ROG Phone 3 Strix Edition cũ là phiên bản rút gọn trong thế hệ ROG Phone 3. Tuy bị cắt giảm một số chi tiết ở vi xử lý, để hãng có thể hỗ trợ một mức giá tốt hơn cho người dùng có thể sở hữu, nhưng không vì thế mà phiên bản này giảm đi độ “hot" và được rất nhiều người dùng chú ý, quan tâm. Hãy cùng điểm qua những điểm nổi bật trên sản phẩm này.

', 'admin',7990000 ,10,4,N'Asus',
					  N'Cái');

--------------OPPO--------------

insert into sanPham (maSP, tenSP, hinhDD, ndTomTat, taiKhoan, giaBan, giamGia, maLoai, nhaSanXuat, dvt) 
              values('Op1', N'OPPO Reno8 5G ','/Asset/Images/Oppo/Hình 1.jpg',N'

Chỉ sau 5 tháng ra mắt thế hệ Reno8 Series, OPPO đã nhanh chóng ra mắt phiên bản mới Reno8 Series bao gồm 3 dòng là Reno8 5G, Reno8 Z 5G và Reno8 4G. Trong đó nổi bật là model Reno8 5G, dòng máy cao cấp nhất thuộc thế hệ Reno8 5G vừa ra mắt tại Việt Nam vào ngày 18/08. Cùng 24hStore tìm hiểu kỹ hơn về siêu phẩm này nhé!

', 'admin',12350000 ,10,5,N'OPPO',
					  N'Cái');

insert into sanPham (maSP, tenSP, hinhDD, ndTomTat, taiKhoan, giaBan, giamGia, maLoai, nhaSanXuat, dvt) 
              values('Op2', N'OPPO Reno7 Z 5G cũ ','/Asset/Images/Oppo/Hình 2.jpg',N'

Tháng 4 năm 2022, Oppo vừa chính thức ra mắt siêu phẩm OPPO Reno7 Z 5G tại thị trường Việt Nam. Đây là siêu phẩm smartphone sở hữu kiểu dáng vô cùng hiện đại và bộ vi xử lý siêu ấn tượng. Cùng 24hStore tìm hiểu những thông tin mô tả sản phẩm OPPO Reno7 Z 5G cũ chi tiết hơn nhé! 



', 'admin',6290000 ,10,5,N'OPPO',
					  N'Cái');



insert into sanPham (maSP, tenSP, hinhDD, ndTomTat, taiKhoan, giaBan, giamGia, maLoai, nhaSanXuat, dvt) 
              values('Op3', N'OPPO Reno8 Z 5G ','/Asset/Images/Oppo/Hình 3.jpg',N'
Vào đầu tháng 8 OPPO đã chính thức phát hành chính thức sản phẩm mới của mình là dòng OPPO Reno8 Z 5G. Chiếc smartphone này không chỉ sở hữu một cấu hình mạnh mẽ mà còn được khoác lên một thiết kế siêu bắt mắt và hiện đại. Cùng 24hStore đánh giá xem OPPO Reno8 Z 5G có gì và cấu hình hình mạnh ra sao qua bài viết dưới đây nhé!


', 'admin',9290000 ,10,5,N'OPPO',
					  N'Cái');


---------------MACBOOK-------------------


insert into sanPham (maSP, tenSP, hinhDD, ndTomTat, taiKhoan, giaBan, giamGia, maLoai, nhaSanXuat, dvt) 
              values('Mb1', N' MacBook Pro 16 inch 2021 M1 Max | Chính hãng Apple Việt Nam ',
'/Asset/Images/Macbook/Hình 1.jpg',N'

Sáng ngày 19/10, được  Apple đã ra mắt cùng với các dòng MacBook Pro khác, nhưng Macbook Pro 16 inch 2021 M1 Max đã gây dấu ấn mạnh với nhiều điểm nổi bật, tại sự kiện Unleashed. Bên cạnh việc sở hữu phong cách thiết kế, vừa lạ vừa quen, kèm với đó là độ mỏng của thiết bị và màn hình tai thỏ 120Hz ProMotion, cấu hình của MacBook Pro 2021 M1 Max thật sự có hiệu năng cực khủng, mạnh mẽ hơn rất nhiều nhờ sở hữu chipset M1 Max của Apple, một con chip hấp dẫn tuyệt đối. Và tất nhiên giá cả của chiếc MacBook này cũng sẽ tiêu hao đi khá nhiều tháng tiết kiệm của bạn đấy. Vậy cụ thể thì chiếc MacBook mới này có điều gì nổi bật khiến mọi người hào hứng đến thế, hãy cùng 24hStore tìm hiểu sâu thêm chiếc MacBook này nhé!
', 'admin',71990000 ,10,6,N'Apple',
					  N'Cái');

insert into sanPham (maSP, tenSP, hinhDD, ndTomTat, taiKhoan, giaBan, giamGia, maLoai, nhaSanXuat, dvt) 
              values('Mb2', N'Macbook Pro 13 inch 2022 M2 | Chính hãng Apple Việt Nam
',
'/Asset/Images/Macbook/Hình 2.jpg',N'
Tại Hội nghị các nhà phát triển toàn cầu hàng năm (WWDC), Apple đã công bố phiên bản máy tính xách tay MacBook Pro 13 inch 2022 M2. Phiên bản mới bổ sung chip M2 mới, hỗ trợ bộ nhớ thống nhất lên đến 24GB và hứa hẹn đem đến hiệu suất đột phá ấn tượng. 



', 'admin',29290000 ,10,6,N'Apple',
					  N'Cái');


insert into sanPham (maSP, tenSP, hinhDD, ndTomTat, taiKhoan, giaBan, giamGia, maLoai, nhaSanXuat, dvt) 
              values('Mb3', N' MacBook Pro 2020 M1 13 inch | Chính hãng Apple Việt Nam
',
'/Asset/Images/Macbook/Hình 3.jpg',N'
MacBook Pro 2020 M1 13 inch sở hữu thiết kế sang trọng, nhỏ gọn, màn hình Retina sắc nét, thời lượng pin khủng lên đến 20 giờ... Nổi bật hơn nữa là máy được Apple trang bị bộ vi xử lý Apple M1mới “độc nhất vô nhị” mang đến hiệu năng mạnh mẽ giúp người dùng có những giây phút trải nghiệm tuyệt vời đến đáng kinh ngạc.



', 'admin',26790000,10,6,N'Apple',
					  N'Cái');



---------------Laptop Acer-------------------
insert into sanPham (maSP, tenSP, hinhDD, ndTomTat, taiKhoan, giaBan, giamGia, maLoai, nhaSanXuat, dvt) 
              values('Ac1', N' Laptop Acer Aspire 7 Gaming A715 42G

',
'/Asset/Images/Laptop acer/Hình 1.jpg',N'

Laptop Acer Aspire 7 Gaming A715 42G Thiết kế nhỏ gọn tiện lợi cấu hình mạnh mẽ giải quyết các vấn đề về sức mạnh tầm trung giá rẻ.

', 'admin',21190000 ,10,7,N'Acer',
					  N'Cái');




insert into sanPham (maSP, tenSP, hinhDD, ndTomTat, taiKhoan, giaBan, giamGia, maLoai, nhaSanXuat, dvt) 
              values('Ac2', N' Laptop Acer Aspire A514 54 53T8


',
'/Asset/Images/Laptop acer/Hình 2.jpg',N'

Laptop Acer Aspire A514 54 53T8 Thiết kế nhỏ gọn tiện lợi cấu hình mạnh mẽ giải quyết các vấn đề về sức mạnh tầm trung giá rẻ.

', 'admin',19690000 ,10,7,N'Acer',
					  N'Cái');




insert into sanPham (maSP, tenSP, hinhDD, ndTomTat, taiKhoan, giaBan, giamGia, maLoai, nhaSanXuat, dvt) 
              values('Ac3', N' Laptop Acer Aspire A315 56 308N



',
'/Asset/Images/Laptop acer/Hình 3.jpg',N'

 Laptop Acer Aspire A315 56 308N Thiết kế nhỏ gọn tiện lợi cấu hình mạnh mẽ giải quyết các vấn đề về sức mạnh tầm trung giá rẻ.

', 'admin',11790000 ,10,7,N'Acer',
					  N'Cái');



---------------Laptop Asus-------------------



insert into sanPham (maSP, tenSP, hinhDD, ndTomTat, taiKhoan, giaBan, giamGia, maLoai, nhaSanXuat, dvt) 
              values('LtAsus1', N' Laptop Asus ZenBook UX325EA i5 1135G7




',
'/Asset/Images/Laptop Asus/hình 1.jpg',N'

Laptop Asus ZenBook UX325EA i5 (EG079T) khoác lên mình vẻ ngoài sang trọng, hiện đại kết hợp cùng cấu hình mạnh mẽ nhờ sở hữu chip Intel thế hệ thứ 11 mới nhất cùng ổ cứng SSD cho tốc độ load nhanh chóng và mượt mà, đây sẽ là chiếc máy tính lý tưởng hỗ trợ tốt cho bạn trong công việc và học tập.


', 'admin',23490000 ,10,8,N'LTAsus',
					  N'Cái');






insert into sanPham (maSP, tenSP, hinhDD, ndTomTat, taiKhoan, giaBan, giamGia, maLoai, nhaSanXuat, dvt) 
              values('LtAsus2', N' Laptop Asus ZenBook UX425EA i5 1135G7


',
'/Asset/Images/Laptop Asus/hình 3.jpg',N'

Laptop Asus ZenBook UX425EA i5 (KI839W) có thiết kế mỏng nhẹ thuận tiện cho việc mang theo bên mình, hiệu năng mạnh mẽ đến từ CPU Intel gen 11 xử lý mượt mà mọi tác vụ.

', 'admin',23390000 ,10,8,N'LTAsus',
					  N'Cái');




insert into sanPham (maSP, tenSP, hinhDD, ndTomTat, taiKhoan, giaBan, giamGia, maLoai, nhaSanXuat, dvt) 
              values('LtAsus3', N' Laptop Asus VivoBook A415EA i5 1135G7
',
'/Asset/Images/Laptop Asus/hình 2.jpg',N'

Laptop Asus VivoBook A415EA i5 (AM1637W) mang ngôn ngữ thiết kế hiện đại, cao cấp kết hợp vi xử lý Intel thế hệ 11 đáp ứng mượt mà mục đích phục vụ công việc và hoạt động giải trí hằng ngày của bạn.

', 'admin',18990000 ,10,8,N'LTAsus',
					  N'Cái');


---------------Laptop DEll-------------------



insert into sanPham (maSP, tenSP, hinhDD, ndTomTat, taiKhoan, giaBan, giamGia, maLoai, nhaSanXuat, dvt) 
              values('LtDell1', N' Laptop Dell Vostro 5510',

'/Asset/Images/Laptop Dell/Hình 1.jpg',N'

Laptop Dell Vostro 5510 i5 11320H (70270646) thu hút với ngoại hình thanh lịch nhưng không kém phần sang trọng cùng mức hiệu năng ổn định từ chip thế hệ 11 của nhà Intel, cân mọi tác vụ văn phòng hay đồ họa cần thiết, đáp ứng tốt nhu cầu sử dụng của bạn.



', 'admin',18990000 ,10,9,N'LTDell',
					  N'Cái');



insert into sanPham (maSP, tenSP, hinhDD, ndTomTat, taiKhoan, giaBan, giamGia, maLoai, nhaSanXuat, dvt) 
              values('LtDell2', N' Laptop Dell Inspiron 14 5415 ',
'/Asset/Images/Laptop Dell/Hình 2.jpg',N'

Laptop Dell Inspiron 14 5415 R7 (TX4H61) sở hữu vẻ ngoài sang trọng cùng với hiệu năng vượt trội đến từ bộ xử lý AMD tiên tiến hứa hẹn giúp bạn hoàn thành mọi tác vụ một cách nhanh nhất.


', 'admin',19090000 ,10,9,N'LTDell',
					  N'Cái');



insert into sanPham (maSP, tenSP, hinhDD, ndTomTat, taiKhoan, giaBan, giamGia, maLoai, nhaSanXuat, dvt) 
              values('LtDell3', N' Laptop Dell Vostro 3405',
'/Asset/Images/Laptop Dell/Hình 3.jpg',N'

Laptop Dell Vostro 3405 R5 (V4R53500U003W1) được trang bị chip xử lý mạnh mẽ từ nhà sản xuất AMD mang tới một cấu hình ổn định đảm bảo vận hành mượt mà các tác vụ văn phòng cùng thiết kế gọn gàng với vẻ ngoài thanh lịch hứa hẹn đáp ứng cho nhu cầu học tập, công việc cũng như giải trí hoàn hảo.

', 'admin',17990000 ,10,9,N'LTDell',
					  N'Cái');

---------------LAPTOP LENOVO-----------

insert into sanPham (maSP, tenSP, hinhDD, ndTomTat, taiKhoan, giaBan, giamGia, maLoai, nhaSanXuat, dvt) 
              values('Ltlevono1', N' Laptop Lenovo IdeaPad Gaming 3 15IMH05 ',

'/Asset/Images/Laptop Lenovo/Hình 1.jpg',N'

Lenovo Gaming 15IMH05 i7 (81Y40068VN) đi theo một phong cách thiết kế hiện đại hơn, mỏng nhẹ hơn nhưng vẫn mang những nét đặc trưng của laptop gaming và nó hướng tới đối tượng thường xuyên mang theo laptop nhưng vẫn có thể giải trí với các tựa game hot hiện nay.


', 'admin',23890000 ,10,10,N'Ltlevono',
					  N'Cái');

insert into sanPham (maSP, tenSP, hinhDD, ndTomTat, taiKhoan, giaBan, giamGia, maLoai, nhaSanXuat, dvt) 
              values('Ltlevono2', N' Laptop Lenovo ThinkBook 14s G2 ITL',


'/Asset/Images/Laptop Lenovo/Hình 2.jpg',N'

Laptop Lenovo ThinkBook 14s G2 ITL i5 (20VA000NVN) là chiếc laptop văn phòng được thiết kế đẹp mắt với mặt lưng 2 tông màu cùng sức mạnh xử lý ổn định, mượt mà các phần mềm office, đồ họa 2D nhờ con chip Intel i5 gen 11 và Iris Xe Graphics.

', 'admin',23890000 ,10,10,N'Ltlevono',
					  N'Cái');



insert into sanPham (maSP, tenSP, hinhDD, ndTomTat, taiKhoan, giaBan, giamGia, maLoai, nhaSanXuat, dvt) 
              values('Ltlevono3', N' Laptop Lenovo ThinkBook 14 G2 ITL',

'/Asset/Images/Laptop Lenovo/Hình 3.jpg',N'

Laptop Lenovo ThinkBook 14 G2 ITL i7 (20VD003LVN) sở hữu con chip Intel Core i7 Tiger Lake mạnh mẽ, đáp ứng đa dạng các nhu cầu học tập và làm việc. Thiết kế gọn nhẹ thuận tiện mang theo bên mình xử lý công việc mọi lúc mọi nơi.
', 'admin',20290000 ,10,10,N'Ltlevono',
					  N'Cái');



-----------LAPTOP HP----------

insert into sanPham (maSP, tenSP, hinhDD, ndTomTat, taiKhoan, giaBan, giamGia, maLoai, nhaSanXuat, dvt) 
              values('LtHp1', N' Laptop HP EliteBook X360 830',

'/Asset/Images/Laptop HP/Hình 1.jpg',N'
Laptop 2 trong 1 HP EliteBook X360 830 G7 i7 (230L5PA) với khả năng xoay gập 360 độ cực linh hoạt, bên cạnh thiết kế độc đáo là một cấu hình mạnh mẽ giúp bạn hoàn thành mọi công việc một cách tốt nhất.

', 'admin',34290000 ,10,11,N'LtHp',
					  N'Cái');

insert into sanPham (maSP, tenSP, hinhDD, ndTomTat, taiKhoan, giaBan, giamGia, maLoai, nhaSanXuat, dvt) 
              values('LtHp2', N' Laptop HP Envy 13-ba1030TU',


'/Asset/Images/Laptop HP/Hình 2.jpg',N'
Laptop HP Envy 13 ba0046TU i5 1035G4 (171M7PA) với cấu hình được trang bị chip Intel Core i5 đem đến hiệu năng ổn định phù hợp với các tác vụ văn phòng và một số tác vụ thiết kế 2D cơ bản. Chiếc laptop này đáp ứng tốt nhu cầu vừa cần hiệu năng ổn định vừa cần thiết kế gọn nhẹ của người dùng.
', 'admin',29990000 ,10,11,N'LtHp',
					  N'Cái');



insert into sanPham (maSP, tenSP, hinhDD, ndTomTat, taiKhoan, giaBan, giamGia, maLoai, nhaSanXuat, dvt) 
              values('LtHp3', N' Laptop HP EliteBook 840 G8',

'/Asset/Images/Laptop HP/Hình 3.jpg',N'
Laptop HP EliteBook 840 G8 được đánh giá là chiếc máy tính xách tay mạnh mẽ, an toàn, bền bỉ, dễ dàng kết nối và đáp ứng mọi nhu cầu giúp người sử dụng làm việc và học tập hiệu quả hơn dù đang ở đâu.

', 'admin',29590000 	,10,11,N'LtHp',
					  N'Cái');
--------------Laptop MSI--------------

insert into sanPham (maSP, tenSP, hinhDD, ndTomTat, taiKhoan, giaBan, giamGia, maLoai, nhaSanXuat, dvt) 
              values('LtMSI1', N' Laptop MSI GF75 Thin 10SCXR',

'/Asset/Images/Laptop MSI/Hình 1.jpg',N'

Đến từ thể loại laptop gaming như MSI GF75 Thin 10SCXR 013VN lại sở hữu một vẻ ngoài giản dị đến mức khó tin, các bạn có thể nhầm lẫn chiếc sản phẩm với phân khúc laptop văn phòng. Mặt ngoài của MSI GF75 Thin 10SCXR 013VN được làm từ hợp kim nhôm cùng lớp phay xước xám bạc đem lại vẻ ngoài vô cùng sang trọng và mạnh mẽ cho chiếc laptop của chúng ta. Và hợp kim nhôm chính là chất liệu cấu tạo nên kết cấu vô cùng nhẹ nhàng mà vẫn đem lại sự bền bỉ cần thiết cho MSI GF75 Thin 10SCXR 013VN. Đây xứng đáng là một trong những chiếc laptop gaming mỏng nhẹ tốt nhất hiện nay.


', 'admin',23390000 ,10,12,N'LtMSI',
					  N'Cái');




insert into sanPham (maSP, tenSP, hinhDD, ndTomTat, taiKhoan, giaBan, giamGia, maLoai, nhaSanXuat, dvt) 
              values('LtMSI2', N' Laptop MSI Gaming GF63 Thin 10SC',



'/Asset/Images/Laptop MSI/Hình 2.jpg',N'

Laptop MSI thương hiệu không còn xa lạ gì với các game thủ khi các dòng laptop gaming của thương hiệu này đều vô cùng chất lương và MSI GF63 Thin 11UD 473VN cũng không phải ngoại lệ. Hãy cùng GEARVN tìm hiểu về chiếc laptop gaming giá rẻ từ MSI sẽ được hội tụ những gì nhé!

', 'admin',22890000 	,10,12,N'LtMSI',
					  N'Cái');


insert into sanPham (maSP, tenSP, hinhDD, ndTomTat, taiKhoan, giaBan, giamGia, maLoai, nhaSanXuat, dvt) 
              values('LtMSI3', N' Laptop MSI Modern 14 B5M',

'/Asset/Images/Laptop MSI/Hình 3.jpg',N'

Laptop MSI Modern 14 B5M R5 5500U (203VN) sở hữu kiểu dáng thanh lịch với thiết kế màn hình viền mỏng cùng cấu hình ổn định, sẵn sàng đồng hành cùng bạn trong mọi tác vụ xử lý công việc hay giải trí.
', 'admin',16690000 	,10,12,N'LtMSI',
					  N'Cái');

