# Ejercicio 2.B
# Agregar la posibilidad de cargar la dirección de correo electrónico y el teléfono para los clientes.
ALTER TABLE cliente ADD correo char(50);
ALTER TABLE cliente ADD telefono int;

# Ejercicio 3.A
# Listar los artículos pertenecientes al rubro '05'. Por cada articulo, listar el código, la descripción 
# y el precio. Ordenar los datos por precio de articulo en forma descendente. 
SELECT art_id, art_desc, art_prec_vta  FROM articulo WHERE rubro_id =5 ORDER  BY `art_prec_vta` DESC;

# Ejercicio 3.B
# Listar los puntos de ventas, números de facturas y el monto total bruto de cada factura para las 
# ventas que realizo el vendedor ‘Ramón Pérez’ el día 25/07/2016
SELECT 	pto_vta_descr as 'Punto de venta', 
		fac_cab_id as 'Factura numero',
		fac_cab_monto_bruto as 'Factura monto bruto'
		FROM 
		pto_vta INNER JOIN fac_cab  ON  pto_vta.pto_vta_id = fac_cab.pto_vta
				INNER JOIN vendedor on vendedor.vend_id = fac_cab.vend_id
		WHERE
		vendedor.vend_apellido="FERNANDEZ" and
		vendedor.vend_nombres="ADRIANA" and
		fac_cab.fac_cab_fecha ="2017-3-6";

# Ejercicio 3.C
# Listar los totales diarios de ventas que se realizaron en Enero del 2016. Por cada día de venta debe salir un 
# renglón que liste el numero de día, el monto total registrado de ese día, el iva total de ese día, el monto neto
# total de ese día y la cantidad de facturas que se realizaron en dicho día. Utilizar la función que dada una 
# fecha retorna el numero correspondiente al día de la fecha. Las columnas deben tener los siguientes nombres: Día, 
# Bruto, Iva, Neto y Cant. Facturas. 

SELECT fac_cab_fecha as 'Dia', fac_cab_monto_bruto as 'Bruto', count(fac_cab_iva) as 'IvaCant. Facturas' FROM 

		fac_cab INNER JOIN   fac_det  ON  fac_cab.fac_cab_id = fac_det.fac_cab_id

WHERE fac_cab_fecha >= '2016-01-01'
AND fac_cab_fecha <= '2016-05-31'












# Ejercicio 3.E
# Listar los artículos vendidos durante el mes de Marzo del 2016. Por cada articulo listar la descripción del 
# rubro a la cual pertenece, el código de articulo, la descripción del artículo y la cantidad vendida en dicho mes.
# Excluir artículos que no se vendieron. Ordenar por descripción del rubro y código de articulo. 


SELECT * 

FROM articulo  INNER JOIN fac_det on articulo.art_id = fac_det.art_id 
	fac_det INNER JOIN fac_cab  ON  fac_cab.fac_cab_id = fac_det.fac_cab_id


WHERE
 fac_cab_fecha >= '2016-01-01'
AND fac_cab_fecha <= '2016-05-31'


