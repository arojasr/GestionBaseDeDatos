use negocioWeb;
/* Procedimientos almacenados de insert Articulo */
drop procedure if exists SP_Articulos_Insert;

delimiter //
create procedure SP_Articulos_Insert(in 
		Pnombre varchar(20), 
        Pdescripcion varchar(20),
		Ptipo enum('PRENDA','JUGUETE','ALIMENTO','SNACK','ACCESORIO','CORREAS','MEDICAMENTO'),
		PespecieRecomendada enum('CANINO','FELINO','AVE','PEZ','ROEDOR'),
        Pcosto double,
        Pprecio double,
        Pstock int,
        PstockMinimo int,
        PstockMaximo int,
        Pcomentarios varchar(255),
        Pactivo boolean)
	begin
		insert into articulos (nombre,descripcion,tipo,especieRecomendada,costo,precio,stock,stockMinimo,stockMaximo,comentarios,activo)
		 	values
            (Pnombre,Pdescripcion,Ptipo,PespecieRecomendada,Pcosto,Pprecio,Pstock,PstockMinimo,PstockMaximo,Pcomentarios,Pactivo);
    end;
// delimiter ;

call SP_Articulos_Insert('Pantalon','Indumentaria','PRENDA','CANINO',120,170,20,1,30,'Tendencia',1);

/* Procedimientos almacenados de delete Articulo */
drop procedure if exists SP_Articulos_Delete;

delimiter //
create procedure SP_Articulos_Delete(in Pid int)
	begin
		delete from articulos where id = Pid;
    end;
// delimiter ;

call SP_Articulos_Delete(2);

/* Procedimientos almacenados de update Articulo */
drop procedure if exists SP_Articulos_Update;

delimiter //
create procedure SP_Articulos_Update(in 
		Pid int,
		Pnombre varchar(20), 
        Pdescripcion varchar(20),
		Ptipo enum('PRENDA','JUGUETE','ALIMENTO','SNACK','ACCESORIO','CORREAS','MEDICAMENTO'),
		PespecieRecomendada enum('CANINO','FELINO','AVE','PEZ','ROEDOR'),
        Pcosto double,
        Pprecio double,
        Pstock int,
        PstockMinimo int,
        PstockMaximo int,
        Pcomentarios varchar(255),
        Pactivo boolean)
	begin
		update articulos set nombre=Pnombre, descripcion=Pdescripcion, tipo=Ptipo, especieRecomendada=PespecieRecomendada,
			costo=Pcosto, precio=Pprecio, stock=Pstock, stockMinimo=PstockMinimo, stockMaximo=PstockMaximo,
            comentarios=Pcomentarios, activo=Pactivo
            where id=Pid;
    end;
// delimiter ;

call SP_Articulos_Update(
		1,
		(select nombre from articulos where id=1), 
		'',
		(select tipo from articulos where id=1),
		'FELINO',
        (select costo from articulos where id=1),
        (select precio from articulos where id=1),
        (select stock from articulos where id=1),
        (select stockMinimo from articulos where id=1),
        (select stockMaximo from articulos where id=1),
        (select comentarios from articulos where id=1),
        (select activo from articulos where id=1)
);
