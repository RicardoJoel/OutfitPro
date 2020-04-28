-- Table: public.perfil

-- DROP TABLE public.perfil;

CREATE TABLE public.perfil
(
    id serial NOT NULL,
    nombre character varying(100) COLLATE pg_catalog."default" NOT NULL,
    descripcion character varying(500) COLLATE pg_catalog."default" NOT NULL,
    nivelacceso integer NOT NULL,
    activo boolean NOT NULL DEFAULT true,
    idusuariocreacion bigint NOT NULL DEFAULT 0,
    fechahoracreacion timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
    idusuariomodificacion bigint NOT NULL DEFAULT 0,
    fechahoramodificacion timestamp without time zone,
    CONSTRAINT perfil_pkey PRIMARY KEY (id)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.perfil
    OWNER to postgres;
    
-- Table: public.ubigeo

-- DROP TABLE public.ubigeo;

CREATE TABLE public.ubigeo
(
    id serial NOT NULL,
    departamento character varying(100) COLLATE pg_catalog."default" NOT NULL,
    provincia character varying(100) COLLATE pg_catalog."default" NOT NULL,
    distrito character varying(100) COLLATE pg_catalog."default" NOT NULL,
    activo boolean NOT NULL DEFAULT true,
    idusuariocreacion integer NOT NULL DEFAULT 0,
    fechahoracreacion timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
    idusuariomodificacion integer NOT NULL DEFAULT 0,
    fechahoramodificacion timestamp without time zone,
    CONSTRAINT ubigeo_pkey PRIMARY KEY (id)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.ubigeo
    OWNER to postgres;    

-- Table: public.comercio

-- DROP TABLE public.comercio;

CREATE TABLE public.comercio
(
    id serial NOT NULL,
    nombre character varying(100) COLLATE pg_catalog."default" NOT NULL,
    ruc character varying(11) COLLATE pg_catalog."default" NOT NULL,
    correo character varying(100) COLLATE pg_catalog."default" NOT NULL,
    telefono character varying(100) COLLATE pg_catalog."default" NOT NULL,
    nombrecontacto character varying(100) COLLATE pg_catalog."default" NOT NULL,
    correocontacto character varying(100) COLLATE pg_catalog."default" NOT NULL,
    telefonocontacto character varying(100) COLLATE pg_catalog."default" NOT NULL,
    activo boolean NOT NULL DEFAULT true,
    idusuariocreacion integer NOT NULL DEFAULT 0,
    fechahoracreacion timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
    idusuariomodificacion integer NOT NULL DEFAULT 0,
    fechahoramodificacion timestamp without time zone,
    CONSTRAINT "comercio_pkey" PRIMARY KEY (id)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.comercio
    OWNER to postgres;

-- Table: public.tipoprenda

-- DROP TABLE public.tipoprenda;

CREATE TABLE public.tipoprenda
(
    id serial NOT NULL,
    nombre character varying(100) COLLATE pg_catalog."default" NOT NULL,
    descripcion character varying(500) COLLATE pg_catalog."default" NOT NULL,
    activo boolean NOT NULL DEFAULT true,
    idusuariocreacion integer NOT NULL DEFAULT 0,
    fechahoracreacion timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
    idusuariomodificacion integer NOT NULL DEFAULT 0,
    fechahoramodificacion timestamp without time zone,
    CONSTRAINT tipoprenda_pkey PRIMARY KEY (id)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.tipoprenda
    OWNER to postgres;
    
-- Table: public.talla

-- DROP TABLE public.talla;

CREATE TABLE public.talla
(
    id serial NOT NULL,
    nombre character varying(100) COLLATE pg_catalog."default" NOT NULL,
    detalle character varying(100) COLLATE pg_catalog."default" NOT NULL,
    tipoprenda_id integer REFERENCES tipoprenda(id) NOT NULL DEFAULT 0,
    activo boolean NOT NULL DEFAULT true,
    idusuariocreacion integer NOT NULL DEFAULT 0,
    fechahoracreacion timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
    idusuariomodificacion integer NOT NULL DEFAULT 0,
    fechahoramodificacion timestamp without time zone,
    CONSTRAINT talla_pkey PRIMARY KEY (id)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.talla
    OWNER to postgres;
    
-- Table: public.marca

-- DROP TABLE public.marca;

CREATE TABLE public.marca
(
    id serial NOT NULL,
    nombre character varying(100) COLLATE pg_catalog."default" NOT NULL,
    descripcion character varying(500) COLLATE pg_catalog."default" NOT NULL,
    activo boolean NOT NULL DEFAULT true,
    idusuariocreacion integer NOT NULL DEFAULT 0,
    fechahoracreacion timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
    idusuariomodificacion integer NOT NULL DEFAULT 0,
    fechahoramodificacion timestamp without time zone,
    CONSTRAINT marca_pkey PRIMARY KEY (id)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.marca
    OWNER to postgres;
    
-- Table: public.color

-- DROP TABLE public.color;

CREATE TABLE public.color
(
    id serial NOT NULL,
    nombre character varying(100) COLLATE pg_catalog."default" NOT NULL,
    hexadecimal character varying(100) COLLATE pg_catalog."default" NOT NULL,
    activo boolean NOT NULL DEFAULT true,
    idusuariocreacion integer NOT NULL DEFAULT 0,
    fechahoracreacion timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
    idusuariomodificacion integer NOT NULL DEFAULT 0,
    fechahoramodificacion timestamp without time zone,
    CONSTRAINT color_pkey PRIMARY KEY (id)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.color
    OWNER to postgres;
    
-- Table: public.prenda

-- DROP TABLE public.prenda;

CREATE TABLE public.prenda
(
    id serial NOT NULL,
    nombre character varying(100) COLLATE pg_catalog."default" NOT NULL,
    descripcion character varying(500) COLLATE pg_catalog."default" NOT NULL,
	modelo character varying(100) COLLATE pg_catalog."default" NOT NULL,
	genero character varying(100) COLLATE pg_catalog."default" NOT NULL,
	precio float NOT NULL,
	stock integer NOT NULL,
	talla_id integer REFERENCES talla(id) NOT NULL DEFAULT 0,
	color_id integer REFERENCES color(id) NOT NULL DEFAULT 0,
	marca_id integer REFERENCES marca(id) NOT NULL DEFAULT 0,
	comercio_id integer REFERENCES comercio(id) NOT NULL DEFAULT 0,
	tipoprenda_id integer REFERENCES tipoprenda(id) NOT NULL DEFAULT 0,
    activo boolean NOT NULL DEFAULT true,
    idusuariocreacion integer NOT NULL DEFAULT 0,
    fechahoracreacion timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
    idusuariomodificacion integer NOT NULL DEFAULT 0,
    fechahoramodificacion timestamp without time zone,
    CONSTRAINT prenda_pkey PRIMARY KEY (id)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.prenda
    OWNER to postgres;

-- Table: public.descuento

-- DROP TABLE public.descuento;

CREATE TABLE public.descuento
(
    id serial NOT NULL,
    nombre character varying(100) COLLATE pg_catalog."default" NOT NULL,
    descripcion character varying(500) COLLATE pg_catalog."default",
	monto float NOT NULL,
	porcentaje float NOT NULL,
	fechaini timestamp without time zone NOT NULL,
	fechafin timestamp without time zone NOT NULL,
	prenda_id integer REFERENCES prenda(id) NOT NULL,
    activo boolean NOT NULL DEFAULT true,
    idusuariocreacion integer NOT NULL DEFAULT 0,
    fechahoracreacion timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
    idusuariomodificacion integer NOT NULL DEFAULT 0,
    fechahoramodificacion timestamp without time zone,
    CONSTRAINT descuento_pkey PRIMARY KEY (id)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.descuento
    OWNER to postgres;

-- Table: public.usuario

-- DROP TABLE public.usuario;

CREATE TABLE public.usuario
(
    id serial NOT NULL,
    nombre character varying(100) COLLATE pg_catalog."default" NOT NULL,
	apellido character varying(100) COLLATE pg_catalog."default" NOT NULL,
	correo character varying(100) COLLATE pg_catalog."default" NOT NULL,
	contrasena character varying(100) COLLATE pg_catalog."default" NOT NULL,
	genero character varying(100) COLLATE pg_catalog."default" NOT NULL,
	telefono character varying(100) COLLATE pg_catalog."default" NOT NULL,
	direccion character varying(100) COLLATE pg_catalog."default" NOT NULL,
	tipdocumento character varying(100) COLLATE pg_catalog."default" NOT NULL,
	coddocumento character varying(100) COLLATE pg_catalog."default" NOT NULL,
	referencia character varying(500) COLLATE pg_catalog."default" NOT NULL,
	premium boolean NOT NULL DEFAULT false,
	aseslibres integer NOT NULL,
	valoracion integer NOT NULL,
    fechnacimiento timestamp without time zone,
	fechaltapremium timestamp without time zone,
	fechbajapremium timestamp without time zone,
	perfil_id integer REFERENCES perfil(id) NOT NULL DEFAULT 0,
	ubigeo_id integer REFERENCES ubigeo(id) NOT NULL DEFAULT 0,
	activo boolean NOT NULL DEFAULT true,
    idusuariocreacion integer NOT NULL DEFAULT 0,
    fechahoracreacion timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
    idusuariomodificacion integer NOT NULL DEFAULT 0,
    fechahoramodificacion timestamp without time zone,
    CONSTRAINT usuario_pkey PRIMARY KEY (id)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.usuario
    OWNER to postgres;
    
-- Table: public.metodopago

-- DROP TABLE public.metodopago;

CREATE TABLE public.metodopago
(
    id serial NOT NULL,
    tipopago character varying(100) COLLATE pg_catalog."default" NOT NULL,
	tarjeta character varying(100) COLLATE pg_catalog."default" NOT NULL,
	contrasena character varying(100) COLLATE pg_catalog."default" NOT NULL,
	vencimiento timestamp without time zone NOT NULL,
	ccv integer NOT NULL,
	usuario_id integer REFERENCES usuario(id) NOT NULL,
	activo boolean NOT NULL DEFAULT true,
    idusuariocreacion integer NOT NULL DEFAULT 0,
    fechahoracreacion timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
    idusuariomodificacion integer NOT NULL DEFAULT 0,
    fechahoramodificacion timestamp without time zone,
    CONSTRAINT metodopago_pkey PRIMARY KEY (id)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.metodopago
    OWNER to postgres;
    
-- Table: public.asesoria

-- DROP TABLE public.asesoria;

CREATE TABLE public.asesoria
(
    id serial NOT NULL,
    fechoraini timestamp without time zone NOT NULL,
    fechorafin timestamp without time zone,
    valoracion integer NOT NULL DEFAULT 0,
    cliente_id integer REFERENCES usuario(id) NOT NULL DEFAULT 0,
	asesor_id integer REFERENCES usuario(id) NOT NULL DEFAULT 0,
    activo boolean NOT NULL DEFAULT true,
    idusuariocreacion bigint NOT NULL DEFAULT 0,
    fechahoracreacion timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
    idusuariomodificacion bigint NOT NULL DEFAULT 0,
    fechahoramodificacion timestamp without time zone,
    CONSTRAINT asesoria_pkey PRIMARY KEY (id)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.asesoria
    OWNER to postgres;
    
-- Table: public.preferencia

-- DROP TABLE public.preferencia;

CREATE TABLE public.preferencia
(
    id serial NOT NULL,
    explicita boolean NOT NULL DEFAULT true,
	genero character varying(100) COLLATE pg_catalog."default" NOT NULL,
	talla_id integer REFERENCES talla(id) NOT NULL DEFAULT 0,
	color_id integer REFERENCES color(id) NOT NULL DEFAULT 0,
	marca_id integer REFERENCES marca(id) NOT NULL DEFAULT 0,
	usuario_id integer REFERENCES usuario(id) NOT NULL DEFAULT 0,
	asesoria_id integer REFERENCES asesoria(id) NOT NULL DEFAULT 0,
	tipoprenda_id integer REFERENCES tipoprenda(id) NOT NULL DEFAULT 0,
    activo boolean NOT NULL DEFAULT true,
    idusuariocreacion integer NOT NULL DEFAULT 0,
    fechahoracreacion timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
    idusuariomodificacion integer NOT NULL DEFAULT 0,
    fechahoramodificacion timestamp without time zone,
    CONSTRAINT preferencia_pkey PRIMARY KEY (id)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.preferencia
    OWNER to postgres;

-- Table: public.compra

-- DROP TABLE public.compra;

CREATE TABLE public.compra
(
    id serial NOT NULL,
	totalsinigv float NOT NULL,
	igv float NOT NULL,
	totalfinal float NOT NULL,
	estado character varying(100) COLLATE pg_catalog."default" NOT NULL,
	fechorapago timestamp without time zone,
	usuario_id integer REFERENCES usuario(id) NOT NULL DEFAULT 0,
	metodopago_id integer REFERENCES metodopago(id) NOT NULL DEFAULT 0,
    activo boolean NOT NULL DEFAULT true,
    idusuariocreacion integer NOT NULL DEFAULT 0,
    fechahoracreacion timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
    idusuariomodificacion integer NOT NULL DEFAULT 0,
    fechahoramodificacion timestamp without time zone,
    CONSTRAINT compra_pkey PRIMARY KEY (id)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.compra
    OWNER to postgres;

-- Table: public.detalle

-- DROP TABLE public.detalle;

CREATE TABLE public.detalle
(
    id serial NOT NULL,
	cantidad integer NOT NULL,
	subtotal float NOT NULL,
	montodesc float NOT NULL,
	subtotalfinal float NOT NULL,
	igv float NOT NULL,
	compra_id integer REFERENCES compra(id) NOT NULL DEFAULT 0,
	usuario_id integer REFERENCES usuario(id) NOT NULL DEFAULT 0,
	descuento_id integer REFERENCES descuento(id) NOT NULL DEFAULT 0,
    activo boolean NOT NULL DEFAULT true,
    idusuariocreacion integer NOT NULL DEFAULT 0,
    fechahoracreacion timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
    idusuariomodificacion integer NOT NULL DEFAULT 0,
    fechahoramodificacion timestamp without time zone,
    CONSTRAINT detalle_pkey PRIMARY KEY (id)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.detalle
    OWNER to postgres;

insert into perfil (nombre, descripcion, nivelacceso) values ('Administrador','Usuario administrador del sistema. Da mantenimiento a clases maestras y agrega usuarios, prendas y promociones.',1);
insert into perfil (nombre, descripcion, nivelacceso) values ('Asesor','Usuario asesor de imagen. Ofrece asesorías de imagen a los clientes.',2);
insert into perfil (nombre, descripcion, nivelacceso) values ('Cliente','Usuario comprador. Compra prendas y artículos de vestir. Además, recibe asesorías de imagen.',3);

insert into ubigeo (departamento, provincia, distrito) values ('Amazonas','Chachapoyas','Chachapoyas');
insert into ubigeo (departamento, provincia, distrito) values ('Amazonas','Chachapoyas','Asunción');
insert into ubigeo (departamento, provincia, distrito) values ('Amazonas','Chachapoyas','Balsas');
insert into ubigeo (departamento, provincia, distrito) values ('Amazonas','Chachapoyas','Cheto');
insert into ubigeo (departamento, provincia, distrito) values ('Amazonas','Chachapoyas','Chiliquin');
insert into ubigeo (departamento, provincia, distrito) values ('Amazonas','Chachapoyas','Chuquibamba');
insert into ubigeo (departamento, provincia, distrito) values ('Amazonas','Chachapoyas','Granada');
insert into ubigeo (departamento, provincia, distrito) values ('Amazonas','Chachapoyas','Huancas');
insert into ubigeo (departamento, provincia, distrito) values ('Amazonas','Chachapoyas','La Jalca');
insert into ubigeo (departamento, provincia, distrito) values ('Amazonas','Chachapoyas','Leimebamba');
insert into ubigeo (departamento, provincia, distrito) values ('Amazonas','Chachapoyas','Levanto');
insert into ubigeo (departamento, provincia, distrito) values ('Amazonas','Chachapoyas','Magdalena');
insert into ubigeo (departamento, provincia, distrito) values ('Amazonas','Chachapoyas','Mariscal Castilla');
insert into ubigeo (departamento, provincia, distrito) values ('Amazonas','Chachapoyas','Molinopampa');
insert into ubigeo (departamento, provincia, distrito) values ('Amazonas','Chachapoyas','Montevideo');
insert into ubigeo (departamento, provincia, distrito) values ('Amazonas','Chachapoyas','Olleros');
insert into ubigeo (departamento, provincia, distrito) values ('Amazonas','Chachapoyas','Quinjalca');
insert into ubigeo (departamento, provincia, distrito) values ('Amazonas','Chachapoyas','San Francisco de Daguas');
insert into ubigeo (departamento, provincia, distrito) values ('Amazonas','Chachapoyas','San Isidro de Maino');
insert into ubigeo (departamento, provincia, distrito) values ('Amazonas','Chachapoyas','Soloco');
insert into ubigeo (departamento, provincia, distrito) values ('Amazonas','Chachapoyas','Sonche');
insert into ubigeo (departamento, provincia, distrito) values ('Amazonas','Bagua','Bagua');
insert into ubigeo (departamento, provincia, distrito) values ('Amazonas','Bagua','Aramango');
insert into ubigeo (departamento, provincia, distrito) values ('Amazonas','Bagua','Copallin');
insert into ubigeo (departamento, provincia, distrito) values ('Amazonas','Bagua','El Parco');
insert into ubigeo (departamento, provincia, distrito) values ('Amazonas','Bagua','Imaza');
insert into ubigeo (departamento, provincia, distrito) values ('Amazonas','Bagua','La Peca');
insert into ubigeo (departamento, provincia, distrito) values ('Amazonas','Bongará','Jumbilla');
insert into ubigeo (departamento, provincia, distrito) values ('Amazonas','Bongará','Chisquilla');
insert into ubigeo (departamento, provincia, distrito) values ('Amazonas','Bongará','Churuja');
insert into ubigeo (departamento, provincia, distrito) values ('Amazonas','Bongará','Corosha');
insert into ubigeo (departamento, provincia, distrito) values ('Amazonas','Bongará','Cuispes');
insert into ubigeo (departamento, provincia, distrito) values ('Amazonas','Bongará','Florida');
insert into ubigeo (departamento, provincia, distrito) values ('Amazonas','Bongará','Jazan');
insert into ubigeo (departamento, provincia, distrito) values ('Amazonas','Bongará','Recta');
insert into ubigeo (departamento, provincia, distrito) values ('Amazonas','Bongará','San Carlos');
insert into ubigeo (departamento, provincia, distrito) values ('Amazonas','Bongará','Shipasbamba');
insert into ubigeo (departamento, provincia, distrito) values ('Amazonas','Bongará','Valera');
insert into ubigeo (departamento, provincia, distrito) values ('Amazonas','Bongará','Yambrasbamba');
insert into ubigeo (departamento, provincia, distrito) values ('Amazonas','Condorcanqui','Nieva');
insert into ubigeo (departamento, provincia, distrito) values ('Amazonas','Condorcanqui','El Cenepa');
insert into ubigeo (departamento, provincia, distrito) values ('Amazonas','Condorcanqui','Río Santiago');
insert into ubigeo (departamento, provincia, distrito) values ('Amazonas','Luya','Lamud');
insert into ubigeo (departamento, provincia, distrito) values ('Amazonas','Luya','Camporredondo');
insert into ubigeo (departamento, provincia, distrito) values ('Amazonas','Luya','Cocabamba');
insert into ubigeo (departamento, provincia, distrito) values ('Amazonas','Luya','Colcamar');
insert into ubigeo (departamento, provincia, distrito) values ('Amazonas','Luya','Conila');
insert into ubigeo (departamento, provincia, distrito) values ('Amazonas','Luya','Inguilpata');
insert into ubigeo (departamento, provincia, distrito) values ('Amazonas','Luya','Longuita');
insert into ubigeo (departamento, provincia, distrito) values ('Amazonas','Luya','Lonya Chico');
insert into ubigeo (departamento, provincia, distrito) values ('Amazonas','Luya','Luya');
insert into ubigeo (departamento, provincia, distrito) values ('Amazonas','Luya','Luya Viejo');
insert into ubigeo (departamento, provincia, distrito) values ('Amazonas','Luya','María');
insert into ubigeo (departamento, provincia, distrito) values ('Amazonas','Luya','Ocalli');
insert into ubigeo (departamento, provincia, distrito) values ('Amazonas','Luya','Ocumal');
insert into ubigeo (departamento, provincia, distrito) values ('Amazonas','Luya','Pisuquia');
insert into ubigeo (departamento, provincia, distrito) values ('Amazonas','Luya','Providencia');
insert into ubigeo (departamento, provincia, distrito) values ('Amazonas','Luya','San Cristóbal');
insert into ubigeo (departamento, provincia, distrito) values ('Amazonas','Luya','San Francisco de Yeso');
insert into ubigeo (departamento, provincia, distrito) values ('Amazonas','Luya','San Jerónimo');
insert into ubigeo (departamento, provincia, distrito) values ('Amazonas','Luya','San Juan de Lopecancha');
insert into ubigeo (departamento, provincia, distrito) values ('Amazonas','Luya','Santa Catalina');
insert into ubigeo (departamento, provincia, distrito) values ('Amazonas','Luya','Santo Tomas');
insert into ubigeo (departamento, provincia, distrito) values ('Amazonas','Luya','Tingo');
insert into ubigeo (departamento, provincia, distrito) values ('Amazonas','Luya','Trita');
insert into ubigeo (departamento, provincia, distrito) values ('Amazonas','Rodríguez de Mendoza','San Nicolás');
insert into ubigeo (departamento, provincia, distrito) values ('Amazonas','Rodríguez de Mendoza','Chirimoto');
insert into ubigeo (departamento, provincia, distrito) values ('Amazonas','Rodríguez de Mendoza','Cochamal');
insert into ubigeo (departamento, provincia, distrito) values ('Amazonas','Rodríguez de Mendoza','Huambo');
insert into ubigeo (departamento, provincia, distrito) values ('Amazonas','Rodríguez de Mendoza','Limabamba');
insert into ubigeo (departamento, provincia, distrito) values ('Amazonas','Rodríguez de Mendoza','Longar');
insert into ubigeo (departamento, provincia, distrito) values ('Amazonas','Rodríguez de Mendoza','Mariscal Benavides');
insert into ubigeo (departamento, provincia, distrito) values ('Amazonas','Rodríguez de Mendoza','Milpuc');
insert into ubigeo (departamento, provincia, distrito) values ('Amazonas','Rodríguez de Mendoza','Omia');
insert into ubigeo (departamento, provincia, distrito) values ('Amazonas','Rodríguez de Mendoza','Santa Rosa');
insert into ubigeo (departamento, provincia, distrito) values ('Amazonas','Rodríguez de Mendoza','Totora');
insert into ubigeo (departamento, provincia, distrito) values ('Amazonas','Rodríguez de Mendoza','Vista Alegre');
insert into ubigeo (departamento, provincia, distrito) values ('Amazonas','Utcubamba','Bagua Grande');
insert into ubigeo (departamento, provincia, distrito) values ('Amazonas','Utcubamba','Cajaruro');
insert into ubigeo (departamento, provincia, distrito) values ('Amazonas','Utcubamba','Cumba');
insert into ubigeo (departamento, provincia, distrito) values ('Amazonas','Utcubamba','El Milagro');
insert into ubigeo (departamento, provincia, distrito) values ('Amazonas','Utcubamba','Jamalca');
insert into ubigeo (departamento, provincia, distrito) values ('Amazonas','Utcubamba','Lonya Grande');
insert into ubigeo (departamento, provincia, distrito) values ('Amazonas','Utcubamba','Yamon');
insert into ubigeo (departamento, provincia, distrito) values ('Áncash','Huaraz','Huaraz');
insert into ubigeo (departamento, provincia, distrito) values ('Áncash','Huaraz','Cochabamba');
insert into ubigeo (departamento, provincia, distrito) values ('Áncash','Huaraz','Colcabamba');
insert into ubigeo (departamento, provincia, distrito) values ('Áncash','Huaraz','Huanchay');
insert into ubigeo (departamento, provincia, distrito) values ('Áncash','Huaraz','Independencia');
insert into ubigeo (departamento, provincia, distrito) values ('Áncash','Huaraz','Jangas');
insert into ubigeo (departamento, provincia, distrito) values ('Áncash','Huaraz','La Libertad');
insert into ubigeo (departamento, provincia, distrito) values ('Áncash','Huaraz','Olleros');
insert into ubigeo (departamento, provincia, distrito) values ('Áncash','Huaraz','Pampas Grande');
insert into ubigeo (departamento, provincia, distrito) values ('Áncash','Huaraz','Pariacoto');
insert into ubigeo (departamento, provincia, distrito) values ('Áncash','Huaraz','Pira');
insert into ubigeo (departamento, provincia, distrito) values ('Áncash','Huaraz','Tarica');
insert into ubigeo (departamento, provincia, distrito) values ('Áncash','Aija','Aija');
insert into ubigeo (departamento, provincia, distrito) values ('Áncash','Aija','Coris');
insert into ubigeo (departamento, provincia, distrito) values ('Áncash','Aija','Huacllan');
insert into ubigeo (departamento, provincia, distrito) values ('Áncash','Aija','La Merced');
insert into ubigeo (departamento, provincia, distrito) values ('Áncash','Aija','Succha');
insert into ubigeo (departamento, provincia, distrito) values ('Áncash','Antonio Raymondi','Llamellin');
insert into ubigeo (departamento, provincia, distrito) values ('Áncash','Antonio Raymondi','Aczo');
insert into ubigeo (departamento, provincia, distrito) values ('Áncash','Antonio Raymondi','Chaccho');
insert into ubigeo (departamento, provincia, distrito) values ('Áncash','Antonio Raymondi','Chingas');
insert into ubigeo (departamento, provincia, distrito) values ('Áncash','Antonio Raymondi','Mirgas');
insert into ubigeo (departamento, provincia, distrito) values ('Áncash','Antonio Raymondi','San Juan de Rontoy');
insert into ubigeo (departamento, provincia, distrito) values ('Áncash','Asunción','Chacas');
insert into ubigeo (departamento, provincia, distrito) values ('Áncash','Asunción','Acochaca');
insert into ubigeo (departamento, provincia, distrito) values ('Áncash','Bolognesi','Chiquian');
insert into ubigeo (departamento, provincia, distrito) values ('Áncash','Bolognesi','Abelardo Pardo Lezameta');
insert into ubigeo (departamento, provincia, distrito) values ('Áncash','Bolognesi','Antonio Raymondi');
insert into ubigeo (departamento, provincia, distrito) values ('Áncash','Bolognesi','Aquia');
insert into ubigeo (departamento, provincia, distrito) values ('Áncash','Bolognesi','Cajacay');
insert into ubigeo (departamento, provincia, distrito) values ('Áncash','Bolognesi','Canis');
insert into ubigeo (departamento, provincia, distrito) values ('Áncash','Bolognesi','Colquioc');
insert into ubigeo (departamento, provincia, distrito) values ('Áncash','Bolognesi','Huallanca');
insert into ubigeo (departamento, provincia, distrito) values ('Áncash','Bolognesi','Huasta');
insert into ubigeo (departamento, provincia, distrito) values ('Áncash','Bolognesi','Huayllacayan');
insert into ubigeo (departamento, provincia, distrito) values ('Áncash','Bolognesi','La Primavera');
insert into ubigeo (departamento, provincia, distrito) values ('Áncash','Bolognesi','Mangas');
insert into ubigeo (departamento, provincia, distrito) values ('Áncash','Bolognesi','Pacllon');
insert into ubigeo (departamento, provincia, distrito) values ('Áncash','Bolognesi','San Miguel de Corpanqui');
insert into ubigeo (departamento, provincia, distrito) values ('Áncash','Bolognesi','Ticllos');
insert into ubigeo (departamento, provincia, distrito) values ('Áncash','Carhuaz','Carhuaz');
insert into ubigeo (departamento, provincia, distrito) values ('Áncash','Carhuaz','Acopampa');
insert into ubigeo (departamento, provincia, distrito) values ('Áncash','Carhuaz','Amashca');
insert into ubigeo (departamento, provincia, distrito) values ('Áncash','Carhuaz','Anta');
insert into ubigeo (departamento, provincia, distrito) values ('Áncash','Carhuaz','Ataquero');
insert into ubigeo (departamento, provincia, distrito) values ('Áncash','Carhuaz','Marcara');
insert into ubigeo (departamento, provincia, distrito) values ('Áncash','Carhuaz','Pariahuanca');
insert into ubigeo (departamento, provincia, distrito) values ('Áncash','Carhuaz','San Miguel de Aco');
insert into ubigeo (departamento, provincia, distrito) values ('Áncash','Carhuaz','Shilla');
insert into ubigeo (departamento, provincia, distrito) values ('Áncash','Carhuaz','Tinco');
insert into ubigeo (departamento, provincia, distrito) values ('Áncash','Carhuaz','Yungar');
insert into ubigeo (departamento, provincia, distrito) values ('Áncash','Carlos Fermín Fitzcarrald','San Luis');
insert into ubigeo (departamento, provincia, distrito) values ('Áncash','Carlos Fermín Fitzcarrald','San Nicolás');
insert into ubigeo (departamento, provincia, distrito) values ('Áncash','Carlos Fermín Fitzcarrald','Yauya');
insert into ubigeo (departamento, provincia, distrito) values ('Áncash','Casma','Casma');
insert into ubigeo (departamento, provincia, distrito) values ('Áncash','Casma','Buena Vista Alta');
insert into ubigeo (departamento, provincia, distrito) values ('Áncash','Casma','Comandante Noel');
insert into ubigeo (departamento, provincia, distrito) values ('Áncash','Casma','Yautan');
insert into ubigeo (departamento, provincia, distrito) values ('Áncash','Corongo','Corongo');
insert into ubigeo (departamento, provincia, distrito) values ('Áncash','Corongo','Aco');
insert into ubigeo (departamento, provincia, distrito) values ('Áncash','Corongo','Bambas');
insert into ubigeo (departamento, provincia, distrito) values ('Áncash','Corongo','Cusca');
insert into ubigeo (departamento, provincia, distrito) values ('Áncash','Corongo','La Pampa');
insert into ubigeo (departamento, provincia, distrito) values ('Áncash','Corongo','Yanac');
insert into ubigeo (departamento, provincia, distrito) values ('Áncash','Corongo','Yupan');
insert into ubigeo (departamento, provincia, distrito) values ('Áncash','Huari','Huari');
insert into ubigeo (departamento, provincia, distrito) values ('Áncash','Huari','Anra');
insert into ubigeo (departamento, provincia, distrito) values ('Áncash','Huari','Cajay');
insert into ubigeo (departamento, provincia, distrito) values ('Áncash','Huari','Chavin de Huantar');
insert into ubigeo (departamento, provincia, distrito) values ('Áncash','Huari','Huacachi');
insert into ubigeo (departamento, provincia, distrito) values ('Áncash','Huari','Huacchis');
insert into ubigeo (departamento, provincia, distrito) values ('Áncash','Huari','Huachis');
insert into ubigeo (departamento, provincia, distrito) values ('Áncash','Huari','Huantar');
insert into ubigeo (departamento, provincia, distrito) values ('Áncash','Huari','Masin');
insert into ubigeo (departamento, provincia, distrito) values ('Áncash','Huari','Paucas');
insert into ubigeo (departamento, provincia, distrito) values ('Áncash','Huari','Ponto');
insert into ubigeo (departamento, provincia, distrito) values ('Áncash','Huari','Rahuapampa');
insert into ubigeo (departamento, provincia, distrito) values ('Áncash','Huari','Rapayan');
insert into ubigeo (departamento, provincia, distrito) values ('Áncash','Huari','San Marcos');
insert into ubigeo (departamento, provincia, distrito) values ('Áncash','Huari','San Pedro de Chana');
insert into ubigeo (departamento, provincia, distrito) values ('Áncash','Huari','Uco');
insert into ubigeo (departamento, provincia, distrito) values ('Áncash','Huarmey','Huarmey');
insert into ubigeo (departamento, provincia, distrito) values ('Áncash','Huarmey','Cochapeti');
insert into ubigeo (departamento, provincia, distrito) values ('Áncash','Huarmey','Culebras');
insert into ubigeo (departamento, provincia, distrito) values ('Áncash','Huarmey','Huayan');
insert into ubigeo (departamento, provincia, distrito) values ('Áncash','Huarmey','Malvas');
insert into ubigeo (departamento, provincia, distrito) values ('Áncash','Huaylas','Caraz');
insert into ubigeo (departamento, provincia, distrito) values ('Áncash','Huaylas','Huallanca');
insert into ubigeo (departamento, provincia, distrito) values ('Áncash','Huaylas','Huata');
insert into ubigeo (departamento, provincia, distrito) values ('Áncash','Huaylas','Huaylas');
insert into ubigeo (departamento, provincia, distrito) values ('Áncash','Huaylas','Mato');
insert into ubigeo (departamento, provincia, distrito) values ('Áncash','Huaylas','Pamparomas');
insert into ubigeo (departamento, provincia, distrito) values ('Áncash','Huaylas','Pueblo Libre');
insert into ubigeo (departamento, provincia, distrito) values ('Áncash','Huaylas','Santa Cruz');
insert into ubigeo (departamento, provincia, distrito) values ('Áncash','Huaylas','Santo Toribio');
insert into ubigeo (departamento, provincia, distrito) values ('Áncash','Huaylas','Yuracmarca');
insert into ubigeo (departamento, provincia, distrito) values ('Áncash','Mariscal Luzuriaga','Piscobamba');
insert into ubigeo (departamento, provincia, distrito) values ('Áncash','Mariscal Luzuriaga','Casca');
insert into ubigeo (departamento, provincia, distrito) values ('Áncash','Mariscal Luzuriaga','Eleazar Guzmán Barron');
insert into ubigeo (departamento, provincia, distrito) values ('Áncash','Mariscal Luzuriaga','Fidel Olivas Escudero');
insert into ubigeo (departamento, provincia, distrito) values ('Áncash','Mariscal Luzuriaga','Llama');
insert into ubigeo (departamento, provincia, distrito) values ('Áncash','Mariscal Luzuriaga','Llumpa');
insert into ubigeo (departamento, provincia, distrito) values ('Áncash','Mariscal Luzuriaga','Lucma');
insert into ubigeo (departamento, provincia, distrito) values ('Áncash','Mariscal Luzuriaga','Musga');
insert into ubigeo (departamento, provincia, distrito) values ('Áncash','Ocros','Ocros');
insert into ubigeo (departamento, provincia, distrito) values ('Áncash','Ocros','Acas');
insert into ubigeo (departamento, provincia, distrito) values ('Áncash','Ocros','Cajamarquilla');
insert into ubigeo (departamento, provincia, distrito) values ('Áncash','Ocros','Carhuapampa');
insert into ubigeo (departamento, provincia, distrito) values ('Áncash','Ocros','Cochas');
insert into ubigeo (departamento, provincia, distrito) values ('Áncash','Ocros','Congas');
insert into ubigeo (departamento, provincia, distrito) values ('Áncash','Ocros','Llipa');
insert into ubigeo (departamento, provincia, distrito) values ('Áncash','Ocros','San Cristóbal de Rajan');
insert into ubigeo (departamento, provincia, distrito) values ('Áncash','Ocros','San Pedro');
insert into ubigeo (departamento, provincia, distrito) values ('Áncash','Ocros','Santiago de Chilcas');
insert into ubigeo (departamento, provincia, distrito) values ('Áncash','Pallasca','Cabana');
insert into ubigeo (departamento, provincia, distrito) values ('Áncash','Pallasca','Bolognesi');
insert into ubigeo (departamento, provincia, distrito) values ('Áncash','Pallasca','Conchucos');
insert into ubigeo (departamento, provincia, distrito) values ('Áncash','Pallasca','Huacaschuque');
insert into ubigeo (departamento, provincia, distrito) values ('Áncash','Pallasca','Huandoval');
insert into ubigeo (departamento, provincia, distrito) values ('Áncash','Pallasca','Lacabamba');
insert into ubigeo (departamento, provincia, distrito) values ('Áncash','Pallasca','Llapo');
insert into ubigeo (departamento, provincia, distrito) values ('Áncash','Pallasca','Pallasca');
insert into ubigeo (departamento, provincia, distrito) values ('Áncash','Pallasca','Pampas');
insert into ubigeo (departamento, provincia, distrito) values ('Áncash','Pallasca','Santa Rosa');
insert into ubigeo (departamento, provincia, distrito) values ('Áncash','Pallasca','Tauca');
insert into ubigeo (departamento, provincia, distrito) values ('Áncash','Pomabamba','Pomabamba');
insert into ubigeo (departamento, provincia, distrito) values ('Áncash','Pomabamba','Huayllan');
insert into ubigeo (departamento, provincia, distrito) values ('Áncash','Pomabamba','Parobamba');
insert into ubigeo (departamento, provincia, distrito) values ('Áncash','Pomabamba','Quinuabamba');
insert into ubigeo (departamento, provincia, distrito) values ('Áncash','Recuay','Recuay');
insert into ubigeo (departamento, provincia, distrito) values ('Áncash','Recuay','Catac');
insert into ubigeo (departamento, provincia, distrito) values ('Áncash','Recuay','Cotaparaco');
insert into ubigeo (departamento, provincia, distrito) values ('Áncash','Recuay','Huayllapampa');
insert into ubigeo (departamento, provincia, distrito) values ('Áncash','Recuay','Llacllin');
insert into ubigeo (departamento, provincia, distrito) values ('Áncash','Recuay','Marca');
insert into ubigeo (departamento, provincia, distrito) values ('Áncash','Recuay','Pampas Chico');
insert into ubigeo (departamento, provincia, distrito) values ('Áncash','Recuay','Pararin');
insert into ubigeo (departamento, provincia, distrito) values ('Áncash','Recuay','Tapacocha');
insert into ubigeo (departamento, provincia, distrito) values ('Áncash','Recuay','Ticapampa');
insert into ubigeo (departamento, provincia, distrito) values ('Áncash','Santa','Chimbote');
insert into ubigeo (departamento, provincia, distrito) values ('Áncash','Santa','Cáceres del Perú');
insert into ubigeo (departamento, provincia, distrito) values ('Áncash','Santa','Coishco');
insert into ubigeo (departamento, provincia, distrito) values ('Áncash','Santa','Macate');
insert into ubigeo (departamento, provincia, distrito) values ('Áncash','Santa','Moro');
insert into ubigeo (departamento, provincia, distrito) values ('Áncash','Santa','Nepeña');
insert into ubigeo (departamento, provincia, distrito) values ('Áncash','Santa','Samanco');
insert into ubigeo (departamento, provincia, distrito) values ('Áncash','Santa','Santa');
insert into ubigeo (departamento, provincia, distrito) values ('Áncash','Santa','Nuevo Chimbote');
insert into ubigeo (departamento, provincia, distrito) values ('Áncash','Sihuas','Sihuas');
insert into ubigeo (departamento, provincia, distrito) values ('Áncash','Sihuas','Acobamba');
insert into ubigeo (departamento, provincia, distrito) values ('Áncash','Sihuas','Alfonso Ugarte');
insert into ubigeo (departamento, provincia, distrito) values ('Áncash','Sihuas','Cashapampa');
insert into ubigeo (departamento, provincia, distrito) values ('Áncash','Sihuas','Chingalpo');
insert into ubigeo (departamento, provincia, distrito) values ('Áncash','Sihuas','Huayllabamba');
insert into ubigeo (departamento, provincia, distrito) values ('Áncash','Sihuas','Quiches');
insert into ubigeo (departamento, provincia, distrito) values ('Áncash','Sihuas','Ragash');
insert into ubigeo (departamento, provincia, distrito) values ('Áncash','Sihuas','San Juan');
insert into ubigeo (departamento, provincia, distrito) values ('Áncash','Sihuas','Sicsibamba');
insert into ubigeo (departamento, provincia, distrito) values ('Áncash','Yungay','Yungay');
insert into ubigeo (departamento, provincia, distrito) values ('Áncash','Yungay','Cascapara');
insert into ubigeo (departamento, provincia, distrito) values ('Áncash','Yungay','Mancos');
insert into ubigeo (departamento, provincia, distrito) values ('Áncash','Yungay','Matacoto');
insert into ubigeo (departamento, provincia, distrito) values ('Áncash','Yungay','Quillo');
insert into ubigeo (departamento, provincia, distrito) values ('Áncash','Yungay','Ranrahirca');
insert into ubigeo (departamento, provincia, distrito) values ('Áncash','Yungay','Shupluy');
insert into ubigeo (departamento, provincia, distrito) values ('Áncash','Yungay','Yanama');
insert into ubigeo (departamento, provincia, distrito) values ('Apurímac','Abancay','Abancay');
insert into ubigeo (departamento, provincia, distrito) values ('Apurímac','Abancay','Chacoche');
insert into ubigeo (departamento, provincia, distrito) values ('Apurímac','Abancay','Circa');
insert into ubigeo (departamento, provincia, distrito) values ('Apurímac','Abancay','Curahuasi');
insert into ubigeo (departamento, provincia, distrito) values ('Apurímac','Abancay','Huanipaca');
insert into ubigeo (departamento, provincia, distrito) values ('Apurímac','Abancay','Lambrama');
insert into ubigeo (departamento, provincia, distrito) values ('Apurímac','Abancay','Pichirhua');
insert into ubigeo (departamento, provincia, distrito) values ('Apurímac','Abancay','San Pedro de Cachora');
insert into ubigeo (departamento, provincia, distrito) values ('Apurímac','Abancay','Tamburco');
insert into ubigeo (departamento, provincia, distrito) values ('Apurímac','Andahuaylas','Andahuaylas');
insert into ubigeo (departamento, provincia, distrito) values ('Apurímac','Andahuaylas','Andarapa');
insert into ubigeo (departamento, provincia, distrito) values ('Apurímac','Andahuaylas','Chiara');
insert into ubigeo (departamento, provincia, distrito) values ('Apurímac','Andahuaylas','Huancarama');
insert into ubigeo (departamento, provincia, distrito) values ('Apurímac','Andahuaylas','Huancaray');
insert into ubigeo (departamento, provincia, distrito) values ('Apurímac','Andahuaylas','Huayana');
insert into ubigeo (departamento, provincia, distrito) values ('Apurímac','Andahuaylas','Kishuara');
insert into ubigeo (departamento, provincia, distrito) values ('Apurímac','Andahuaylas','Pacobamba');
insert into ubigeo (departamento, provincia, distrito) values ('Apurímac','Andahuaylas','Pacucha');
insert into ubigeo (departamento, provincia, distrito) values ('Apurímac','Andahuaylas','Pampachiri');
insert into ubigeo (departamento, provincia, distrito) values ('Apurímac','Andahuaylas','Pomacocha');
insert into ubigeo (departamento, provincia, distrito) values ('Apurímac','Andahuaylas','San Antonio de Cachi');
insert into ubigeo (departamento, provincia, distrito) values ('Apurímac','Andahuaylas','San Jerónimo');
insert into ubigeo (departamento, provincia, distrito) values ('Apurímac','Andahuaylas','San Miguel de Chaccrampa');
insert into ubigeo (departamento, provincia, distrito) values ('Apurímac','Andahuaylas','Santa María de Chicmo');
insert into ubigeo (departamento, provincia, distrito) values ('Apurímac','Andahuaylas','Talavera');
insert into ubigeo (departamento, provincia, distrito) values ('Apurímac','Andahuaylas','Tumay Huaraca');
insert into ubigeo (departamento, provincia, distrito) values ('Apurímac','Andahuaylas','Turpo');
insert into ubigeo (departamento, provincia, distrito) values ('Apurímac','Andahuaylas','Kaquiabamba');
insert into ubigeo (departamento, provincia, distrito) values ('Apurímac','Andahuaylas','José María Arguedas');
insert into ubigeo (departamento, provincia, distrito) values ('Apurímac','Antabamba','Antabamba');
insert into ubigeo (departamento, provincia, distrito) values ('Apurímac','Antabamba','El Oro');
insert into ubigeo (departamento, provincia, distrito) values ('Apurímac','Antabamba','Huaquirca');
insert into ubigeo (departamento, provincia, distrito) values ('Apurímac','Antabamba','Juan Espinoza Medrano');
insert into ubigeo (departamento, provincia, distrito) values ('Apurímac','Antabamba','Oropesa');
insert into ubigeo (departamento, provincia, distrito) values ('Apurímac','Antabamba','Pachaconas');
insert into ubigeo (departamento, provincia, distrito) values ('Apurímac','Antabamba','Sabaino');
insert into ubigeo (departamento, provincia, distrito) values ('Apurímac','Aymaraes','Chalhuanca');
insert into ubigeo (departamento, provincia, distrito) values ('Apurímac','Aymaraes','Capaya');
insert into ubigeo (departamento, provincia, distrito) values ('Apurímac','Aymaraes','Caraybamba');
insert into ubigeo (departamento, provincia, distrito) values ('Apurímac','Aymaraes','Chapimarca');
insert into ubigeo (departamento, provincia, distrito) values ('Apurímac','Aymaraes','Colcabamba');
insert into ubigeo (departamento, provincia, distrito) values ('Apurímac','Aymaraes','Cotaruse');
insert into ubigeo (departamento, provincia, distrito) values ('Apurímac','Aymaraes','Ihuayllo');
insert into ubigeo (departamento, provincia, distrito) values ('Apurímac','Aymaraes','Justo Apu Sahuaraura');
insert into ubigeo (departamento, provincia, distrito) values ('Apurímac','Aymaraes','Lucre');
insert into ubigeo (departamento, provincia, distrito) values ('Apurímac','Aymaraes','Pocohuanca');
insert into ubigeo (departamento, provincia, distrito) values ('Apurímac','Aymaraes','San Juan de Chacña');
insert into ubigeo (departamento, provincia, distrito) values ('Apurímac','Aymaraes','Sañayca');
insert into ubigeo (departamento, provincia, distrito) values ('Apurímac','Aymaraes','Soraya');
insert into ubigeo (departamento, provincia, distrito) values ('Apurímac','Aymaraes','Tapairihua');
insert into ubigeo (departamento, provincia, distrito) values ('Apurímac','Aymaraes','Tintay');
insert into ubigeo (departamento, provincia, distrito) values ('Apurímac','Aymaraes','Toraya');
insert into ubigeo (departamento, provincia, distrito) values ('Apurímac','Aymaraes','Yanaca');
insert into ubigeo (departamento, provincia, distrito) values ('Apurímac','Cotabambas','Tambobamba');
insert into ubigeo (departamento, provincia, distrito) values ('Apurímac','Cotabambas','Cotabambas');
insert into ubigeo (departamento, provincia, distrito) values ('Apurímac','Cotabambas','Coyllurqui');
insert into ubigeo (departamento, provincia, distrito) values ('Apurímac','Cotabambas','Haquira');
insert into ubigeo (departamento, provincia, distrito) values ('Apurímac','Cotabambas','Mara');
insert into ubigeo (departamento, provincia, distrito) values ('Apurímac','Cotabambas','Challhuahuacho');
insert into ubigeo (departamento, provincia, distrito) values ('Apurímac','Chincheros','Chincheros');
insert into ubigeo (departamento, provincia, distrito) values ('Apurímac','Chincheros','Anco_Huallo');
insert into ubigeo (departamento, provincia, distrito) values ('Apurímac','Chincheros','Cocharcas');
insert into ubigeo (departamento, provincia, distrito) values ('Apurímac','Chincheros','Huaccana');
insert into ubigeo (departamento, provincia, distrito) values ('Apurímac','Chincheros','Ocobamba');
insert into ubigeo (departamento, provincia, distrito) values ('Apurímac','Chincheros','Ongoy');
insert into ubigeo (departamento, provincia, distrito) values ('Apurímac','Chincheros','Uranmarca');
insert into ubigeo (departamento, provincia, distrito) values ('Apurímac','Chincheros','Ranracancha');
insert into ubigeo (departamento, provincia, distrito) values ('Apurímac','Chincheros','Rocchacc');
insert into ubigeo (departamento, provincia, distrito) values ('Apurímac','Chincheros','El Porvenir');
insert into ubigeo (departamento, provincia, distrito) values ('Apurímac','Chincheros','Los Chankas');
insert into ubigeo (departamento, provincia, distrito) values ('Apurímac','Grau','Chuquibambilla');
insert into ubigeo (departamento, provincia, distrito) values ('Apurímac','Grau','Curpahuasi');
insert into ubigeo (departamento, provincia, distrito) values ('Apurímac','Grau','Gamarra');
insert into ubigeo (departamento, provincia, distrito) values ('Apurímac','Grau','Huayllati');
insert into ubigeo (departamento, provincia, distrito) values ('Apurímac','Grau','Mamara');
insert into ubigeo (departamento, provincia, distrito) values ('Apurímac','Grau','Micaela Bastidas');
insert into ubigeo (departamento, provincia, distrito) values ('Apurímac','Grau','Pataypampa');
insert into ubigeo (departamento, provincia, distrito) values ('Apurímac','Grau','Progreso');
insert into ubigeo (departamento, provincia, distrito) values ('Apurímac','Grau','San Antonio');
insert into ubigeo (departamento, provincia, distrito) values ('Apurímac','Grau','Santa Rosa');
insert into ubigeo (departamento, provincia, distrito) values ('Apurímac','Grau','Turpay');
insert into ubigeo (departamento, provincia, distrito) values ('Apurímac','Grau','Vilcabamba');
insert into ubigeo (departamento, provincia, distrito) values ('Apurímac','Grau','Virundo');
insert into ubigeo (departamento, provincia, distrito) values ('Apurímac','Grau','Curasco');
insert into ubigeo (departamento, provincia, distrito) values ('Arequipa','Arequipa','Arequipa');
insert into ubigeo (departamento, provincia, distrito) values ('Arequipa','Arequipa','Alto Selva Alegre');
insert into ubigeo (departamento, provincia, distrito) values ('Arequipa','Arequipa','Cayma');
insert into ubigeo (departamento, provincia, distrito) values ('Arequipa','Arequipa','Cerro Colorado');
insert into ubigeo (departamento, provincia, distrito) values ('Arequipa','Arequipa','Characato');
insert into ubigeo (departamento, provincia, distrito) values ('Arequipa','Arequipa','Chiguata');
insert into ubigeo (departamento, provincia, distrito) values ('Arequipa','Arequipa','Jacobo Hunter');
insert into ubigeo (departamento, provincia, distrito) values ('Arequipa','Arequipa','La Joya');
insert into ubigeo (departamento, provincia, distrito) values ('Arequipa','Arequipa','Mariano Melgar');
insert into ubigeo (departamento, provincia, distrito) values ('Arequipa','Arequipa','Miraflores');
insert into ubigeo (departamento, provincia, distrito) values ('Arequipa','Arequipa','Mollebaya');
insert into ubigeo (departamento, provincia, distrito) values ('Arequipa','Arequipa','Paucarpata');
insert into ubigeo (departamento, provincia, distrito) values ('Arequipa','Arequipa','Pocsi');
insert into ubigeo (departamento, provincia, distrito) values ('Arequipa','Arequipa','Polobaya');
insert into ubigeo (departamento, provincia, distrito) values ('Arequipa','Arequipa','Quequeña');
insert into ubigeo (departamento, provincia, distrito) values ('Arequipa','Arequipa','Sabandia');
insert into ubigeo (departamento, provincia, distrito) values ('Arequipa','Arequipa','Sachaca');
insert into ubigeo (departamento, provincia, distrito) values ('Arequipa','Arequipa','San Juan de Siguas');
insert into ubigeo (departamento, provincia, distrito) values ('Arequipa','Arequipa','San Juan de Tarucani');
insert into ubigeo (departamento, provincia, distrito) values ('Arequipa','Arequipa','Santa Isabel de Siguas');
insert into ubigeo (departamento, provincia, distrito) values ('Arequipa','Arequipa','Santa Rita de Siguas');
insert into ubigeo (departamento, provincia, distrito) values ('Arequipa','Arequipa','Socabaya');
insert into ubigeo (departamento, provincia, distrito) values ('Arequipa','Arequipa','Tiabaya');
insert into ubigeo (departamento, provincia, distrito) values ('Arequipa','Arequipa','Uchumayo');
insert into ubigeo (departamento, provincia, distrito) values ('Arequipa','Arequipa','Vitor');
insert into ubigeo (departamento, provincia, distrito) values ('Arequipa','Arequipa','Yanahuara');
insert into ubigeo (departamento, provincia, distrito) values ('Arequipa','Arequipa','Yarabamba');
insert into ubigeo (departamento, provincia, distrito) values ('Arequipa','Arequipa','Yura');
insert into ubigeo (departamento, provincia, distrito) values ('Arequipa','Arequipa','José Luis Bustamante Y Rivero');
insert into ubigeo (departamento, provincia, distrito) values ('Arequipa','Camaná','Camaná');
insert into ubigeo (departamento, provincia, distrito) values ('Arequipa','Camaná','José María Quimper');
insert into ubigeo (departamento, provincia, distrito) values ('Arequipa','Camaná','Mariano Nicolás Valcárcel');
insert into ubigeo (departamento, provincia, distrito) values ('Arequipa','Camaná','Mariscal Cáceres');
insert into ubigeo (departamento, provincia, distrito) values ('Arequipa','Camaná','Nicolás de Pierola');
insert into ubigeo (departamento, provincia, distrito) values ('Arequipa','Camaná','Ocoña');
insert into ubigeo (departamento, provincia, distrito) values ('Arequipa','Camaná','Quilca');
insert into ubigeo (departamento, provincia, distrito) values ('Arequipa','Camaná','Samuel Pastor');
insert into ubigeo (departamento, provincia, distrito) values ('Arequipa','Caravelí','Caravelí');
insert into ubigeo (departamento, provincia, distrito) values ('Arequipa','Caravelí','Acarí');
insert into ubigeo (departamento, provincia, distrito) values ('Arequipa','Caravelí','Atico');
insert into ubigeo (departamento, provincia, distrito) values ('Arequipa','Caravelí','Atiquipa');
insert into ubigeo (departamento, provincia, distrito) values ('Arequipa','Caravelí','Bella Unión');
insert into ubigeo (departamento, provincia, distrito) values ('Arequipa','Caravelí','Cahuacho');
insert into ubigeo (departamento, provincia, distrito) values ('Arequipa','Caravelí','Chala');
insert into ubigeo (departamento, provincia, distrito) values ('Arequipa','Caravelí','Chaparra');
insert into ubigeo (departamento, provincia, distrito) values ('Arequipa','Caravelí','Huanuhuanu');
insert into ubigeo (departamento, provincia, distrito) values ('Arequipa','Caravelí','Jaqui');
insert into ubigeo (departamento, provincia, distrito) values ('Arequipa','Caravelí','Lomas');
insert into ubigeo (departamento, provincia, distrito) values ('Arequipa','Caravelí','Quicacha');
insert into ubigeo (departamento, provincia, distrito) values ('Arequipa','Caravelí','Yauca');
insert into ubigeo (departamento, provincia, distrito) values ('Arequipa','Castilla','Aplao');
insert into ubigeo (departamento, provincia, distrito) values ('Arequipa','Castilla','Andagua');
insert into ubigeo (departamento, provincia, distrito) values ('Arequipa','Castilla','Ayo');
insert into ubigeo (departamento, provincia, distrito) values ('Arequipa','Castilla','Chachas');
insert into ubigeo (departamento, provincia, distrito) values ('Arequipa','Castilla','Chilcaymarca');
insert into ubigeo (departamento, provincia, distrito) values ('Arequipa','Castilla','Choco');
insert into ubigeo (departamento, provincia, distrito) values ('Arequipa','Castilla','Huancarqui');
insert into ubigeo (departamento, provincia, distrito) values ('Arequipa','Castilla','Machaguay');
insert into ubigeo (departamento, provincia, distrito) values ('Arequipa','Castilla','Orcopampa');
insert into ubigeo (departamento, provincia, distrito) values ('Arequipa','Castilla','Pampacolca');
insert into ubigeo (departamento, provincia, distrito) values ('Arequipa','Castilla','Tipan');
insert into ubigeo (departamento, provincia, distrito) values ('Arequipa','Castilla','Uñon');
insert into ubigeo (departamento, provincia, distrito) values ('Arequipa','Castilla','Uraca');
insert into ubigeo (departamento, provincia, distrito) values ('Arequipa','Castilla','Viraco');
insert into ubigeo (departamento, provincia, distrito) values ('Arequipa','Caylloma','Chivay');
insert into ubigeo (departamento, provincia, distrito) values ('Arequipa','Caylloma','Achoma');
insert into ubigeo (departamento, provincia, distrito) values ('Arequipa','Caylloma','Cabanaconde');
insert into ubigeo (departamento, provincia, distrito) values ('Arequipa','Caylloma','Callalli');
insert into ubigeo (departamento, provincia, distrito) values ('Arequipa','Caylloma','Caylloma');
insert into ubigeo (departamento, provincia, distrito) values ('Arequipa','Caylloma','Coporaque');
insert into ubigeo (departamento, provincia, distrito) values ('Arequipa','Caylloma','Huambo');
insert into ubigeo (departamento, provincia, distrito) values ('Arequipa','Caylloma','Huanca');
insert into ubigeo (departamento, provincia, distrito) values ('Arequipa','Caylloma','Ichupampa');
insert into ubigeo (departamento, provincia, distrito) values ('Arequipa','Caylloma','Lari');
insert into ubigeo (departamento, provincia, distrito) values ('Arequipa','Caylloma','Lluta');
insert into ubigeo (departamento, provincia, distrito) values ('Arequipa','Caylloma','Maca');
insert into ubigeo (departamento, provincia, distrito) values ('Arequipa','Caylloma','Madrigal');
insert into ubigeo (departamento, provincia, distrito) values ('Arequipa','Caylloma','San Antonio de Chuca');
insert into ubigeo (departamento, provincia, distrito) values ('Arequipa','Caylloma','Sibayo');
insert into ubigeo (departamento, provincia, distrito) values ('Arequipa','Caylloma','Tapay');
insert into ubigeo (departamento, provincia, distrito) values ('Arequipa','Caylloma','Tisco');
insert into ubigeo (departamento, provincia, distrito) values ('Arequipa','Caylloma','Tuti');
insert into ubigeo (departamento, provincia, distrito) values ('Arequipa','Caylloma','Yanque');
insert into ubigeo (departamento, provincia, distrito) values ('Arequipa','Caylloma','Majes');
insert into ubigeo (departamento, provincia, distrito) values ('Arequipa','Condesuyos','Chuquibamba');
insert into ubigeo (departamento, provincia, distrito) values ('Arequipa','Condesuyos','Andaray');
insert into ubigeo (departamento, provincia, distrito) values ('Arequipa','Condesuyos','Cayarani');
insert into ubigeo (departamento, provincia, distrito) values ('Arequipa','Condesuyos','Chichas');
insert into ubigeo (departamento, provincia, distrito) values ('Arequipa','Condesuyos','Iray');
insert into ubigeo (departamento, provincia, distrito) values ('Arequipa','Condesuyos','Río Grande');
insert into ubigeo (departamento, provincia, distrito) values ('Arequipa','Condesuyos','Salamanca');
insert into ubigeo (departamento, provincia, distrito) values ('Arequipa','Condesuyos','Yanaquihua');
insert into ubigeo (departamento, provincia, distrito) values ('Arequipa','Islay','Mollendo');
insert into ubigeo (departamento, provincia, distrito) values ('Arequipa','Islay','Cocachacra');
insert into ubigeo (departamento, provincia, distrito) values ('Arequipa','Islay','Dean Valdivia');
insert into ubigeo (departamento, provincia, distrito) values ('Arequipa','Islay','Islay');
insert into ubigeo (departamento, provincia, distrito) values ('Arequipa','Islay','Mejia');
insert into ubigeo (departamento, provincia, distrito) values ('Arequipa','Islay','Punta de Bombón');
insert into ubigeo (departamento, provincia, distrito) values ('Arequipa','La Uniòn','Cotahuasi');
insert into ubigeo (departamento, provincia, distrito) values ('Arequipa','La Uniòn','Alca');
insert into ubigeo (departamento, provincia, distrito) values ('Arequipa','La Uniòn','Charcana');
insert into ubigeo (departamento, provincia, distrito) values ('Arequipa','La Uniòn','Huaynacotas');
insert into ubigeo (departamento, provincia, distrito) values ('Arequipa','La Uniòn','Pampamarca');
insert into ubigeo (departamento, provincia, distrito) values ('Arequipa','La Uniòn','Puyca');
insert into ubigeo (departamento, provincia, distrito) values ('Arequipa','La Uniòn','Quechualla');
insert into ubigeo (departamento, provincia, distrito) values ('Arequipa','La Uniòn','Sayla');
insert into ubigeo (departamento, provincia, distrito) values ('Arequipa','La Uniòn','Tauria');
insert into ubigeo (departamento, provincia, distrito) values ('Arequipa','La Uniòn','Tomepampa');
insert into ubigeo (departamento, provincia, distrito) values ('Arequipa','La Uniòn','Toro');
insert into ubigeo (departamento, provincia, distrito) values ('Ayacucho','Huamanga','Ayacucho');
insert into ubigeo (departamento, provincia, distrito) values ('Ayacucho','Huamanga','Acocro');
insert into ubigeo (departamento, provincia, distrito) values ('Ayacucho','Huamanga','Acos Vinchos');
insert into ubigeo (departamento, provincia, distrito) values ('Ayacucho','Huamanga','Carmen Alto');
insert into ubigeo (departamento, provincia, distrito) values ('Ayacucho','Huamanga','Chiara');
insert into ubigeo (departamento, provincia, distrito) values ('Ayacucho','Huamanga','Ocros');
insert into ubigeo (departamento, provincia, distrito) values ('Ayacucho','Huamanga','Pacaycasa');
insert into ubigeo (departamento, provincia, distrito) values ('Ayacucho','Huamanga','Quinua');
insert into ubigeo (departamento, provincia, distrito) values ('Ayacucho','Huamanga','San José de Ticllas');
insert into ubigeo (departamento, provincia, distrito) values ('Ayacucho','Huamanga','San Juan Bautista');
insert into ubigeo (departamento, provincia, distrito) values ('Ayacucho','Huamanga','Santiago de Pischa');
insert into ubigeo (departamento, provincia, distrito) values ('Ayacucho','Huamanga','Socos');
insert into ubigeo (departamento, provincia, distrito) values ('Ayacucho','Huamanga','Tambillo');
insert into ubigeo (departamento, provincia, distrito) values ('Ayacucho','Huamanga','Vinchos');
insert into ubigeo (departamento, provincia, distrito) values ('Ayacucho','Huamanga','Jesús Nazareno');
insert into ubigeo (departamento, provincia, distrito) values ('Ayacucho','Huamanga','Andrés Avelino Cáceres Dorregaray');
insert into ubigeo (departamento, provincia, distrito) values ('Ayacucho','Cangallo','Cangallo');
insert into ubigeo (departamento, provincia, distrito) values ('Ayacucho','Cangallo','Chuschi');
insert into ubigeo (departamento, provincia, distrito) values ('Ayacucho','Cangallo','Los Morochucos');
insert into ubigeo (departamento, provincia, distrito) values ('Ayacucho','Cangallo','María Parado de Bellido');
insert into ubigeo (departamento, provincia, distrito) values ('Ayacucho','Cangallo','Paras');
insert into ubigeo (departamento, provincia, distrito) values ('Ayacucho','Cangallo','Totos');
insert into ubigeo (departamento, provincia, distrito) values ('Ayacucho','Huanca Sancos','Sancos');
insert into ubigeo (departamento, provincia, distrito) values ('Ayacucho','Huanca Sancos','Carapo');
insert into ubigeo (departamento, provincia, distrito) values ('Ayacucho','Huanca Sancos','Sacsamarca');
insert into ubigeo (departamento, provincia, distrito) values ('Ayacucho','Huanca Sancos','Santiago de Lucanamarca');
insert into ubigeo (departamento, provincia, distrito) values ('Ayacucho','Huanta','Huanta');
insert into ubigeo (departamento, provincia, distrito) values ('Ayacucho','Huanta','Ayahuanco');
insert into ubigeo (departamento, provincia, distrito) values ('Ayacucho','Huanta','Huamanguilla');
insert into ubigeo (departamento, provincia, distrito) values ('Ayacucho','Huanta','Iguain');
insert into ubigeo (departamento, provincia, distrito) values ('Ayacucho','Huanta','Luricocha');
insert into ubigeo (departamento, provincia, distrito) values ('Ayacucho','Huanta','Santillana');
insert into ubigeo (departamento, provincia, distrito) values ('Ayacucho','Huanta','Sivia');
insert into ubigeo (departamento, provincia, distrito) values ('Ayacucho','Huanta','Llochegua');
insert into ubigeo (departamento, provincia, distrito) values ('Ayacucho','Huanta','Canayre');
insert into ubigeo (departamento, provincia, distrito) values ('Ayacucho','Huanta','Uchuraccay');
insert into ubigeo (departamento, provincia, distrito) values ('Ayacucho','Huanta','Pucacolpa');
insert into ubigeo (departamento, provincia, distrito) values ('Ayacucho','Huanta','Chaca');
insert into ubigeo (departamento, provincia, distrito) values ('Ayacucho','La Mar','San Miguel');
insert into ubigeo (departamento, provincia, distrito) values ('Ayacucho','La Mar','Anco');
insert into ubigeo (departamento, provincia, distrito) values ('Ayacucho','La Mar','Ayna');
insert into ubigeo (departamento, provincia, distrito) values ('Ayacucho','La Mar','Chilcas');
insert into ubigeo (departamento, provincia, distrito) values ('Ayacucho','La Mar','Chungui');
insert into ubigeo (departamento, provincia, distrito) values ('Ayacucho','La Mar','Luis Carranza');
insert into ubigeo (departamento, provincia, distrito) values ('Ayacucho','La Mar','Santa Rosa');
insert into ubigeo (departamento, provincia, distrito) values ('Ayacucho','La Mar','Tambo');
insert into ubigeo (departamento, provincia, distrito) values ('Ayacucho','La Mar','Samugari');
insert into ubigeo (departamento, provincia, distrito) values ('Ayacucho','La Mar','Anchihuay');
insert into ubigeo (departamento, provincia, distrito) values ('Ayacucho','La Mar','Oronccoy');
insert into ubigeo (departamento, provincia, distrito) values ('Ayacucho','Lucanas','Puquio');
insert into ubigeo (departamento, provincia, distrito) values ('Ayacucho','Lucanas','Aucara');
insert into ubigeo (departamento, provincia, distrito) values ('Ayacucho','Lucanas','Cabana');
insert into ubigeo (departamento, provincia, distrito) values ('Ayacucho','Lucanas','Carmen Salcedo');
insert into ubigeo (departamento, provincia, distrito) values ('Ayacucho','Lucanas','Chaviña');
insert into ubigeo (departamento, provincia, distrito) values ('Ayacucho','Lucanas','Chipao');
insert into ubigeo (departamento, provincia, distrito) values ('Ayacucho','Lucanas','Huac-Huas');
insert into ubigeo (departamento, provincia, distrito) values ('Ayacucho','Lucanas','Laramate');
insert into ubigeo (departamento, provincia, distrito) values ('Ayacucho','Lucanas','Leoncio Prado');
insert into ubigeo (departamento, provincia, distrito) values ('Ayacucho','Lucanas','Llauta');
insert into ubigeo (departamento, provincia, distrito) values ('Ayacucho','Lucanas','Lucanas');
insert into ubigeo (departamento, provincia, distrito) values ('Ayacucho','Lucanas','Ocaña');
insert into ubigeo (departamento, provincia, distrito) values ('Ayacucho','Lucanas','Otoca');
insert into ubigeo (departamento, provincia, distrito) values ('Ayacucho','Lucanas','Saisa');
insert into ubigeo (departamento, provincia, distrito) values ('Ayacucho','Lucanas','San Cristóbal');
insert into ubigeo (departamento, provincia, distrito) values ('Ayacucho','Lucanas','San Juan');
insert into ubigeo (departamento, provincia, distrito) values ('Ayacucho','Lucanas','San Pedro');
insert into ubigeo (departamento, provincia, distrito) values ('Ayacucho','Lucanas','San Pedro de Palco');
insert into ubigeo (departamento, provincia, distrito) values ('Ayacucho','Lucanas','Sancos');
insert into ubigeo (departamento, provincia, distrito) values ('Ayacucho','Lucanas','Santa Ana de Huaycahuacho');
insert into ubigeo (departamento, provincia, distrito) values ('Ayacucho','Lucanas','Santa Lucia');
insert into ubigeo (departamento, provincia, distrito) values ('Ayacucho','Parinacochas','Coracora');
insert into ubigeo (departamento, provincia, distrito) values ('Ayacucho','Parinacochas','Chumpi');
insert into ubigeo (departamento, provincia, distrito) values ('Ayacucho','Parinacochas','Coronel Castañeda');
insert into ubigeo (departamento, provincia, distrito) values ('Ayacucho','Parinacochas','Pacapausa');
insert into ubigeo (departamento, provincia, distrito) values ('Ayacucho','Parinacochas','Pullo');
insert into ubigeo (departamento, provincia, distrito) values ('Ayacucho','Parinacochas','Puyusca');
insert into ubigeo (departamento, provincia, distrito) values ('Ayacucho','Parinacochas','San Francisco de Ravacayco');
insert into ubigeo (departamento, provincia, distrito) values ('Ayacucho','Parinacochas','Upahuacho');
insert into ubigeo (departamento, provincia, distrito) values ('Ayacucho','Pàucar del Sara Sara','Pausa');
insert into ubigeo (departamento, provincia, distrito) values ('Ayacucho','Pàucar del Sara Sara','Colta');
insert into ubigeo (departamento, provincia, distrito) values ('Ayacucho','Pàucar del Sara Sara','Corculla');
insert into ubigeo (departamento, provincia, distrito) values ('Ayacucho','Pàucar del Sara Sara','Lampa');
insert into ubigeo (departamento, provincia, distrito) values ('Ayacucho','Pàucar del Sara Sara','Marcabamba');
insert into ubigeo (departamento, provincia, distrito) values ('Ayacucho','Pàucar del Sara Sara','Oyolo');
insert into ubigeo (departamento, provincia, distrito) values ('Ayacucho','Pàucar del Sara Sara','Pararca');
insert into ubigeo (departamento, provincia, distrito) values ('Ayacucho','Pàucar del Sara Sara','San Javier de Alpabamba');
insert into ubigeo (departamento, provincia, distrito) values ('Ayacucho','Pàucar del Sara Sara','San José de Ushua');
insert into ubigeo (departamento, provincia, distrito) values ('Ayacucho','Pàucar del Sara Sara','Sara Sara');
insert into ubigeo (departamento, provincia, distrito) values ('Ayacucho','Sucre','Querobamba');
insert into ubigeo (departamento, provincia, distrito) values ('Ayacucho','Sucre','Belén');
insert into ubigeo (departamento, provincia, distrito) values ('Ayacucho','Sucre','Chalcos');
insert into ubigeo (departamento, provincia, distrito) values ('Ayacucho','Sucre','Chilcayoc');
insert into ubigeo (departamento, provincia, distrito) values ('Ayacucho','Sucre','Huacaña');
insert into ubigeo (departamento, provincia, distrito) values ('Ayacucho','Sucre','Morcolla');
insert into ubigeo (departamento, provincia, distrito) values ('Ayacucho','Sucre','Paico');
insert into ubigeo (departamento, provincia, distrito) values ('Ayacucho','Sucre','San Pedro de Larcay');
insert into ubigeo (departamento, provincia, distrito) values ('Ayacucho','Sucre','San Salvador de Quije');
insert into ubigeo (departamento, provincia, distrito) values ('Ayacucho','Sucre','Santiago de Paucaray');
insert into ubigeo (departamento, provincia, distrito) values ('Ayacucho','Sucre','Soras');
insert into ubigeo (departamento, provincia, distrito) values ('Ayacucho','Víctor Fajardo','Huancapi');
insert into ubigeo (departamento, provincia, distrito) values ('Ayacucho','Víctor Fajardo','Alcamenca');
insert into ubigeo (departamento, provincia, distrito) values ('Ayacucho','Víctor Fajardo','Apongo');
insert into ubigeo (departamento, provincia, distrito) values ('Ayacucho','Víctor Fajardo','Asquipata');
insert into ubigeo (departamento, provincia, distrito) values ('Ayacucho','Víctor Fajardo','Canaria');
insert into ubigeo (departamento, provincia, distrito) values ('Ayacucho','Víctor Fajardo','Cayara');
insert into ubigeo (departamento, provincia, distrito) values ('Ayacucho','Víctor Fajardo','Colca');
insert into ubigeo (departamento, provincia, distrito) values ('Ayacucho','Víctor Fajardo','Huamanquiquia');
insert into ubigeo (departamento, provincia, distrito) values ('Ayacucho','Víctor Fajardo','Huancaraylla');
insert into ubigeo (departamento, provincia, distrito) values ('Ayacucho','Víctor Fajardo','Hualla');
insert into ubigeo (departamento, provincia, distrito) values ('Ayacucho','Víctor Fajardo','Sarhua');
insert into ubigeo (departamento, provincia, distrito) values ('Ayacucho','Víctor Fajardo','Vilcanchos');
insert into ubigeo (departamento, provincia, distrito) values ('Ayacucho','Vilcas Huamán','Vilcas Huaman');
insert into ubigeo (departamento, provincia, distrito) values ('Ayacucho','Vilcas Huamán','Accomarca');
insert into ubigeo (departamento, provincia, distrito) values ('Ayacucho','Vilcas Huamán','Carhuanca');
insert into ubigeo (departamento, provincia, distrito) values ('Ayacucho','Vilcas Huamán','Concepción');
insert into ubigeo (departamento, provincia, distrito) values ('Ayacucho','Vilcas Huamán','Huambalpa');
insert into ubigeo (departamento, provincia, distrito) values ('Ayacucho','Vilcas Huamán','Independencia');
insert into ubigeo (departamento, provincia, distrito) values ('Ayacucho','Vilcas Huamán','Saurama');
insert into ubigeo (departamento, provincia, distrito) values ('Ayacucho','Vilcas Huamán','Vischongo');
insert into ubigeo (departamento, provincia, distrito) values ('Cajamarca','Cajamarca','Cajamarca');
insert into ubigeo (departamento, provincia, distrito) values ('Cajamarca','Cajamarca','Asunción');
insert into ubigeo (departamento, provincia, distrito) values ('Cajamarca','Cajamarca','Chetilla');
insert into ubigeo (departamento, provincia, distrito) values ('Cajamarca','Cajamarca','Cospan');
insert into ubigeo (departamento, provincia, distrito) values ('Cajamarca','Cajamarca','Encañada');
insert into ubigeo (departamento, provincia, distrito) values ('Cajamarca','Cajamarca','Jesús');
insert into ubigeo (departamento, provincia, distrito) values ('Cajamarca','Cajamarca','Llacanora');
insert into ubigeo (departamento, provincia, distrito) values ('Cajamarca','Cajamarca','Los Baños del Inca');
insert into ubigeo (departamento, provincia, distrito) values ('Cajamarca','Cajamarca','Magdalena');
insert into ubigeo (departamento, provincia, distrito) values ('Cajamarca','Cajamarca','Matara');
insert into ubigeo (departamento, provincia, distrito) values ('Cajamarca','Cajamarca','Namora');
insert into ubigeo (departamento, provincia, distrito) values ('Cajamarca','Cajamarca','San Juan');
insert into ubigeo (departamento, provincia, distrito) values ('Cajamarca','Cajabamba','Cajabamba');
insert into ubigeo (departamento, provincia, distrito) values ('Cajamarca','Cajabamba','Cachachi');
insert into ubigeo (departamento, provincia, distrito) values ('Cajamarca','Cajabamba','Condebamba');
insert into ubigeo (departamento, provincia, distrito) values ('Cajamarca','Cajabamba','Sitacocha');
insert into ubigeo (departamento, provincia, distrito) values ('Cajamarca','Celendín','Celendín');
insert into ubigeo (departamento, provincia, distrito) values ('Cajamarca','Celendín','Chumuch');
insert into ubigeo (departamento, provincia, distrito) values ('Cajamarca','Celendín','Cortegana');
insert into ubigeo (departamento, provincia, distrito) values ('Cajamarca','Celendín','Huasmin');
insert into ubigeo (departamento, provincia, distrito) values ('Cajamarca','Celendín','Jorge Chávez');
insert into ubigeo (departamento, provincia, distrito) values ('Cajamarca','Celendín','José Gálvez');
insert into ubigeo (departamento, provincia, distrito) values ('Cajamarca','Celendín','Miguel Iglesias');
insert into ubigeo (departamento, provincia, distrito) values ('Cajamarca','Celendín','Oxamarca');
insert into ubigeo (departamento, provincia, distrito) values ('Cajamarca','Celendín','Sorochuco');
insert into ubigeo (departamento, provincia, distrito) values ('Cajamarca','Celendín','Sucre');
insert into ubigeo (departamento, provincia, distrito) values ('Cajamarca','Celendín','Utco');
insert into ubigeo (departamento, provincia, distrito) values ('Cajamarca','Celendín','La Libertad de Pallan');
insert into ubigeo (departamento, provincia, distrito) values ('Cajamarca','Chota','Chota');
insert into ubigeo (departamento, provincia, distrito) values ('Cajamarca','Chota','Anguia');
insert into ubigeo (departamento, provincia, distrito) values ('Cajamarca','Chota','Chadin');
insert into ubigeo (departamento, provincia, distrito) values ('Cajamarca','Chota','Chiguirip');
insert into ubigeo (departamento, provincia, distrito) values ('Cajamarca','Chota','Chimban');
insert into ubigeo (departamento, provincia, distrito) values ('Cajamarca','Chota','Choropampa');
insert into ubigeo (departamento, provincia, distrito) values ('Cajamarca','Chota','Cochabamba');
insert into ubigeo (departamento, provincia, distrito) values ('Cajamarca','Chota','Conchan');
insert into ubigeo (departamento, provincia, distrito) values ('Cajamarca','Chota','Huambos');
insert into ubigeo (departamento, provincia, distrito) values ('Cajamarca','Chota','Lajas');
insert into ubigeo (departamento, provincia, distrito) values ('Cajamarca','Chota','Llama');
insert into ubigeo (departamento, provincia, distrito) values ('Cajamarca','Chota','Miracosta');
insert into ubigeo (departamento, provincia, distrito) values ('Cajamarca','Chota','Paccha');
insert into ubigeo (departamento, provincia, distrito) values ('Cajamarca','Chota','Pion');
insert into ubigeo (departamento, provincia, distrito) values ('Cajamarca','Chota','Querocoto');
insert into ubigeo (departamento, provincia, distrito) values ('Cajamarca','Chota','San Juan de Licupis');
insert into ubigeo (departamento, provincia, distrito) values ('Cajamarca','Chota','Tacabamba');
insert into ubigeo (departamento, provincia, distrito) values ('Cajamarca','Chota','Tocmoche');
insert into ubigeo (departamento, provincia, distrito) values ('Cajamarca','Chota','Chalamarca');
insert into ubigeo (departamento, provincia, distrito) values ('Cajamarca','Contumazá','Contumaza');
insert into ubigeo (departamento, provincia, distrito) values ('Cajamarca','Contumazá','Chilete');
insert into ubigeo (departamento, provincia, distrito) values ('Cajamarca','Contumazá','Cupisnique');
insert into ubigeo (departamento, provincia, distrito) values ('Cajamarca','Contumazá','Guzmango');
insert into ubigeo (departamento, provincia, distrito) values ('Cajamarca','Contumazá','San Benito');
insert into ubigeo (departamento, provincia, distrito) values ('Cajamarca','Contumazá','Santa Cruz de Toledo');
insert into ubigeo (departamento, provincia, distrito) values ('Cajamarca','Contumazá','Tantarica');
insert into ubigeo (departamento, provincia, distrito) values ('Cajamarca','Contumazá','Yonan');
insert into ubigeo (departamento, provincia, distrito) values ('Cajamarca','Cutervo','Cutervo');
insert into ubigeo (departamento, provincia, distrito) values ('Cajamarca','Cutervo','Callayuc');
insert into ubigeo (departamento, provincia, distrito) values ('Cajamarca','Cutervo','Choros');
insert into ubigeo (departamento, provincia, distrito) values ('Cajamarca','Cutervo','Cujillo');
insert into ubigeo (departamento, provincia, distrito) values ('Cajamarca','Cutervo','La Ramada');
insert into ubigeo (departamento, provincia, distrito) values ('Cajamarca','Cutervo','Pimpingos');
insert into ubigeo (departamento, provincia, distrito) values ('Cajamarca','Cutervo','Querocotillo');
insert into ubigeo (departamento, provincia, distrito) values ('Cajamarca','Cutervo','San Andrés de Cutervo');
insert into ubigeo (departamento, provincia, distrito) values ('Cajamarca','Cutervo','San Juan de Cutervo');
insert into ubigeo (departamento, provincia, distrito) values ('Cajamarca','Cutervo','San Luis de Lucma');
insert into ubigeo (departamento, provincia, distrito) values ('Cajamarca','Cutervo','Santa Cruz');
insert into ubigeo (departamento, provincia, distrito) values ('Cajamarca','Cutervo','Santo Domingo de la Capilla');
insert into ubigeo (departamento, provincia, distrito) values ('Cajamarca','Cutervo','Santo Tomas');
insert into ubigeo (departamento, provincia, distrito) values ('Cajamarca','Cutervo','Socota');
insert into ubigeo (departamento, provincia, distrito) values ('Cajamarca','Cutervo','Toribio Casanova');
insert into ubigeo (departamento, provincia, distrito) values ('Cajamarca','Hualgayoc','Bambamarca');
insert into ubigeo (departamento, provincia, distrito) values ('Cajamarca','Hualgayoc','Chugur');
insert into ubigeo (departamento, provincia, distrito) values ('Cajamarca','Hualgayoc','Hualgayoc');
insert into ubigeo (departamento, provincia, distrito) values ('Cajamarca','Jaén','Jaén');
insert into ubigeo (departamento, provincia, distrito) values ('Cajamarca','Jaén','Bellavista');
insert into ubigeo (departamento, provincia, distrito) values ('Cajamarca','Jaén','Chontali');
insert into ubigeo (departamento, provincia, distrito) values ('Cajamarca','Jaén','Colasay');
insert into ubigeo (departamento, provincia, distrito) values ('Cajamarca','Jaén','Huabal');
insert into ubigeo (departamento, provincia, distrito) values ('Cajamarca','Jaén','Las Pirias');
insert into ubigeo (departamento, provincia, distrito) values ('Cajamarca','Jaén','Pomahuaca');
insert into ubigeo (departamento, provincia, distrito) values ('Cajamarca','Jaén','Pucara');
insert into ubigeo (departamento, provincia, distrito) values ('Cajamarca','Jaén','Sallique');
insert into ubigeo (departamento, provincia, distrito) values ('Cajamarca','Jaén','San Felipe');
insert into ubigeo (departamento, provincia, distrito) values ('Cajamarca','Jaén','San José del Alto');
insert into ubigeo (departamento, provincia, distrito) values ('Cajamarca','Jaén','Santa Rosa');
insert into ubigeo (departamento, provincia, distrito) values ('Cajamarca','San Ignacio','San Ignacio');
insert into ubigeo (departamento, provincia, distrito) values ('Cajamarca','San Ignacio','Chirinos');
insert into ubigeo (departamento, provincia, distrito) values ('Cajamarca','San Ignacio','Huarango');
insert into ubigeo (departamento, provincia, distrito) values ('Cajamarca','San Ignacio','La Coipa');
insert into ubigeo (departamento, provincia, distrito) values ('Cajamarca','San Ignacio','Namballe');
insert into ubigeo (departamento, provincia, distrito) values ('Cajamarca','San Ignacio','San José de Lourdes');
insert into ubigeo (departamento, provincia, distrito) values ('Cajamarca','San Ignacio','Tabaconas');
insert into ubigeo (departamento, provincia, distrito) values ('Cajamarca','San Marcos','Pedro Gálvez');
insert into ubigeo (departamento, provincia, distrito) values ('Cajamarca','San Marcos','Chancay');
insert into ubigeo (departamento, provincia, distrito) values ('Cajamarca','San Marcos','Eduardo Villanueva');
insert into ubigeo (departamento, provincia, distrito) values ('Cajamarca','San Marcos','Gregorio Pita');
insert into ubigeo (departamento, provincia, distrito) values ('Cajamarca','San Marcos','Ichocan');
insert into ubigeo (departamento, provincia, distrito) values ('Cajamarca','San Marcos','José Manuel Quiroz');
insert into ubigeo (departamento, provincia, distrito) values ('Cajamarca','San Marcos','José Sabogal');
insert into ubigeo (departamento, provincia, distrito) values ('Cajamarca','San Miguel','San Miguel');
insert into ubigeo (departamento, provincia, distrito) values ('Cajamarca','San Miguel','Bolívar');
insert into ubigeo (departamento, provincia, distrito) values ('Cajamarca','San Miguel','Calquis');
insert into ubigeo (departamento, provincia, distrito) values ('Cajamarca','San Miguel','Catilluc');
insert into ubigeo (departamento, provincia, distrito) values ('Cajamarca','San Miguel','El Prado');
insert into ubigeo (departamento, provincia, distrito) values ('Cajamarca','San Miguel','La Florida');
insert into ubigeo (departamento, provincia, distrito) values ('Cajamarca','San Miguel','Llapa');
insert into ubigeo (departamento, provincia, distrito) values ('Cajamarca','San Miguel','Nanchoc');
insert into ubigeo (departamento, provincia, distrito) values ('Cajamarca','San Miguel','Niepos');
insert into ubigeo (departamento, provincia, distrito) values ('Cajamarca','San Miguel','San Gregorio');
insert into ubigeo (departamento, provincia, distrito) values ('Cajamarca','San Miguel','San Silvestre de Cochan');
insert into ubigeo (departamento, provincia, distrito) values ('Cajamarca','San Miguel','Tongod');
insert into ubigeo (departamento, provincia, distrito) values ('Cajamarca','San Miguel','Unión Agua Blanca');
insert into ubigeo (departamento, provincia, distrito) values ('Cajamarca','San Pablo','San Pablo');
insert into ubigeo (departamento, provincia, distrito) values ('Cajamarca','San Pablo','San Bernardino');
insert into ubigeo (departamento, provincia, distrito) values ('Cajamarca','San Pablo','San Luis');
insert into ubigeo (departamento, provincia, distrito) values ('Cajamarca','San Pablo','Tumbaden');
insert into ubigeo (departamento, provincia, distrito) values ('Cajamarca','Santa Cruz','Santa Cruz');
insert into ubigeo (departamento, provincia, distrito) values ('Cajamarca','Santa Cruz','Andabamba');
insert into ubigeo (departamento, provincia, distrito) values ('Cajamarca','Santa Cruz','Catache');
insert into ubigeo (departamento, provincia, distrito) values ('Cajamarca','Santa Cruz','Chancaybaños');
insert into ubigeo (departamento, provincia, distrito) values ('Cajamarca','Santa Cruz','La Esperanza');
insert into ubigeo (departamento, provincia, distrito) values ('Cajamarca','Santa Cruz','Ninabamba');
insert into ubigeo (departamento, provincia, distrito) values ('Cajamarca','Santa Cruz','Pulan');
insert into ubigeo (departamento, provincia, distrito) values ('Cajamarca','Santa Cruz','Saucepampa');
insert into ubigeo (departamento, provincia, distrito) values ('Cajamarca','Santa Cruz','Sexi');
insert into ubigeo (departamento, provincia, distrito) values ('Cajamarca','Santa Cruz','Uticyacu');
insert into ubigeo (departamento, provincia, distrito) values ('Cajamarca','Santa Cruz','Yauyucan');
insert into ubigeo (departamento, provincia, distrito) values ('Callao','Prov. Const. del Callao','Callao');
insert into ubigeo (departamento, provincia, distrito) values ('Callao','Prov. Const. del Callao','Bellavista');
insert into ubigeo (departamento, provincia, distrito) values ('Callao','Prov. Const. del Callao','Carmen de la Legua Reynoso');
insert into ubigeo (departamento, provincia, distrito) values ('Callao','Prov. Const. del Callao','La Perla');
insert into ubigeo (departamento, provincia, distrito) values ('Callao','Prov. Const. del Callao','La Punta');
insert into ubigeo (departamento, provincia, distrito) values ('Callao','Prov. Const. del Callao','Ventanilla');
insert into ubigeo (departamento, provincia, distrito) values ('Callao','Prov. Const. del Callao','Mi Perú');
insert into ubigeo (departamento, provincia, distrito) values ('Cusco','Cusco','Cusco');
insert into ubigeo (departamento, provincia, distrito) values ('Cusco','Cusco','Ccorca');
insert into ubigeo (departamento, provincia, distrito) values ('Cusco','Cusco','Poroy');
insert into ubigeo (departamento, provincia, distrito) values ('Cusco','Cusco','San Jerónimo');
insert into ubigeo (departamento, provincia, distrito) values ('Cusco','Cusco','San Sebastian');
insert into ubigeo (departamento, provincia, distrito) values ('Cusco','Cusco','Santiago');
insert into ubigeo (departamento, provincia, distrito) values ('Cusco','Cusco','Saylla');
insert into ubigeo (departamento, provincia, distrito) values ('Cusco','Cusco','Wanchaq');
insert into ubigeo (departamento, provincia, distrito) values ('Cusco','Acomayo','Acomayo');
insert into ubigeo (departamento, provincia, distrito) values ('Cusco','Acomayo','Acopia');
insert into ubigeo (departamento, provincia, distrito) values ('Cusco','Acomayo','Acos');
insert into ubigeo (departamento, provincia, distrito) values ('Cusco','Acomayo','Mosoc Llacta');
insert into ubigeo (departamento, provincia, distrito) values ('Cusco','Acomayo','Pomacanchi');
insert into ubigeo (departamento, provincia, distrito) values ('Cusco','Acomayo','Rondocan');
insert into ubigeo (departamento, provincia, distrito) values ('Cusco','Acomayo','Sangarara');
insert into ubigeo (departamento, provincia, distrito) values ('Cusco','Anta','Anta');
insert into ubigeo (departamento, provincia, distrito) values ('Cusco','Anta','Ancahuasi');
insert into ubigeo (departamento, provincia, distrito) values ('Cusco','Anta','Cachimayo');
insert into ubigeo (departamento, provincia, distrito) values ('Cusco','Anta','Chinchaypujio');
insert into ubigeo (departamento, provincia, distrito) values ('Cusco','Anta','Huarocondo');
insert into ubigeo (departamento, provincia, distrito) values ('Cusco','Anta','Limatambo');
insert into ubigeo (departamento, provincia, distrito) values ('Cusco','Anta','Mollepata');
insert into ubigeo (departamento, provincia, distrito) values ('Cusco','Anta','Pucyura');
insert into ubigeo (departamento, provincia, distrito) values ('Cusco','Anta','Zurite');
insert into ubigeo (departamento, provincia, distrito) values ('Cusco','Calca','Calca');
insert into ubigeo (departamento, provincia, distrito) values ('Cusco','Calca','Coya');
insert into ubigeo (departamento, provincia, distrito) values ('Cusco','Calca','Lamay');
insert into ubigeo (departamento, provincia, distrito) values ('Cusco','Calca','Lares');
insert into ubigeo (departamento, provincia, distrito) values ('Cusco','Calca','Pisac');
insert into ubigeo (departamento, provincia, distrito) values ('Cusco','Calca','San Salvador');
insert into ubigeo (departamento, provincia, distrito) values ('Cusco','Calca','Taray');
insert into ubigeo (departamento, provincia, distrito) values ('Cusco','Calca','Yanatile');
insert into ubigeo (departamento, provincia, distrito) values ('Cusco','Canas','Yanaoca');
insert into ubigeo (departamento, provincia, distrito) values ('Cusco','Canas','Checca');
insert into ubigeo (departamento, provincia, distrito) values ('Cusco','Canas','Kunturkanki');
insert into ubigeo (departamento, provincia, distrito) values ('Cusco','Canas','Langui');
insert into ubigeo (departamento, provincia, distrito) values ('Cusco','Canas','Layo');
insert into ubigeo (departamento, provincia, distrito) values ('Cusco','Canas','Pampamarca');
insert into ubigeo (departamento, provincia, distrito) values ('Cusco','Canas','Quehue');
insert into ubigeo (departamento, provincia, distrito) values ('Cusco','Canas','Tupac Amaru');
insert into ubigeo (departamento, provincia, distrito) values ('Cusco','Canchis','Sicuani');
insert into ubigeo (departamento, provincia, distrito) values ('Cusco','Canchis','Checacupe');
insert into ubigeo (departamento, provincia, distrito) values ('Cusco','Canchis','Combapata');
insert into ubigeo (departamento, provincia, distrito) values ('Cusco','Canchis','Marangani');
insert into ubigeo (departamento, provincia, distrito) values ('Cusco','Canchis','Pitumarca');
insert into ubigeo (departamento, provincia, distrito) values ('Cusco','Canchis','San Pablo');
insert into ubigeo (departamento, provincia, distrito) values ('Cusco','Canchis','San Pedro');
insert into ubigeo (departamento, provincia, distrito) values ('Cusco','Canchis','Tinta');
insert into ubigeo (departamento, provincia, distrito) values ('Cusco','Chumbivilcas','Santo Tomas');
insert into ubigeo (departamento, provincia, distrito) values ('Cusco','Chumbivilcas','Capacmarca');
insert into ubigeo (departamento, provincia, distrito) values ('Cusco','Chumbivilcas','Chamaca');
insert into ubigeo (departamento, provincia, distrito) values ('Cusco','Chumbivilcas','Colquemarca');
insert into ubigeo (departamento, provincia, distrito) values ('Cusco','Chumbivilcas','Livitaca');
insert into ubigeo (departamento, provincia, distrito) values ('Cusco','Chumbivilcas','Llusco');
insert into ubigeo (departamento, provincia, distrito) values ('Cusco','Chumbivilcas','Quiñota');
insert into ubigeo (departamento, provincia, distrito) values ('Cusco','Chumbivilcas','Velille');
insert into ubigeo (departamento, provincia, distrito) values ('Cusco','Espinar','Espinar');
insert into ubigeo (departamento, provincia, distrito) values ('Cusco','Espinar','Condoroma');
insert into ubigeo (departamento, provincia, distrito) values ('Cusco','Espinar','Coporaque');
insert into ubigeo (departamento, provincia, distrito) values ('Cusco','Espinar','Ocoruro');
insert into ubigeo (departamento, provincia, distrito) values ('Cusco','Espinar','Pallpata');
insert into ubigeo (departamento, provincia, distrito) values ('Cusco','Espinar','Pichigua');
insert into ubigeo (departamento, provincia, distrito) values ('Cusco','Espinar','Suyckutambo');
insert into ubigeo (departamento, provincia, distrito) values ('Cusco','Espinar','Alto Pichigua');
insert into ubigeo (departamento, provincia, distrito) values ('Cusco','La Convención','Santa Ana');
insert into ubigeo (departamento, provincia, distrito) values ('Cusco','La Convención','Echarate');
insert into ubigeo (departamento, provincia, distrito) values ('Cusco','La Convención','Huayopata');
insert into ubigeo (departamento, provincia, distrito) values ('Cusco','La Convención','Maranura');
insert into ubigeo (departamento, provincia, distrito) values ('Cusco','La Convención','Ocobamba');
insert into ubigeo (departamento, provincia, distrito) values ('Cusco','La Convención','Quellouno');
insert into ubigeo (departamento, provincia, distrito) values ('Cusco','La Convención','Kimbiri');
insert into ubigeo (departamento, provincia, distrito) values ('Cusco','La Convención','Santa Teresa');
insert into ubigeo (departamento, provincia, distrito) values ('Cusco','La Convención','Vilcabamba');
insert into ubigeo (departamento, provincia, distrito) values ('Cusco','La Convención','Pichari');
insert into ubigeo (departamento, provincia, distrito) values ('Cusco','La Convención','Inkawasi');
insert into ubigeo (departamento, provincia, distrito) values ('Cusco','La Convención','Villa Virgen');
insert into ubigeo (departamento, provincia, distrito) values ('Cusco','La Convención','Villa Kintiarina');
insert into ubigeo (departamento, provincia, distrito) values ('Cusco','La Convención','Megantoni');
insert into ubigeo (departamento, provincia, distrito) values ('Cusco','Paruro','Paruro');
insert into ubigeo (departamento, provincia, distrito) values ('Cusco','Paruro','Accha');
insert into ubigeo (departamento, provincia, distrito) values ('Cusco','Paruro','Ccapi');
insert into ubigeo (departamento, provincia, distrito) values ('Cusco','Paruro','Colcha');
insert into ubigeo (departamento, provincia, distrito) values ('Cusco','Paruro','Huanoquite');
insert into ubigeo (departamento, provincia, distrito) values ('Cusco','Paruro','Omacha');
insert into ubigeo (departamento, provincia, distrito) values ('Cusco','Paruro','Paccaritambo');
insert into ubigeo (departamento, provincia, distrito) values ('Cusco','Paruro','Pillpinto');
insert into ubigeo (departamento, provincia, distrito) values ('Cusco','Paruro','Yaurisque');
insert into ubigeo (departamento, provincia, distrito) values ('Cusco','Paucartambo','Paucartambo');
insert into ubigeo (departamento, provincia, distrito) values ('Cusco','Paucartambo','Caicay');
insert into ubigeo (departamento, provincia, distrito) values ('Cusco','Paucartambo','Challabamba');
insert into ubigeo (departamento, provincia, distrito) values ('Cusco','Paucartambo','Colquepata');
insert into ubigeo (departamento, provincia, distrito) values ('Cusco','Paucartambo','Huancarani');
insert into ubigeo (departamento, provincia, distrito) values ('Cusco','Paucartambo','Kosñipata');
insert into ubigeo (departamento, provincia, distrito) values ('Cusco','Quispicanchi','Urcos');
insert into ubigeo (departamento, provincia, distrito) values ('Cusco','Quispicanchi','Andahuaylillas');
insert into ubigeo (departamento, provincia, distrito) values ('Cusco','Quispicanchi','Camanti');
insert into ubigeo (departamento, provincia, distrito) values ('Cusco','Quispicanchi','Ccarhuayo');
insert into ubigeo (departamento, provincia, distrito) values ('Cusco','Quispicanchi','Ccatca');
insert into ubigeo (departamento, provincia, distrito) values ('Cusco','Quispicanchi','Cusipata');
insert into ubigeo (departamento, provincia, distrito) values ('Cusco','Quispicanchi','Huaro');
insert into ubigeo (departamento, provincia, distrito) values ('Cusco','Quispicanchi','Lucre');
insert into ubigeo (departamento, provincia, distrito) values ('Cusco','Quispicanchi','Marcapata');
insert into ubigeo (departamento, provincia, distrito) values ('Cusco','Quispicanchi','Ocongate');
insert into ubigeo (departamento, provincia, distrito) values ('Cusco','Quispicanchi','Oropesa');
insert into ubigeo (departamento, provincia, distrito) values ('Cusco','Quispicanchi','Quiquijana');
insert into ubigeo (departamento, provincia, distrito) values ('Cusco','Urubamba','Urubamba');
insert into ubigeo (departamento, provincia, distrito) values ('Cusco','Urubamba','Chinchero');
insert into ubigeo (departamento, provincia, distrito) values ('Cusco','Urubamba','Huayllabamba');
insert into ubigeo (departamento, provincia, distrito) values ('Cusco','Urubamba','Machupicchu');
insert into ubigeo (departamento, provincia, distrito) values ('Cusco','Urubamba','Maras');
insert into ubigeo (departamento, provincia, distrito) values ('Cusco','Urubamba','Ollantaytambo');
insert into ubigeo (departamento, provincia, distrito) values ('Cusco','Urubamba','Yucay');
insert into ubigeo (departamento, provincia, distrito) values ('Huancavelica','Huancavelica','Huancavelica');
insert into ubigeo (departamento, provincia, distrito) values ('Huancavelica','Huancavelica','Acobambilla');
insert into ubigeo (departamento, provincia, distrito) values ('Huancavelica','Huancavelica','Acoria');
insert into ubigeo (departamento, provincia, distrito) values ('Huancavelica','Huancavelica','Conayca');
insert into ubigeo (departamento, provincia, distrito) values ('Huancavelica','Huancavelica','Cuenca');
insert into ubigeo (departamento, provincia, distrito) values ('Huancavelica','Huancavelica','Huachocolpa');
insert into ubigeo (departamento, provincia, distrito) values ('Huancavelica','Huancavelica','Huayllahuara');
insert into ubigeo (departamento, provincia, distrito) values ('Huancavelica','Huancavelica','Izcuchaca');
insert into ubigeo (departamento, provincia, distrito) values ('Huancavelica','Huancavelica','Laria');
insert into ubigeo (departamento, provincia, distrito) values ('Huancavelica','Huancavelica','Manta');
insert into ubigeo (departamento, provincia, distrito) values ('Huancavelica','Huancavelica','Mariscal Cáceres');
insert into ubigeo (departamento, provincia, distrito) values ('Huancavelica','Huancavelica','Moya');
insert into ubigeo (departamento, provincia, distrito) values ('Huancavelica','Huancavelica','Nuevo Occoro');
insert into ubigeo (departamento, provincia, distrito) values ('Huancavelica','Huancavelica','Palca');
insert into ubigeo (departamento, provincia, distrito) values ('Huancavelica','Huancavelica','Pilchaca');
insert into ubigeo (departamento, provincia, distrito) values ('Huancavelica','Huancavelica','Vilca');
insert into ubigeo (departamento, provincia, distrito) values ('Huancavelica','Huancavelica','Yauli');
insert into ubigeo (departamento, provincia, distrito) values ('Huancavelica','Huancavelica','Ascensión');
insert into ubigeo (departamento, provincia, distrito) values ('Huancavelica','Huancavelica','Huando');
insert into ubigeo (departamento, provincia, distrito) values ('Huancavelica','Acobamba','Acobamba');
insert into ubigeo (departamento, provincia, distrito) values ('Huancavelica','Acobamba','Andabamba');
insert into ubigeo (departamento, provincia, distrito) values ('Huancavelica','Acobamba','Anta');
insert into ubigeo (departamento, provincia, distrito) values ('Huancavelica','Acobamba','Caja');
insert into ubigeo (departamento, provincia, distrito) values ('Huancavelica','Acobamba','Marcas');
insert into ubigeo (departamento, provincia, distrito) values ('Huancavelica','Acobamba','Paucara');
insert into ubigeo (departamento, provincia, distrito) values ('Huancavelica','Acobamba','Pomacocha');
insert into ubigeo (departamento, provincia, distrito) values ('Huancavelica','Acobamba','Rosario');
insert into ubigeo (departamento, provincia, distrito) values ('Huancavelica','Angaraes','Lircay');
insert into ubigeo (departamento, provincia, distrito) values ('Huancavelica','Angaraes','Anchonga');
insert into ubigeo (departamento, provincia, distrito) values ('Huancavelica','Angaraes','Callanmarca');
insert into ubigeo (departamento, provincia, distrito) values ('Huancavelica','Angaraes','Ccochaccasa');
insert into ubigeo (departamento, provincia, distrito) values ('Huancavelica','Angaraes','Chincho');
insert into ubigeo (departamento, provincia, distrito) values ('Huancavelica','Angaraes','Congalla');
insert into ubigeo (departamento, provincia, distrito) values ('Huancavelica','Angaraes','Huanca-Huanca');
insert into ubigeo (departamento, provincia, distrito) values ('Huancavelica','Angaraes','Huayllay Grande');
insert into ubigeo (departamento, provincia, distrito) values ('Huancavelica','Angaraes','Julcamarca');
insert into ubigeo (departamento, provincia, distrito) values ('Huancavelica','Angaraes','San Antonio de Antaparco');
insert into ubigeo (departamento, provincia, distrito) values ('Huancavelica','Angaraes','Santo Tomas de Pata');
insert into ubigeo (departamento, provincia, distrito) values ('Huancavelica','Angaraes','Secclla');
insert into ubigeo (departamento, provincia, distrito) values ('Huancavelica','Castrovirreyna','Castrovirreyna');
insert into ubigeo (departamento, provincia, distrito) values ('Huancavelica','Castrovirreyna','Arma');
insert into ubigeo (departamento, provincia, distrito) values ('Huancavelica','Castrovirreyna','Aurahua');
insert into ubigeo (departamento, provincia, distrito) values ('Huancavelica','Castrovirreyna','Capillas');
insert into ubigeo (departamento, provincia, distrito) values ('Huancavelica','Castrovirreyna','Chupamarca');
insert into ubigeo (departamento, provincia, distrito) values ('Huancavelica','Castrovirreyna','Cocas');
insert into ubigeo (departamento, provincia, distrito) values ('Huancavelica','Castrovirreyna','Huachos');
insert into ubigeo (departamento, provincia, distrito) values ('Huancavelica','Castrovirreyna','Huamatambo');
insert into ubigeo (departamento, provincia, distrito) values ('Huancavelica','Castrovirreyna','Mollepampa');
insert into ubigeo (departamento, provincia, distrito) values ('Huancavelica','Castrovirreyna','San Juan');
insert into ubigeo (departamento, provincia, distrito) values ('Huancavelica','Castrovirreyna','Santa Ana');
insert into ubigeo (departamento, provincia, distrito) values ('Huancavelica','Castrovirreyna','Tantara');
insert into ubigeo (departamento, provincia, distrito) values ('Huancavelica','Castrovirreyna','Ticrapo');
insert into ubigeo (departamento, provincia, distrito) values ('Huancavelica','Churcampa','Churcampa');
insert into ubigeo (departamento, provincia, distrito) values ('Huancavelica','Churcampa','Anco');
insert into ubigeo (departamento, provincia, distrito) values ('Huancavelica','Churcampa','Chinchihuasi');
insert into ubigeo (departamento, provincia, distrito) values ('Huancavelica','Churcampa','El Carmen');
insert into ubigeo (departamento, provincia, distrito) values ('Huancavelica','Churcampa','La Merced');
insert into ubigeo (departamento, provincia, distrito) values ('Huancavelica','Churcampa','Locroja');
insert into ubigeo (departamento, provincia, distrito) values ('Huancavelica','Churcampa','Paucarbamba');
insert into ubigeo (departamento, provincia, distrito) values ('Huancavelica','Churcampa','San Miguel de Mayocc');
insert into ubigeo (departamento, provincia, distrito) values ('Huancavelica','Churcampa','San Pedro de Coris');
insert into ubigeo (departamento, provincia, distrito) values ('Huancavelica','Churcampa','Pachamarca');
insert into ubigeo (departamento, provincia, distrito) values ('Huancavelica','Churcampa','Cosme');
insert into ubigeo (departamento, provincia, distrito) values ('Huancavelica','Huaytará','Huaytara');
insert into ubigeo (departamento, provincia, distrito) values ('Huancavelica','Huaytará','Ayavi');
insert into ubigeo (departamento, provincia, distrito) values ('Huancavelica','Huaytará','Córdova');
insert into ubigeo (departamento, provincia, distrito) values ('Huancavelica','Huaytará','Huayacundo Arma');
insert into ubigeo (departamento, provincia, distrito) values ('Huancavelica','Huaytará','Laramarca');
insert into ubigeo (departamento, provincia, distrito) values ('Huancavelica','Huaytará','Ocoyo');
insert into ubigeo (departamento, provincia, distrito) values ('Huancavelica','Huaytará','Pilpichaca');
insert into ubigeo (departamento, provincia, distrito) values ('Huancavelica','Huaytará','Querco');
insert into ubigeo (departamento, provincia, distrito) values ('Huancavelica','Huaytará','Quito-Arma');
insert into ubigeo (departamento, provincia, distrito) values ('Huancavelica','Huaytará','San Antonio de Cusicancha');
insert into ubigeo (departamento, provincia, distrito) values ('Huancavelica','Huaytará','San Francisco de Sangayaico');
insert into ubigeo (departamento, provincia, distrito) values ('Huancavelica','Huaytará','San Isidro');
insert into ubigeo (departamento, provincia, distrito) values ('Huancavelica','Huaytará','Santiago de Chocorvos');
insert into ubigeo (departamento, provincia, distrito) values ('Huancavelica','Huaytará','Santiago de Quirahuara');
insert into ubigeo (departamento, provincia, distrito) values ('Huancavelica','Huaytará','Santo Domingo de Capillas');
insert into ubigeo (departamento, provincia, distrito) values ('Huancavelica','Huaytará','Tambo');
insert into ubigeo (departamento, provincia, distrito) values ('Huancavelica','Tayacaja','Pampas');
insert into ubigeo (departamento, provincia, distrito) values ('Huancavelica','Tayacaja','Acostambo');
insert into ubigeo (departamento, provincia, distrito) values ('Huancavelica','Tayacaja','Acraquia');
insert into ubigeo (departamento, provincia, distrito) values ('Huancavelica','Tayacaja','Ahuaycha');
insert into ubigeo (departamento, provincia, distrito) values ('Huancavelica','Tayacaja','Colcabamba');
insert into ubigeo (departamento, provincia, distrito) values ('Huancavelica','Tayacaja','Daniel Hernández');
insert into ubigeo (departamento, provincia, distrito) values ('Huancavelica','Tayacaja','Huachocolpa');
insert into ubigeo (departamento, provincia, distrito) values ('Huancavelica','Tayacaja','Huaribamba');
insert into ubigeo (departamento, provincia, distrito) values ('Huancavelica','Tayacaja','Ñahuimpuquio');
insert into ubigeo (departamento, provincia, distrito) values ('Huancavelica','Tayacaja','Pazos');
insert into ubigeo (departamento, provincia, distrito) values ('Huancavelica','Tayacaja','Quishuar');
insert into ubigeo (departamento, provincia, distrito) values ('Huancavelica','Tayacaja','Salcabamba');
insert into ubigeo (departamento, provincia, distrito) values ('Huancavelica','Tayacaja','Salcahuasi');
insert into ubigeo (departamento, provincia, distrito) values ('Huancavelica','Tayacaja','San Marcos de Rocchac');
insert into ubigeo (departamento, provincia, distrito) values ('Huancavelica','Tayacaja','Surcubamba');
insert into ubigeo (departamento, provincia, distrito) values ('Huancavelica','Tayacaja','Tintay Puncu');
insert into ubigeo (departamento, provincia, distrito) values ('Huancavelica','Tayacaja','Quichuas');
insert into ubigeo (departamento, provincia, distrito) values ('Huancavelica','Tayacaja','Andaymarca');
insert into ubigeo (departamento, provincia, distrito) values ('Huancavelica','Tayacaja','Roble');
insert into ubigeo (departamento, provincia, distrito) values ('Huancavelica','Tayacaja','Pichos');
insert into ubigeo (departamento, provincia, distrito) values ('Huancavelica','Tayacaja','Santiago de Tucuma');
insert into ubigeo (departamento, provincia, distrito) values ('Huánuco','Huánuco','Huanuco');
insert into ubigeo (departamento, provincia, distrito) values ('Huánuco','Huánuco','Amarilis');
insert into ubigeo (departamento, provincia, distrito) values ('Huánuco','Huánuco','Chinchao');
insert into ubigeo (departamento, provincia, distrito) values ('Huánuco','Huánuco','Churubamba');
insert into ubigeo (departamento, provincia, distrito) values ('Huánuco','Huánuco','Margos');
insert into ubigeo (departamento, provincia, distrito) values ('Huánuco','Huánuco','Quisqui (Kichki)');
insert into ubigeo (departamento, provincia, distrito) values ('Huánuco','Huánuco','San Francisco de Cayran');
insert into ubigeo (departamento, provincia, distrito) values ('Huánuco','Huánuco','San Pedro de Chaulan');
insert into ubigeo (departamento, provincia, distrito) values ('Huánuco','Huánuco','Santa María del Valle');
insert into ubigeo (departamento, provincia, distrito) values ('Huánuco','Huánuco','Yarumayo');
insert into ubigeo (departamento, provincia, distrito) values ('Huánuco','Huánuco','Pillco Marca');
insert into ubigeo (departamento, provincia, distrito) values ('Huánuco','Huánuco','Yacus');
insert into ubigeo (departamento, provincia, distrito) values ('Huánuco','Huánuco','San Pablo de Pillao');
insert into ubigeo (departamento, provincia, distrito) values ('Huánuco','Ambo','Ambo');
insert into ubigeo (departamento, provincia, distrito) values ('Huánuco','Ambo','Cayna');
insert into ubigeo (departamento, provincia, distrito) values ('Huánuco','Ambo','Colpas');
insert into ubigeo (departamento, provincia, distrito) values ('Huánuco','Ambo','Conchamarca');
insert into ubigeo (departamento, provincia, distrito) values ('Huánuco','Ambo','Huacar');
insert into ubigeo (departamento, provincia, distrito) values ('Huánuco','Ambo','San Francisco');
insert into ubigeo (departamento, provincia, distrito) values ('Huánuco','Ambo','San Rafael');
insert into ubigeo (departamento, provincia, distrito) values ('Huánuco','Ambo','Tomay Kichwa');
insert into ubigeo (departamento, provincia, distrito) values ('Huánuco','Dos de Mayo','La Unión');
insert into ubigeo (departamento, provincia, distrito) values ('Huánuco','Dos de Mayo','Chuquis');
insert into ubigeo (departamento, provincia, distrito) values ('Huánuco','Dos de Mayo','Marías');
insert into ubigeo (departamento, provincia, distrito) values ('Huánuco','Dos de Mayo','Pachas');
insert into ubigeo (departamento, provincia, distrito) values ('Huánuco','Dos de Mayo','Quivilla');
insert into ubigeo (departamento, provincia, distrito) values ('Huánuco','Dos de Mayo','Ripan');
insert into ubigeo (departamento, provincia, distrito) values ('Huánuco','Dos de Mayo','Shunqui');
insert into ubigeo (departamento, provincia, distrito) values ('Huánuco','Dos de Mayo','Sillapata');
insert into ubigeo (departamento, provincia, distrito) values ('Huánuco','Dos de Mayo','Yanas');
insert into ubigeo (departamento, provincia, distrito) values ('Huánuco','Huacaybamba','Huacaybamba');
insert into ubigeo (departamento, provincia, distrito) values ('Huánuco','Huacaybamba','Canchabamba');
insert into ubigeo (departamento, provincia, distrito) values ('Huánuco','Huacaybamba','Cochabamba');
insert into ubigeo (departamento, provincia, distrito) values ('Huánuco','Huacaybamba','Pinra');
insert into ubigeo (departamento, provincia, distrito) values ('Huánuco','Huamalíes','Llata');
insert into ubigeo (departamento, provincia, distrito) values ('Huánuco','Huamalíes','Arancay');
insert into ubigeo (departamento, provincia, distrito) values ('Huánuco','Huamalíes','Chavín de Pariarca');
insert into ubigeo (departamento, provincia, distrito) values ('Huánuco','Huamalíes','Jacas Grande');
insert into ubigeo (departamento, provincia, distrito) values ('Huánuco','Huamalíes','Jircan');
insert into ubigeo (departamento, provincia, distrito) values ('Huánuco','Huamalíes','Miraflores');
insert into ubigeo (departamento, provincia, distrito) values ('Huánuco','Huamalíes','Monzón');
insert into ubigeo (departamento, provincia, distrito) values ('Huánuco','Huamalíes','Punchao');
insert into ubigeo (departamento, provincia, distrito) values ('Huánuco','Huamalíes','Puños');
insert into ubigeo (departamento, provincia, distrito) values ('Huánuco','Huamalíes','Singa');
insert into ubigeo (departamento, provincia, distrito) values ('Huánuco','Huamalíes','Tantamayo');
insert into ubigeo (departamento, provincia, distrito) values ('Huánuco','Leoncio Prado','Rupa-Rupa');
insert into ubigeo (departamento, provincia, distrito) values ('Huánuco','Leoncio Prado','Daniel Alomía Robles');
insert into ubigeo (departamento, provincia, distrito) values ('Huánuco','Leoncio Prado','Hermílio Valdizan');
insert into ubigeo (departamento, provincia, distrito) values ('Huánuco','Leoncio Prado','José Crespo y Castillo');
insert into ubigeo (departamento, provincia, distrito) values ('Huánuco','Leoncio Prado','Luyando');
insert into ubigeo (departamento, provincia, distrito) values ('Huánuco','Leoncio Prado','Mariano Damaso Beraun');
insert into ubigeo (departamento, provincia, distrito) values ('Huánuco','Leoncio Prado','Pucayacu');
insert into ubigeo (departamento, provincia, distrito) values ('Huánuco','Leoncio Prado','Castillo Grande');
insert into ubigeo (departamento, provincia, distrito) values ('Huánuco','Leoncio Prado','Pueblo Nuevo');
insert into ubigeo (departamento, provincia, distrito) values ('Huánuco','Leoncio Prado','Santo Domingo de Anda');
insert into ubigeo (departamento, provincia, distrito) values ('Huánuco','Marañón','Huacrachuco');
insert into ubigeo (departamento, provincia, distrito) values ('Huánuco','Marañón','Cholon');
insert into ubigeo (departamento, provincia, distrito) values ('Huánuco','Marañón','San Buenaventura');
insert into ubigeo (departamento, provincia, distrito) values ('Huánuco','Marañón','La Morada');
insert into ubigeo (departamento, provincia, distrito) values ('Huánuco','Marañón','Santa Rosa de Alto Yanajanca');
insert into ubigeo (departamento, provincia, distrito) values ('Huánuco','Pachitea','Panao');
insert into ubigeo (departamento, provincia, distrito) values ('Huánuco','Pachitea','Chaglla');
insert into ubigeo (departamento, provincia, distrito) values ('Huánuco','Pachitea','Molino');
insert into ubigeo (departamento, provincia, distrito) values ('Huánuco','Pachitea','Umari');
insert into ubigeo (departamento, provincia, distrito) values ('Huánuco','Puerto Inca','Puerto Inca');
insert into ubigeo (departamento, provincia, distrito) values ('Huánuco','Puerto Inca','Codo del Pozuzo');
insert into ubigeo (departamento, provincia, distrito) values ('Huánuco','Puerto Inca','Honoria');
insert into ubigeo (departamento, provincia, distrito) values ('Huánuco','Puerto Inca','Tournavista');
insert into ubigeo (departamento, provincia, distrito) values ('Huánuco','Puerto Inca','Yuyapichis');
insert into ubigeo (departamento, provincia, distrito) values ('Huánuco','Lauricocha','Jesús');
insert into ubigeo (departamento, provincia, distrito) values ('Huánuco','Lauricocha','Baños');
insert into ubigeo (departamento, provincia, distrito) values ('Huánuco','Lauricocha','Jivia');
insert into ubigeo (departamento, provincia, distrito) values ('Huánuco','Lauricocha','Queropalca');
insert into ubigeo (departamento, provincia, distrito) values ('Huánuco','Lauricocha','Rondos');
insert into ubigeo (departamento, provincia, distrito) values ('Huánuco','Lauricocha','San Francisco de Asís');
insert into ubigeo (departamento, provincia, distrito) values ('Huánuco','Lauricocha','San Miguel de Cauri');
insert into ubigeo (departamento, provincia, distrito) values ('Huánuco','Yarowilca','Chavinillo');
insert into ubigeo (departamento, provincia, distrito) values ('Huánuco','Yarowilca','Cahuac');
insert into ubigeo (departamento, provincia, distrito) values ('Huánuco','Yarowilca','Chacabamba');
insert into ubigeo (departamento, provincia, distrito) values ('Huánuco','Yarowilca','Aparicio Pomares');
insert into ubigeo (departamento, provincia, distrito) values ('Huánuco','Yarowilca','Jacas Chico');
insert into ubigeo (departamento, provincia, distrito) values ('Huánuco','Yarowilca','Obas');
insert into ubigeo (departamento, provincia, distrito) values ('Huánuco','Yarowilca','Pampamarca');
insert into ubigeo (departamento, provincia, distrito) values ('Huánuco','Yarowilca','Choras');
insert into ubigeo (departamento, provincia, distrito) values ('Ica','Ica','Ica');
insert into ubigeo (departamento, provincia, distrito) values ('Ica','Ica','La Tinguiña');
insert into ubigeo (departamento, provincia, distrito) values ('Ica','Ica','Los Aquijes');
insert into ubigeo (departamento, provincia, distrito) values ('Ica','Ica','Ocucaje');
insert into ubigeo (departamento, provincia, distrito) values ('Ica','Ica','Pachacutec');
insert into ubigeo (departamento, provincia, distrito) values ('Ica','Ica','Parcona');
insert into ubigeo (departamento, provincia, distrito) values ('Ica','Ica','Pueblo Nuevo');
insert into ubigeo (departamento, provincia, distrito) values ('Ica','Ica','Salas');
insert into ubigeo (departamento, provincia, distrito) values ('Ica','Ica','San José de Los Molinos');
insert into ubigeo (departamento, provincia, distrito) values ('Ica','Ica','San Juan Bautista');
insert into ubigeo (departamento, provincia, distrito) values ('Ica','Ica','Santiago');
insert into ubigeo (departamento, provincia, distrito) values ('Ica','Ica','Subtanjalla');
insert into ubigeo (departamento, provincia, distrito) values ('Ica','Ica','Tate');
insert into ubigeo (departamento, provincia, distrito) values ('Ica','Ica','Yauca del Rosario');
insert into ubigeo (departamento, provincia, distrito) values ('Ica','Chincha','Chincha Alta');
insert into ubigeo (departamento, provincia, distrito) values ('Ica','Chincha','Alto Laran');
insert into ubigeo (departamento, provincia, distrito) values ('Ica','Chincha','Chavin');
insert into ubigeo (departamento, provincia, distrito) values ('Ica','Chincha','Chincha Baja');
insert into ubigeo (departamento, provincia, distrito) values ('Ica','Chincha','El Carmen');
insert into ubigeo (departamento, provincia, distrito) values ('Ica','Chincha','Grocio Prado');
insert into ubigeo (departamento, provincia, distrito) values ('Ica','Chincha','Pueblo Nuevo');
insert into ubigeo (departamento, provincia, distrito) values ('Ica','Chincha','San Juan de Yanac');
insert into ubigeo (departamento, provincia, distrito) values ('Ica','Chincha','San Pedro de Huacarpana');
insert into ubigeo (departamento, provincia, distrito) values ('Ica','Chincha','Sunampe');
insert into ubigeo (departamento, provincia, distrito) values ('Ica','Chincha','Tambo de Mora');
insert into ubigeo (departamento, provincia, distrito) values ('Ica','Nasca','Nasca');
insert into ubigeo (departamento, provincia, distrito) values ('Ica','Nasca','Changuillo');
insert into ubigeo (departamento, provincia, distrito) values ('Ica','Nasca','El Ingenio');
insert into ubigeo (departamento, provincia, distrito) values ('Ica','Nasca','Marcona');
insert into ubigeo (departamento, provincia, distrito) values ('Ica','Nasca','Vista Alegre');
insert into ubigeo (departamento, provincia, distrito) values ('Ica','Palpa','Palpa');
insert into ubigeo (departamento, provincia, distrito) values ('Ica','Palpa','Llipata');
insert into ubigeo (departamento, provincia, distrito) values ('Ica','Palpa','Río Grande');
insert into ubigeo (departamento, provincia, distrito) values ('Ica','Palpa','Santa Cruz');
insert into ubigeo (departamento, provincia, distrito) values ('Ica','Palpa','Tibillo');
insert into ubigeo (departamento, provincia, distrito) values ('Ica','Pisco','Pisco');
insert into ubigeo (departamento, provincia, distrito) values ('Ica','Pisco','Huancano');
insert into ubigeo (departamento, provincia, distrito) values ('Ica','Pisco','Humay');
insert into ubigeo (departamento, provincia, distrito) values ('Ica','Pisco','Independencia');
insert into ubigeo (departamento, provincia, distrito) values ('Ica','Pisco','Paracas');
insert into ubigeo (departamento, provincia, distrito) values ('Ica','Pisco','San Andrés');
insert into ubigeo (departamento, provincia, distrito) values ('Ica','Pisco','San Clemente');
insert into ubigeo (departamento, provincia, distrito) values ('Ica','Pisco','Tupac Amaru Inca');
insert into ubigeo (departamento, provincia, distrito) values ('Junín','Huancayo','Huancayo');
insert into ubigeo (departamento, provincia, distrito) values ('Junín','Huancayo','Carhuacallanga');
insert into ubigeo (departamento, provincia, distrito) values ('Junín','Huancayo','Chacapampa');
insert into ubigeo (departamento, provincia, distrito) values ('Junín','Huancayo','Chicche');
insert into ubigeo (departamento, provincia, distrito) values ('Junín','Huancayo','Chilca');
insert into ubigeo (departamento, provincia, distrito) values ('Junín','Huancayo','Chongos Alto');
insert into ubigeo (departamento, provincia, distrito) values ('Junín','Huancayo','Chupuro');
insert into ubigeo (departamento, provincia, distrito) values ('Junín','Huancayo','Colca');
insert into ubigeo (departamento, provincia, distrito) values ('Junín','Huancayo','Cullhuas');
insert into ubigeo (departamento, provincia, distrito) values ('Junín','Huancayo','El Tambo');
insert into ubigeo (departamento, provincia, distrito) values ('Junín','Huancayo','Huacrapuquio');
insert into ubigeo (departamento, provincia, distrito) values ('Junín','Huancayo','Hualhuas');
insert into ubigeo (departamento, provincia, distrito) values ('Junín','Huancayo','Huancan');
insert into ubigeo (departamento, provincia, distrito) values ('Junín','Huancayo','Huasicancha');
insert into ubigeo (departamento, provincia, distrito) values ('Junín','Huancayo','Huayucachi');
insert into ubigeo (departamento, provincia, distrito) values ('Junín','Huancayo','Ingenio');
insert into ubigeo (departamento, provincia, distrito) values ('Junín','Huancayo','Pariahuanca');
insert into ubigeo (departamento, provincia, distrito) values ('Junín','Huancayo','Pilcomayo');
insert into ubigeo (departamento, provincia, distrito) values ('Junín','Huancayo','Pucara');
insert into ubigeo (departamento, provincia, distrito) values ('Junín','Huancayo','Quichuay');
insert into ubigeo (departamento, provincia, distrito) values ('Junín','Huancayo','Quilcas');
insert into ubigeo (departamento, provincia, distrito) values ('Junín','Huancayo','San Agustín');
insert into ubigeo (departamento, provincia, distrito) values ('Junín','Huancayo','San Jerónimo de Tunan');
insert into ubigeo (departamento, provincia, distrito) values ('Junín','Huancayo','Saño');
insert into ubigeo (departamento, provincia, distrito) values ('Junín','Huancayo','Sapallanga');
insert into ubigeo (departamento, provincia, distrito) values ('Junín','Huancayo','Sicaya');
insert into ubigeo (departamento, provincia, distrito) values ('Junín','Huancayo','Santo Domingo de Acobamba');
insert into ubigeo (departamento, provincia, distrito) values ('Junín','Huancayo','Viques');
insert into ubigeo (departamento, provincia, distrito) values ('Junín','Concepción','Concepción');
insert into ubigeo (departamento, provincia, distrito) values ('Junín','Concepción','Aco');
insert into ubigeo (departamento, provincia, distrito) values ('Junín','Concepción','Andamarca');
insert into ubigeo (departamento, provincia, distrito) values ('Junín','Concepción','Chambara');
insert into ubigeo (departamento, provincia, distrito) values ('Junín','Concepción','Cochas');
insert into ubigeo (departamento, provincia, distrito) values ('Junín','Concepción','Comas');
insert into ubigeo (departamento, provincia, distrito) values ('Junín','Concepción','Heroínas Toledo');
insert into ubigeo (departamento, provincia, distrito) values ('Junín','Concepción','Manzanares');
insert into ubigeo (departamento, provincia, distrito) values ('Junín','Concepción','Mariscal Castilla');
insert into ubigeo (departamento, provincia, distrito) values ('Junín','Concepción','Matahuasi');
insert into ubigeo (departamento, provincia, distrito) values ('Junín','Concepción','Mito');
insert into ubigeo (departamento, provincia, distrito) values ('Junín','Concepción','Nueve de Julio');
insert into ubigeo (departamento, provincia, distrito) values ('Junín','Concepción','Orcotuna');
insert into ubigeo (departamento, provincia, distrito) values ('Junín','Concepción','San José de Quero');
insert into ubigeo (departamento, provincia, distrito) values ('Junín','Concepción','Santa Rosa de Ocopa');
insert into ubigeo (departamento, provincia, distrito) values ('Junín','Chanchamayo','Chanchamayo');
insert into ubigeo (departamento, provincia, distrito) values ('Junín','Chanchamayo','Perene');
insert into ubigeo (departamento, provincia, distrito) values ('Junín','Chanchamayo','Pichanaqui');
insert into ubigeo (departamento, provincia, distrito) values ('Junín','Chanchamayo','San Luis de Shuaro');
insert into ubigeo (departamento, provincia, distrito) values ('Junín','Chanchamayo','San Ramón');
insert into ubigeo (departamento, provincia, distrito) values ('Junín','Chanchamayo','Vitoc');
insert into ubigeo (departamento, provincia, distrito) values ('Junín','Jauja','Jauja');
insert into ubigeo (departamento, provincia, distrito) values ('Junín','Jauja','Acolla');
insert into ubigeo (departamento, provincia, distrito) values ('Junín','Jauja','Apata');
insert into ubigeo (departamento, provincia, distrito) values ('Junín','Jauja','Ataura');
insert into ubigeo (departamento, provincia, distrito) values ('Junín','Jauja','Canchayllo');
insert into ubigeo (departamento, provincia, distrito) values ('Junín','Jauja','Curicaca');
insert into ubigeo (departamento, provincia, distrito) values ('Junín','Jauja','El Mantaro');
insert into ubigeo (departamento, provincia, distrito) values ('Junín','Jauja','Huamali');
insert into ubigeo (departamento, provincia, distrito) values ('Junín','Jauja','Huaripampa');
insert into ubigeo (departamento, provincia, distrito) values ('Junín','Jauja','Huertas');
insert into ubigeo (departamento, provincia, distrito) values ('Junín','Jauja','Janjaillo');
insert into ubigeo (departamento, provincia, distrito) values ('Junín','Jauja','Julcán');
insert into ubigeo (departamento, provincia, distrito) values ('Junín','Jauja','Leonor Ordóñez');
insert into ubigeo (departamento, provincia, distrito) values ('Junín','Jauja','Llocllapampa');
insert into ubigeo (departamento, provincia, distrito) values ('Junín','Jauja','Marco');
insert into ubigeo (departamento, provincia, distrito) values ('Junín','Jauja','Masma');
insert into ubigeo (departamento, provincia, distrito) values ('Junín','Jauja','Masma Chicche');
insert into ubigeo (departamento, provincia, distrito) values ('Junín','Jauja','Molinos');
insert into ubigeo (departamento, provincia, distrito) values ('Junín','Jauja','Monobamba');
insert into ubigeo (departamento, provincia, distrito) values ('Junín','Jauja','Muqui');
insert into ubigeo (departamento, provincia, distrito) values ('Junín','Jauja','Muquiyauyo');
insert into ubigeo (departamento, provincia, distrito) values ('Junín','Jauja','Paca');
insert into ubigeo (departamento, provincia, distrito) values ('Junín','Jauja','Paccha');
insert into ubigeo (departamento, provincia, distrito) values ('Junín','Jauja','Pancan');
insert into ubigeo (departamento, provincia, distrito) values ('Junín','Jauja','Parco');
insert into ubigeo (departamento, provincia, distrito) values ('Junín','Jauja','Pomacancha');
insert into ubigeo (departamento, provincia, distrito) values ('Junín','Jauja','Ricran');
insert into ubigeo (departamento, provincia, distrito) values ('Junín','Jauja','San Lorenzo');
insert into ubigeo (departamento, provincia, distrito) values ('Junín','Jauja','San Pedro de Chunan');
insert into ubigeo (departamento, provincia, distrito) values ('Junín','Jauja','Sausa');
insert into ubigeo (departamento, provincia, distrito) values ('Junín','Jauja','Sincos');
insert into ubigeo (departamento, provincia, distrito) values ('Junín','Jauja','Tunan Marca');
insert into ubigeo (departamento, provincia, distrito) values ('Junín','Jauja','Yauli');
insert into ubigeo (departamento, provincia, distrito) values ('Junín','Jauja','Yauyos');
insert into ubigeo (departamento, provincia, distrito) values ('Junín','Junín','Junin');
insert into ubigeo (departamento, provincia, distrito) values ('Junín','Junín','Carhuamayo');
insert into ubigeo (departamento, provincia, distrito) values ('Junín','Junín','Ondores');
insert into ubigeo (departamento, provincia, distrito) values ('Junín','Junín','Ulcumayo');
insert into ubigeo (departamento, provincia, distrito) values ('Junín','Satipo','Satipo');
insert into ubigeo (departamento, provincia, distrito) values ('Junín','Satipo','Coviriali');
insert into ubigeo (departamento, provincia, distrito) values ('Junín','Satipo','Llaylla');
insert into ubigeo (departamento, provincia, distrito) values ('Junín','Satipo','Mazamari');
insert into ubigeo (departamento, provincia, distrito) values ('Junín','Satipo','Pampa Hermosa');
insert into ubigeo (departamento, provincia, distrito) values ('Junín','Satipo','Pangoa');
insert into ubigeo (departamento, provincia, distrito) values ('Junín','Satipo','Río Negro');
insert into ubigeo (departamento, provincia, distrito) values ('Junín','Satipo','Río Tambo');
insert into ubigeo (departamento, provincia, distrito) values ('Junín','Satipo','Vizcatan del Ene');
insert into ubigeo (departamento, provincia, distrito) values ('Junín','Tarma','Tarma');
insert into ubigeo (departamento, provincia, distrito) values ('Junín','Tarma','Acobamba');
insert into ubigeo (departamento, provincia, distrito) values ('Junín','Tarma','Huaricolca');
insert into ubigeo (departamento, provincia, distrito) values ('Junín','Tarma','Huasahuasi');
insert into ubigeo (departamento, provincia, distrito) values ('Junín','Tarma','La Unión');
insert into ubigeo (departamento, provincia, distrito) values ('Junín','Tarma','Palca');
insert into ubigeo (departamento, provincia, distrito) values ('Junín','Tarma','Palcamayo');
insert into ubigeo (departamento, provincia, distrito) values ('Junín','Tarma','San Pedro de Cajas');
insert into ubigeo (departamento, provincia, distrito) values ('Junín','Tarma','Tapo');
insert into ubigeo (departamento, provincia, distrito) values ('Junín','Yauli','La Oroya');
insert into ubigeo (departamento, provincia, distrito) values ('Junín','Yauli','Chacapalpa');
insert into ubigeo (departamento, provincia, distrito) values ('Junín','Yauli','Huay-Huay');
insert into ubigeo (departamento, provincia, distrito) values ('Junín','Yauli','Marcapomacocha');
insert into ubigeo (departamento, provincia, distrito) values ('Junín','Yauli','Morococha');
insert into ubigeo (departamento, provincia, distrito) values ('Junín','Yauli','Paccha');
insert into ubigeo (departamento, provincia, distrito) values ('Junín','Yauli','Santa Bárbara de Carhuacayan');
insert into ubigeo (departamento, provincia, distrito) values ('Junín','Yauli','Santa Rosa de Sacco');
insert into ubigeo (departamento, provincia, distrito) values ('Junín','Yauli','Suitucancha');
insert into ubigeo (departamento, provincia, distrito) values ('Junín','Yauli','Yauli');
insert into ubigeo (departamento, provincia, distrito) values ('Junín','Chupaca','Chupaca');
insert into ubigeo (departamento, provincia, distrito) values ('Junín','Chupaca','Ahuac');
insert into ubigeo (departamento, provincia, distrito) values ('Junín','Chupaca','Chongos Bajo');
insert into ubigeo (departamento, provincia, distrito) values ('Junín','Chupaca','Huachac');
insert into ubigeo (departamento, provincia, distrito) values ('Junín','Chupaca','Huamancaca Chico');
insert into ubigeo (departamento, provincia, distrito) values ('Junín','Chupaca','San Juan de Iscos');
insert into ubigeo (departamento, provincia, distrito) values ('Junín','Chupaca','San Juan de Jarpa');
insert into ubigeo (departamento, provincia, distrito) values ('Junín','Chupaca','Tres de Diciembre');
insert into ubigeo (departamento, provincia, distrito) values ('Junín','Chupaca','Yanacancha');
insert into ubigeo (departamento, provincia, distrito) values ('La Libertad','Trujillo','Trujillo');
insert into ubigeo (departamento, provincia, distrito) values ('La Libertad','Trujillo','El Porvenir');
insert into ubigeo (departamento, provincia, distrito) values ('La Libertad','Trujillo','Florencia de Mora');
insert into ubigeo (departamento, provincia, distrito) values ('La Libertad','Trujillo','Huanchaco');
insert into ubigeo (departamento, provincia, distrito) values ('La Libertad','Trujillo','La Esperanza');
insert into ubigeo (departamento, provincia, distrito) values ('La Libertad','Trujillo','Laredo');
insert into ubigeo (departamento, provincia, distrito) values ('La Libertad','Trujillo','Moche');
insert into ubigeo (departamento, provincia, distrito) values ('La Libertad','Trujillo','Poroto');
insert into ubigeo (departamento, provincia, distrito) values ('La Libertad','Trujillo','Salaverry');
insert into ubigeo (departamento, provincia, distrito) values ('La Libertad','Trujillo','Simbal');
insert into ubigeo (departamento, provincia, distrito) values ('La Libertad','Trujillo','Victor Larco Herrera');
insert into ubigeo (departamento, provincia, distrito) values ('La Libertad','Ascope','Ascope');
insert into ubigeo (departamento, provincia, distrito) values ('La Libertad','Ascope','Chicama');
insert into ubigeo (departamento, provincia, distrito) values ('La Libertad','Ascope','Chocope');
insert into ubigeo (departamento, provincia, distrito) values ('La Libertad','Ascope','Magdalena de Cao');
insert into ubigeo (departamento, provincia, distrito) values ('La Libertad','Ascope','Paijan');
insert into ubigeo (departamento, provincia, distrito) values ('La Libertad','Ascope','Rázuri');
insert into ubigeo (departamento, provincia, distrito) values ('La Libertad','Ascope','Santiago de Cao');
insert into ubigeo (departamento, provincia, distrito) values ('La Libertad','Ascope','Casa Grande');
insert into ubigeo (departamento, provincia, distrito) values ('La Libertad','Bolívar','Bolívar');
insert into ubigeo (departamento, provincia, distrito) values ('La Libertad','Bolívar','Bambamarca');
insert into ubigeo (departamento, provincia, distrito) values ('La Libertad','Bolívar','Condormarca');
insert into ubigeo (departamento, provincia, distrito) values ('La Libertad','Bolívar','Longotea');
insert into ubigeo (departamento, provincia, distrito) values ('La Libertad','Bolívar','Uchumarca');
insert into ubigeo (departamento, provincia, distrito) values ('La Libertad','Bolívar','Ucuncha');
insert into ubigeo (departamento, provincia, distrito) values ('La Libertad','Chepén','Chepen');
insert into ubigeo (departamento, provincia, distrito) values ('La Libertad','Chepén','Pacanga');
insert into ubigeo (departamento, provincia, distrito) values ('La Libertad','Chepén','Pueblo Nuevo');
insert into ubigeo (departamento, provincia, distrito) values ('La Libertad','Julcán','Julcan');
insert into ubigeo (departamento, provincia, distrito) values ('La Libertad','Julcán','Calamarca');
insert into ubigeo (departamento, provincia, distrito) values ('La Libertad','Julcán','Carabamba');
insert into ubigeo (departamento, provincia, distrito) values ('La Libertad','Julcán','Huaso');
insert into ubigeo (departamento, provincia, distrito) values ('La Libertad','Otuzco','Otuzco');
insert into ubigeo (departamento, provincia, distrito) values ('La Libertad','Otuzco','Agallpampa');
insert into ubigeo (departamento, provincia, distrito) values ('La Libertad','Otuzco','Charat');
insert into ubigeo (departamento, provincia, distrito) values ('La Libertad','Otuzco','Huaranchal');
insert into ubigeo (departamento, provincia, distrito) values ('La Libertad','Otuzco','La Cuesta');
insert into ubigeo (departamento, provincia, distrito) values ('La Libertad','Otuzco','Mache');
insert into ubigeo (departamento, provincia, distrito) values ('La Libertad','Otuzco','Paranday');
insert into ubigeo (departamento, provincia, distrito) values ('La Libertad','Otuzco','Salpo');
insert into ubigeo (departamento, provincia, distrito) values ('La Libertad','Otuzco','Sinsicap');
insert into ubigeo (departamento, provincia, distrito) values ('La Libertad','Otuzco','Usquil');
insert into ubigeo (departamento, provincia, distrito) values ('La Libertad','Pacasmayo','San Pedro de Lloc');
insert into ubigeo (departamento, provincia, distrito) values ('La Libertad','Pacasmayo','Guadalupe');
insert into ubigeo (departamento, provincia, distrito) values ('La Libertad','Pacasmayo','Jequetepeque');
insert into ubigeo (departamento, provincia, distrito) values ('La Libertad','Pacasmayo','Pacasmayo');
insert into ubigeo (departamento, provincia, distrito) values ('La Libertad','Pacasmayo','San José');
insert into ubigeo (departamento, provincia, distrito) values ('La Libertad','Pataz','Tayabamba');
insert into ubigeo (departamento, provincia, distrito) values ('La Libertad','Pataz','Buldibuyo');
insert into ubigeo (departamento, provincia, distrito) values ('La Libertad','Pataz','Chillia');
insert into ubigeo (departamento, provincia, distrito) values ('La Libertad','Pataz','Huancaspata');
insert into ubigeo (departamento, provincia, distrito) values ('La Libertad','Pataz','Huaylillas');
insert into ubigeo (departamento, provincia, distrito) values ('La Libertad','Pataz','Huayo');
insert into ubigeo (departamento, provincia, distrito) values ('La Libertad','Pataz','Ongon');
insert into ubigeo (departamento, provincia, distrito) values ('La Libertad','Pataz','Parcoy');
insert into ubigeo (departamento, provincia, distrito) values ('La Libertad','Pataz','Pataz');
insert into ubigeo (departamento, provincia, distrito) values ('La Libertad','Pataz','Pias');
insert into ubigeo (departamento, provincia, distrito) values ('La Libertad','Pataz','Santiago de Challas');
insert into ubigeo (departamento, provincia, distrito) values ('La Libertad','Pataz','Taurija');
insert into ubigeo (departamento, provincia, distrito) values ('La Libertad','Pataz','Urpay');
insert into ubigeo (departamento, provincia, distrito) values ('La Libertad','Sánchez Carrión','Huamachuco');
insert into ubigeo (departamento, provincia, distrito) values ('La Libertad','Sánchez Carrión','Chugay');
insert into ubigeo (departamento, provincia, distrito) values ('La Libertad','Sánchez Carrión','Cochorco');
insert into ubigeo (departamento, provincia, distrito) values ('La Libertad','Sánchez Carrión','Curgos');
insert into ubigeo (departamento, provincia, distrito) values ('La Libertad','Sánchez Carrión','Marcabal');
insert into ubigeo (departamento, provincia, distrito) values ('La Libertad','Sánchez Carrión','Sanagoran');
insert into ubigeo (departamento, provincia, distrito) values ('La Libertad','Sánchez Carrión','Sarin');
insert into ubigeo (departamento, provincia, distrito) values ('La Libertad','Sánchez Carrión','Sartimbamba');
insert into ubigeo (departamento, provincia, distrito) values ('La Libertad','Santiago de Chuco','Santiago de Chuco');
insert into ubigeo (departamento, provincia, distrito) values ('La Libertad','Santiago de Chuco','Angasmarca');
insert into ubigeo (departamento, provincia, distrito) values ('La Libertad','Santiago de Chuco','Cachicadan');
insert into ubigeo (departamento, provincia, distrito) values ('La Libertad','Santiago de Chuco','Mollebamba');
insert into ubigeo (departamento, provincia, distrito) values ('La Libertad','Santiago de Chuco','Mollepata');
insert into ubigeo (departamento, provincia, distrito) values ('La Libertad','Santiago de Chuco','Quiruvilca');
insert into ubigeo (departamento, provincia, distrito) values ('La Libertad','Santiago de Chuco','Santa Cruz de Chuca');
insert into ubigeo (departamento, provincia, distrito) values ('La Libertad','Santiago de Chuco','Sitabamba');
insert into ubigeo (departamento, provincia, distrito) values ('La Libertad','Gran Chimú','Cascas');
insert into ubigeo (departamento, provincia, distrito) values ('La Libertad','Gran Chimú','Lucma');
insert into ubigeo (departamento, provincia, distrito) values ('La Libertad','Gran Chimú','Marmot');
insert into ubigeo (departamento, provincia, distrito) values ('La Libertad','Gran Chimú','Sayapullo');
insert into ubigeo (departamento, provincia, distrito) values ('La Libertad','Virú','Viru');
insert into ubigeo (departamento, provincia, distrito) values ('La Libertad','Virú','Chao');
insert into ubigeo (departamento, provincia, distrito) values ('La Libertad','Virú','Guadalupito');
insert into ubigeo (departamento, provincia, distrito) values ('Lambayeque','Chiclayo','Chiclayo');
insert into ubigeo (departamento, provincia, distrito) values ('Lambayeque','Chiclayo','Chongoyape');
insert into ubigeo (departamento, provincia, distrito) values ('Lambayeque','Chiclayo','Eten');
insert into ubigeo (departamento, provincia, distrito) values ('Lambayeque','Chiclayo','Eten Puerto');
insert into ubigeo (departamento, provincia, distrito) values ('Lambayeque','Chiclayo','José Leonardo Ortiz');
insert into ubigeo (departamento, provincia, distrito) values ('Lambayeque','Chiclayo','La Victoria');
insert into ubigeo (departamento, provincia, distrito) values ('Lambayeque','Chiclayo','Lagunas');
insert into ubigeo (departamento, provincia, distrito) values ('Lambayeque','Chiclayo','Monsefu');
insert into ubigeo (departamento, provincia, distrito) values ('Lambayeque','Chiclayo','Nueva Arica');
insert into ubigeo (departamento, provincia, distrito) values ('Lambayeque','Chiclayo','Oyotun');
insert into ubigeo (departamento, provincia, distrito) values ('Lambayeque','Chiclayo','Picsi');
insert into ubigeo (departamento, provincia, distrito) values ('Lambayeque','Chiclayo','Pimentel');
insert into ubigeo (departamento, provincia, distrito) values ('Lambayeque','Chiclayo','Reque');
insert into ubigeo (departamento, provincia, distrito) values ('Lambayeque','Chiclayo','Santa Rosa');
insert into ubigeo (departamento, provincia, distrito) values ('Lambayeque','Chiclayo','Saña');
insert into ubigeo (departamento, provincia, distrito) values ('Lambayeque','Chiclayo','Cayalti');
insert into ubigeo (departamento, provincia, distrito) values ('Lambayeque','Chiclayo','Patapo');
insert into ubigeo (departamento, provincia, distrito) values ('Lambayeque','Chiclayo','Pomalca');
insert into ubigeo (departamento, provincia, distrito) values ('Lambayeque','Chiclayo','Pucala');
insert into ubigeo (departamento, provincia, distrito) values ('Lambayeque','Chiclayo','Tuman');
insert into ubigeo (departamento, provincia, distrito) values ('Lambayeque','Ferreñafe','Ferreñafe');
insert into ubigeo (departamento, provincia, distrito) values ('Lambayeque','Ferreñafe','Cañaris');
insert into ubigeo (departamento, provincia, distrito) values ('Lambayeque','Ferreñafe','Incahuasi');
insert into ubigeo (departamento, provincia, distrito) values ('Lambayeque','Ferreñafe','Manuel Antonio Mesones Muro');
insert into ubigeo (departamento, provincia, distrito) values ('Lambayeque','Ferreñafe','Pitipo');
insert into ubigeo (departamento, provincia, distrito) values ('Lambayeque','Ferreñafe','Pueblo Nuevo');
insert into ubigeo (departamento, provincia, distrito) values ('Lambayeque','Lambayeque','Lambayeque');
insert into ubigeo (departamento, provincia, distrito) values ('Lambayeque','Lambayeque','Chochope');
insert into ubigeo (departamento, provincia, distrito) values ('Lambayeque','Lambayeque','Illimo');
insert into ubigeo (departamento, provincia, distrito) values ('Lambayeque','Lambayeque','Jayanca');
insert into ubigeo (departamento, provincia, distrito) values ('Lambayeque','Lambayeque','Mochumi');
insert into ubigeo (departamento, provincia, distrito) values ('Lambayeque','Lambayeque','Morrope');
insert into ubigeo (departamento, provincia, distrito) values ('Lambayeque','Lambayeque','Motupe');
insert into ubigeo (departamento, provincia, distrito) values ('Lambayeque','Lambayeque','Olmos');
insert into ubigeo (departamento, provincia, distrito) values ('Lambayeque','Lambayeque','Pacora');
insert into ubigeo (departamento, provincia, distrito) values ('Lambayeque','Lambayeque','Salas');
insert into ubigeo (departamento, provincia, distrito) values ('Lambayeque','Lambayeque','San José');
insert into ubigeo (departamento, provincia, distrito) values ('Lambayeque','Lambayeque','Tucume');
insert into ubigeo (departamento, provincia, distrito) values ('Lima','Lima','Lima');
insert into ubigeo (departamento, provincia, distrito) values ('Lima','Lima','Ancón');
insert into ubigeo (departamento, provincia, distrito) values ('Lima','Lima','Ate');
insert into ubigeo (departamento, provincia, distrito) values ('Lima','Lima','Barranco');
insert into ubigeo (departamento, provincia, distrito) values ('Lima','Lima','Breña');
insert into ubigeo (departamento, provincia, distrito) values ('Lima','Lima','Carabayllo');
insert into ubigeo (departamento, provincia, distrito) values ('Lima','Lima','Chaclacayo');
insert into ubigeo (departamento, provincia, distrito) values ('Lima','Lima','Chorrillos');
insert into ubigeo (departamento, provincia, distrito) values ('Lima','Lima','Cieneguilla');
insert into ubigeo (departamento, provincia, distrito) values ('Lima','Lima','Comas');
insert into ubigeo (departamento, provincia, distrito) values ('Lima','Lima','El Agustino');
insert into ubigeo (departamento, provincia, distrito) values ('Lima','Lima','Independencia');
insert into ubigeo (departamento, provincia, distrito) values ('Lima','Lima','Jesús María');
insert into ubigeo (departamento, provincia, distrito) values ('Lima','Lima','La Molina');
insert into ubigeo (departamento, provincia, distrito) values ('Lima','Lima','La Victoria');
insert into ubigeo (departamento, provincia, distrito) values ('Lima','Lima','Lince');
insert into ubigeo (departamento, provincia, distrito) values ('Lima','Lima','Los Olivos');
insert into ubigeo (departamento, provincia, distrito) values ('Lima','Lima','Lurigancho');
insert into ubigeo (departamento, provincia, distrito) values ('Lima','Lima','Lurin');
insert into ubigeo (departamento, provincia, distrito) values ('Lima','Lima','Magdalena del Mar');
insert into ubigeo (departamento, provincia, distrito) values ('Lima','Lima','Pueblo Libre');
insert into ubigeo (departamento, provincia, distrito) values ('Lima','Lima','Miraflores');
insert into ubigeo (departamento, provincia, distrito) values ('Lima','Lima','Pachacamac');
insert into ubigeo (departamento, provincia, distrito) values ('Lima','Lima','Pucusana');
insert into ubigeo (departamento, provincia, distrito) values ('Lima','Lima','Puente Piedra');
insert into ubigeo (departamento, provincia, distrito) values ('Lima','Lima','Punta Hermosa');
insert into ubigeo (departamento, provincia, distrito) values ('Lima','Lima','Punta Negra');
insert into ubigeo (departamento, provincia, distrito) values ('Lima','Lima','Rímac');
insert into ubigeo (departamento, provincia, distrito) values ('Lima','Lima','San Bartolo');
insert into ubigeo (departamento, provincia, distrito) values ('Lima','Lima','San Borja');
insert into ubigeo (departamento, provincia, distrito) values ('Lima','Lima','San Isidro');
insert into ubigeo (departamento, provincia, distrito) values ('Lima','Lima','San Juan de Lurigancho');
insert into ubigeo (departamento, provincia, distrito) values ('Lima','Lima','San Juan de Miraflores');
insert into ubigeo (departamento, provincia, distrito) values ('Lima','Lima','San Luis');
insert into ubigeo (departamento, provincia, distrito) values ('Lima','Lima','San Martín de Porres');
insert into ubigeo (departamento, provincia, distrito) values ('Lima','Lima','San Miguel');
insert into ubigeo (departamento, provincia, distrito) values ('Lima','Lima','Santa Anita');
insert into ubigeo (departamento, provincia, distrito) values ('Lima','Lima','Santa María del Mar');
insert into ubigeo (departamento, provincia, distrito) values ('Lima','Lima','Santa Rosa');
insert into ubigeo (departamento, provincia, distrito) values ('Lima','Lima','Santiago de Surco');
insert into ubigeo (departamento, provincia, distrito) values ('Lima','Lima','Surquillo');
insert into ubigeo (departamento, provincia, distrito) values ('Lima','Lima','Villa El Salvador');
insert into ubigeo (departamento, provincia, distrito) values ('Lima','Lima','Villa María del Triunfo');
insert into ubigeo (departamento, provincia, distrito) values ('Lima','Barranca','Barranca');
insert into ubigeo (departamento, provincia, distrito) values ('Lima','Barranca','Paramonga');
insert into ubigeo (departamento, provincia, distrito) values ('Lima','Barranca','Pativilca');
insert into ubigeo (departamento, provincia, distrito) values ('Lima','Barranca','Supe');
insert into ubigeo (departamento, provincia, distrito) values ('Lima','Barranca','Supe Puerto');
insert into ubigeo (departamento, provincia, distrito) values ('Lima','Cajatambo','Cajatambo');
insert into ubigeo (departamento, provincia, distrito) values ('Lima','Cajatambo','Copa');
insert into ubigeo (departamento, provincia, distrito) values ('Lima','Cajatambo','Gorgor');
insert into ubigeo (departamento, provincia, distrito) values ('Lima','Cajatambo','Huancapon');
insert into ubigeo (departamento, provincia, distrito) values ('Lima','Cajatambo','Manas');
insert into ubigeo (departamento, provincia, distrito) values ('Lima','Canta','Canta');
insert into ubigeo (departamento, provincia, distrito) values ('Lima','Canta','Arahuay');
insert into ubigeo (departamento, provincia, distrito) values ('Lima','Canta','Huamantanga');
insert into ubigeo (departamento, provincia, distrito) values ('Lima','Canta','Huaros');
insert into ubigeo (departamento, provincia, distrito) values ('Lima','Canta','Lachaqui');
insert into ubigeo (departamento, provincia, distrito) values ('Lima','Canta','San Buenaventura');
insert into ubigeo (departamento, provincia, distrito) values ('Lima','Canta','Santa Rosa de Quives');
insert into ubigeo (departamento, provincia, distrito) values ('Lima','Cañete','San Vicente de Cañete');
insert into ubigeo (departamento, provincia, distrito) values ('Lima','Cañete','Asia');
insert into ubigeo (departamento, provincia, distrito) values ('Lima','Cañete','Calango');
insert into ubigeo (departamento, provincia, distrito) values ('Lima','Cañete','Cerro Azul');
insert into ubigeo (departamento, provincia, distrito) values ('Lima','Cañete','Chilca');
insert into ubigeo (departamento, provincia, distrito) values ('Lima','Cañete','Coayllo');
insert into ubigeo (departamento, provincia, distrito) values ('Lima','Cañete','Imperial');
insert into ubigeo (departamento, provincia, distrito) values ('Lima','Cañete','Lunahuana');
insert into ubigeo (departamento, provincia, distrito) values ('Lima','Cañete','Mala');
insert into ubigeo (departamento, provincia, distrito) values ('Lima','Cañete','Nuevo Imperial');
insert into ubigeo (departamento, provincia, distrito) values ('Lima','Cañete','Pacaran');
insert into ubigeo (departamento, provincia, distrito) values ('Lima','Cañete','Quilmana');
insert into ubigeo (departamento, provincia, distrito) values ('Lima','Cañete','San Antonio');
insert into ubigeo (departamento, provincia, distrito) values ('Lima','Cañete','San Luis');
insert into ubigeo (departamento, provincia, distrito) values ('Lima','Cañete','Santa Cruz de Flores');
insert into ubigeo (departamento, provincia, distrito) values ('Lima','Cañete','Zúñiga');
insert into ubigeo (departamento, provincia, distrito) values ('Lima','Huaral','Huaral');
insert into ubigeo (departamento, provincia, distrito) values ('Lima','Huaral','Atavillos Alto');
insert into ubigeo (departamento, provincia, distrito) values ('Lima','Huaral','Atavillos Bajo');
insert into ubigeo (departamento, provincia, distrito) values ('Lima','Huaral','Aucallama');
insert into ubigeo (departamento, provincia, distrito) values ('Lima','Huaral','Chancay');
insert into ubigeo (departamento, provincia, distrito) values ('Lima','Huaral','Ihuari');
insert into ubigeo (departamento, provincia, distrito) values ('Lima','Huaral','Lampian');
insert into ubigeo (departamento, provincia, distrito) values ('Lima','Huaral','Pacaraos');
insert into ubigeo (departamento, provincia, distrito) values ('Lima','Huaral','San Miguel de Acos');
insert into ubigeo (departamento, provincia, distrito) values ('Lima','Huaral','Santa Cruz de Andamarca');
insert into ubigeo (departamento, provincia, distrito) values ('Lima','Huaral','Sumbilca');
insert into ubigeo (departamento, provincia, distrito) values ('Lima','Huaral','Veintisiete de Noviembre');
insert into ubigeo (departamento, provincia, distrito) values ('Lima','Huarochirí','Matucana');
insert into ubigeo (departamento, provincia, distrito) values ('Lima','Huarochirí','Antioquia');
insert into ubigeo (departamento, provincia, distrito) values ('Lima','Huarochirí','Callahuanca');
insert into ubigeo (departamento, provincia, distrito) values ('Lima','Huarochirí','Carampoma');
insert into ubigeo (departamento, provincia, distrito) values ('Lima','Huarochirí','Chicla');
insert into ubigeo (departamento, provincia, distrito) values ('Lima','Huarochirí','Cuenca');
insert into ubigeo (departamento, provincia, distrito) values ('Lima','Huarochirí','Huachupampa');
insert into ubigeo (departamento, provincia, distrito) values ('Lima','Huarochirí','Huanza');
insert into ubigeo (departamento, provincia, distrito) values ('Lima','Huarochirí','Huarochiri');
insert into ubigeo (departamento, provincia, distrito) values ('Lima','Huarochirí','Lahuaytambo');
insert into ubigeo (departamento, provincia, distrito) values ('Lima','Huarochirí','Langa');
insert into ubigeo (departamento, provincia, distrito) values ('Lima','Huarochirí','Laraos');
insert into ubigeo (departamento, provincia, distrito) values ('Lima','Huarochirí','Mariatana');
insert into ubigeo (departamento, provincia, distrito) values ('Lima','Huarochirí','Ricardo Palma');
insert into ubigeo (departamento, provincia, distrito) values ('Lima','Huarochirí','San Andrés de Tupicocha');
insert into ubigeo (departamento, provincia, distrito) values ('Lima','Huarochirí','San Antonio');
insert into ubigeo (departamento, provincia, distrito) values ('Lima','Huarochirí','San Bartolomé');
insert into ubigeo (departamento, provincia, distrito) values ('Lima','Huarochirí','San Damian');
insert into ubigeo (departamento, provincia, distrito) values ('Lima','Huarochirí','San Juan de Iris');
insert into ubigeo (departamento, provincia, distrito) values ('Lima','Huarochirí','San Juan de Tantaranche');
insert into ubigeo (departamento, provincia, distrito) values ('Lima','Huarochirí','San Lorenzo de Quinti');
insert into ubigeo (departamento, provincia, distrito) values ('Lima','Huarochirí','San Mateo');
insert into ubigeo (departamento, provincia, distrito) values ('Lima','Huarochirí','San Mateo de Otao');
insert into ubigeo (departamento, provincia, distrito) values ('Lima','Huarochirí','San Pedro de Casta');
insert into ubigeo (departamento, provincia, distrito) values ('Lima','Huarochirí','San Pedro de Huancayre');
insert into ubigeo (departamento, provincia, distrito) values ('Lima','Huarochirí','Sangallaya');
insert into ubigeo (departamento, provincia, distrito) values ('Lima','Huarochirí','Santa Cruz de Cocachacra');
insert into ubigeo (departamento, provincia, distrito) values ('Lima','Huarochirí','Santa Eulalia');
insert into ubigeo (departamento, provincia, distrito) values ('Lima','Huarochirí','Santiago de Anchucaya');
insert into ubigeo (departamento, provincia, distrito) values ('Lima','Huarochirí','Santiago de Tuna');
insert into ubigeo (departamento, provincia, distrito) values ('Lima','Huarochirí','Santo Domingo de Los Olleros');
insert into ubigeo (departamento, provincia, distrito) values ('Lima','Huarochirí','Surco');
insert into ubigeo (departamento, provincia, distrito) values ('Lima','Huaura','Huacho');
insert into ubigeo (departamento, provincia, distrito) values ('Lima','Huaura','Ambar');
insert into ubigeo (departamento, provincia, distrito) values ('Lima','Huaura','Caleta de Carquin');
insert into ubigeo (departamento, provincia, distrito) values ('Lima','Huaura','Checras');
insert into ubigeo (departamento, provincia, distrito) values ('Lima','Huaura','Hualmay');
insert into ubigeo (departamento, provincia, distrito) values ('Lima','Huaura','Huaura');
insert into ubigeo (departamento, provincia, distrito) values ('Lima','Huaura','Leoncio Prado');
insert into ubigeo (departamento, provincia, distrito) values ('Lima','Huaura','Paccho');
insert into ubigeo (departamento, provincia, distrito) values ('Lima','Huaura','Santa Leonor');
insert into ubigeo (departamento, provincia, distrito) values ('Lima','Huaura','Santa María');
insert into ubigeo (departamento, provincia, distrito) values ('Lima','Huaura','Sayan');
insert into ubigeo (departamento, provincia, distrito) values ('Lima','Huaura','Vegueta');
insert into ubigeo (departamento, provincia, distrito) values ('Lima','Oyón','Oyon');
insert into ubigeo (departamento, provincia, distrito) values ('Lima','Oyón','Andajes');
insert into ubigeo (departamento, provincia, distrito) values ('Lima','Oyón','Caujul');
insert into ubigeo (departamento, provincia, distrito) values ('Lima','Oyón','Cochamarca');
insert into ubigeo (departamento, provincia, distrito) values ('Lima','Oyón','Navan');
insert into ubigeo (departamento, provincia, distrito) values ('Lima','Oyón','Pachangara');
insert into ubigeo (departamento, provincia, distrito) values ('Lima','Yauyos','Yauyos');
insert into ubigeo (departamento, provincia, distrito) values ('Lima','Yauyos','Alis');
insert into ubigeo (departamento, provincia, distrito) values ('Lima','Yauyos','Allauca');
insert into ubigeo (departamento, provincia, distrito) values ('Lima','Yauyos','Ayaviri');
insert into ubigeo (departamento, provincia, distrito) values ('Lima','Yauyos','Azángaro');
insert into ubigeo (departamento, provincia, distrito) values ('Lima','Yauyos','Cacra');
insert into ubigeo (departamento, provincia, distrito) values ('Lima','Yauyos','Carania');
insert into ubigeo (departamento, provincia, distrito) values ('Lima','Yauyos','Catahuasi');
insert into ubigeo (departamento, provincia, distrito) values ('Lima','Yauyos','Chocos');
insert into ubigeo (departamento, provincia, distrito) values ('Lima','Yauyos','Cochas');
insert into ubigeo (departamento, provincia, distrito) values ('Lima','Yauyos','Colonia');
insert into ubigeo (departamento, provincia, distrito) values ('Lima','Yauyos','Hongos');
insert into ubigeo (departamento, provincia, distrito) values ('Lima','Yauyos','Huampara');
insert into ubigeo (departamento, provincia, distrito) values ('Lima','Yauyos','Huancaya');
insert into ubigeo (departamento, provincia, distrito) values ('Lima','Yauyos','Huangascar');
insert into ubigeo (departamento, provincia, distrito) values ('Lima','Yauyos','Huantan');
insert into ubigeo (departamento, provincia, distrito) values ('Lima','Yauyos','Huañec');
insert into ubigeo (departamento, provincia, distrito) values ('Lima','Yauyos','Laraos');
insert into ubigeo (departamento, provincia, distrito) values ('Lima','Yauyos','Lincha');
insert into ubigeo (departamento, provincia, distrito) values ('Lima','Yauyos','Madean');
insert into ubigeo (departamento, provincia, distrito) values ('Lima','Yauyos','Miraflores');
insert into ubigeo (departamento, provincia, distrito) values ('Lima','Yauyos','Omas');
insert into ubigeo (departamento, provincia, distrito) values ('Lima','Yauyos','Putinza');
insert into ubigeo (departamento, provincia, distrito) values ('Lima','Yauyos','Quinches');
insert into ubigeo (departamento, provincia, distrito) values ('Lima','Yauyos','Quinocay');
insert into ubigeo (departamento, provincia, distrito) values ('Lima','Yauyos','San Joaquín');
insert into ubigeo (departamento, provincia, distrito) values ('Lima','Yauyos','San Pedro de Pilas');
insert into ubigeo (departamento, provincia, distrito) values ('Lima','Yauyos','Tanta');
insert into ubigeo (departamento, provincia, distrito) values ('Lima','Yauyos','Tauripampa');
insert into ubigeo (departamento, provincia, distrito) values ('Lima','Yauyos','Tomas');
insert into ubigeo (departamento, provincia, distrito) values ('Lima','Yauyos','Tupe');
insert into ubigeo (departamento, provincia, distrito) values ('Lima','Yauyos','Viñac');
insert into ubigeo (departamento, provincia, distrito) values ('Lima','Yauyos','Vitis');
insert into ubigeo (departamento, provincia, distrito) values ('Loreto','Maynas','Iquitos');
insert into ubigeo (departamento, provincia, distrito) values ('Loreto','Maynas','Alto Nanay');
insert into ubigeo (departamento, provincia, distrito) values ('Loreto','Maynas','Fernando Lores');
insert into ubigeo (departamento, provincia, distrito) values ('Loreto','Maynas','Indiana');
insert into ubigeo (departamento, provincia, distrito) values ('Loreto','Maynas','Las Amazonas');
insert into ubigeo (departamento, provincia, distrito) values ('Loreto','Maynas','Mazan');
insert into ubigeo (departamento, provincia, distrito) values ('Loreto','Maynas','Napo');
insert into ubigeo (departamento, provincia, distrito) values ('Loreto','Maynas','Punchana');
insert into ubigeo (departamento, provincia, distrito) values ('Loreto','Maynas','Torres Causana');
insert into ubigeo (departamento, provincia, distrito) values ('Loreto','Maynas','Belén');
insert into ubigeo (departamento, provincia, distrito) values ('Loreto','Maynas','San Juan Bautista');
insert into ubigeo (departamento, provincia, distrito) values ('Loreto','Alto Amazonas','Yurimaguas');
insert into ubigeo (departamento, provincia, distrito) values ('Loreto','Alto Amazonas','Balsapuerto');
insert into ubigeo (departamento, provincia, distrito) values ('Loreto','Alto Amazonas','Jeberos');
insert into ubigeo (departamento, provincia, distrito) values ('Loreto','Alto Amazonas','Lagunas');
insert into ubigeo (departamento, provincia, distrito) values ('Loreto','Alto Amazonas','Santa Cruz');
insert into ubigeo (departamento, provincia, distrito) values ('Loreto','Alto Amazonas','Teniente Cesar López Rojas');
insert into ubigeo (departamento, provincia, distrito) values ('Loreto','Loreto','Nauta');
insert into ubigeo (departamento, provincia, distrito) values ('Loreto','Loreto','Parinari');
insert into ubigeo (departamento, provincia, distrito) values ('Loreto','Loreto','Tigre');
insert into ubigeo (departamento, provincia, distrito) values ('Loreto','Loreto','Trompeteros');
insert into ubigeo (departamento, provincia, distrito) values ('Loreto','Loreto','Urarinas');
insert into ubigeo (departamento, provincia, distrito) values ('Loreto','Mariscal Ramón Castilla','Ramón Castilla');
insert into ubigeo (departamento, provincia, distrito) values ('Loreto','Mariscal Ramón Castilla','Pebas');
insert into ubigeo (departamento, provincia, distrito) values ('Loreto','Mariscal Ramón Castilla','Yavari');
insert into ubigeo (departamento, provincia, distrito) values ('Loreto','Mariscal Ramón Castilla','San Pablo');
insert into ubigeo (departamento, provincia, distrito) values ('Loreto','Requena','Requena');
insert into ubigeo (departamento, provincia, distrito) values ('Loreto','Requena','Alto Tapiche');
insert into ubigeo (departamento, provincia, distrito) values ('Loreto','Requena','Capelo');
insert into ubigeo (departamento, provincia, distrito) values ('Loreto','Requena','Emilio San Martín');
insert into ubigeo (departamento, provincia, distrito) values ('Loreto','Requena','Maquia');
insert into ubigeo (departamento, provincia, distrito) values ('Loreto','Requena','Puinahua');
insert into ubigeo (departamento, provincia, distrito) values ('Loreto','Requena','Saquena');
insert into ubigeo (departamento, provincia, distrito) values ('Loreto','Requena','Soplin');
insert into ubigeo (departamento, provincia, distrito) values ('Loreto','Requena','Tapiche');
insert into ubigeo (departamento, provincia, distrito) values ('Loreto','Requena','Jenaro Herrera');
insert into ubigeo (departamento, provincia, distrito) values ('Loreto','Requena','Yaquerana');
insert into ubigeo (departamento, provincia, distrito) values ('Loreto','Ucayali','Contamana');
insert into ubigeo (departamento, provincia, distrito) values ('Loreto','Ucayali','Inahuaya');
insert into ubigeo (departamento, provincia, distrito) values ('Loreto','Ucayali','Padre Márquez');
insert into ubigeo (departamento, provincia, distrito) values ('Loreto','Ucayali','Pampa Hermosa');
insert into ubigeo (departamento, provincia, distrito) values ('Loreto','Ucayali','Sarayacu');
insert into ubigeo (departamento, provincia, distrito) values ('Loreto','Ucayali','Vargas Guerra');
insert into ubigeo (departamento, provincia, distrito) values ('Loreto','Datem del Marañón','Barranca');
insert into ubigeo (departamento, provincia, distrito) values ('Loreto','Datem del Marañón','Cahuapanas');
insert into ubigeo (departamento, provincia, distrito) values ('Loreto','Datem del Marañón','Manseriche');
insert into ubigeo (departamento, provincia, distrito) values ('Loreto','Datem del Marañón','Morona');
insert into ubigeo (departamento, provincia, distrito) values ('Loreto','Datem del Marañón','Pastaza');
insert into ubigeo (departamento, provincia, distrito) values ('Loreto','Datem del Marañón','Andoas');
insert into ubigeo (departamento, provincia, distrito) values ('Loreto','Putumayo','Putumayo');
insert into ubigeo (departamento, provincia, distrito) values ('Loreto','Putumayo','Rosa Panduro');
insert into ubigeo (departamento, provincia, distrito) values ('Loreto','Putumayo','Teniente Manuel Clavero');
insert into ubigeo (departamento, provincia, distrito) values ('Loreto','Putumayo','Yaguas');
insert into ubigeo (departamento, provincia, distrito) values ('Madre de Dios','Tambopata','Tambopata');
insert into ubigeo (departamento, provincia, distrito) values ('Madre de Dios','Tambopata','Inambari');
insert into ubigeo (departamento, provincia, distrito) values ('Madre de Dios','Tambopata','Las Piedras');
insert into ubigeo (departamento, provincia, distrito) values ('Madre de Dios','Tambopata','Laberinto');
insert into ubigeo (departamento, provincia, distrito) values ('Madre de Dios','Manu','Manu');
insert into ubigeo (departamento, provincia, distrito) values ('Madre de Dios','Manu','Fitzcarrald');
insert into ubigeo (departamento, provincia, distrito) values ('Madre de Dios','Manu','Madre de Dios');
insert into ubigeo (departamento, provincia, distrito) values ('Madre de Dios','Manu','Huepetuhe');
insert into ubigeo (departamento, provincia, distrito) values ('Madre de Dios','Tahuamanu','Iñapari');
insert into ubigeo (departamento, provincia, distrito) values ('Madre de Dios','Tahuamanu','Iberia');
insert into ubigeo (departamento, provincia, distrito) values ('Madre de Dios','Tahuamanu','Tahuamanu');
insert into ubigeo (departamento, provincia, distrito) values ('Moquegua','Mariscal Nieto','Moquegua');
insert into ubigeo (departamento, provincia, distrito) values ('Moquegua','Mariscal Nieto','Carumas');
insert into ubigeo (departamento, provincia, distrito) values ('Moquegua','Mariscal Nieto','Cuchumbaya');
insert into ubigeo (departamento, provincia, distrito) values ('Moquegua','Mariscal Nieto','Samegua');
insert into ubigeo (departamento, provincia, distrito) values ('Moquegua','Mariscal Nieto','San Cristóbal');
insert into ubigeo (departamento, provincia, distrito) values ('Moquegua','Mariscal Nieto','Torata');
insert into ubigeo (departamento, provincia, distrito) values ('Moquegua','General Sánchez Cerro','Omate');
insert into ubigeo (departamento, provincia, distrito) values ('Moquegua','General Sánchez Cerro','Chojata');
insert into ubigeo (departamento, provincia, distrito) values ('Moquegua','General Sánchez Cerro','Coalaque');
insert into ubigeo (departamento, provincia, distrito) values ('Moquegua','General Sánchez Cerro','Ichuña');
insert into ubigeo (departamento, provincia, distrito) values ('Moquegua','General Sánchez Cerro','La Capilla');
insert into ubigeo (departamento, provincia, distrito) values ('Moquegua','General Sánchez Cerro','Lloque');
insert into ubigeo (departamento, provincia, distrito) values ('Moquegua','General Sánchez Cerro','Matalaque');
insert into ubigeo (departamento, provincia, distrito) values ('Moquegua','General Sánchez Cerro','Puquina');
insert into ubigeo (departamento, provincia, distrito) values ('Moquegua','General Sánchez Cerro','Quinistaquillas');
insert into ubigeo (departamento, provincia, distrito) values ('Moquegua','General Sánchez Cerro','Ubinas');
insert into ubigeo (departamento, provincia, distrito) values ('Moquegua','General Sánchez Cerro','Yunga');
insert into ubigeo (departamento, provincia, distrito) values ('Moquegua','Ilo','Ilo');
insert into ubigeo (departamento, provincia, distrito) values ('Moquegua','Ilo','El Algarrobal');
insert into ubigeo (departamento, provincia, distrito) values ('Moquegua','Ilo','Pacocha');
insert into ubigeo (departamento, provincia, distrito) values ('Pasco','Pasco','Chaupimarca');
insert into ubigeo (departamento, provincia, distrito) values ('Pasco','Pasco','Huachon');
insert into ubigeo (departamento, provincia, distrito) values ('Pasco','Pasco','Huariaca');
insert into ubigeo (departamento, provincia, distrito) values ('Pasco','Pasco','Huayllay');
insert into ubigeo (departamento, provincia, distrito) values ('Pasco','Pasco','Ninacaca');
insert into ubigeo (departamento, provincia, distrito) values ('Pasco','Pasco','Pallanchacra');
insert into ubigeo (departamento, provincia, distrito) values ('Pasco','Pasco','Paucartambo');
insert into ubigeo (departamento, provincia, distrito) values ('Pasco','Pasco','San Francisco de Asís de Yarusyacan');
insert into ubigeo (departamento, provincia, distrito) values ('Pasco','Pasco','Simon Bolívar');
insert into ubigeo (departamento, provincia, distrito) values ('Pasco','Pasco','Ticlacayan');
insert into ubigeo (departamento, provincia, distrito) values ('Pasco','Pasco','Tinyahuarco');
insert into ubigeo (departamento, provincia, distrito) values ('Pasco','Pasco','Vicco');
insert into ubigeo (departamento, provincia, distrito) values ('Pasco','Pasco','Yanacancha');
insert into ubigeo (departamento, provincia, distrito) values ('Pasco','Daniel Alcides Carrión','Yanahuanca');
insert into ubigeo (departamento, provincia, distrito) values ('Pasco','Daniel Alcides Carrión','Chacayan');
insert into ubigeo (departamento, provincia, distrito) values ('Pasco','Daniel Alcides Carrión','Goyllarisquizga');
insert into ubigeo (departamento, provincia, distrito) values ('Pasco','Daniel Alcides Carrión','Paucar');
insert into ubigeo (departamento, provincia, distrito) values ('Pasco','Daniel Alcides Carrión','San Pedro de Pillao');
insert into ubigeo (departamento, provincia, distrito) values ('Pasco','Daniel Alcides Carrión','Santa Ana de Tusi');
insert into ubigeo (departamento, provincia, distrito) values ('Pasco','Daniel Alcides Carrión','Tapuc');
insert into ubigeo (departamento, provincia, distrito) values ('Pasco','Daniel Alcides Carrión','Vilcabamba');
insert into ubigeo (departamento, provincia, distrito) values ('Pasco','Oxapampa','Oxapampa');
insert into ubigeo (departamento, provincia, distrito) values ('Pasco','Oxapampa','Chontabamba');
insert into ubigeo (departamento, provincia, distrito) values ('Pasco','Oxapampa','Huancabamba');
insert into ubigeo (departamento, provincia, distrito) values ('Pasco','Oxapampa','Palcazu');
insert into ubigeo (departamento, provincia, distrito) values ('Pasco','Oxapampa','Pozuzo');
insert into ubigeo (departamento, provincia, distrito) values ('Pasco','Oxapampa','Puerto Bermúdez');
insert into ubigeo (departamento, provincia, distrito) values ('Pasco','Oxapampa','Villa Rica');
insert into ubigeo (departamento, provincia, distrito) values ('Pasco','Oxapampa','Constitución');
insert into ubigeo (departamento, provincia, distrito) values ('Piura','Piura','Piura');
insert into ubigeo (departamento, provincia, distrito) values ('Piura','Piura','Castilla');
insert into ubigeo (departamento, provincia, distrito) values ('Piura','Piura','Catacaos');
insert into ubigeo (departamento, provincia, distrito) values ('Piura','Piura','Cura Mori');
insert into ubigeo (departamento, provincia, distrito) values ('Piura','Piura','El Tallan');
insert into ubigeo (departamento, provincia, distrito) values ('Piura','Piura','La Arena');
insert into ubigeo (departamento, provincia, distrito) values ('Piura','Piura','La Unión');
insert into ubigeo (departamento, provincia, distrito) values ('Piura','Piura','Las Lomas');
insert into ubigeo (departamento, provincia, distrito) values ('Piura','Piura','Tambo Grande');
insert into ubigeo (departamento, provincia, distrito) values ('Piura','Piura','Veintiseis de Octubre');
insert into ubigeo (departamento, provincia, distrito) values ('Piura','Ayabaca','Ayabaca');
insert into ubigeo (departamento, provincia, distrito) values ('Piura','Ayabaca','Frias');
insert into ubigeo (departamento, provincia, distrito) values ('Piura','Ayabaca','Jilili');
insert into ubigeo (departamento, provincia, distrito) values ('Piura','Ayabaca','Lagunas');
insert into ubigeo (departamento, provincia, distrito) values ('Piura','Ayabaca','Montero');
insert into ubigeo (departamento, provincia, distrito) values ('Piura','Ayabaca','Pacaipampa');
insert into ubigeo (departamento, provincia, distrito) values ('Piura','Ayabaca','Paimas');
insert into ubigeo (departamento, provincia, distrito) values ('Piura','Ayabaca','Sapillica');
insert into ubigeo (departamento, provincia, distrito) values ('Piura','Ayabaca','Sicchez');
insert into ubigeo (departamento, provincia, distrito) values ('Piura','Ayabaca','Suyo');
insert into ubigeo (departamento, provincia, distrito) values ('Piura','Huancabamba','Huancabamba');
insert into ubigeo (departamento, provincia, distrito) values ('Piura','Huancabamba','Canchaque');
insert into ubigeo (departamento, provincia, distrito) values ('Piura','Huancabamba','El Carmen de la Frontera');
insert into ubigeo (departamento, provincia, distrito) values ('Piura','Huancabamba','Huarmaca');
insert into ubigeo (departamento, provincia, distrito) values ('Piura','Huancabamba','Lalaquiz');
insert into ubigeo (departamento, provincia, distrito) values ('Piura','Huancabamba','San Miguel de El Faique');
insert into ubigeo (departamento, provincia, distrito) values ('Piura','Huancabamba','Sondor');
insert into ubigeo (departamento, provincia, distrito) values ('Piura','Huancabamba','Sondorillo');
insert into ubigeo (departamento, provincia, distrito) values ('Piura','Morropón','Chulucanas');
insert into ubigeo (departamento, provincia, distrito) values ('Piura','Morropón','Buenos Aires');
insert into ubigeo (departamento, provincia, distrito) values ('Piura','Morropón','Chalaco');
insert into ubigeo (departamento, provincia, distrito) values ('Piura','Morropón','La Matanza');
insert into ubigeo (departamento, provincia, distrito) values ('Piura','Morropón','Morropon');
insert into ubigeo (departamento, provincia, distrito) values ('Piura','Morropón','Salitral');
insert into ubigeo (departamento, provincia, distrito) values ('Piura','Morropón','San Juan de Bigote');
insert into ubigeo (departamento, provincia, distrito) values ('Piura','Morropón','Santa Catalina de Mossa');
insert into ubigeo (departamento, provincia, distrito) values ('Piura','Morropón','Santo Domingo');
insert into ubigeo (departamento, provincia, distrito) values ('Piura','Morropón','Yamango');
insert into ubigeo (departamento, provincia, distrito) values ('Piura','Paita','Paita');
insert into ubigeo (departamento, provincia, distrito) values ('Piura','Paita','Amotape');
insert into ubigeo (departamento, provincia, distrito) values ('Piura','Paita','Arenal');
insert into ubigeo (departamento, provincia, distrito) values ('Piura','Paita','Colan');
insert into ubigeo (departamento, provincia, distrito) values ('Piura','Paita','La Huaca');
insert into ubigeo (departamento, provincia, distrito) values ('Piura','Paita','Tamarindo');
insert into ubigeo (departamento, provincia, distrito) values ('Piura','Paita','Vichayal');
insert into ubigeo (departamento, provincia, distrito) values ('Piura','Sullana','Sullana');
insert into ubigeo (departamento, provincia, distrito) values ('Piura','Sullana','Bellavista');
insert into ubigeo (departamento, provincia, distrito) values ('Piura','Sullana','Ignacio Escudero');
insert into ubigeo (departamento, provincia, distrito) values ('Piura','Sullana','Lancones');
insert into ubigeo (departamento, provincia, distrito) values ('Piura','Sullana','Marcavelica');
insert into ubigeo (departamento, provincia, distrito) values ('Piura','Sullana','Miguel Checa');
insert into ubigeo (departamento, provincia, distrito) values ('Piura','Sullana','Querecotillo');
insert into ubigeo (departamento, provincia, distrito) values ('Piura','Sullana','Salitral');
insert into ubigeo (departamento, provincia, distrito) values ('Piura','Talara','Pariñas');
insert into ubigeo (departamento, provincia, distrito) values ('Piura','Talara','El Alto');
insert into ubigeo (departamento, provincia, distrito) values ('Piura','Talara','La Brea');
insert into ubigeo (departamento, provincia, distrito) values ('Piura','Talara','Lobitos');
insert into ubigeo (departamento, provincia, distrito) values ('Piura','Talara','Los Organos');
insert into ubigeo (departamento, provincia, distrito) values ('Piura','Talara','Mancora');
insert into ubigeo (departamento, provincia, distrito) values ('Piura','Sechura','Sechura');
insert into ubigeo (departamento, provincia, distrito) values ('Piura','Sechura','Bellavista de la Unión');
insert into ubigeo (departamento, provincia, distrito) values ('Piura','Sechura','Bernal');
insert into ubigeo (departamento, provincia, distrito) values ('Piura','Sechura','Cristo Nos Valga');
insert into ubigeo (departamento, provincia, distrito) values ('Piura','Sechura','Vice');
insert into ubigeo (departamento, provincia, distrito) values ('Piura','Sechura','Rinconada Llicuar');
insert into ubigeo (departamento, provincia, distrito) values ('Puno','Puno','Puno');
insert into ubigeo (departamento, provincia, distrito) values ('Puno','Puno','Acora');
insert into ubigeo (departamento, provincia, distrito) values ('Puno','Puno','Amantani');
insert into ubigeo (departamento, provincia, distrito) values ('Puno','Puno','Atuncolla');
insert into ubigeo (departamento, provincia, distrito) values ('Puno','Puno','Capachica');
insert into ubigeo (departamento, provincia, distrito) values ('Puno','Puno','Chucuito');
insert into ubigeo (departamento, provincia, distrito) values ('Puno','Puno','Coata');
insert into ubigeo (departamento, provincia, distrito) values ('Puno','Puno','Huata');
insert into ubigeo (departamento, provincia, distrito) values ('Puno','Puno','Mañazo');
insert into ubigeo (departamento, provincia, distrito) values ('Puno','Puno','Paucarcolla');
insert into ubigeo (departamento, provincia, distrito) values ('Puno','Puno','Pichacani');
insert into ubigeo (departamento, provincia, distrito) values ('Puno','Puno','Plateria');
insert into ubigeo (departamento, provincia, distrito) values ('Puno','Puno','San Antonio');
insert into ubigeo (departamento, provincia, distrito) values ('Puno','Puno','Tiquillaca');
insert into ubigeo (departamento, provincia, distrito) values ('Puno','Puno','Vilque');
insert into ubigeo (departamento, provincia, distrito) values ('Puno','Azángaro','Azángaro');
insert into ubigeo (departamento, provincia, distrito) values ('Puno','Azángaro','Achaya');
insert into ubigeo (departamento, provincia, distrito) values ('Puno','Azángaro','Arapa');
insert into ubigeo (departamento, provincia, distrito) values ('Puno','Azángaro','Asillo');
insert into ubigeo (departamento, provincia, distrito) values ('Puno','Azángaro','Caminaca');
insert into ubigeo (departamento, provincia, distrito) values ('Puno','Azángaro','Chupa');
insert into ubigeo (departamento, provincia, distrito) values ('Puno','Azángaro','José Domingo Choquehuanca');
insert into ubigeo (departamento, provincia, distrito) values ('Puno','Azángaro','Muñani');
insert into ubigeo (departamento, provincia, distrito) values ('Puno','Azángaro','Potoni');
insert into ubigeo (departamento, provincia, distrito) values ('Puno','Azángaro','Saman');
insert into ubigeo (departamento, provincia, distrito) values ('Puno','Azángaro','San Anton');
insert into ubigeo (departamento, provincia, distrito) values ('Puno','Azángaro','San José');
insert into ubigeo (departamento, provincia, distrito) values ('Puno','Azángaro','San Juan de Salinas');
insert into ubigeo (departamento, provincia, distrito) values ('Puno','Azángaro','Santiago de Pupuja');
insert into ubigeo (departamento, provincia, distrito) values ('Puno','Azángaro','Tirapata');
insert into ubigeo (departamento, provincia, distrito) values ('Puno','Carabaya','Macusani');
insert into ubigeo (departamento, provincia, distrito) values ('Puno','Carabaya','Ajoyani');
insert into ubigeo (departamento, provincia, distrito) values ('Puno','Carabaya','Ayapata');
insert into ubigeo (departamento, provincia, distrito) values ('Puno','Carabaya','Coasa');
insert into ubigeo (departamento, provincia, distrito) values ('Puno','Carabaya','Corani');
insert into ubigeo (departamento, provincia, distrito) values ('Puno','Carabaya','Crucero');
insert into ubigeo (departamento, provincia, distrito) values ('Puno','Carabaya','Ituata');
insert into ubigeo (departamento, provincia, distrito) values ('Puno','Carabaya','Ollachea');
insert into ubigeo (departamento, provincia, distrito) values ('Puno','Carabaya','San Gaban');
insert into ubigeo (departamento, provincia, distrito) values ('Puno','Carabaya','Usicayos');
insert into ubigeo (departamento, provincia, distrito) values ('Puno','Chucuito','Juli');
insert into ubigeo (departamento, provincia, distrito) values ('Puno','Chucuito','Desaguadero');
insert into ubigeo (departamento, provincia, distrito) values ('Puno','Chucuito','Huacullani');
insert into ubigeo (departamento, provincia, distrito) values ('Puno','Chucuito','Kelluyo');
insert into ubigeo (departamento, provincia, distrito) values ('Puno','Chucuito','Pisacoma');
insert into ubigeo (departamento, provincia, distrito) values ('Puno','Chucuito','Pomata');
insert into ubigeo (departamento, provincia, distrito) values ('Puno','Chucuito','Zepita');
insert into ubigeo (departamento, provincia, distrito) values ('Puno','El Collao','Ilave');
insert into ubigeo (departamento, provincia, distrito) values ('Puno','El Collao','Capazo');
insert into ubigeo (departamento, provincia, distrito) values ('Puno','El Collao','Pilcuyo');
insert into ubigeo (departamento, provincia, distrito) values ('Puno','El Collao','Santa Rosa');
insert into ubigeo (departamento, provincia, distrito) values ('Puno','El Collao','Conduriri');
insert into ubigeo (departamento, provincia, distrito) values ('Puno','Huancané','Huancane');
insert into ubigeo (departamento, provincia, distrito) values ('Puno','Huancané','Cojata');
insert into ubigeo (departamento, provincia, distrito) values ('Puno','Huancané','Huatasani');
insert into ubigeo (departamento, provincia, distrito) values ('Puno','Huancané','Inchupalla');
insert into ubigeo (departamento, provincia, distrito) values ('Puno','Huancané','Pusi');
insert into ubigeo (departamento, provincia, distrito) values ('Puno','Huancané','Rosaspata');
insert into ubigeo (departamento, provincia, distrito) values ('Puno','Huancané','Taraco');
insert into ubigeo (departamento, provincia, distrito) values ('Puno','Huancané','Vilque Chico');
insert into ubigeo (departamento, provincia, distrito) values ('Puno','Lampa','Lampa');
insert into ubigeo (departamento, provincia, distrito) values ('Puno','Lampa','Cabanilla');
insert into ubigeo (departamento, provincia, distrito) values ('Puno','Lampa','Calapuja');
insert into ubigeo (departamento, provincia, distrito) values ('Puno','Lampa','Nicasio');
insert into ubigeo (departamento, provincia, distrito) values ('Puno','Lampa','Ocuviri');
insert into ubigeo (departamento, provincia, distrito) values ('Puno','Lampa','Palca');
insert into ubigeo (departamento, provincia, distrito) values ('Puno','Lampa','Paratia');
insert into ubigeo (departamento, provincia, distrito) values ('Puno','Lampa','Pucara');
insert into ubigeo (departamento, provincia, distrito) values ('Puno','Lampa','Santa Lucia');
insert into ubigeo (departamento, provincia, distrito) values ('Puno','Lampa','Vilavila');
insert into ubigeo (departamento, provincia, distrito) values ('Puno','Melgar','Ayaviri');
insert into ubigeo (departamento, provincia, distrito) values ('Puno','Melgar','Antauta');
insert into ubigeo (departamento, provincia, distrito) values ('Puno','Melgar','Cupi');
insert into ubigeo (departamento, provincia, distrito) values ('Puno','Melgar','Llalli');
insert into ubigeo (departamento, provincia, distrito) values ('Puno','Melgar','Macari');
insert into ubigeo (departamento, provincia, distrito) values ('Puno','Melgar','Nuñoa');
insert into ubigeo (departamento, provincia, distrito) values ('Puno','Melgar','Orurillo');
insert into ubigeo (departamento, provincia, distrito) values ('Puno','Melgar','Santa Rosa');
insert into ubigeo (departamento, provincia, distrito) values ('Puno','Melgar','Umachiri');
insert into ubigeo (departamento, provincia, distrito) values ('Puno','Moho','Moho');
insert into ubigeo (departamento, provincia, distrito) values ('Puno','Moho','Conima');
insert into ubigeo (departamento, provincia, distrito) values ('Puno','Moho','Huayrapata');
insert into ubigeo (departamento, provincia, distrito) values ('Puno','Moho','Tilali');
insert into ubigeo (departamento, provincia, distrito) values ('Puno','San Antonio de Putina','Putina');
insert into ubigeo (departamento, provincia, distrito) values ('Puno','San Antonio de Putina','Ananea');
insert into ubigeo (departamento, provincia, distrito) values ('Puno','San Antonio de Putina','Pedro Vilca Apaza');
insert into ubigeo (departamento, provincia, distrito) values ('Puno','San Antonio de Putina','Quilcapuncu');
insert into ubigeo (departamento, provincia, distrito) values ('Puno','San Antonio de Putina','Sina');
insert into ubigeo (departamento, provincia, distrito) values ('Puno','San Román','Juliaca');
insert into ubigeo (departamento, provincia, distrito) values ('Puno','San Román','Cabana');
insert into ubigeo (departamento, provincia, distrito) values ('Puno','San Román','Cabanillas');
insert into ubigeo (departamento, provincia, distrito) values ('Puno','San Román','Caracoto');
insert into ubigeo (departamento, provincia, distrito) values ('Puno','San Román','San Miguel');
insert into ubigeo (departamento, provincia, distrito) values ('Puno','Sandia','Sandia');
insert into ubigeo (departamento, provincia, distrito) values ('Puno','Sandia','Cuyocuyo');
insert into ubigeo (departamento, provincia, distrito) values ('Puno','Sandia','Limbani');
insert into ubigeo (departamento, provincia, distrito) values ('Puno','Sandia','Patambuco');
insert into ubigeo (departamento, provincia, distrito) values ('Puno','Sandia','Phara');
insert into ubigeo (departamento, provincia, distrito) values ('Puno','Sandia','Quiaca');
insert into ubigeo (departamento, provincia, distrito) values ('Puno','Sandia','San Juan del Oro');
insert into ubigeo (departamento, provincia, distrito) values ('Puno','Sandia','Yanahuaya');
insert into ubigeo (departamento, provincia, distrito) values ('Puno','Sandia','Alto Inambari');
insert into ubigeo (departamento, provincia, distrito) values ('Puno','Sandia','San Pedro de Putina Punco');
insert into ubigeo (departamento, provincia, distrito) values ('Puno','Yunguyo','Yunguyo');
insert into ubigeo (departamento, provincia, distrito) values ('Puno','Yunguyo','Anapia');
insert into ubigeo (departamento, provincia, distrito) values ('Puno','Yunguyo','Copani');
insert into ubigeo (departamento, provincia, distrito) values ('Puno','Yunguyo','Cuturapi');
insert into ubigeo (departamento, provincia, distrito) values ('Puno','Yunguyo','Ollaraya');
insert into ubigeo (departamento, provincia, distrito) values ('Puno','Yunguyo','Tinicachi');
insert into ubigeo (departamento, provincia, distrito) values ('Puno','Yunguyo','Unicachi');
insert into ubigeo (departamento, provincia, distrito) values ('San Martín','Moyobamba','Moyobamba');
insert into ubigeo (departamento, provincia, distrito) values ('San Martín','Moyobamba','Calzada');
insert into ubigeo (departamento, provincia, distrito) values ('San Martín','Moyobamba','Habana');
insert into ubigeo (departamento, provincia, distrito) values ('San Martín','Moyobamba','Jepelacio');
insert into ubigeo (departamento, provincia, distrito) values ('San Martín','Moyobamba','Soritor');
insert into ubigeo (departamento, provincia, distrito) values ('San Martín','Moyobamba','Yantalo');
insert into ubigeo (departamento, provincia, distrito) values ('San Martín','Bellavista','Bellavista');
insert into ubigeo (departamento, provincia, distrito) values ('San Martín','Bellavista','Alto Biavo');
insert into ubigeo (departamento, provincia, distrito) values ('San Martín','Bellavista','Bajo Biavo');
insert into ubigeo (departamento, provincia, distrito) values ('San Martín','Bellavista','Huallaga');
insert into ubigeo (departamento, provincia, distrito) values ('San Martín','Bellavista','San Pablo');
insert into ubigeo (departamento, provincia, distrito) values ('San Martín','Bellavista','San Rafael');
insert into ubigeo (departamento, provincia, distrito) values ('San Martín','El Dorado','San José de Sisa');
insert into ubigeo (departamento, provincia, distrito) values ('San Martín','El Dorado','Agua Blanca');
insert into ubigeo (departamento, provincia, distrito) values ('San Martín','El Dorado','San Martín');
insert into ubigeo (departamento, provincia, distrito) values ('San Martín','El Dorado','Santa Rosa');
insert into ubigeo (departamento, provincia, distrito) values ('San Martín','El Dorado','Shatoja');
insert into ubigeo (departamento, provincia, distrito) values ('San Martín','Huallaga','Saposoa');
insert into ubigeo (departamento, provincia, distrito) values ('San Martín','Huallaga','Alto Saposoa');
insert into ubigeo (departamento, provincia, distrito) values ('San Martín','Huallaga','El Eslabón');
insert into ubigeo (departamento, provincia, distrito) values ('San Martín','Huallaga','Piscoyacu');
insert into ubigeo (departamento, provincia, distrito) values ('San Martín','Huallaga','Sacanche');
insert into ubigeo (departamento, provincia, distrito) values ('San Martín','Huallaga','Tingo de Saposoa');
insert into ubigeo (departamento, provincia, distrito) values ('San Martín','Lamas','Lamas');
insert into ubigeo (departamento, provincia, distrito) values ('San Martín','Lamas','Alonso de Alvarado');
insert into ubigeo (departamento, provincia, distrito) values ('San Martín','Lamas','Barranquita');
insert into ubigeo (departamento, provincia, distrito) values ('San Martín','Lamas','Caynarachi');
insert into ubigeo (departamento, provincia, distrito) values ('San Martín','Lamas','Cuñumbuqui');
insert into ubigeo (departamento, provincia, distrito) values ('San Martín','Lamas','Pinto Recodo');
insert into ubigeo (departamento, provincia, distrito) values ('San Martín','Lamas','Rumisapa');
insert into ubigeo (departamento, provincia, distrito) values ('San Martín','Lamas','San Roque de Cumbaza');
insert into ubigeo (departamento, provincia, distrito) values ('San Martín','Lamas','Shanao');
insert into ubigeo (departamento, provincia, distrito) values ('San Martín','Lamas','Tabalosos');
insert into ubigeo (departamento, provincia, distrito) values ('San Martín','Lamas','Zapatero');
insert into ubigeo (departamento, provincia, distrito) values ('San Martín','Mariscal Cáceres','Juanjuí');
insert into ubigeo (departamento, provincia, distrito) values ('San Martín','Mariscal Cáceres','Campanilla');
insert into ubigeo (departamento, provincia, distrito) values ('San Martín','Mariscal Cáceres','Huicungo');
insert into ubigeo (departamento, provincia, distrito) values ('San Martín','Mariscal Cáceres','Pachiza');
insert into ubigeo (departamento, provincia, distrito) values ('San Martín','Mariscal Cáceres','Pajarillo');
insert into ubigeo (departamento, provincia, distrito) values ('San Martín','Picota','Picota');
insert into ubigeo (departamento, provincia, distrito) values ('San Martín','Picota','Buenos Aires');
insert into ubigeo (departamento, provincia, distrito) values ('San Martín','Picota','Caspisapa');
insert into ubigeo (departamento, provincia, distrito) values ('San Martín','Picota','Pilluana');
insert into ubigeo (departamento, provincia, distrito) values ('San Martín','Picota','Pucacaca');
insert into ubigeo (departamento, provincia, distrito) values ('San Martín','Picota','San Cristóbal');
insert into ubigeo (departamento, provincia, distrito) values ('San Martín','Picota','San Hilarión');
insert into ubigeo (departamento, provincia, distrito) values ('San Martín','Picota','Shamboyacu');
insert into ubigeo (departamento, provincia, distrito) values ('San Martín','Picota','Tingo de Ponasa');
insert into ubigeo (departamento, provincia, distrito) values ('San Martín','Picota','Tres Unidos');
insert into ubigeo (departamento, provincia, distrito) values ('San Martín','Rioja','Rioja');
insert into ubigeo (departamento, provincia, distrito) values ('San Martín','Rioja','Awajun');
insert into ubigeo (departamento, provincia, distrito) values ('San Martín','Rioja','Elías Soplin Vargas');
insert into ubigeo (departamento, provincia, distrito) values ('San Martín','Rioja','Nueva Cajamarca');
insert into ubigeo (departamento, provincia, distrito) values ('San Martín','Rioja','Pardo Miguel');
insert into ubigeo (departamento, provincia, distrito) values ('San Martín','Rioja','Posic');
insert into ubigeo (departamento, provincia, distrito) values ('San Martín','Rioja','San Fernando');
insert into ubigeo (departamento, provincia, distrito) values ('San Martín','Rioja','Yorongos');
insert into ubigeo (departamento, provincia, distrito) values ('San Martín','Rioja','Yuracyacu');
insert into ubigeo (departamento, provincia, distrito) values ('San Martín','San Martín','Tarapoto');
insert into ubigeo (departamento, provincia, distrito) values ('San Martín','San Martín','Alberto Leveau');
insert into ubigeo (departamento, provincia, distrito) values ('San Martín','San Martín','Cacatachi');
insert into ubigeo (departamento, provincia, distrito) values ('San Martín','San Martín','Chazuta');
insert into ubigeo (departamento, provincia, distrito) values ('San Martín','San Martín','Chipurana');
insert into ubigeo (departamento, provincia, distrito) values ('San Martín','San Martín','El Porvenir');
insert into ubigeo (departamento, provincia, distrito) values ('San Martín','San Martín','Huimbayoc');
insert into ubigeo (departamento, provincia, distrito) values ('San Martín','San Martín','Juan Guerra');
insert into ubigeo (departamento, provincia, distrito) values ('San Martín','San Martín','La Banda de Shilcayo');
insert into ubigeo (departamento, provincia, distrito) values ('San Martín','San Martín','Morales');
insert into ubigeo (departamento, provincia, distrito) values ('San Martín','San Martín','Papaplaya');
insert into ubigeo (departamento, provincia, distrito) values ('San Martín','San Martín','San Antonio');
insert into ubigeo (departamento, provincia, distrito) values ('San Martín','San Martín','Sauce');
insert into ubigeo (departamento, provincia, distrito) values ('San Martín','San Martín','Shapaja');
insert into ubigeo (departamento, provincia, distrito) values ('San Martín','Tocache','Tocache');
insert into ubigeo (departamento, provincia, distrito) values ('San Martín','Tocache','Nuevo Progreso');
insert into ubigeo (departamento, provincia, distrito) values ('San Martín','Tocache','Polvora');
insert into ubigeo (departamento, provincia, distrito) values ('San Martín','Tocache','Shunte');
insert into ubigeo (departamento, provincia, distrito) values ('San Martín','Tocache','Uchiza');
insert into ubigeo (departamento, provincia, distrito) values ('Tacna','Tacna','Tacna');
insert into ubigeo (departamento, provincia, distrito) values ('Tacna','Tacna','Alto de la Alianza');
insert into ubigeo (departamento, provincia, distrito) values ('Tacna','Tacna','Calana');
insert into ubigeo (departamento, provincia, distrito) values ('Tacna','Tacna','Ciudad Nueva');
insert into ubigeo (departamento, provincia, distrito) values ('Tacna','Tacna','Inclan');
insert into ubigeo (departamento, provincia, distrito) values ('Tacna','Tacna','Pachia');
insert into ubigeo (departamento, provincia, distrito) values ('Tacna','Tacna','Palca');
insert into ubigeo (departamento, provincia, distrito) values ('Tacna','Tacna','Pocollay');
insert into ubigeo (departamento, provincia, distrito) values ('Tacna','Tacna','Sama');
insert into ubigeo (departamento, provincia, distrito) values ('Tacna','Tacna','Coronel Gregorio Albarracín Lanchipa');
insert into ubigeo (departamento, provincia, distrito) values ('Tacna','Tacna','La Yarada los Palos');
insert into ubigeo (departamento, provincia, distrito) values ('Tacna','Candarave','Candarave');
insert into ubigeo (departamento, provincia, distrito) values ('Tacna','Candarave','Cairani');
insert into ubigeo (departamento, provincia, distrito) values ('Tacna','Candarave','Camilaca');
insert into ubigeo (departamento, provincia, distrito) values ('Tacna','Candarave','Curibaya');
insert into ubigeo (departamento, provincia, distrito) values ('Tacna','Candarave','Huanuara');
insert into ubigeo (departamento, provincia, distrito) values ('Tacna','Candarave','Quilahuani');
insert into ubigeo (departamento, provincia, distrito) values ('Tacna','Jorge Basadre','Locumba');
insert into ubigeo (departamento, provincia, distrito) values ('Tacna','Jorge Basadre','Ilabaya');
insert into ubigeo (departamento, provincia, distrito) values ('Tacna','Jorge Basadre','Ite');
insert into ubigeo (departamento, provincia, distrito) values ('Tacna','Tarata','Tarata');
insert into ubigeo (departamento, provincia, distrito) values ('Tacna','Tarata','Héroes Albarracín');
insert into ubigeo (departamento, provincia, distrito) values ('Tacna','Tarata','Estique');
insert into ubigeo (departamento, provincia, distrito) values ('Tacna','Tarata','Estique-Pampa');
insert into ubigeo (departamento, provincia, distrito) values ('Tacna','Tarata','Sitajara');
insert into ubigeo (departamento, provincia, distrito) values ('Tacna','Tarata','Susapaya');
insert into ubigeo (departamento, provincia, distrito) values ('Tacna','Tarata','Tarucachi');
insert into ubigeo (departamento, provincia, distrito) values ('Tacna','Tarata','Ticaco');
insert into ubigeo (departamento, provincia, distrito) values ('Tumbes','Tumbes','Tumbes');
insert into ubigeo (departamento, provincia, distrito) values ('Tumbes','Tumbes','Corrales');
insert into ubigeo (departamento, provincia, distrito) values ('Tumbes','Tumbes','La Cruz');
insert into ubigeo (departamento, provincia, distrito) values ('Tumbes','Tumbes','Pampas de Hospital');
insert into ubigeo (departamento, provincia, distrito) values ('Tumbes','Tumbes','San Jacinto');
insert into ubigeo (departamento, provincia, distrito) values ('Tumbes','Tumbes','San Juan de la Virgen');
insert into ubigeo (departamento, provincia, distrito) values ('Tumbes','Contralmirante Villar','Zorritos');
insert into ubigeo (departamento, provincia, distrito) values ('Tumbes','Contralmirante Villar','Casitas');
insert into ubigeo (departamento, provincia, distrito) values ('Tumbes','Contralmirante Villar','Canoas de Punta Sal');
insert into ubigeo (departamento, provincia, distrito) values ('Tumbes','Zarumilla','Zarumilla');
insert into ubigeo (departamento, provincia, distrito) values ('Tumbes','Zarumilla','Aguas Verdes');
insert into ubigeo (departamento, provincia, distrito) values ('Tumbes','Zarumilla','Matapalo');
insert into ubigeo (departamento, provincia, distrito) values ('Tumbes','Zarumilla','Papayal');
insert into ubigeo (departamento, provincia, distrito) values ('Ucayali','Coronel Portillo','Calleria');
insert into ubigeo (departamento, provincia, distrito) values ('Ucayali','Coronel Portillo','Campoverde');
insert into ubigeo (departamento, provincia, distrito) values ('Ucayali','Coronel Portillo','Iparia');
insert into ubigeo (departamento, provincia, distrito) values ('Ucayali','Coronel Portillo','Masisea');
insert into ubigeo (departamento, provincia, distrito) values ('Ucayali','Coronel Portillo','Yarinacocha');
insert into ubigeo (departamento, provincia, distrito) values ('Ucayali','Coronel Portillo','Nueva Requena');
insert into ubigeo (departamento, provincia, distrito) values ('Ucayali','Coronel Portillo','Manantay');
insert into ubigeo (departamento, provincia, distrito) values ('Ucayali','Atalaya','Raymondi');
insert into ubigeo (departamento, provincia, distrito) values ('Ucayali','Atalaya','Sepahua');
insert into ubigeo (departamento, provincia, distrito) values ('Ucayali','Atalaya','Tahuania');
insert into ubigeo (departamento, provincia, distrito) values ('Ucayali','Atalaya','Yurua');
insert into ubigeo (departamento, provincia, distrito) values ('Ucayali','Padre Abad','Padre Abad');
insert into ubigeo (departamento, provincia, distrito) values ('Ucayali','Padre Abad','Irazola');
insert into ubigeo (departamento, provincia, distrito) values ('Ucayali','Padre Abad','Curimana');
insert into ubigeo (departamento, provincia, distrito) values ('Ucayali','Padre Abad','Neshuya');
insert into ubigeo (departamento, provincia, distrito) values ('Ucayali','Padre Abad','Alexander Von Humboldt');
insert into ubigeo (departamento, provincia, distrito) values ('Ucayali','Purús','Purus');

