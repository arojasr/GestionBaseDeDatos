use negocioWeb;
/* Trigger para insert Articulo */
drop trigger if exists TR_Articulos_Insert;

delimiter //
create trigger TR_Articulos_Insert
	after insert
    on articulos for each row
    begin
		insert into control_tablas (tabla,accion,fecha,hora,usuario,terminal,idRegistro) 
        values 
        ('articulos','insert',current_date(),current_time(),current_user(), 
			(select user()),new.id);
    end;
// delimiter ;


/* Trigger para delete Articulo */
drop trigger if exists TR_Articulos_Delete;

delimiter //
create trigger TR_Articulos_Delete
	after delete
    on articulos for each row
    begin
		insert into control_tablas (tabla,accion,fecha,hora,usuario,terminal,idRegistro) 
        values 
        ('articulos','delete',current_date(),current_time(),current_user(), 
			(select user()),old.id);
    end;
// delimiter ;


/* Trigger para update Articulo */
drop trigger if exists TR_Articulos_Update;

delimiter //
	create trigger TR_Articulos_Update
    after update on articulos for each row
    begin
		insert into control_tablas (tabla,accion,fecha,hora,usuario,terminal,idRegistro) 
        values
        ('articulos','update',current_date(),current_time(),current_user(), 
			(select user()),old.id);
    end;
// delimiter ;
