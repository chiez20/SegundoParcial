--Procedimiento Almacenado
create or replace function obtener_cantidad_reparacion(
	IN tecnico_nombre varchar,
	OUT total_reparaciones varchar
)
as $BODY$
begin 
	select count(distinct reparacion_dron.repdron_id) into total_reparaciones
	from reparacion_dron
	inner join orden_reparacion on orden_reparacion.orden_id = reparacion_dron.orden_id
	inner join empleado_tecnico on empleado_tecnico.tec_id = orden_reparacion.tec_id
	inner join empleado on empleado.empleado_id = empleado_tecnico.empleado_id
	where tecnico_nombre = empleado_nombre;
end $BODY$
language plpgsql;

select * from obtener_cantidad_reparacion('Gustavo') 