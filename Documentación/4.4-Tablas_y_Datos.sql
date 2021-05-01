--Tablas para QuevedoFest
DROP DATABASE IF EXISTS artistas;
CREATE DATABASE artistas OWNER dbo_daw1_a;

CREATE TABLE organizacion (
    id_organizacion INT CONSTRAINT organizacion_pk PRIMARY KEY,
    nombre VARCHAR(20) NOT NULL,
    jefe_jefa VARCHAR(30) NOT NULL,
    empresa VARCHAR(20) NOT NULL,
    presupuesto INT NOT NULL,
    patrocinador VARCHAR(20)
);

CREATE TABLE agenda (
    id_agenda INT CONSTRAINT agenda_pk PRIMARY KEY,
    fecha DATE NOT NULL,
    prevision_dia VARCHAR(120) NOT NULL,
    id_organizacion INT NOT NULL,
        CONSTRAINT agenda_organizacion_id_organizacion_fk FOREIGN KEY (id_organizacion) 
        REFERENCES organizacion (id_organizacion) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE horario (
    id_horario INT CONSTRAINT horario_pk PRIMARY KEY,
    fecha DATE NOT NULL,
    hora VARCHAR(7) NOT NULL,
    descripcion_evento VARCHAR(60) NOT NULL,
    id_agenda INT NOT NULL,
        CONSTRAINT horario_agenda_id_agenda_fk FOREIGN KEY (id_agenda) 
        REFERENCES agenda (id_agenda) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE diseñador (
    id_diseñador INT CONSTRAINT diseñador_pk PRIMARY KEY,
    nombre VARCHAR(30) NOT NULL,
    red_social VARCHAR(30),
    id_organizacion INT NOT NULL,
        CONSTRAINT diseñador_organizacion_id_organizacion_fk FOREIGN KEY (id_organizacion) 
        REFERENCES organizacion (id_organizacion) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE cartel (
    id_cartel INT CONSTRAINT cartel_pk PRIMARY KEY,
    fecha DATE NOT NULL,
    presupuesto INT NOT NULL,
    id_diseñador INT NOT NULL,
    id_agenda INT NOT NULL,
        CONSTRAINT cartel_diseñador_id_diseñador_fk FOREIGN KEY (id_diseñador) 
        REFERENCES diseñador (id_diseñador) ON DELETE CASCADE ON UPDATE CASCADE,
        CONSTRAINT cartel_agenda_id_agenda_fk FOREIGN KEY (id_agenda) 
        REFERENCES agenda (id_agenda) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE actor_actriz (
    id_act INT CONSTRAINT actor_actriz_pk PRIMARY KEY,
    nombre VARCHAR(30) NOT NULL,
    agencia VARCHAR(15) NOT NULL
);

CREATE TABLE influencer (
    id_influencer INT CONSTRAINT influencer_pk PRIMARY KEY,
    nombre VARCHAR(30) NOT NULL,
    red_social VARCHAR(30) NOT NULL
);

CREATE TABLE celebridades (
    id_celebridad INT CONSTRAINT celebridades_pk PRIMARY KEY,
    id_act INT UNIQUE,
    id_influencer INT UNIQUE,
        CONSTRAINT celebridades_actor_actriz_id_act_fk FOREIGN KEY (id_act) 
        REFERENCES actor_actriz (id_act) ON DELETE CASCADE ON UPDATE CASCADE,
        CONSTRAINT celebridades_influencer_id_influencer_fk FOREIGN KEY (id_influencer) 
        REFERENCES influencer (id_influencer) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE campo_trabajo (
    campo_trabajo VARCHAR(30) NOT NULL,
    id_celebridad INT NOT NULL,
        CONSTRAINT campo_trabajo_celebridades_id_celebridad_fk FOREIGN KEY (id_celebridad) 
        REFERENCES celebridades (id_celebridad) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE invitacion (
    id_invitacion INT CONSTRAINT invitacion_pk PRIMARY KEY,
    codigo_QR VARCHAR(25) NOT NULL UNIQUE,
    fecha DATE NOT NULL,
    id_celebridad INT NOT NULL,
    id_organizacion INT NOT NULL,
        CONSTRAINT invitacion_celebridades_id_celebridad_fk FOREIGN KEY (id_celebridad) 
        REFERENCES celebridades (id_celebridad) ON DELETE CASCADE ON UPDATE CASCADE,
        CONSTRAINT invitacion_organizacion_id_organizacion_fk FOREIGN KEY (id_organizacion) 
        REFERENCES organizacion (id_organizacion) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE speaker (
    id_speaker INT CONSTRAINT speaker_pk PRIMARY KEY,
    nombre  VARCHAR(30) NOT NULL,       
    agencia  VARCHAR(15),
    fecha_turno DATE NOT NULL
);

CREATE TABLE charla (
    tema_charla VARCHAR(50) NOT NULL,
    id_speaker INT NOT NULL,
        CONSTRAINT charla_speaker_id_speaker_fk FOREIGN KEY (id_speaker) 
        REFERENCES speaker (id_speaker) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE presentador (
    id_presentador  INT CONSTRAINT presentador_pk PRIMARY KEY,
    nombre  VARCHAR(30) NOT NULL,       
    agencia  VARCHAR(15),
    fecha_turno DATE NOT NULL
);

CREATE TABLE maquillador (
    id_maquillador INT CONSTRAINT maquillador_pk PRIMARY KEY,
    nombre VARCHAR(30) NOT NULL,
    contacto VARCHAR(40) NOT NULL,
    red_social VARCHAR(30),
    especialidad VARCHAR(20) NOT NULL,
    material VARCHAR(100)
);

CREATE TABLE vestuario (
    id_vestuario INT CONSTRAINT vestuario_pk PRIMARY KEY,
    nombre VARCHAR(30) NOT NULL,
    contacto VARCHAR(40) NOT NULL,
    red_social VARCHAR(30),
    marca_ropa VARCHAR(15)
);

CREATE TABLE cantante (
    id_cantante INT CONSTRAINT cantante_pk PRIMARY KEY,
    nombre  VARCHAR(30) NOT NULL,       
    agencia  VARCHAR(15) NOT NULL,
    fecha_turno DATE NOT NULL,
    genero_musical VARCHAR(15) NOT NULL,
    color_oficial VARCHAR(10),
    fecha_debut DATE,
    nombre_fanclub VARCHAR(15),
    id_maquillador INT NOT NULL,
    id_vestuario INT NOT NULL,
        CONSTRAINT cantante_maquillador_id_maquillador_fk FOREIGN KEY (id_maquillador) 
        REFERENCES maquillador (id_maquillador) ON DELETE CASCADE ON UPDATE CASCADE,
        CONSTRAINT cantante_vestuario_id_vestuario_fk FOREIGN KEY (id_vestuario) 
        REFERENCES vestuario (id_vestuario) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE solista (
    id_solista INT CONSTRAINT solista_pk PRIMARY KEY,
    num_bailarines INT,
    id_cantante INT NOT NULL,
        CONSTRAINT solista_cantante_id_cantante_fk FOREIGN KEY (id_cantante) 
        REFERENCES cantante (id_cantante) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE grupo (
    id_grupo INT CONSTRAINT grupo_pk PRIMARY KEY,
    num_integrantes INT NOT NULL,
    id_cantante INT NOT NULL,
        CONSTRAINT grupo_cantante_id_cantante_fk FOREIGN KEY (id_cantante) 
        REFERENCES cantante (id_cantante) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE artistas(
    id_artistas INT CONSTRAINT artistas_pk PRIMARY KEY,
    id_organizacion INT NOT NULL,
    id_cartel INT NOT NULL,
    id_agenda INT NOT NULL,
    id_speaker INT,
    id_cantante INT,
    id_presentador INT,
        CONSTRAINT artistas_organizacion_id_organizacion_fk FOREIGN KEY (id_organizacion) 
        REFERENCES organizacion (id_organizacion) ON DELETE CASCADE ON UPDATE CASCADE,
        CONSTRAINT artistas_cartel_id_cartel_fk FOREIGN KEY (id_cartel) 
        REFERENCES cartel (id_cartel) ON DELETE CASCADE ON UPDATE CASCADE,
        CONSTRAINT artistas_agenda_id_agenda_fk FOREIGN KEY (id_agenda) 
        REFERENCES agenda (id_agenda) ON DELETE CASCADE ON UPDATE CASCADE,
        CONSTRAINT artistas_speaker_id_speaker_fk FOREIGN KEY (id_speaker) 
        REFERENCES speaker (id_speaker) ON DELETE CASCADE ON UPDATE CASCADE,
        CONSTRAINT artistas_presentador_id_presentador_fk FOREIGN KEY (id_presentador) 
        REFERENCES presentador (id_presentador) ON DELETE CASCADE ON UPDATE CASCADE,
        CONSTRAINT artistas_cantante_id_cantante_fk FOREIGN KEY (id_cantante) 
        REFERENCES cantante (id_cantante) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE fanclub (
    id_fanclub INT CONSTRAINT fanclub_pk PRIMARY KEY,
    nombre VARCHAR(15) NOT NULL,
    pagina_web VARCHAR(50),
    id_cantante INT NOT NULL,
        CONSTRAINT fanclub_cantante_id_cantante_fk FOREIGN KEY (id_cantante) 
        REFERENCES cantante (id_cantante) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE fan(
    id_fan INT CONSTRAINT fan_pk PRIMARY KEY,
    nombre VARCHAR(30) NOT NULL,
    fecha_inscripcion DATE NOT NULL,
    estatus VARCHAR(10) NOT NULL,
    id_fanclub INT NOT NULL,
        CONSTRAINT fan_fanclub_id_fanclub_fk FOREIGN KEY (id_fanclub) 
        REFERENCES fanclub (id_fanclub) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE proyecto(
    id_proyecto INT CONSTRAINT proyecto_id PRIMARY KEY,
    descripcion VARCHAR(60) NOT NULL,
    material VARCHAR(40),
    id_fan INT NOT NULL,
        CONSTRAINT proyecto_fan_id_fan_fk FOREIGN KEY (id_fan) 
        REFERENCES fan (id_fan) ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO organizacion VALUES(161019, 'QuevedoFest', 'Paula Pérez García', 'FILLMORE22', 500000, 'Coca Cola');

INSERT INTO agenda VALUES(1, '2021-07-06', '2 charlas con 7 speakers, 8 cantantes y 10 invitados', 161019);
INSERT INTO agenda VALUES(2, '2021-07-07', '4 charlas con 8 speakers, 6 cantantes, 10 invitados', 161019);
INSERT INTO agenda VALUES(3, '2021-07-08', '1 charlas con 4 speakers, 10 cantantes, 10 invitados', 161019);

INSERT INTO horario VALUES(1, '2021-07-06', '09:00AM', 'Charla "Compañeros de Piso"', 1);
INSERT INTO horario VALUES(2, '2021-07-06', '13:00PM', 'Concierto Ariana Grande', 1);
INSERT INTO horario VALUES(3, '2021-07-06', '20:00PM', 'Concierto DEAN"', 1);
INSERT INTO horario VALUES(4, '2021-07-07', '09:00AM', 'Charla "Tóxicas"', 2);
INSERT INTO horario VALUES(5, '2021-07-07', '13:00PM', 'Charla "Series Míticas"', 2);
INSERT INTO horario VALUES(6, '2021-07-07', '20:00PM', 'Concierto Jackson Wang"', 2);
INSERT INTO horario VALUES(7, '2021-07-08', '09:00AM', 'Concierto Bad Bunny', 3);
INSERT INTO horario VALUES(8, '2021-07-08', '13:00PM', 'Concierto Jessi', 3);
INSERT INTO horario VALUES(9, '2021-07-08', '20:00PM', 'Concierto Estopa"', 3);

INSERT INTO diseñador VALUES(1, 'Mario Lería', '@marioleria', 161019);
INSERT INTO diseñador VALUES(2, 'Lucía Rodríguez Hernandez', '@luciarodher', 161019);
INSERT INTO diseñador VALUES(3, 'Lith Galera', '@lilithgalera', 161019);

INSERT INTO cartel VALUES(1, '2021-07-06', 200, 1, 1);
INSERT INTO cartel VALUES(2, '2021-07-07', 500, 2, 2);
INSERT INTO cartel VALUES(3, '2021-07-08', 350, 3, 3);

INSERT INTO actor_actriz VALUES(1, 'Miguel Ánguel Silvestre', 'StartUp');
INSERT INTO actor_actriz VALUES(2, 'Zendaya', 'NeoAttack');
INSERT INTO actor_actriz VALUES(3, 'Barbie Ferreira', 'PS Management');
INSERT INTO actor_actriz VALUES(4, 'Anya Taylor-Joy', 'StartUp');

INSERT INTO influencer VALUES(1, 'Patri Jordan', '@patri_fitness');
INSERT INTO influencer VALUES(2, 'Holly Molly', '@hollymollyguacamoli');
INSERT INTO influencer VALUES(3, 'Plastique Tiara', '@plastiqueTiara');
INSERT INTO influencer VALUES(4, 'Dyan Bay', '@dyanabayana');

INSERT INTO celebridades VALUES(1, 1, NULL);
INSERT INTO celebridades VALUES(2, 2, NULL);
INSERT INTO celebridades VALUES(3, 3, NULL);
INSERT INTO celebridades VALUES(4, 4, NULL);
INSERT INTO celebridades VALUES(5, NULL, 1);
INSERT INTO celebridades VALUES(6, NULL, 2);
INSERT INTO celebridades VALUES(7, NULL, 3);
INSERT INTO celebridades VALUES(8, NULL, 4);

INSERT INTO campo_trabajo VALUES('Cine', 1);
INSERT INTO campo_trabajo VALUES('Cine', 2);
INSERT INTO campo_trabajo VALUES('Cine', 3);
INSERT INTO campo_trabajo VALUES('Series', 4);
INSERT INTO campo_trabajo VALUES('Youtube', 5);
INSERT INTO campo_trabajo VALUES('Youtube', 6);
INSERT INTO campo_trabajo VALUES('Espectaculo', 7);
INSERT INTO campo_trabajo VALUES('Youtube', 8);

INSERT INTO invitacion VALUES(1, 'LJ245345CO0', '2021-07-06', 1, 161019);
INSERT INTO invitacion VALUES(2, 'LP245445COL', '2021-07-06', 2, 161019);
INSERT INTO invitacion VALUES(3, 'PF245765CO2', '2021-07-07', 3, 161019);
INSERT INTO invitacion VALUES(4, 'VDS428433O0', '2021-07-07', 4, 161019);
INSERT INTO invitacion VALUES(5, 'QW244375CLP', '2021-07-06', 5, 161019);
INSERT INTO invitacion VALUES(6, 'QE24BD45CO3', '2021-07-08', 6, 161019);
INSERT INTO invitacion VALUES(7, '345453413GF', '2021-07-07', 7, 161019);
INSERT INTO invitacion VALUES(8, 'DE44534567G', '2021-07-06', 8, 161019);

INSERT INTO speaker VALUES(1, 'Carolina Iglesias', 'NeoAttack', '2021-07-06');
INSERT INTO speaker VALUES(2, 'Vistoria Martín', 'NeoAttack', '2021-07-06');
INSERT INTO speaker VALUES(3, 'MimiXXL', 'Zenith', '2021-07-06');
INSERT INTO speaker VALUES(4, 'Uy Albert', 'Action Catalyst', '2021-07-06');
INSERT INTO speaker VALUES(5, 'Fizpireta', 'NeoAttack', '2021-07-06');
INSERT INTO speaker VALUES(6, 'Andrea Compton', 'StartUp', '2021-07-06');
INSERT INTO speaker VALUES(7, 'Berry', 'PS Management', '2021-07-06');
INSERT INTO speaker VALUES(8, 'Perra de Satán', 'PUF', '2021-07-07');
INSERT INTO speaker VALUES(9, 'Esnorkel', 'PS Management', '2021-07-07');
INSERT INTO speaker VALUES(10, 'Inés Hernand', 'StartUp', '2021-07-07');
INSERT INTO speaker VALUES(11, 'Brays Efe', 'PS Management', '2021-07-07');
INSERT INTO speaker VALUES(12, 'Abi Power', 'Zenith', '2021-07-07');
INSERT INTO speaker VALUES(13, 'Chynthia Lee Fontaine', 'PUF', '2021-07-07');
INSERT INTO speaker VALUES(14, 'Liry Onni', 'Zenith', '2021-07-07');
INSERT INTO speaker VALUES(15, 'Yapura Meri', 'StartUp', '2021-07-07');
INSERT INTO speaker VALUES(16, 'Rodrigo Cortes', 'StartUp', '2021-07-08');
INSERT INTO speaker VALUES(17, 'Javier Cansado', 'NeoAttack', '2021-07-08');
INSERT INTO speaker VALUES(18, 'Juan Gómez-Jurado', 'Zenith', '2021-07-08');
INSERT INTO speaker VALUES(19, 'Arturo González-Campos', 'NeoAttack', '2021-07-08');

INSERT INTO charla VALUES('Compañeros de piso', 1);
INSERT INTO charla VALUES('Compañeros de piso', 2);
INSERT INTO charla VALUES('Compañeros de piso', 3);
INSERT INTO charla VALUES('Tarot con oyentes', 4);
INSERT INTO charla VALUES('Tarot con oyentes', 5);
INSERT INTO charla VALUES('Tarot con oyentes', 6);
INSERT INTO charla VALUES('Tarot con oyentes', 7);
INSERT INTO charla VALUES('Tóxicas', 8);
INSERT INTO charla VALUES('Tóxicas', 9);
INSERT INTO charla VALUES('Series míticas', 10);
INSERT INTO charla VALUES('Series míticas', 11);
INSERT INTO charla VALUES('Personajes', 12);
INSERT INTO charla VALUES('Personajes', 13);
INSERT INTO charla VALUES('Choques culturales', 14);
INSERT INTO charla VALUES('Choques culturales', 15);
INSERT INTO charla VALUES('Villanos', 16);
INSERT INTO charla VALUES('Villanos', 17);
INSERT INTO charla VALUES('Villanos', 18);
INSERT INTO charla VALUES('Villanos', 19);

INSERT INTO presentador VALUES(1, 'Samantha Hudson', 'AltaFonte Spain', '2021-07-06');
INSERT INTO presentador VALUES(2, 'Supremme de Luxe', 'Diferenza Music', '2021-07-07');
INSERT INTO presentador VALUES(3, 'Ger', 'Big Creators', '2021-07-08');

INSERT INTO maquillador VALUES(1, 'Trixie Mattel', 'trixie_mattel_makeup@gmail.com', '@trixiecosmetics', 'Maquillaje Drag', 'Paletas Urban Decay / Bases Fenty Beuty');
INSERT INTO maquillador VALUES(2, 'Raquel Barrajón', 'raquel_meikap@gmail.com', NULL, 'Maquillaje de bodas', NULL);
INSERT INTO maquillador VALUES(3, 'Ariel Reck', 'ariel_r_e_c_k@hotmail.com', '@ArielDrag', 'Maquillaje Fantasía', 'Paletas Krash Cosmetics');
INSERT INTO maquillador VALUES(4, 'Mika Teyuta', 'mika_contact@gmail.com', '@mika', 'Maquillaje Fantasía', 'Paletas Urban Decay / Brochas Morphey');

INSERT INTO vestuario VALUES(1, 'Violet Chachki', 'voilet_the_one@gmail.com', '@violetblue', 'Gucci');
INSERT INTO vestuario VALUES(2, 'Mika Teyuta', 'mika_contact@gmail.com', '@mika', 'YSL');
INSERT INTO vestuario VALUES(3, 'Lexson Millington', 'lexxxxsonML@hotmail.com', '@lexsonator', 'Berskha');
INSERT INTO vestuario VALUES(4, 'Wisdom Kaye', 'wis_a_kaye@hotmail.com', '@wisdm', NULL);

INSERT INTO cantante VALUES(1, 'Dua Lipa', 'StartUp', '2021-07-06', 'Pop/Retro', 'Hot Pink', '2015-07-03', 'Lovers', 1, 2);
INSERT INTO cantante VALUES(2, 'Ariana Grande', 'PUF', '2021-07-06', 'Pop', 'Rosa', '2017-05-23', 'Arianators', 4, 3);
INSERT INTO cantante VALUES(3, 'Lil Nas X', 'NeoAttack', '2021-07-06', 'R&B', 'Rojo', '2011-02-12', 'Devils', 4, 2);
INSERT INTO cantante VALUES(4, 'Nathy Peluso', 'LatMusic', '2021-07-06', 'Alternativa', 'Azul', '2018-09-14', NULL, 1, 4);
INSERT INTO cantante VALUES(5, 'DEAN', 'Diferenza Music', '2021-07-06', 'Indie', NULL, '2012-05-08', NULL, 3, 4);
INSERT INTO cantante VALUES(6, 'BOBBY', 'LatMusic', '2021-07-06', 'Rap', 'Negro', '2017-02-28', 'MADS', 2, 3);
INSERT INTO cantante VALUES(7, 'MAMAMOO', 'StartUp', '2021-07-06', 'Pop', 'Naranja', '2015-02-23', 'MOMOO', 2, 4);
INSERT INTO cantante VALUES(8, 'Jonas Brothers', 'Action Catalyst', '2021-07-06', 'Pop', NULL, '2009-12-08', 'Sisters', 3, 1);
INSERT INTO cantante VALUES(9, 'Jackson Wang', 'PS Management', '2021-07-07', 'Pop', 'Rojo', '2014-03-18', NULL, 3, 2);
INSERT INTO cantante VALUES(10, 'Rosalía', 'PUF', '2021-07-07', 'Alternativa', 'Rojo', '2019-02-12', 'Roses', 1, 1);
INSERT INTO cantante VALUES(11, 'Bad Bunny', 'StartUp', '2021-07-07', 'Trap', NULL, '2012-09-30', NULL, 4, 2);
INSERT INTO cantante VALUES(12, 'Jessi', 'LatMusic', '2021-07-07', 'R&B', 'Verde', '2017-03-21', 'Littles', 3, 3);
INSERT INTO cantante VALUES(13, 'Stray Kids', 'Big Creators', '2021-07-07', 'Alternativa', 'Amarillo', '2019-02-13', 'STAY', 4, 2);
INSERT INTO cantante VALUES(14, 'PURPLE KISS', 'StartUp', '2021-07-07', 'Pop', 'Morado', '2021-02-27', 'Kisses', 2, 4);
INSERT INTO cantante VALUES(15, 'CHEETAH', 'PUF', '2021-07-08', 'R&B', NULL, '2008-09-18', 'Panters', 4, 1);
INSERT INTO cantante VALUES(16, 'C.Tangana', 'LatMusic', '2021-07-08', 'Trap', NULL, '2014-01-24', NULL, 3, 2);
INSERT INTO cantante VALUES(17, 'Destiny Rogers', 'NeoAttack', '2021-07-08', 'Alternativa', 'Gris', NULL, NULL, 1, 4);
INSERT INTO cantante VALUES(18, 'Doja Cat', 'StartUp', '2021-07-08', 'Pop', 'Hot Pink', '2020-04-27', 'Kittens', 1, 1);
INSERT INTO cantante VALUES(19, 'Queen Wa$abii', 'LatMusic', '2021-07-08', 'Trap', 'Verde', '2018-03-16', NULL, 2, 2);
INSERT INTO cantante VALUES(20, 'ITZY', 'Big Creators', '2021-07-08', 'Alternativa', 'Hot Pink', NULL, 'MITZY', 4, 2);
INSERT INTO cantante VALUES(21, 'BTS', 'StartUp', '2021-07-08', 'Pop/Retro', 'Morado', '2015-07-23', 'ARMY', 1, 4);
INSERT INTO cantante VALUES(22, 'Estopa', 'PUF', '2021-07-08', 'Rock', null, '2006-11-24', NULL, 3, 2);
INSERT INTO cantante VALUES(23, 'Loona', 'NeoAttack', '2021-07-08', 'Pop', 'Naranja', NULL, 'Orbits', 1, 2);
INSERT INTO cantante VALUES(24, 'TWICE', 'StartUp', '2021-07-08', 'Retro', 'Azul', '2017-01-13', 'ONCES', 2, 2);

INSERT INTO solista VALUES(1, 3, 1);
INSERT INTO solista VALUES(2, 13, 2);
INSERT INTO solista VALUES(3, 12, 3);
INSERT INTO solista VALUES(4, 6, 4);
INSERT INTO solista VALUES(5, NULL, 5);
INSERT INTO solista VALUES(6, 5, 6);
INSERT INTO solista VALUES(7, 14, 9);
INSERT INTO solista VALUES(8, NULL, 10);
INSERT INTO solista VALUES(9, 7, 11);
INSERT INTO solista VALUES(10, 9, 12);
INSERT INTO solista VALUES(11, 3, 15);
INSERT INTO solista VALUES(12, 2, 16);
INSERT INTO solista VALUES(13, 1, 17);
INSERT INTO solista VALUES(14, 15, 18);
INSERT INTO solista VALUES(15, 5, 19);

INSERT INTO grupo VALUES(1, 4, 7);
INSERT INTO grupo VALUES(2, 3, 8);
INSERT INTO grupo VALUES(3, 8, 13);
INSERT INTO grupo VALUES(4, 9, 14);
INSERT INTO grupo VALUES(5, 5, 20);
INSERT INTO grupo VALUES(6, 7, 21);
INSERT INTO grupo VALUES(7, 2, 22);
INSERT INTO grupo VALUES(8, 12, 23);
INSERT INTO grupo VALUES(9, 9, 24);

INSERT INTO artistas VALUES(1, 161019, 1, 1, NULL, NULL, 1);
INSERT INTO artistas VALUES(2, 161019, 2, 2, NULL, NULL, 2);
INSERT INTO artistas VALUES(3, 161019, 3, 3, NULL, NULL, 3);
INSERT INTO artistas VALUES(4, 161019, 1, 1, 1, NULL, NULL);
INSERT INTO artistas VALUES(5, 161019, 1, 1, 2, NULL, NULL);
INSERT INTO artistas VALUES(6, 161019, 1, 1, 3, NULL, NULL);
INSERT INTO artistas VALUES(7, 161019, 1, 1, 4, NULL, NULL);
INSERT INTO artistas VALUES(8, 161019, 1, 1, 5, NULL, NULL);
INSERT INTO artistas VALUES(9, 161019, 1, 1, 6, NULL, NULL);
INSERT INTO artistas VALUES(10, 161019, 1, 1, 7, NULL, NULL);
INSERT INTO artistas VALUES(11, 161019, 2, 2, 8, NULL, NULL);
INSERT INTO artistas VALUES(12, 161019, 2, 2, 9, NULL, NULL);
INSERT INTO artistas VALUES(13, 161019, 2, 2, 10, NULL, NULL);
INSERT INTO artistas VALUES(14, 161019, 2, 2, 11, NULL, NULL);
INSERT INTO artistas VALUES(15, 161019, 2, 2, 12, NULL, NULL);
INSERT INTO artistas VALUES(16, 161019, 2, 2, 13, NULL, NULL);
INSERT INTO artistas VALUES(17, 161019, 2, 2, 14, NULL, NULL);
INSERT INTO artistas VALUES(18, 161019, 2, 2, 15, NULL, NULL);
INSERT INTO artistas VALUES(19, 161019, 3, 3, 16, NULL, NULL);
INSERT INTO artistas VALUES(20, 161019, 3, 3, 17, NULL, NULL);
INSERT INTO artistas VALUES(21, 161019, 3, 3, 18, NULL, NULL);
INSERT INTO artistas VALUES(22, 161019, 3, 3, 19, NULL, NULL);
INSERT INTO artistas VALUES(23, 161019, 1, 1, NULL, 1, NULL);
INSERT INTO artistas VALUES(24, 161019, 1, 1, NULL, 2, NULL);
INSERT INTO artistas VALUES(25, 161019, 1, 1, NULL, 3, NULL);
INSERT INTO artistas VALUES(26, 161019, 1, 1, NULL, 4, NULL);
INSERT INTO artistas VALUES(27, 161019, 1, 1, NULL, 5, NULL);
INSERT INTO artistas VALUES(28, 161019, 1, 1, NULL, 6, NULL);
INSERT INTO artistas VALUES(29, 161019, 1, 1, NULL, 7, NULL);
INSERT INTO artistas VALUES(30, 161019, 1, 1, NULL, 8, NULL);
INSERT INTO artistas VALUES(31, 161019, 2, 2, NULL, 9, NULL);
INSERT INTO artistas VALUES(32, 161019, 2, 2, NULL, 10, NULL);
INSERT INTO artistas VALUES(33, 161019, 2, 2, NULL, 11, NULL);
INSERT INTO artistas VALUES(34, 161019, 2, 2, NULL, 12, NULL);
INSERT INTO artistas VALUES(35, 161019, 2, 2, NULL, 13, NULL);
INSERT INTO artistas VALUES(36, 161019, 2, 2, NULL, 14, NULL);
INSERT INTO artistas VALUES(37, 161019, 3, 3, NULL, 15, NULL);
INSERT INTO artistas VALUES(38, 161019, 3, 3, NULL, 16, NULL);
INSERT INTO artistas VALUES(39, 161019, 3, 3, NULL, 17, NULL);
INSERT INTO artistas VALUES(40, 161019, 3, 3, NULL, 18, NULL);
INSERT INTO artistas VALUES(41, 161019, 3, 3, NULL, 19, NULL);
INSERT INTO artistas VALUES(42, 161019, 3, 3, NULL, 20, NULL);
INSERT INTO artistas VALUES(43, 161019, 3, 3, NULL, 21, NULL);
INSERT INTO artistas VALUES(44, 161019, 3, 3, NULL, 22, NULL);
INSERT INTO artistas VALUES(45, 161019, 3, 3, NULL, 23, NULL);
INSERT INTO artistas VALUES(46, 161019, 3, 3, NULL, 24, NULL);

INSERT INTO fanclub VALUES(1, 'Loves', NULL, 1);
INSERT INTO fanclub VALUES(2, 'MOMOO', 'fancafemamamoo.com', 7);

INSERT INTO fan VALUES(1, 'Lisa Rodríguez', '2015-10-23', 'Oro', 2);
INSERT INTO fan VALUES(2, 'Manuel Perez', '2017-03-12', 'Plata', 2);
INSERT INTO fan VALUES(3, 'Anna Vaquerizo', '2017-01-03', 'Oro', 2);
INSERT INTO fan VALUES(4, 'Mirem Navarrete', '2019-05-17', 'Bronce', 2);

INSERT INTO proyecto VALUES(1, 'Mar de luces', 'Lightsticks/Linternas de móvil', 1);
INSERT INTO proyecto VALUES(2, 'Singing Together', NULL, 4);