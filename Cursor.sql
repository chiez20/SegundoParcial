--Cursor
do $$
declare
	registro Record;
	Cur_nombres Cursor for select
	*
	from empleado_operador
	INNER JOIN public.empleado on empleado.empleado_id = empleado_operador.empleado_id
	where empleado_operador.emploperad_tiempomanejo >=100;
	
begin
for registro in Cur_nombres loop
Raise Notice 'Id: % Nombre:% % Pais:% DronId:% TiempoManejoHoras: %',
			  registro.emploperad_id, registro.EMPLEADO_NOMBRE , registro.EMPLEADO_APELLIDO, registro.EMPLEADO_PAIS,
			  registro.dron_id,registro.emploperad_tiempomanejo;
end loop;
end $$
Language 'plpgsql';
