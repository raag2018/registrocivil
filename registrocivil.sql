create database registrocivil;
use registrocivil;
create table profesion(
	id int not null primary key auto_increment,
    nombre varchar(70) not null
);
create table departamento(
	id int not null primary key auto_increment,
    nombre varchar(70) not null
);
create table municipio(
	id int not null primary key auto_increment,
    id_departamento int not null,
    nombre varchar(70) not null,
    constraint fk_id_departamento foreign key(id_departamento) references departamento(id) 
);
create table nacionalidad(
	id int not null primary key auto_increment,
    nombre varchar(100) not null
);
create table genero(
	id int not null primary key auto_increment,
    nombre varchar(20) not null
);
create table estado_civil(
	id int not null primary key,
    nombre varchar(50) not null
);
create table persona(
	id int not null primary key auto_increment,
    id_profesion int not null,
    id_municipio int not null,
    id_nacionalidad int not null,
    id_genero int not null,
    id_estado_civil int not null,
    nombres varchar(100) not null,
    apellidos varchar(100) not null,
    edad int(3) not null,
    fecha_nac date not null,
    domicilio varchar(200),
    origen varchar(200),
    dui varchar(10) not null,
    apellido_casada varchar(70),
    constraint fk_id_profesion foreign key(id_profesion) references profesion(id),
    constraint fk_id_municipio foreign key(id_municipio) references municipio(id),
    constraint fk_id_nacionalidad foreign key(id_nacionalidad) references nacionalidad(id),
    constraint fk_id_genero foreign key(id_genero) references genero(id),
    constraint fk_id_estado_civil foreign key(id_estado_civil) references estado_civil(id)
);
create table tipo_regimen(
	id int not null primary key auto_increment,
    nombre varchar(70) not null
);
create table cargo(
	id int not null primary key auto_increment,
    nombre varchar(70) not null
);
create table funcionario(
	id int not null primary key auto_increment,
    id_cargo int not null,
    nombre varchar(150) not null,
    fecha_ini date not null,
    fecha_fin date not null,
    constraint fk_id_cargo foreign key(id_cargo) references cargo(id)
);

create table acta_previa(
	id int not null primary key auto_increment,
    id_tipo_regiment int not null,
    fecha_acta date not null,
    fecha_matrimonio date not null
);
create table persona_acta_previa(
	id_persona int not null,
    id_acta_previa int not null,
    primary key(id_persona, id_acta_previa),
    constraint fk_id_persona foreign key(id_persona) references persona(id),
    constraint fk_id_acta_previa_persona foreign key(id_acta_previa) references acta_previa(id)
);
create table funcionario_acta_previa(
	id_funcionario int not null,
    id_acta_previa int not null,
    primary key(id_funcionario, id_acta_previa),
    constraint fk_id_funcionario foreign key(id_funcionario) references funcionario(id),
    constraint fk_id_acta_previa_funcionario foreign key(id_acta_previa) references acta_previa(id)
);
