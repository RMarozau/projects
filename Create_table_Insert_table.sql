/*Создание таблиц*/

CREATE TABLE [dbo].[Accounts] (
    [id_Account] [int] NOT NULL IDENTITY(1,1),
    [id_Client] [int] NOT NULL,
    [Account] [varchar](28) NOT NULL,
    [Val] [varchar](3) NOT NULL,
    [Date_Open] [date] default getdate() NOT NULL,
    [Date_Close] [date],
    [Ost] [decimal](19, 2),
    CONSTRAINT [PK_dbo.Accounts] PRIMARY KEY ([id_Account])
)
CREATE INDEX [IX_id_Client] ON [dbo].[Accounts]([id_Client])
CREATE TABLE [dbo].[Clients] (
    [id_Client] [int] NOT NULL IDENTITY(1,1),
    [Name_Client] [varchar](50) NOT NULL,
    [Address] [varchar](50),
    CONSTRAINT [PK_dbo.Clients] PRIMARY KEY ([id_Client])
)
CREATE TABLE [dbo].[History] (
    [Id] [int] NOT NULL IDENTITY(1,1),
    [id_Client] [int] NOT NULL,
    [Operation] [nvarchar](200) NOT NULL,
    [CreateAt] [datetime] default getdate() NOT NULL,
    CONSTRAINT [PK_dbo.History] PRIMARY KEY ([Id])
)
ALTER TABLE [dbo].[Accounts] ADD CONSTRAINT [FK_dbo.Accounts_dbo.Clients_id_Client] FOREIGN KEY ([id_Client]) REFERENCES [dbo].[Clients] ([id_Client])

INSERT INTO [dbo].[Clients]
           ([Name_Client]
           ,[Address])
     VALUES
           ('ОАО Беларусьбанк','г.Минск'),
		   ('Приорбанк','г.Брест'),
		   ('БМРЦ','г.Минск')

INSERT INTO [dbo].[Accounts]
           ([id_Client]
           ,[Account]
           ,[Val]
		   ,[Date_Close] 
           ,[Ost])
     VALUES
           (
		   (Select id_Client from Clients where Name_Client = 'ОАО Беларусьбанк'),
		   'BY49NBRB101080001',
		   'BYN',
		   NULL,
		   30
		   ),
		   (
		   (Select id_Client from Clients where Name_Client = 'ОАО Беларусьбанк'),
		   'BY49NBRB101080002',
		   'USD',
		   NULL,
		   1000
		   ),
		   (
		   (Select id_Client from Clients where Name_Client = 'Приорбанк'),
		   'BY49NBRB101080003',
		   'USD',
		   NULL,
		   5000
		   ),
		   (
		   (Select id_Client from Clients where Name_Client = 'Приорбанк'),
		   'BY49NBRB101080004',
		   'RUB',
		   '2020-04-08',
		   50000
		   ),
		   (
		   (Select id_Client from Clients where Name_Client = 'БМРЦ'),
		   'BY49NBRB101080005',
		   'RUB',
		   '2020-04-08',
		   32000
		   ),
		   (
		   (Select id_Client from Clients where Name_Client = 'БМРЦ'),
		   'BY49NBRB101080006',
		   'RUB',
		   '2020-04-08',
		   342120
		   )


