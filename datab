drop database if exists flash;

create database flash;
use flash;

create table rol(
	id int primary key auto_increment not null, 
    nombreRol varchar(60) not null 
    );

create table persona(
	id int primary key auto_increment not null,
    boleta varchar(60) not null,
    nombre varchar(60) not null,
    apellPat varchar(60) not null,
    apellMat varchar(60) not null,
    usuario varchar(60) not null,
    contrasena varchar(60) not null,
    email varchar(60) not null,
    idRol int not null,
    ## estado 0= inactivo, 1=activo 
    estado int not null,
    foreign key (idRol) references rol (id)
	);
alter table persona add imagen varchar(60) not null;
    
create table cuestionario(
	id int primary key auto_increment not null, 
    fecha date not null,
    idProfesor int not null,
    foreign key (idProfesor) references persona (id)
	);
    
create table preguntas(
	id int primary key auto_increment not null, 
    respCorr varchar(60) not null,
    respInc1 varchar(60) not null,
    respInc2 varchar(60) not null,
    respInc3 varchar(60) not null,
    tiempo int not null,
    idCuestionario int not null,
    foreign key(idCuestionario) references cuestionario (id)
    );
    
create table grupo(
	id int primary key auto_increment not null, 
    nombre varchar(60) not null,
    claveGrupo varchar(60) not null
	);
    
create table relGrupoPer(
	idPer int not null,
    idGrupo int not null,
    foreign key(idPer) references persona (id),
    foreign key(idGrupo) references grupo (id)
    );
    
create table relGrupoCuest(
	idGrupo int not null,
    idCuestionario int not null,
    foreign key(idGrupo) references grupo (id),
    foreign key(idCuestionario) references cuestionario (id)
    );
    
## Store Procedures 

drop procedure if exists spGuardaPer;

delimiter :v

create procedure spGuardaPer(in id_ int, in boleta_ varchar(60), in nombre_ varchar(60), in apellPat_ varchar(60), in apellMat_ varchar(60),in usuario_ varchar(60), in contrasena_ varchar(60), in email_ varchar(60), in idRol_ int, in estado_ int, in contrasena2_ varchar(60), in img_ varchar(60))
begin
declare id int;
declare msj varchar(120);
declare existe int;

/*1*/if (id_=0) then 
set existe =(select count(*) from persona g where boleta_=g.boleta);
	/*2*/if(existe=0) then
		#set existe =(select count(*) from persona g where concat(nombre_,apellPat_,apellMat)=concat(g.nombre,g.apellPat,g.apellMat));
		/*3*/#if(existe=0) then
			set existe=(select count(*) from persona g where usuario_=g.usuario);
            if (existe=0) then
				set existe=(select count(*) from persona g where email_=g.email);
                if (existe=0) then
                
					if (idRol_=1) then
						set img_='defaultProf.jpg';
					else
						set img_='defaultAlum.jpg';
					end if;
					
                    insert into persona(boleta, nombre, apellPat, apellMat, usuario, contrasena, email, idRol, estado, imagen) values(boleta_, nombre_, apellPat_, apellMat_, usuario_, md5(contrasena_), email_, idRol_, estado_, img_);
                    set msj='Registrado exitosamente';
                else
					set msj='E-mail ya registrado';
                end if;
            else
				set msj='Usuario ya registrado';
            end if;
        
		/*3*/#else
			#set msj='Nombre ya registrado';
		/*3*/#end if;
	/*2*/else
		set msj='Boleta ya registrada';
   /*2*/end if;

/*1*/else
	set existe=(select count(*) from persona p where p.id=id_);
	if (existe=1) then
		set existe=(select count(*) from persona p where id_=p.id and md5(contrasena_)=p.contrasena);
		if (existe=1) then 
			set boleta_=ifnull(boleta_,(select boleta from persona p where id_=p.id)); 
			set nombre_=ifnull(nombre_,(select nombre from persona p where id_=p.id)); 
            set apellPat_=ifnull(apellPat_,(select apellPat from persona p where id_=p.id)); 
            set apellMat_=ifnull(apellMat_,(select apellMat from persona p where id_=p.id));
            
            if contrasena2_=' ' then
				set contrasena_=(select contrasena from persona p where id_=p.id);
			else
	            set contrasena_=md5(contrasena2_);
            end if;
            
            set estado_=ifnull(estado_,(select estado from persona p where id_=p.id)); 
			set img_=ifnull(img_,(select imagen from persona p where id_=p.id)); 
            
            update persona p set p.boleta=boleta_, p.nombre=nombre_, p.apellPat=apellPat_, p.apellMat=apellMat_, p.contrasena=contrasena_, p.estado=estado_ , p.imagen=img_ where p.id=id_;
            
            set msj='guardado correctamente';
        else
			set msj='Contraseña incorrecta';
        end if;
    else
		set msj='No existes';
    end if;

/*1*/end if;


select msj;
end;

:v
    
delimiter ;


drop procedure if exists spIniciaSes;

delimiter :v

create procedure spIniciaSes(in usr varchar(60), in psw varchar(120))
begin 
declare idp int;
declare existe int;
declare msj varchar(60);
set existe=(select count(*) from persona p where usr=p.usuario or usr=p.email);
if existe=1 then
	set idp=(select id from persona p where usr=p.usuario or usr=p.email);
    set existe=(select count(*) from persona p where idp=p.id and p.contrasena=md5(psw));
    if existe=1 then
		select idp as mensaje;
	else
		set msj='No coincide usuario y contraseña';
        select msj as mensaje;
	end if;
else
	set msj='No existe ese usuario o e-mail';
    select msj as mensaje;
end if;


end;

:v

delimiter ;




select * from persona;	



insert into rol values(1, 'maestro');
insert into rol values(2, 'alumno');

select md5('pitosgrandes');


call spIniciaSes('lascaresj@gmail.com', '12345');

call spGuardaPer(0, 'SOdLsasaJ', 'Jossa', 'Soria','Láscars','JdoJSL', '123456', 'lasca@gmail.com', 2,1, ' ', 'img.jpg');

call spGuardaPer(4, '2016090012', 'Ignacio Adrian', 'Aguirre', 'Miranda', 'igneo', 'pitosgrandes', 'caca@gmail.com',2,1,' ','defaultProf.jpg');
#spGuardaPer(in id_ int, in boleta_ varchar(60), in nombre_ varchar(60), in apellPat_ varchar(60), in apellMat_ varchar(60),in usuario_ varchar(60), in contrasena_ varchar(60), in email_ varchar(60), in idRol_ int, in estado_ int, in contrasena2_ varchar(60), in img_ varchar(60))

select * from persona;

describe persona;

update persona set contrasena='e807f1fcf82d132f9bb018ca6738a19f' where id=4;
