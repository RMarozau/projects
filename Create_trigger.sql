/*�������  �� ����������, ���������� � ��������*/

/*Accounts*/

--CREATE TRIGGER [dbo].[Account_INSERT]
--ON [dbo].[Accounts]
--AFTER insert
--AS
--Insert into dbo.History(id_Client,Operation)
--SELECT id_Client, '������� Account, c����� � id_Account  = ' + CAST(id_Account as varchar) + ' ��������� '
--FROM inserted

--CREATE TRIGGER [dbo].[Account_Update]
--ON [dbo].[Accounts]
--AFTER update
--AS
--Insert into dbo.History(id_Client,Operation)
--SELECT id_Client, '������� Account, c����� � id_Account  = ' + CAST(id_Account as varchar) + ' ��������� '
--FROM inserted

--CREATE TRIGGER [dbo].[Account_delete]
--ON [dbo].[Accounts]
--AFTER delete
--AS
--Insert into dbo.History(id_Client,Operation)
--SELECT id_Client, '������� Account, c����� � id_Account  = ' + CAST(id_Account as varchar) + ' ������� '
--FROM deleted

/*Clients*/

--CREATE TRIGGER [dbo].[Client_INSERT]
--ON [dbo].[Clients]
--AFTER INSERT
--AS
--Insert into dbo.History(id_Client,Operation)
--SELECT id_Client, '������ ' + Name_Client +  ' �������� ' +  ' ������ �������: ' + Address
--FROM inserted

--CREATE TRIGGER [dbo].[Client_UPDATE]
--ON [dbo].[Clients]
--AFTER UPDATE
--AS
--Insert into dbo.History(id_Client,Operation)
--SELECT id_Client, '������ ' + Name_Client +  ' �������� ' +  ' ������ �������: ' + Address
--FROM inserted


--CREATE TRIGGER [dbo].[Client_DELETE]
--ON [dbo].[Clients]
--AFTER delete
--AS
--Insert into dbo.History(id_Client,Operation)
--SELECT id_Client, '������ ' + Name_Client +  ' ������ ' +  ' ������ �������: ' + Address
--FROM deleted