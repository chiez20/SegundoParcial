--Crear funcion que retorne trigger
CREATE OR REPLACE FUNCTION insertar_trigger() RETURNS TRIGGER AS $insertar$
DECLARE BEGIN
	
	INSERT INTO ORDEN_REPARACION
				(dron_id,tec_id,Orden_fecha,orden_comentario)
		   VALUES(OLD.dron_id, 3,current_date,'Revisar');
	RETURN NULL;
END;
$insertar$ LANGUAGE plpgsql;



create TRIGGER actualizar AFTER UPDATE
On Dron FOR EACH ROW
EXECUTE PROCEDURE insertar_trigger();


update Dron set Dron_estado='No funcional'  where dron_id = 2 and dron_estado != 'No funcional'


Select * From Dron order by dron_id
Select*From Orden_Reparacion