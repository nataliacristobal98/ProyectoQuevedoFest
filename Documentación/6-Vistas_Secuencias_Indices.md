## 6-Vistas, secuencias e índices

### 1. Vistas
#### 1. Vista para saber los días del festival.

```sql
CREATE OR REPLACE VIEW diasFestival AS
SELECT fecha FROM agenda;
```

#### 2. Vista para saber la previsión de cada día.

```sql
CREATE OR REPLACE VIEW prevision AS
SELECT prevision_dia as "Previsión", fecha FROM agenda;
```

#### 3. Vista para el horario.

```sql
CREATE OR REPLACE VIEW horarioFestival AS
SELECT fecha, hora, descripcion_evento as "Actividad" FROM horario;
```

#### 4. Vista para saber los diseñadores contratados.

```sql
CREATE OR REPLACE VIEW diseñadoresCartel AS
SELECT nombre as "Diseñador" FROM diseñador
WITH CHECK OPTION;
```

#### 5. Vista para saber los influencers que asisten.

```sql
CREATE OR REPLACE VIEW influencersFestival AS
SELECT c.nombre as "Influencers" 
FROM celebridades c
JOIN influencer i ON (c.id_celebridad = i.id_celebridad);
```

#### 6. Vista para saber los speaker del día 3.

```sql
CREATE OR REPLACE VIEW speakers3 AS
SELECT ar.nombre as "Speakers" 
FROM artistas ar
JOIN speaker s ON (ar.id_artistas = s.id_artistas)
WHERE ar.fecha_turno = '2021-07-08';

```

Resultado:
```
                List of relations
 Schema |        Name         | Type |   Owner
--------+---------------------+------+------------
 public | diasfestival        | view | dbo_daw1_a
 public | diseñadorescartel   | view | dbo_daw1_a
 public | horariofestival     | view | dbo_daw1_a
 public | influencersfestival | view | dbo_daw1_a
 public | prevision           | view | dbo_daw1_a
 public | sepakers3           | view | dbo_daw1_a
(6 rows)

artistas=> select * from speakers3;
        Speakers
------------------------
 Rodrigo Cortes
 Javier Cansado
 Juan Gómez-Jurado
 Arturo González-Campos
(4 rows)
```

### 2. Secuencias
Generamos una secuencia para añadir artistas a partir del 47.

```sql
CREATE SEQUENCE nuevoArtista
INCREMENT 1
START 47;
CREATE SEQUENCE

INSERT INTO artistas VALUES (nextval('nuevoArtista'), 'GOT7', 'Big Creators', '2021-07-06', 1, 1);
INSERT INTO artistas VALUES (nextval('nuevoArtista'), 'One Direction', 'PUF', '2021-07-07', 2, 2);
```
Resultado:
```
id_artistas |         nombre         |     agencia
-------------+------------------------+-----------------
           1 | Samantha Hudson        | AltaFonte Spain
           2 | Supremme de Luxe       | Diferenza Music
           3 | Ger                    | Big Creators
           4 | Carolina Iglesias      | NeoAttack
...
          45 | Loona                  | NeoAttack
          46 | TWICE                  | StartUp
          47 | GOT7                   | Big Creators
          48 | One Direction          | PUF
(48 rows)
```

### 3. Índices
Creamos un índice para los identificadores de artista en la tabla de cantantes.

```sql
CREATE INDEX cantantes_id_artistas_ix
ON cantante(id_artistas);
CREATE INDEX
```
Resultado:
````
artistas-> \d cantante
                         Table "public.cantante"
     Column     |         Type          | Collation | Nullable | Default
----------------+-----------------------+-----------+----------+---------
 id_cantante    | integer               |           | not null |
 genero_musical | character varying(15) |           | not null |
 color_oficial  | character varying(10) |           |          |
 fecha_debut    | date                  |           |          |
 nombre_fanclub | character varying(15) |           |          |
 id_maquillador | integer               |           | not null |
 id_vestuario   | integer               |           | not null |
 id_artistas    | integer               |           | not null |
Indexes:
    "cantante_pk" PRIMARY KEY, btree (id_cantante)  

    "cantantes_id_artistas_ix" btree (id_artistas) ---->Indice creado

Foreign-key constraints:
    "cantante_maquillador_id_maquillador_fk" FOREIGN KEY (id_maquillador) REFERENCES maquillador(id_maquillador) ON UPDATE CASCADE ON DELETE CASCADE
    "cantante_vestuario_id_vestuario_fk" FOREIGN KEY (id_vestuario) REFERENCES vestuario(id_vestuario) ON UPDATE CASCADE ON DELETE CASCADE
    "speaker_artistas_id_artistas_fk" FOREIGN KEY (id_artistas) REFERENCES artistas(id_artistas) ON UPDATE CASCADE ON DELETE CASCADE
Referenced by:
    TABLE "fanclub" CONSTRAINT "fanclub_cantante_id_cantante_fk" FOREIGN KEY (id_cantante) REFERENCES cantante(id_cantante) ON UPDATE CASCADE ON DELETE CASCADE
    TABLE "grupo" CONSTRAINT "grupo_cantante_id_cantante_fk" FOREIGN KEY (id_cantante) REFERENCES cantante(id_cantante) ON UPDATE CASCADE ON DELETE CASCADE
    TABLE "solista" CONSTRAINT "solista_cantante_id_cantante_fk" FOREIGN KEY (id_cantante) REFERENCES cantante(id_cantante) ON UPDATE CASCADE ON DELETE CASCADE
```
