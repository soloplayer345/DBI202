USE master
GO

IF EXISTS (SELECT * FROM sys.databases WHERE name='FUH_COMPANY')
	DROP DATABASE FUH_COMPANY
GO

CREATE DATABASE FUH_COMPANY
GO 

USE FUH_COMPANY
GO

CREATE TABLE tblDepartment(
	[depNum] [int] NOT NULL,
	[depName] [nvarchar](50) NULL,
	[mgrSSN] [decimal](18, 0) NULL,
	[mgrAssDate] [datetime] NULL,
 CONSTRAINT [PK_tblDepartment] PRIMARY KEY CLUSTERED 
(
	[depNum] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

CREATE TABLE tblDependent(
	[depName] [nvarchar](50) NOT NULL,
	[empSSN] [decimal](18, 0) NOT NULL,
	[depSex] [char](1) NULL,
	[depBirthdate] [datetime] NULL,
	[depRelationship] [nvarchar](50) NULL,
 CONSTRAINT [PK_tblDependent] PRIMARY KEY CLUSTERED 
(
	[depName] ASC,
	[empSSN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

CREATE TABLE tblDepLocation(
	[depNum] [int] NOT NULL,
	[locNum] [int] NOT NULL,
 CONSTRAINT [PK_tblDepLocation] PRIMARY KEY CLUSTERED 
(
	[depNum] ASC,
	[locNum] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

CREATE TABLE tblEmployee(
	[empSSN] [decimal](18, 0) NOT NULL,
	[empName] [nvarchar](50) NULL,
	[empAddress] [nvarchar](50) NULL,
	[empSalary] [decimal](18, 0) NULL,
	[empSex] [char](1) NULL,
	[empBirthdate] [datetime] NULL,
	[depNum] [int] NULL,
	[supervisorSSN] [decimal](18, 0) NULL,
	[empStartdate] [datetime] NULL,
 CONSTRAINT [PK_tblEmployee] PRIMARY KEY CLUSTERED 
(
	[empSSN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

CREATE TABLE tblLocation(
	[locNum] [int] IDENTITY(1,1) NOT NULL,
	[locName] [nvarchar](50) NULL,
 CONSTRAINT [PK_tblLocation] PRIMARY KEY CLUSTERED 
(
	[locNum] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

CREATE TABLE tblProject(
	[proNum] [int] NOT NULL,
	[proName] [nvarchar](50) NULL,
	[locNum] [int] NULL,
	[depNum] [int] NULL,
 CONSTRAINT [PK_tblProject] PRIMARY KEY CLUSTERED 
(
	[proNum] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

CREATE TABLE tblWorksOn(
	[empSSN] [decimal](18, 0) NOT NULL,
	[proNum] [int] NOT NULL,
	[workHours] [int] NULL,
 CONSTRAINT [PK_tblWorksOn] PRIMARY KEY CLUSTERED 
(
	[empSSN] ASC,
	[proNum] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

INSERT [tblDepartment] ([depNum], [depName], [mgrSSN], [mgrAssDate]) VALUES (1, N'Phòng Phần mềm trong nước', CAST(30121050037 AS Decimal(18, 0)), CAST(0x000092FD00000000 AS DateTime))
INSERT [tblDepartment] ([depNum], [depName], [mgrSSN], [mgrAssDate]) VALUES (2, N'Phòng Phần mềm nước ngoài', CAST(30121050142 AS Decimal(18, 0)), CAST(0x000095D400000000 AS DateTime))
INSERT [tblDepartment] ([depNum], [depName], [mgrSSN], [mgrAssDate]) VALUES (3, N'Phòng Giải pháp mạng truyền thông', CAST(30121050254 AS Decimal(18, 0)), CAST(0x00008EAC00000000 AS DateTime))
INSERT [tblDepartment] ([depNum], [depName], [mgrSSN], [mgrAssDate]) VALUES (4, N'Phòng Dịch vụ chăm sóc khách hàng', CAST(30121050295 AS Decimal(18, 0)), CAST(0x00009A1C00000000 AS DateTime))
INSERT [tblDepartment] ([depNum], [depName], [mgrSSN], [mgrAssDate]) VALUES (5, N'Phòng Nghiên cứu và phát triển', CAST(30121050184 AS Decimal(18, 0)), CAST(0x0000974700000000 AS DateTime))
INSERT [tblDependent] ([depName], [empSSN], [depSex], [depBirthdate], [depRelationship]) VALUES (N'Bùi Phương Ngọc', CAST(30121050180 AS Decimal(18, 0)), N'M', CAST(0x00005FEF00000000 AS DateTime), N'Chồng')
INSERT [tblDependent] ([depName], [empSSN], [depSex], [depBirthdate], [depRelationship]) VALUES (N'Đoàn Minh Đạo', CAST(30121050038 AS Decimal(18, 0)), N'M', CAST(0x0000598900000000 AS DateTime), N'Chồng')
INSERT [tblDependent] ([depName], [empSSN], [depSex], [depBirthdate], [depRelationship]) VALUES (N'Hà Mỹ Duyên', CAST(30121050037 AS Decimal(18, 0)), N'F', CAST(0x000072C900000000 AS DateTime), N'Vợ')
INSERT [tblDependent] ([depName], [empSSN], [depSex], [depBirthdate], [depRelationship]) VALUES (N'Hồ Đức Trung Hữu', CAST(30121050158 AS Decimal(18, 0)), N'M', CAST(0x0000560400000000 AS DateTime), N'Chồng')
INSERT [tblDependent] ([depName], [empSSN], [depSex], [depBirthdate], [depRelationship]) VALUES (N'Huỳnh Thị Ngọc Điệp', CAST(30121050049 AS Decimal(18, 0)), N'F', CAST(0x0000648200000000 AS DateTime), N'Vợ')
INSERT [tblDependent] ([depName], [empSSN], [depSex], [depBirthdate], [depRelationship]) VALUES (N'Nguyễn Thạc Hải', CAST(30121050254 AS Decimal(18, 0)), N'M', CAST(0x000064E200000000 AS DateTime), N'Chồng')
INSERT [tblDependent] ([depName], [empSSN], [depSex], [depBirthdate], [depRelationship]) VALUES (N'Nguyễn Thị Minh Hà', CAST(30121050184 AS Decimal(18, 0)), N'F', CAST(0x0000726400000000 AS DateTime), N'Em')
INSERT [tblDependent] ([depName], [empSSN], [depSex], [depBirthdate], [depRelationship]) VALUES (N'Nguyễn Thị Minh Hằng', CAST(30121050060 AS Decimal(18, 0)), N'F', CAST(0x00005CC000000000 AS DateTime), N'Vợ')
INSERT [tblDependent] ([depName], [empSSN], [depSex], [depBirthdate], [depRelationship]) VALUES (N'Nguyễn Thị Thu Hằng', CAST(30121050142 AS Decimal(18, 0)), N'F', CAST(0x000062CA00000000 AS DateTime), N'Vợ')
INSERT [tblDependent] ([depName], [empSSN], [depSex], [depBirthdate], [depRelationship]) VALUES (N'Nguyễn Thị Thùy Dung', CAST(30121050027 AS Decimal(18, 0)), N'F', CAST(0x00004CAF00000000 AS DateTime), N'Mẹ')
INSERT [tblDependent] ([depName], [empSSN], [depSex], [depBirthdate], [depRelationship]) VALUES (N'Phạm Nguyên Dũng', CAST(30121050015 AS Decimal(18, 0)), N'M', CAST(0x00005D2600000000 AS DateTime), N'Chồng')
INSERT [tblDependent] ([depName], [empSSN], [depSex], [depBirthdate], [depRelationship]) VALUES (N'Phan Thành Đăng', CAST(30121050035 AS Decimal(18, 0)), N'M', CAST(0x0000641500000000 AS DateTime), N'Chồng')
INSERT [tblDependent] ([depName], [empSSN], [depSex], [depBirthdate], [depRelationship]) VALUES (N'Vương Thị Kim Cúc', CAST(30121050004 AS Decimal(18, 0)), N'F', CAST(0x00006F9700000000 AS DateTime), N'Em')
INSERT [tblDepLocation] ([depNum], [locNum]) VALUES (1, 1)
INSERT [tblDepLocation] ([depNum], [locNum]) VALUES (1, 2)
INSERT [tblDepLocation] ([depNum], [locNum]) VALUES (1, 3)
INSERT [tblDepLocation] ([depNum], [locNum]) VALUES (1, 5)
INSERT [tblDepLocation] ([depNum], [locNum]) VALUES (2, 1)
INSERT [tblDepLocation] ([depNum], [locNum]) VALUES (2, 2)
INSERT [tblDepLocation] ([depNum], [locNum]) VALUES (2, 4)
INSERT [tblDepLocation] ([depNum], [locNum]) VALUES (3, 1)
INSERT [tblDepLocation] ([depNum], [locNum]) VALUES (3, 4)
INSERT [tblDepLocation] ([depNum], [locNum]) VALUES (4, 1)
INSERT [tblDepLocation] ([depNum], [locNum]) VALUES (4, 3)
INSERT [tblDepLocation] ([depNum], [locNum]) VALUES (4, 5)
INSERT [tblDepLocation] ([depNum], [locNum]) VALUES (5, 1)
INSERT [tblDepLocation] ([depNum], [locNum]) VALUES (5, 2)
INSERT [tblDepLocation] ([depNum], [locNum]) VALUES (5, 4)
INSERT [tblEmployee] ([empSSN], [empName], [empAddress], [empSalary], [empSex], [empBirthdate], [depNum], [supervisorSSN], [empStartdate]) VALUES (CAST(30121050004 AS Decimal(18, 0)), N'Mai Duy An', N'Long An', CAST(30000 AS Decimal(18, 0)), N'M', CAST(0x0000615900000000 AS DateTime), 1, CAST(30121050037 AS Decimal(18, 0)), CAST(0x00008EAC00000000 AS DateTime))
INSERT [tblEmployee] ([empSSN], [empName], [empAddress], [empSalary], [empSex], [empBirthdate], [depNum], [supervisorSSN], [empStartdate]) VALUES (CAST(30121050015 AS Decimal(18, 0)), N'Huỳnh Mai Anh', N'TP. Hồ Chí Minh', CAST(58000 AS Decimal(18, 0)), N'F', CAST(0x00005A5D00000000 AS DateTime), 1, CAST(30121050004 AS Decimal(18, 0)), CAST(0x000095DC00000000 AS DateTime))
INSERT [tblEmployee] ([empSSN], [empName], [empAddress], [empSalary], [empSex], [empBirthdate], [depNum], [supervisorSSN], [empStartdate]) VALUES (CAST(30121050027 AS Decimal(18, 0)), N'Nguyễn Thúy Quỳnh Anh', N'Nam Định', CAST(91000 AS Decimal(18, 0)), N'F', CAST(0x00006E3F00000000 AS DateTime), 1, CAST(30121050004 AS Decimal(18, 0)), CAST(0x0000960600000000 AS DateTime))
INSERT [tblEmployee] ([empSSN], [empName], [empAddress], [empSalary], [empSex], [empBirthdate], [depNum], [supervisorSSN], [empStartdate]) VALUES (CAST(30121050035 AS Decimal(18, 0)), N'Tống Thị Lan Anh', N'Vũng Tàu', CAST(78000 AS Decimal(18, 0)), N'F', CAST(0x0000707500000000 AS DateTime), 1, CAST(30121050037 AS Decimal(18, 0)), CAST(0x000094CA00000000 AS DateTime))
INSERT [tblEmployee] ([empSSN], [empName], [empAddress], [empSalary], [empSex], [empBirthdate], [depNum], [supervisorSSN], [empStartdate]) VALUES (CAST(30121050037 AS Decimal(18, 0)), N'Võ Việt Anh', N'Khánh Hòa', CAST(110000 AS Decimal(18, 0)), N'M', CAST(0x00006ACE00000000 AS DateTime), 1, NULL, CAST(0x00008F3B00000000 AS DateTime))
INSERT [tblEmployee] ([empSSN], [empName], [empAddress], [empSalary], [empSex], [empBirthdate], [depNum], [supervisorSSN], [empStartdate]) VALUES (CAST(30121050038 AS Decimal(18, 0)), N'Vũ Thuỵ Hồng Anh', N'TP. Hồ Chí Minh', CAST(104000 AS Decimal(18, 0)), N'F', CAST(0x00005ECD00000000 AS DateTime), 2, CAST(30121050142 AS Decimal(18, 0)), CAST(0x00008F3C00000000 AS DateTime))
INSERT [tblEmployee] ([empSSN], [empName], [empAddress], [empSalary], [empSex], [empBirthdate], [depNum], [supervisorSSN], [empStartdate]) VALUES (CAST(30121050049 AS Decimal(18, 0)), N'Trần Nguyễn Phương Bình', N'TP. Hồ Chí Minh', CAST(83000 AS Decimal(18, 0)), N'M', CAST(0x000054B500000000 AS DateTime), 2, CAST(30121050038 AS Decimal(18, 0)), CAST(0x0000965200000000 AS DateTime))
INSERT [tblEmployee] ([empSSN], [empName], [empAddress], [empSalary], [empSex], [empBirthdate], [depNum], [supervisorSSN], [empStartdate]) VALUES (CAST(30121050060 AS Decimal(18, 0)), N'Trần Thiện Bảo', N'TP. Hồ Chí Minh', CAST(75000 AS Decimal(18, 0)), N'M', CAST(0x00004FDF00000000 AS DateTime), 2, CAST(30121050038 AS Decimal(18, 0)), CAST(0x00009B3B00000000 AS DateTime))
INSERT [tblEmployee] ([empSSN], [empName], [empAddress], [empSalary], [empSex], [empBirthdate], [depNum], [supervisorSSN], [empStartdate]) VALUES (CAST(30121050142 AS Decimal(18, 0)), N'Nguyễn Hoàng Dũng', N'TP. Hồ Chí Minh', CAST(114000 AS Decimal(18, 0)), N'M', CAST(0x0000501D00000000 AS DateTime), 2, NULL, CAST(0x0000989800000000 AS DateTime))
INSERT [tblEmployee] ([empSSN], [empName], [empAddress], [empSalary], [empSex], [empBirthdate], [depNum], [supervisorSSN], [empStartdate]) VALUES (CAST(30121050158 AS Decimal(18, 0)), N'Lê Hoàng Linh Giang', N'Huế', CAST(98000 AS Decimal(18, 0)), N'F', CAST(0x0000521700000000 AS DateTime), 2, CAST(30121050142 AS Decimal(18, 0)), CAST(0x0000987F00000000 AS DateTime))
INSERT [tblEmployee] ([empSSN], [empName], [empAddress], [empSalary], [empSex], [empBirthdate], [depNum], [supervisorSSN], [empStartdate]) VALUES (CAST(30121050180 AS Decimal(18, 0)), N'Trần Ngọc Như Hằng', N'TP. Hồ Chí Minh', CAST(59000 AS Decimal(18, 0)), N'F', CAST(0x0000647300000000 AS DateTime), 5, CAST(30121050184 AS Decimal(18, 0)), CAST(0x000098B700000000 AS DateTime))
INSERT [tblEmployee] ([empSSN], [empName], [empAddress], [empSalary], [empSex], [empBirthdate], [depNum], [supervisorSSN], [empStartdate]) VALUES (CAST(30121050184 AS Decimal(18, 0)), N'Nguyễn Thị Minh Hưng', N'Thanh Hóa ', CAST(92000 AS Decimal(18, 0)), N'F', CAST(0x00006DD300000000 AS DateTime), 5, NULL, CAST(0x000098F500000000 AS DateTime))
INSERT [tblEmployee] ([empSSN], [empName], [empAddress], [empSalary], [empSex], [empBirthdate], [depNum], [supervisorSSN], [empStartdate]) VALUES (CAST(30121050254 AS Decimal(18, 0)), N'Bùi Thị Thu Hương', N'TP. Hà Nội', CAST(117000 AS Decimal(18, 0)), N'F', CAST(0x000063E400000000 AS DateTime), 3, NULL, CAST(0x00009AC500000000 AS DateTime))
INSERT [tblEmployee] ([empSSN], [empName], [empAddress], [empSalary], [empSex], [empBirthdate], [depNum], [supervisorSSN], [empStartdate]) VALUES (CAST(30121050265 AS Decimal(18, 0)), N'Phạm Thị Ngọc Hảo', N'Gia Lai', CAST(35000 AS Decimal(18, 0)), N'F', CAST(0x00006B2300000000 AS DateTime), 3, CAST(30121050254 AS Decimal(18, 0)), CAST(0x00009AF400000000 AS DateTime))
INSERT [tblEmployee] ([empSSN], [empName], [empAddress], [empSalary], [empSex], [empBirthdate], [depNum], [supervisorSSN], [empStartdate]) VALUES (CAST(30121050294 AS Decimal(18, 0)), N'Trịnh Hạnh', N'TP. Đà Nẵng', CAST(94000 AS Decimal(18, 0)), N'F', CAST(0x00006E0600000000 AS DateTime), 4, CAST(30121050295 AS Decimal(18, 0)), CAST(0x0000964B00000000 AS DateTime))
INSERT [tblEmployee] ([empSSN], [empName], [empAddress], [empSalary], [empSex], [empBirthdate], [depNum], [supervisorSSN], [empStartdate]) VALUES (CAST(30121050295 AS Decimal(18, 0)), N'Huỳnh Thị Như Hồng', N'TP. Cần Thơ', CAST(110000 AS Decimal(18, 0)), N'F', CAST(0x000064C000000000 AS DateTime), 4, NULL, CAST(0x00009B7500000000 AS DateTime))
INSERT [tblEmployee] ([empSSN], [empName], [empAddress], [empSalary], [empSex], [empBirthdate], [depNum], [supervisorSSN], [empStartdate]) VALUES (CAST(30121050322 AS Decimal(18, 0)), N'Đỗ Thị Thúy Hùng', N'Sông Bé', CAST(76000 AS Decimal(18, 0)), N'M', CAST(0x000059F700000000 AS DateTime), 3, CAST(30121050254 AS Decimal(18, 0)), CAST(0x000092C100000000 AS DateTime))
INSERT [tblEmployee] ([empSSN], [empName], [empAddress], [empSalary], [empSex], [empBirthdate], [depNum], [supervisorSSN], [empStartdate]) VALUES (CAST(30121050336 AS Decimal(18, 0)), N'Trương Thanh Hiền', N'TP. Hải Phòng', CAST(102000 AS Decimal(18, 0)), N'F', CAST(0x00005A6900000000 AS DateTime), 4, CAST(30121050295 AS Decimal(18, 0)), CAST(0x0000936800000000 AS DateTime))
INSERT [tblEmployee] ([empSSN], [empName], [empAddress], [empSalary], [empSex], [empBirthdate], [depNum], [supervisorSSN], [empStartdate]) VALUES (CAST(30121050341 AS Decimal(18, 0)), N'Nguyễn Đặng Hiếu', N'TP. Hồ Chí Minh', CAST(46000 AS Decimal(18, 0)), N'F', CAST(0x000064D000000000 AS DateTime), 4, CAST(30121050295 AS Decimal(18, 0)), CAST(0x00009AF300000000 AS DateTime))
INSERT [tblEmployee] ([empSSN], [empName], [empAddress], [empSalary], [empSex], [empBirthdate], [depNum], [supervisorSSN], [empStartdate]) VALUES (CAST(30121050418 AS Decimal(18, 0)), N'Vũ Phạm Minh Hương', N'TP. Hà Nội', CAST(30000 AS Decimal(18, 0)), N'F', CAST(0x0000663000000000 AS DateTime), 5, CAST(30121050184 AS Decimal(18, 0)), CAST(0x00009C5100000000 AS DateTime))
INSERT [tblEmployee] ([empSSN], [empName], [empAddress], [empSalary], [empSex], [empBirthdate], [depNum], [supervisorSSN], [empStartdate]) VALUES (CAST(30121050982 AS Decimal(18, 0)), N'Hồ Việt Hoà', N'Đồng Nai', CAST(95000 AS Decimal(18, 0)), N'M', CAST(0x0000640000000000 AS DateTime), 3, CAST(30121050254 AS Decimal(18, 0)), CAST(0x0000971600000000 AS DateTime))
SET IDENTITY_INSERT [tblLocation] ON 

INSERT [tblLocation] ([locNum], [locName]) VALUES (1, N'TP Hà Nội')
INSERT [tblLocation] ([locNum], [locName]) VALUES (2, N'TP Hải Phòng')
INSERT [tblLocation] ([locNum], [locName]) VALUES (3, N'TP Đà Nẵng')
INSERT [tblLocation] ([locNum], [locName]) VALUES (4, N'TP Huế')
INSERT [tblLocation] ([locNum], [locName]) VALUES (5, N'TP Hồ Chí Minh')
INSERT [tblLocation] ([locNum], [locName]) VALUES (6, N'TP Cần Thơ')
SET IDENTITY_INSERT [tblLocation] OFF
INSERT [tblProject] ([proNum], [proName], [locNum], [depNum]) VALUES (1, N'ProjectA', 1, 3)
INSERT [tblProject] ([proNum], [proName], [locNum], [depNum]) VALUES (2, N'ProjectB', 1, 2)
INSERT [tblProject] ([proNum], [proName], [locNum], [depNum]) VALUES (3, N'ProjectC', 3, 2)
INSERT [tblProject] ([proNum], [proName], [locNum], [depNum]) VALUES (4, N'ProjectD', 2, 1)
INSERT [tblProject] ([proNum], [proName], [locNum], [depNum]) VALUES (5, N'ProjectE', 5, 4)
INSERT [tblWorksOn] ([empSSN], [proNum], [workHours]) VALUES (CAST(30121050027 AS Decimal(18, 0)), 1, 7)
INSERT [tblWorksOn] ([empSSN], [proNum], [workHours]) VALUES (CAST(30121050027 AS Decimal(18, 0)), 2, 5)
INSERT [tblWorksOn] ([empSSN], [proNum], [workHours]) VALUES (CAST(30121050027 AS Decimal(18, 0)), 4, 18)
INSERT [tblWorksOn] ([empSSN], [proNum], [workHours]) VALUES (CAST(30121050035 AS Decimal(18, 0)), 4, 15)
INSERT [tblWorksOn] ([empSSN], [proNum], [workHours]) VALUES (CAST(30121050037 AS Decimal(18, 0)), 1, 10)
INSERT [tblWorksOn] ([empSSN], [proNum], [workHours]) VALUES (CAST(30121050037 AS Decimal(18, 0)), 2, 10)
INSERT [tblWorksOn] ([empSSN], [proNum], [workHours]) VALUES (CAST(30121050037 AS Decimal(18, 0)), 4, 15)
INSERT [tblWorksOn] ([empSSN], [proNum], [workHours]) VALUES (CAST(30121050037 AS Decimal(18, 0)), 5, 5)
INSERT [tblWorksOn] ([empSSN], [proNum], [workHours]) VALUES (CAST(30121050038 AS Decimal(18, 0)), 2, 33)
INSERT [tblWorksOn] ([empSSN], [proNum], [workHours]) VALUES (CAST(30121050038 AS Decimal(18, 0)), 3, 12)
INSERT [tblWorksOn] ([empSSN], [proNum], [workHours]) VALUES (CAST(30121050049 AS Decimal(18, 0)), 2, 24)
INSERT [tblWorksOn] ([empSSN], [proNum], [workHours]) VALUES (CAST(30121050049 AS Decimal(18, 0)), 3, 6)
INSERT [tblWorksOn] ([empSSN], [proNum], [workHours]) VALUES (CAST(30121050060 AS Decimal(18, 0)), 2, 21)
INSERT [tblWorksOn] ([empSSN], [proNum], [workHours]) VALUES (CAST(30121050060 AS Decimal(18, 0)), 3, 27)
INSERT [tblWorksOn] ([empSSN], [proNum], [workHours]) VALUES (CAST(30121050142 AS Decimal(18, 0)), 2, 9)
INSERT [tblWorksOn] ([empSSN], [proNum], [workHours]) VALUES (CAST(30121050142 AS Decimal(18, 0)), 3, 12)
INSERT [tblWorksOn] ([empSSN], [proNum], [workHours]) VALUES (CAST(30121050158 AS Decimal(18, 0)), 2, 21)
INSERT [tblWorksOn] ([empSSN], [proNum], [workHours]) VALUES (CAST(30121050158 AS Decimal(18, 0)), 3, 12)
INSERT [tblWorksOn] ([empSSN], [proNum], [workHours]) VALUES (CAST(30121050254 AS Decimal(18, 0)), 1, 24)
INSERT [tblWorksOn] ([empSSN], [proNum], [workHours]) VALUES (CAST(30121050265 AS Decimal(18, 0)), 1, 40)
INSERT [tblWorksOn] ([empSSN], [proNum], [workHours]) VALUES (CAST(30121050294 AS Decimal(18, 0)), 3, 5)
INSERT [tblWorksOn] ([empSSN], [proNum], [workHours]) VALUES (CAST(30121050294 AS Decimal(18, 0)), 5, 15)
INSERT [tblWorksOn] ([empSSN], [proNum], [workHours]) VALUES (CAST(30121050295 AS Decimal(18, 0)), 5, 15)
INSERT [tblWorksOn] ([empSSN], [proNum], [workHours]) VALUES (CAST(30121050322 AS Decimal(18, 0)), 1, 30)
INSERT [tblWorksOn] ([empSSN], [proNum], [workHours]) VALUES (CAST(30121050336 AS Decimal(18, 0)), 5, 15)
INSERT [tblWorksOn] ([empSSN], [proNum], [workHours]) VALUES (CAST(30121050982 AS Decimal(18, 0)), 1, 33)
INSERT [tblWorksOn] ([empSSN], [proNum], [workHours]) VALUES (CAST(30121050982 AS Decimal(18, 0)), 2, 10)
ALTER TABLE [tblDepartment]  WITH CHECK ADD  CONSTRAINT [FK_tblDepartment_tblEmployee] FOREIGN KEY([mgrSSN])
REFERENCES [tblEmployee] ([empSSN])
GO
ALTER TABLE [tblDepartment] CHECK CONSTRAINT [FK_tblDepartment_tblEmployee]
GO
ALTER TABLE [tblDependent]  WITH CHECK ADD  CONSTRAINT [FK_tblDependent_tblEmployee] FOREIGN KEY([empSSN])
REFERENCES [tblEmployee] ([empSSN])
GO
ALTER TABLE [tblDependent] CHECK CONSTRAINT [FK_tblDependent_tblEmployee]
GO
ALTER TABLE [tblDepLocation]  WITH CHECK ADD  CONSTRAINT [FK_tblDepLocation_tblDepartment] FOREIGN KEY([depNum])
REFERENCES [tblDepartment] ([depNum])
GO
ALTER TABLE [tblDepLocation] CHECK CONSTRAINT [FK_tblDepLocation_tblDepartment]
GO
ALTER TABLE [tblDepLocation]  WITH CHECK ADD  CONSTRAINT [FK_tblDepLocation_tblLocation] FOREIGN KEY([locNum])
REFERENCES [tblLocation] ([locNum])
GO
ALTER TABLE [tblDepLocation] CHECK CONSTRAINT [FK_tblDepLocation_tblLocation]
GO
ALTER TABLE [tblEmployee]  WITH CHECK ADD  CONSTRAINT [FK_tblEmployee_tblDepartment] FOREIGN KEY([depNum])
REFERENCES [tblDepartment] ([depNum])
GO
ALTER TABLE [tblEmployee] CHECK CONSTRAINT [FK_tblEmployee_tblDepartment]
GO
ALTER TABLE [tblEmployee]  WITH CHECK ADD  CONSTRAINT [FK_tblEmployee_tblEmployee] FOREIGN KEY([supervisorSSN])
REFERENCES [tblEmployee] ([empSSN])
GO
ALTER TABLE [tblEmployee] CHECK CONSTRAINT [FK_tblEmployee_tblEmployee]
GO
ALTER TABLE [tblProject]  WITH CHECK ADD  CONSTRAINT [FK_tblProject_tblDepartment] FOREIGN KEY([depNum])
REFERENCES [tblDepartment] ([depNum])
GO
ALTER TABLE [tblProject] CHECK CONSTRAINT [FK_tblProject_tblDepartment]
GO
ALTER TABLE [tblProject]  WITH CHECK ADD  CONSTRAINT [FK_tblProject_tblLocation] FOREIGN KEY([locNum])
REFERENCES [tblLocation] ([locNum])
GO
ALTER TABLE [tblProject] CHECK CONSTRAINT [FK_tblProject_tblLocation]
GO
ALTER TABLE [tblWorksOn]  WITH CHECK ADD  CONSTRAINT [FK_tblWorksOn_tblEmployee] FOREIGN KEY([empSSN])
REFERENCES [tblEmployee] ([empSSN])
GO
ALTER TABLE [tblWorksOn] CHECK CONSTRAINT [FK_tblWorksOn_tblEmployee]
GO
ALTER TABLE [tblWorksOn]  WITH CHECK ADD  CONSTRAINT [FK_tblWorksOn_tblProject] FOREIGN KEY([proNum])
REFERENCES [tblProject] ([proNum])
GO
ALTER TABLE [tblWorksOn] CHECK CONSTRAINT [FK_tblWorksOn_tblProject]
GO
ALTER TABLE [tblEmployee]  WITH CHECK ADD  CONSTRAINT [CHK_SexAge] CHECK  (([empSex]='F' AND (datepart(year,getdate())-datepart(year,[empBirthdate]))<=(70) OR [empSex]='M' AND (datepart(year,getdate())-datepart(year,[empBirthdate]))<=(75)))
GO
ALTER TABLE [tblEmployee] CHECK CONSTRAINT [CHK_SexAge]
GO
USE [master]
GO
ALTER DATABASE [FUH_COMPANY] SET  READ_WRITE 
GO
