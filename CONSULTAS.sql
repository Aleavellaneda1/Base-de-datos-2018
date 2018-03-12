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
		fac_cab.fac_cab_fecha ="2017-3-7";









# Ejercicio 3.C
# Listar los totales diarios de ventas que se realizaron en Enero del 2016. Por cada día de venta debe salir un 
# renglón que liste el numero de día, el monto total registrado de ese día, el iva total de ese día, el monto neto
# total de ese día y la cantidad de facturas que se realizaron en dicho día. Utilizar la función que dada una 
# fecha retorna el numero correspondiente al día de la fecha. Las columnas deben tener los siguientes nombres: Día, 
# Bruto, Iva, Neto y Cant. Facturas. 

SELECT fac_cab_fecha as 'Dia', fac_cab_monto_bruto as 'Bruto',fac_cab_iva as 'Iva' 'Cant.' 'Facturas' FROM 

FROM 
		fac_cab INNER JOIN fac_det  ON  fac_cab.fac_cab_id = fac_det.fac_cab_id

fac_cab WHERE fac_cab_fecha >= '2016-01-01'
AND fac_cab_fecha <= '2016-01-31'


# Ejercicio 3.D
# Listar los apellidos y nombres de cada vendedor junto con el monto que le corresponde en concepto de 
# comisiones por ventas para el mes de Junio del 2016. Las comisiones se pagan sobre el monto bruto de 
# cada factura. Incluir todos los vendedores (tengan o no ventas en dicho periodo) y tener presente que 
# el campo vend_porc_comis está en formato 99.99 










# Ejercicio 3.E
# Listar los artículos vendidos durante el mes de Marzo del 2016. Por cada articulo listar la 
# descripción del rubro a la cual pertenece, el código de articulo, la descripción del artículo y la 
# cantidad vendida en dicho mes. Excluir artículos que no se vendieron. Ordenar por descripción del 
# rubro y código de articulo.

SELECT
		* 
FROM
		rubro INNER JOIN articulo on  rubro.rubro_id = articulo.rubro_id
	          INNER JOIN fac_det on fac_det.fac_det_id = articulo.rubro_id 
WHERE 
		rubro_desc ="Alimentos y Bebidas"



# Ejercicio 3.F
# Idem punto anterior pero incluyendo los artículos que no se vendieron en Marzo del 2016 
# (es decir mostrando todos los artículos). Aquellos que no se vendieron deben salir en cero en la 
# columna de total vendido











# Ejercicio 3.G
# Listar los rubros para los cuales se vendieron mas de 10 artículos durante el primer trimestre del 2016. 
# Por cada rubro listar el código, la descripción y la cantidad total de artículos vendidos en ese rubro 
# durante dicho periodo. Ordenar el listado por cantidad vendida en forma descendente y código de rubro en 
# forma ascendente (a igualdad de cantidad vendida). No listar rubros que no cumplan con las condiciones 
# dadas.







# Ejercicio 3.H
# Listar los clientes que viven en 'Misiones' a los cuales no se les vendió durante el año 2015 
# (Misiones es el nombre de la provincia y no el cogido). 










# Ejercicio 3.I
# Listar las facturas que se generaron el día 15/03/2016 y que no incluyen artículos del 
# rubro ‘Perfumería’. Por cada factura, listar el punto de venta y el numero de factura.










# Ejercicio 3.J
# Emitir un informe comparativo entre las ventas del año 2014 y el año 2015. El informe debe tener 3 columnas: 
# Código de Artículo, Total vendido en el año 2014 y Total vendido en el año 2015. Tener presente que un 
# artículo puede tener ventas en un año y no en el otro, en cuyo caso debe aparecer igual en el informe.
# Incluir 








# Ejercicio 3.K
# Listar los códigos de artículos que se vendieron a todos los clientes durante el mes de Marzo del 2016. 







# Ejercicio 3.L
# Borrar los clientes a los cuales no se les realizo ninguna venta. 






# Ejercicio 3.M
# Aumentar un 3 % la comisión a los vendedores que en algún mes del año 2015 vendieron mas de 100 artículos. 




# Ejercicio 3.N
# Aumentar el precio de los artículos cuya existencia sea menor al stock mínimo. 
SELECT art_prec_vta, art_prec_vta +100  FROM articulo WHERE  art_stock < art_stock_min;






# Ejercicio 3.Ñ
# Supongamos que se agrega en el modelo una tabla de estadísticas de ventas por provincias con la siguiente 
# estructura: vtas_x_prov(prov_id, anio, mes, cantidades_vendidas, pesos_vendidos) Donde en el atributo 
# cantidades vendidas se quiere almacenar las cantidades vendidas para cada provincia en un año y mes 
# determinado y en el atributo pesos_vendidos se quiere almacenar la suma de los montos netos de las facturas 
# que corresponden a cada provincia en un año y mes determinado. Se pide poblar la tabla con los datos 
# correspondientes al año 2015 asumiendo que dicha tabla no tiene aun valores para el año 2015.