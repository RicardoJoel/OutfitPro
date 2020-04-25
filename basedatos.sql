-- Table: public.marca

-- DROP TABLE public.marca;

CREATE TABLE public.marca
(
    codigo integer NOT NULL DEFAULT nextval('marca_codigo_seq'::regclass),
    nombre character varying(500) COLLATE pg_catalog."default" NOT NULL,
    descripcion character varying(500) COLLATE pg_catalog."default" NOT NULL,
    activo boolean NOT NULL DEFAULT true,
    idusuariocreacion integer NOT NULL DEFAULT 0,
    fechahoracreacion timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
    idusuariomodificacion integer NOT NULL DEFAULT 0,
    fechahoramodificacion timestamp without time zone,
    CONSTRAINT marca_pkey PRIMARY KEY (codigo)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.marca
    OWNER to postgres;

-- Table: public.perfil

-- DROP TABLE public.perfil;

CREATE TABLE public.perfil
(
    codigo integer NOT NULL DEFAULT nextval('perfil_codigo_seq'::regclass),
    nombre character varying(500) COLLATE pg_catalog."default" NOT NULL,
    descripcion character varying(500) COLLATE pg_catalog."default" NOT NULL,
    nivelacceso integer NOT NULL DEFAULT 1,
    activo boolean NOT NULL DEFAULT true,
    idusuariocreacion bigint NOT NULL DEFAULT 0,
    fechahoracreacion timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
    idusuariomodificacion bigint NOT NULL DEFAULT 0,
    fechahoramodificacion timestamp without time zone,
    CONSTRAINT perfil_pkey PRIMARY KEY (codigo)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.perfil
    OWNER to postgres;

-- Table: public.comercio

-- DROP TABLE public.comercio;

CREATE TABLE public.comercio
(
    codigo integer NOT NULL DEFAULT nextval('"Comercio_codigo_seq"'::regclass),
    nombre character varying(500) COLLATE pg_catalog."default" NOT NULL,
    ruc character varying(11) COLLATE pg_catalog."default" NOT NULL,
    correo character varying(500) COLLATE pg_catalog."default" NOT NULL,
    telefono character varying(500) COLLATE pg_catalog."default" NOT NULL,
    nombrerepres character varying(500) COLLATE pg_catalog."default" NOT NULL,
    correorepres character varying(500) COLLATE pg_catalog."default" NOT NULL,
    telefonorepres character varying(500) COLLATE pg_catalog."default" NOT NULL,
    activo boolean NOT NULL DEFAULT true,
    idusuariocreacion integer NOT NULL DEFAULT 0,
    fechahoracreacion timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
    idusuariomodificacion integer NOT NULL DEFAULT 0,
    fechahoramodificacion timestamp without time zone,
    CONSTRAINT "Comercio_pkey" PRIMARY KEY (codigo)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.comercio
    OWNER to postgres;