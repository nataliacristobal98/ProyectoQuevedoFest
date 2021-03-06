--Tablas para QuevedoFest
DROP DATABASE IF EXISTS artistas;
CREATE DATABASE artistas OWNER dbo_daw1_a;

CREATE TABLE agenda (
    id_agenda INT CONSTRAINT agenda_pk PRIMARY KEY,
    fecha DATE NOT NULL,
    prevision_dia VARCHAR(120) NOT NULL
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
    red_social VARCHAR(30)
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

CREATE TABLE celebridades (
    id_celebridad INT CONSTRAINT celebridades_pk PRIMARY KEY,
    nombre VARCHAR(30) NOT NULL
);

CREATE TABLE campo_trabajo (
    campo_trabajo VARCHAR(30) NOT NULL,
    id_celebridad INT NOT NULL,
        CONSTRAINT campo_trabajo_celebridades_id_celebridad_fk FOREIGN KEY (id_celebridad) 
        REFERENCES celebridades (id_celebridad) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE actor_actriz (
    id_act INT CONSTRAINT actor_actriz_pk PRIMARY KEY,
    agencia VARCHAR(15) NOT NULL,
    id_celebridad INT NOT NULL,
        CONSTRAINT actor_actriz_celebridades_id_celebridad_fk FOREIGN KEY (id_celebridad) 
        REFERENCES celebridades (id_celebridad) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE influencer (
    id_influencer INT CONSTRAINT influencer_pk PRIMARY KEY,
    red_social VARCHAR(30) NOT NULL,
    id_celebridad INT NOT NULL,
        CONSTRAINT influencer_celebridades_id_celebridad_fk FOREIGN KEY (id_celebridad) 
        REFERENCES celebridades (id_celebridad) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE invitacion (
    id_invitacion INT CONSTRAINT invitacion_pk PRIMARY KEY,
    codigo_QR VARCHAR(25) NOT NULL UNIQUE,
    fecha DATE NOT NULL,
    id_celebridad INT NOT NULL,
    id_agenda INT NOT NULL,
        CONSTRAINT invitacion_celebridades_id_celebridad_fk FOREIGN KEY (id_celebridad) 
        REFERENCES celebridades (id_celebridad) ON DELETE CASCADE ON UPDATE CASCADE,
        CONSTRAINT invitacion_agenda_id_agenda_fk FOREIGN KEY (id_agenda) 
        REFERENCES agenda (id_agenda) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE artistas(
    id_artistas INT CONSTRAINT artistas_pk PRIMARY KEY,
    nombre  VARCHAR(30) NOT NULL,       
    agencia  VARCHAR(15),
    fecha_turno DATE NOT NULL,
    id_cartel INT NOT NULL,
    id_agenda INT NOT NULL,
        CONSTRAINT artistas_cartel_id_cartel_fk FOREIGN KEY (id_cartel) 
        REFERENCES cartel (id_cartel) ON DELETE CASCADE ON UPDATE CASCADE,
        CONSTRAINT artistas_agenda_id_agenda_fk FOREIGN KEY (id_agenda) 
        REFERENCES agenda (id_agenda) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE speaker (
    id_speaker INT CONSTRAINT speaker_pk PRIMARY KEY,
    tema_charla VARCHAR(50) NOT NULL,
    id_artistas INT NOT NULL,
        CONSTRAINT speaker_artistas_id_artistas_fk FOREIGN KEY (id_artistas) 
        REFERENCES artistas (id_artistas) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE presentador (
    id_presentador  INT CONSTRAINT presentador_pk PRIMARY KEY,
    id_artistas INT NOT NULL,
        CONSTRAINT speaker_artistas_id_artistas_fk FOREIGN KEY (id_artistas) 
        REFERENCES artistas (id_artistas) ON DELETE CASCADE ON UPDATE CASCADE
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
    genero_musical VARCHAR(15) NOT NULL,
    color_oficial VARCHAR(10),
    fecha_debut DATE,
    nombre_fanclub VARCHAR(15),
    id_maquillador INT NOT NULL,
    id_vestuario INT NOT NULL,
    id_artistas INT NOT NULL,
        CONSTRAINT speaker_artistas_id_artistas_fk FOREIGN KEY (id_artistas) 
        REFERENCES artistas (id_artistas) ON DELETE CASCADE ON UPDATE CASCADE,
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

--Datos de inserción
INSERT INTO agenda VALUES(1, '2021-07-06', '2 charlas con 7 speakers, 8 cantantes y 10 invitados');
INSERT INTO agenda VALUES(2, '2021-07-07', '4 charlas con 8 speakers, 6 cantantes, 10 invitados');
INSERT INTO agenda VALUES(3, '2021-07-08', '1 charlas con 4 speakers, 10 cantantes, 10 invitados');

INSERT INTO horario VALUES(1, '2021-07-06', '09:00AM', 'Charla "Compañeros de Piso"', 1);
INSERT INTO horario VALUES(2, '2021-07-06', '13:00PM', 'Concierto Ariana Grande', 1);
INSERT INTO horario VALUES(3, '2021-07-06', '20:00PM', 'Concierto DEAN"', 1);
INSERT INTO horario VALUES(4, '2021-07-07', '09:00AM', 'Charla "Tóxicas"', 2);
INSERT INTO horario VALUES(5, '2021-07-07', '13:00PM', 'Charla "Series Míticas"', 2);
INSERT INTO horario VALUES(6, '2021-07-07', '20:00PM', 'Concierto Jackson Wang"', 2);
INSERT INTO horario VALUES(7, '2021-07-08', '09:00AM', 'Concierto Bad Bunny', 3);
INSERT INTO horario VALUES(8, '2021-07-08', '13:00PM', 'Concierto Jessi', 3);
INSERT INTO horario VALUES(9, '2021-07-08', '20:00PM', 'Concierto Estopa"', 3);

INSERT INTO diseñador VALUES(1, 'Mario Lería', '@marioleria');
INSERT INTO diseñador VALUES(2, 'Lucía Rodríguez Hernandez', '@luciarodher');
INSERT INTO diseñador VALUES(3, 'Lith Galera', '@lilithgalera');

INSERT INTO cartel VALUES(1, '2021-07-06', 200, 1, 1);
INSERT INTO cartel VALUES(2, '2021-07-07', 500, 2, 2);
INSERT INTO cartel VALUES(3, '2021-07-08', 350, 3, 3);

INSERT INTO celebridades VALUES(1, 'Miguel Ánguel Silvestre');
INSERT INTO celebridades VALUES(2, 'Zendaya');
INSERT INTO celebridades VALUES(3, 'Barbie Ferreira');
INSERT INTO celebridades VALUES(4, 'Anya Taylor-Joy');
INSERT INTO celebridades VALUES(5, 'Patri Jordan');
INSERT INTO celebridades VALUES(6, 'Holly Molly');
INSERT INTO celebridades VALUES(7, 'Plastique Tiara');
INSERT INTO celebridades VALUES(8, 'Dyan Bay');

INSERT INTO campo_trabajo VALUES('Cine', 1);
INSERT INTO campo_trabajo VALUES('Cine', 2);
INSERT INTO campo_trabajo VALUES('Cine', 3);
INSERT INTO campo_trabajo VALUES('Series', 4);
INSERT INTO campo_trabajo VALUES('Youtube', 5);
INSERT INTO campo_trabajo VALUES('Youtube', 6);
INSERT INTO campo_trabajo VALUES('Espectaculo', 7);
INSERT INTO campo_trabajo VALUES('Youtube', 8);
INSERT INTO campo_trabajo VALUES('Series', 1);
INSERT INTO campo_trabajo VALUES('Series', 2);

INSERT INTO actor_actriz VALUES(1, 'StartUp', 1);
INSERT INTO actor_actriz VALUES(2, 'NeoAttack', 2);
INSERT INTO actor_actriz VALUES(3, 'PS Management', 3);
INSERT INTO actor_actriz VALUES(4, 'StartUp', 4);

INSERT INTO influencer VALUES(1, '@patri_fitness', 5);
INSERT INTO influencer VALUES(2, '@hollymollyguacamoli', 6);
INSERT INTO influencer VALUES(3, '@plastiqueTiara', 7);
INSERT INTO influencer VALUES(4, '@dyanabayana', 8);

INSERT INTO invitacion VALUES(1, 'LJ245345CO0', '2021-07-06', 1, 1);
INSERT INTO invitacion VALUES(2, 'LP245445COL', '2021-07-06', 2, 1);
INSERT INTO invitacion VALUES(3, 'PF245765CO2', '2021-07-07', 3, 2);
INSERT INTO invitacion VALUES(4, 'VDS428433O0', '2021-07-07', 4, 2);
INSERT INTO invitacion VALUES(5, 'QW244375CLP', '2021-07-06', 5, 1);
INSERT INTO invitacion VALUES(6, 'QE24BD45CO3', '2021-07-08', 6, 3);
INSERT INTO invitacion VALUES(7, '345453413GF', '2021-07-07', 7, 3);
INSERT INTO invitacion VALUES(8, 'DE44534567G', '2021-07-06', 8, 3);

INSERT INTO artistas VALUES(1, 'Samantha Hudson', 'AltaFonte Spain', '2021-07-06', 1, 1);
INSERT INTO artistas VALUES(2, 'Supremme de Luxe', 'Diferenza Music', '2021-07-07', 2, 2);
INSERT INTO artistas VALUES(3, 'Ger', 'Big Creators', '2021-07-08', 3, 3);
INSERT INTO artistas VALUES(4, 'Carolina Iglesias', 'NeoAttack', '2021-07-06', 1, 1);
INSERT INTO artistas VALUES(5, 'Victoria Martín', 'NeoAttack', '2021-07-06', 1, 1);
INSERT INTO artistas VALUES(6, 'MimiXXL', 'Zenith', '2021-07-06', 1, 1);
INSERT INTO artistas VALUES(7, 'Uy Albert', 'Action Catalyst', '2021-07-06', 1, 1);
INSERT INTO artistas VALUES(8, 'Fizpireta', 'NeoAttack', '2021-07-06', 1, 1);
INSERT INTO artistas VALUES(9, 'Andrea Compton', 'StartUp', '2021-07-06', 1, 1);
INSERT INTO artistas VALUES(10, 'Berry', 'PS Management', '2021-07-06', 1, 1);
INSERT INTO artistas VALUES(11, 'Perra de Satán', 'PUF', '2021-07-07', 2, 2);
INSERT INTO artistas VALUES(12, 'Esnorkel', 'PS Management', '2021-07-07', 2, 2);
INSERT INTO artistas VALUES(13, 'Inés Hernand', 'StartUp', '2021-07-07', 2, 2);
INSERT INTO artistas VALUES(14, 'Brays Efe', 'PS Management', '2021-07-07', 2, 2);
INSERT INTO artistas VALUES(15, 'Abi Power', 'Zenith', '2021-07-07', 2, 2);
INSERT INTO artistas VALUES(16, 'Chynthia Lee Fontaine', 'PUF', '2021-07-07', 2, 2);
INSERT INTO artistas VALUES(17, 'Liry Onni', 'Zenith', '2021-07-07', 2, 2);
INSERT INTO artistas VALUES(18, 'Yapura Meri', 'StartUp', '2021-07-07', 2, 2);
INSERT INTO artistas VALUES(19, 'Rodrigo Cortes', 'StartUp', '2021-07-08', 3, 3);
INSERT INTO artistas VALUES(20, 'Javier Cansado', 'NeoAttack', '2021-07-08', 3, 3);
INSERT INTO artistas VALUES(21, 'Juan Gómez-Jurado', 'Zenith', '2021-07-08', 3, 3);
INSERT INTO artistas VALUES(22, 'Arturo González-Campos', 'NeoAttack', '2021-07-08', 3, 3);
INSERT INTO artistas VALUES(23, 'Dua Lipa', 'StartUp', '2021-07-06', 1, 1);
INSERT INTO artistas VALUES(24, 'Ariana Grande', 'PUF', '2021-07-06', 1, 1);
INSERT INTO artistas VALUES(25, 'Lil Nas X', 'NeoAttack', '2021-07-06', 1, 1);
INSERT INTO artistas VALUES(26, 'Nathy Peluso', 'LatMusic', '2021-07-06', 1, 1);
INSERT INTO artistas VALUES(27, 'DEAN', 'Diferenza Music', '2021-07-06', 1, 1);
INSERT INTO artistas VALUES(28, 'BOBBY', 'LatMusic', '2021-07-06', 1, 1);
INSERT INTO artistas VALUES(29, 'MAMAMOO', 'StartUp', '2021-07-06', 1, 1);
INSERT INTO artistas VALUES(30, 'Jonas Brothers', 'Action Catalyst', '2021-07-06', 1, 1);
INSERT INTO artistas VALUES(31, 'Jackson Wang', 'PS Management', '2021-07-07', 2, 2);
INSERT INTO artistas VALUES(32, 'Rosalía', 'PUF', '2021-07-07', 2, 2);
INSERT INTO artistas VALUES(33, 'Bad Bunny', 'StartUp', '2021-07-07', 2, 2);
INSERT INTO artistas VALUES(34, 'Jessi', 'LatMusic', '2021-07-07', 2, 2);
INSERT INTO artistas VALUES(35, 'Stray Kids', 'Big Creators', '2021-07-07', 2, 2);
INSERT INTO artistas VALUES(36, 'PURPLE KISS', 'StartUp', '2021-07-07', 2, 2);
INSERT INTO artistas VALUES(37, 'CHEETAH', 'PUF', '2021-07-08', 3, 3);
INSERT INTO artistas VALUES(38, 'C.Tangana', 'LatMusic', '2021-07-08', 3, 3);
INSERT INTO artistas VALUES(39, 'Destiny Rogers', 'NeoAttack', '2021-07-08', 3, 3);
INSERT INTO artistas VALUES(40, 'Doja Cat', 'StartUp', '2021-07-08', 3, 3);
INSERT INTO artistas VALUES(41, 'Queen Wa$abii', 'LatMusic', '2021-07-08', 3, 3);
INSERT INTO artistas VALUES(42, 'ITZY', 'Big Creators', '2021-07-08', 3, 3);
INSERT INTO artistas VALUES(43, 'BTS', 'StartUp', '2021-07-08', 3, 3);
INSERT INTO artistas VALUES(44, 'Estopa', 'PUF', '2021-07-08', 3, 3);
INSERT INTO artistas VALUES(45, 'Loona', 'NeoAttack', '2021-07-08', 3, 3);
INSERT INTO artistas VALUES(46, 'TWICE', 'StartUp', '2021-07-08', 3, 3);

INSERT INTO presentador VALUES(1, 1);
INSERT INTO presentador VALUES(2, 2);
INSERT INTO presentador VALUES(3, 3);

INSERT INTO speaker VALUES(1, 'Compañeros de piso', 4);
INSERT INTO speaker VALUES(2, 'Compañeros de piso', 5);
INSERT INTO speaker VALUES(3, 'Compañeros de piso', 6);
INSERT INTO speaker VALUES(4, 'Tarot con oyentes', 7);
INSERT INTO speaker VALUES(5, 'Tarot con oyentes', 8);
INSERT INTO speaker VALUES(6, 'Tarot con oyentes', 9);
INSERT INTO speaker VALUES(7, 'Tarot con oyentes', 10);
INSERT INTO speaker VALUES(8, 'Tóxicas', 11);
INSERT INTO speaker VALUES(9, 'Tóxicas', 12);
INSERT INTO speaker VALUES(10, 'Series míticas', 13);
INSERT INTO speaker VALUES(11, 'Series míticas', 14);
INSERT INTO speaker VALUES(12, 'Personajes', 15);
INSERT INTO speaker VALUES(13, 'Personajes', 16);
INSERT INTO speaker VALUES(14, 'Choques culturales', 17);
INSERT INTO speaker VALUES(15, 'Choques culturales', 18);
INSERT INTO speaker VALUES(16, 'Villanos', 19);
INSERT INTO speaker VALUES(17, 'Villanos', 20);
INSERT INTO speaker VALUES(18, 'Villanos', 21);
INSERT INTO speaker VALUES(19, 'Villanos', 22);

INSERT INTO maquillador VALUES(1, 'Trixie Mattel', 'trixie_mattel_makeup@gmail.com', '@trixiecosmetics', 'Maquillaje Drag', 'Paletas Urban Decay / Bases Fenty Beuty');
INSERT INTO maquillador VALUES(2, 'Raquel Barrajón', 'raquel_meikap@gmail.com', NULL, 'Maquillaje de bodas', NULL);
INSERT INTO maquillador VALUES(3, 'Ariel Reck', 'ariel_r_e_c_k@hotmail.com', '@ArielDrag', 'Maquillaje Fantasía', 'Paletas Krash Cosmetics');
INSERT INTO maquillador VALUES(4, 'Mika Teyuta', 'mika_contact@gmail.com', '@mika', 'Maquillaje Fantasía', 'Paletas Urban Decay / Brochas Morphey');

INSERT INTO vestuario VALUES(1, 'Violet Chachki', 'voilet_the_one@gmail.com', '@violetblue', 'Gucci');
INSERT INTO vestuario VALUES(2, 'Mika Teyuta', 'mika_contact@gmail.com', '@mika', 'YSL');
INSERT INTO vestuario VALUES(3, 'Lexson Millington', 'lexxxxsonML@hotmail.com', '@lexsonator', 'Berskha');
INSERT INTO vestuario VALUES(4, 'Wisdom Kaye', 'wis_a_kaye@hotmail.com', '@wisdm', NULL);

INSERT INTO cantante VALUES(1, 'Pop/Retro', 'Hot Pink', '2015-07-03', 'Lovers', 1, 2, 23);
INSERT INTO cantante VALUES(2, 'Pop', 'Rosa', '2017-05-23', 'Arianators', 4, 3 ,23);
INSERT INTO cantante VALUES(3, 'R&B', 'Rojo', '2011-02-12', 'Devils', 4, 2, 25);
INSERT INTO cantante VALUES(4, 'Alternativa', 'Azul', '2018-09-14', NULL, 1, 4, 26);
INSERT INTO cantante VALUES(5, 'Indie', NULL, '2012-05-08', NULL, 3, 4, 27);
INSERT INTO cantante VALUES(6, 'Rap', 'Negro', '2017-02-28', 'MADS', 2, 3, 28);
INSERT INTO cantante VALUES(7, 'Pop', 'Naranja', '2015-02-23', 'MOMOO', 2, 4, 29);
INSERT INTO cantante VALUES(8, 'Pop', NULL, '2009-12-08', 'Sisters', 3, 1, 30);
INSERT INTO cantante VALUES(9, 'Pop', 'Rojo', '2014-03-18', NULL, 3, 2, 31);
INSERT INTO cantante VALUES(10, 'Alternativa', 'Rojo', '2019-02-12', 'Roses', 1, 1, 32);
INSERT INTO cantante VALUES(11, 'Trap', NULL, '2012-09-30', NULL, 4, 2, 33);
INSERT INTO cantante VALUES(12, 'R&B', 'Verde', '2017-03-21', 'Littles', 3, 3, 34);
INSERT INTO cantante VALUES(13, 'Alternativa', 'Amarillo', '2019-02-13', 'STAY', 4, 2, 35);
INSERT INTO cantante VALUES(14, 'Pop', 'Morado', '2021-02-27', 'Kisses', 2, 4, 36);
INSERT INTO cantante VALUES(15, 'R&B', NULL, '2008-09-18', 'Panters', 4, 1, 37);
INSERT INTO cantante VALUES(16, 'Trap', NULL, '2014-01-24', NULL, 3, 2, 38);
INSERT INTO cantante VALUES(17, 'Alternativa', 'Gris', NULL, NULL, 1, 4, 39);
INSERT INTO cantante VALUES(18, 'Pop', 'Hot Pink', '2020-04-27', 'Kittens', 1, 1, 40);
INSERT INTO cantante VALUES(19, 'Trap', 'Verde', '2018-03-16', NULL, 2, 2, 41);
INSERT INTO cantante VALUES(20, 'Alternativa', 'Hot Pink', NULL, 'MITZY', 4, 2, 42);
INSERT INTO cantante VALUES(21, 'Pop/Retro', 'Morado', '2015-07-23', 'ARMY', 1, 4, 43);
INSERT INTO cantante VALUES(22, 'Rock', null, '2006-11-24', NULL, 3, 2, 44);
INSERT INTO cantante VALUES(23, 'Pop', 'Naranja', NULL, 'Orbits', 1, 2, 45);
INSERT INTO cantante VALUES(24, 'Retro', 'Azul', '2017-01-13', 'ONCES', 2, 2, 46);

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

INSERT INTO fanclub VALUES(1, 'Loves', NULL, 1);
INSERT INTO fanclub VALUES(2, 'MOMOO', 'fancafemamamoo.com', 7);

INSERT INTO fan VALUES(1, 'Lisa Rodríguez', '2015-10-23', 'Oro', 2);
INSERT INTO fan VALUES(2, 'Manuel Perez', '2017-03-12', 'Plata', 2);
INSERT INTO fan VALUES(3, 'Anna Vaquerizo', '2017-01-03', 'Oro', 2);
INSERT INTO fan VALUES(4, 'Mirem Navarrete', '2019-05-17', 'Bronce', 2);

INSERT INTO proyecto VALUES(1, 'Mar de luces', 'Lightsticks/Linternas de móvil', 1);
INSERT INTO proyecto VALUES(2, 'Singing Together', NULL, 4);