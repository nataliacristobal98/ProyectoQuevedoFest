## 6-Vistas, secuencias e índices

### 1. Vistas
#### 1. Vista para saber los días del festival

```sql
CREATE OR REPLACE VIEW diasFestival AS
SELECT fecha FROM agenda;
```

#### 2. Vista para saber la previsión de cada día

```sql
CREATE OR REPLACE VIEW prevision AS
SELECT prevision_dia as "Previsión", fecha FROM agenda;
```

#### 3. Vista para el horario

```sql
CREATE OR REPLACE VIEW horarioFestival AS
SELECT fecha, hora, descripcion_evento as "Actividad" FROM horario;
```

#### 4. Vista para saber los diseñadores contratados

```sql
CREATE OR REPLACE VIEW diseñadoresCartel AS
SELECT nombre as "Diseñador" FROM diseñador
WITH CHECK OPTION;
```

#### 5. Vista para saber los influencers que asisten

```sql
CREATE OR REPLACE VIEW influencersFestival AS
SELECT c.nombre as "Influencers" 
FROM celebridades c
JOIN influencer i ON (c.id_celebridad = i.id_celebridad);
```

#### 6. Vista para saber los speaker del día 3

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
