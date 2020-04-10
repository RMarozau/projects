/*Тригеры  на добавления, обновление и удаление*/

/*Accounts*/

--CREATE TRIGGER [dbo].[Account_INSERT]
--ON [dbo].[Accounts]
--AFTER insert
--AS
--Insert into dbo.History(id_Client,Operation)
--SELECT id_Client, 'таблица Account, cтрока с id_Account  = ' + CAST(id_Account as varchar) + ' добавлена '
--FROM inserted

--CREATE TRIGGER [dbo].[Account_Update]
--ON [dbo].[Accounts]
--AFTER update
--AS
--Insert into dbo.History(id_Client,Operation)
--SELECT id_Client, 'таблица Account, cтрока с id_Account  = ' + CAST(id_Account as varchar) + ' обновлена '
--FROM inserted

--CREATE TRIGGER [dbo].[Account_delete]
--ON [dbo].[Accounts]
--AFTER delete
--AS
--Insert into dbo.History(id_Client,Operation)
--SELECT id_Client, 'таблица Account, cтрока с id_Account  = ' + CAST(id_Account as varchar) + ' удалена '
--FROM deleted

/*Clients*/

--CREATE TRIGGER [dbo].[Client_INSERT]
--ON [dbo].[Clients]
--AFTER INSERT
--AS
--Insert into dbo.History(id_Client,Operation)
--SELECT id_Client, 'Клиент ' + Name_Client +  ' добавлен ' +  ' Адресс клиента: ' + Address
--FROM inserted

--CREATE TRIGGER [dbo].[Client_UPDATE]
--ON [dbo].[Clients]
--AFTER UPDATE
--AS
--Insert into dbo.History(id_Client,Operation)
--SELECT id_Client, 'Клиент ' + Name_Client +  ' обновлен ' +  ' Адресс клиента: ' + Address
--FROM inserted


--CREATE TRIGGER [dbo].[Client_DELETE]
--ON [dbo].[Clients]
--AFTER delete
--AS
--Insert into dbo.History(id_Client,Operation)
--SELECT id_Client, 'Клиент ' + Name_Client +  ' удален ' +  ' Адресс клиента: ' + Address
--FROM deleted