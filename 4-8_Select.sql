/*4)*/select Name_Client, COUNT(*) as [count_acc], MIN(Date_Open) as first_date_open from Clients as c
			inner join Accounts as ac ON c.id_Client = ac.id_Client
			group by c.id_Client, Name_Client

/*5)*/select distinct id_Client,
(select Name_Client from Clients where id_Client = t1.id_Client) as NameClient, 
(Select MAX(Date_Close) from Accounts where t1.id_Client = Accounts.id_Client) as MAX_date
				from Accounts as t1 
				where not exists(select * from Accounts as t2 where Date_Close is NULL and t1.id_Client = t2.id_Client) 

/*6)*/Select Clients.Name_Client,* from Accounts join Clients ON Accounts.id_Client = Clients.id_Client where Name_Client Like '%Œ¿Œ%' or Account Like '%Œ¿Œ'or Account Like 'Œ¿Œ%'

/*7)*/declare @Name_Account varchar(max)
set @Name_Account = '¡Ã–÷'

UPDATE Accounts
SET  Ost = 0
where id_Client = (Select id_Client from Clients where Name_Client = @Name_Account)

/*8)*/select * from Clients 
		 join Accounts ON Accounts.id_Client = Clients.id_Client
		 where Date_Close is null