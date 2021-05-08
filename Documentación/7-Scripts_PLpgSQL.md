## 7-Scripts en PL/pgSQL

### 1. Procedimiento para borrar artistas

```sql
create or replace procedure borrar_artista(
	p_id_art artistas.id_artistas%type
)
language plpgsql
as
$$
declare
   v_id_art artistas.id_artistas%type;
begin
   -- primero comprobar si existe el artista
   select id_artistas from artistas
   into v_id_art
   where id_artistas = p_id_art;
   -- borrar artista
   delete from artistas
   where id_artistas = p_id_art;
   raise notice 'Artista eliminado';
   -- capturar excepciones
   exception
      when no_data_found then 
         raise notice 'El artista % no existe', p_id_art;
      when others then
         raise exception 'Se ha producido en un error inesperado';
end;
$$

CALL borar_artista(47);
```

### 2. Procedimiento que cambie el turno del artista. *

```sql
create or replace procedure cambio_turno_artista(
p_id_art artistas.id_artistas%type,
p_turno_nuevo date
)
language plpgsql
as
$$
declare
  v_id_art artistas.id_artistas%type;
begin
   -- primero comprobar si existe el artista
   select id_artistas from artistas
   into v_id_art
   where id_artistas = p_id_art;
   -- cambiamos el día de su turno
   update artista
   set fecha_turno = p_turno
   where id_artistas = p_id_art;
   raise notice 'Fecha cambiada conn exito';
   -- capturar excepciones
   exception
      when no_data_found then 
         raise notice 'El artista % no existe', p_id_art;
      when others then
         raise exception 'Se ha producido en un error inesperado';
end;
$$

CALL borar_artista(47, '2021-07-07');
```

### 3. Un procedimiento que diga si es speaker el artista introducido por parámetro.

```sql
create or replace procedure artista_speaker(
p_id_art artistas.id_artistas%type
)
language plpgsql
as
$$
declare
  v_id_art artistas.id_artistas%type;
begin
   -- primero comprobar si existe el artista
   select id_artistas from artistas
   into v_id_art
   where id_artistas = p_id_art;
   -- Comprobamos si su id de artista coincide con un speaker
   perform id_artistas from speaker
   where id_artistas = p_id_art;
   --
   if not found then
 raise notice 'El artista % no es speaker', p_id_art;
 else
 raise notice 'El artista es speaker';
 end if;
   -- capturar excepciones
   exception
      when others then
         raise exception 'Se ha producido en un error inesperado';
end;
$$
```

### 4. Un procedimiento que diga el numero de integrantes que tiene un grupo introducido por parámetro.

```sql
create or replace procedure num_grupo(
p_id_grup grupo.id_grupo%type
)
language plpgsql
as
$$
declare
  v_grup grupo.id_grupo%type;
  v_num grupo.num_integrantes%type;
begin
   -- Cargamos las variables con los datos que correspondan al parámetro dado
   select id_grupo from grupo
   into v_grup
   where id_grupo = p_id_grup;
  select num_integrantes from grupo
   into v_num
   where id_grupo = p_id_grup;
   -- Si no encontramos el parámetro se indica y si no se imprime los datos
   if not found then
 raise notice 'La id no corresponde a ningún grupo' ;
 else
 raise notice 'El grupo % tiene % miembros', p_id_grup, v_num;
 end if;
end;
$$
```

### 5. Una función que devuelve el número de cantantes que hay en los artistas.

```sql
create or replace function num_cantantes()
returns integer
language plpgsql
as
$$
declare
   v_art_id artistas.id_artistas%type;
   v_num_cant integer;
begin
   -- primero cargamos la variable con los datos de id_artistas
   select id_artistas from artistas
   into v_art_id;
   -- Contamos el numero de cantantes que hay con uan id que corresponda a ellos
   select count(c.*) 
   from cantante c
   into v_num_cant
   where id_artistas IN 
      (select id_artistas from cantante);
   -- Devolvemos el resultado
   return v_num_cant;
   -- capturar excepciones
   exception
      when others then
         raise exception 'Se ha producido en un error inesperado';
end;
$$

select num_cantantes();
```

### 6. Una función que devuelve el número de youtuber que hay entre las celebridades.

```sql
create or replace function num_yt()
returns integer
language plpgsql
as
$$
declare
   v_celeb_id celebridades.id_celebridad%type;
   v_num_yt integer;
begin
   -- cargamos la variable con los datos de id_artistas
   select id_celebridad from celebridades
   into v_celeb_id;
   -- no solo contamos las celebridades si no que le ponemos la condición con un LIKE
   select count(y.*) 
   from campo_trabajo y
   into v_num_yt
   where id_celebridad IN 
      (select id_celebridad from campo_trabajo where campo_trabajo LIKE 'Youtube');
   -- Devolvemos el resultado
   return v_num_yt;
   -- capturar excepciones
   exception
      when others then
         raise exception 'Se ha producido en un error inesperado';
end;
$$

select num_cantantes();
```

### 7. Mostrar la previsión de la agenda que se indique.

```sql
create or replace procedure mostrar_agenda(
	p_id_agen agenda.id_agenda%type
)
language plpgsql
as
$$
declare
   v_id_agen agenda.id_agenda%type;
   v_fecha agenda.fecha%type;
   v_prev agenda.prevision_dia%type;
begin
   -- Cargamos las variables que necesitaremos para enseñar por pantalla
   select id_agenda from agenda
   into v_id_agen
   where id_agenda = p_id_agen;

   select fecha from agenda
   into v_fecha
   where id_agenda = p_id_agen;

   select prevision_dia from agenda
   into v_prev
   where id_agenda = p_id_agen;
   -- Al coincidir con el parámetro lo enseñamos
   raise notice 'La agenda % con la fecha % tiene previsto: %', p_id_agen, v_fecha, v_prev;
   -- capturar excepciones
   exception
      -- Si no se encuentra se indica
      when no_data_found then 
         raise notice 'El artista % no existe', p_id_agen;
      when others then
         raise exception 'Se ha producido en un error inesperado';
end;
$$

CALL mostrar_agenda(1);
```


