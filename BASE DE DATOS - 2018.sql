CREATE TABLE IF NOT EXISTS rubro(
	rubro_id int NOT NULL AUTO_INCREMENT,
	rubro_desc char(30),
	CONSTRAINT pk_rubro PRIMARY KEY (rubro_id)
);

CREATE TABLE IF NOT EXISTS articulo(
	art_id int NOT NULL AUTO_INCREMENT,
	art_desc char(30), 
	rubro_id int, 
	art_prec_compra decimal(5,2), 
	art_prec_vta decimal(5,2), 
	art_stock int, 
	art_stock_min int,
	CONSTRAINT pk_articulo PRIMARY KEY (art_id),
	CONSTRAINT fk_articulo FOREIGN KEY (rubro_id) REFERENCES rubro(rubro_id)
);

CREATE TABLE IF NOT EXISTS pto_vta(
 	pto_vta_id int(11) NOT NULL AUTO_INCREMENT,
  	pto_vta_descr varchar(50),
  	CONSTRAINT pk_pto_vta PRIMARY KEY (pto_vta_id)
);

CREATE TABLE IF NOT EXISTS vendedor(
	vend_id int NOT NULL AUTO_INCREMENT,
	vend_apellido char(30), 
	vend_nombres char(30), 
	vend_porc_comis decimal(5,2),
	CONSTRAINT pk_vendedor PRIMARY KEY (vend_id)
);

CREATE TABLE IF NOT EXISTS provincia(
	prov_id int NOT NULL AUTO_INCREMENT,
	prov_desc char(70),
	CONSTRAINT pk_provincia PRIMARY KEY (prov_id)
);

CREATE TABLE IF NOT EXISTS localidad(
  	loc_id int NOT NULL AUTO_INCREMENT,
  	loc_des varchar(50),
  	prov_id int,
	CONSTRAINT pk_localidad PRIMARY KEY (loc_id),
  	CONSTRAINT fk_provincia FOREIGN KEY (prov_id) REFERENCES provincia(prov_id)
);

CREATE TABLE IF NOT EXISTS domicilio (
	dom_id int NOT NULL AUTO_INCREMENT,
	dom_calle char(50),
	loc_id int,
	CONSTRAINT pk_domicilio PRIMARY KEY (dom_id),
	CONSTRAINT fk_localidad FOREIGN key (loc_id) REFERENCES localidad(loc_id)
);

CREATE TABLE IF NOT EXISTS cliente(
	clie_id int NOT NULL AUTO_INCREMENT,
	clie_razon char(40), #no se que es lo cargo como nulo
	clie_nombre char(40), 
	dom_id int, 
	CONSTRAINT pk_clientes PRIMARY KEY (clie_id),
	CONSTRAINT fk_domicilio FOREIGN KEY (dom_id) REFERENCES domicilio(dom_id)
);


CREATE TABLE IF NOT EXISTS fac_cab(
	fac_cab_id int(11) NOT NULL, #factura numero
	fac_cab_fecha date NOT NULL, 
	fac_cab_monto_bruto decimal(5,2),  
	fac_cab_iva decimal(5,2),
	clie_id int, 
	vend_id int, 
	pto_vta_id int NOT NULL, 
	CONSTRAINT pk_fac_cab PRIMARY KEY(pto_vta_id,fac_cab_id,fac_cab_fecha),
	CONSTRAINT fk_pto_vta FOREIGN KEY (pto_vta_id) REFERENCES pto_vta(pto_vta_id),
	CONSTRAINT fk_clie_id FOREIGN KEY (clie_id) REFERENCES cliente(clie_id),
	CONSTRAINT fk_vend_id FOREIGN KEY (vend_id) REFERENCES vendedor(vend_id)
	
);


 create table vehiculos(
  patente char(6) not null,
  tipo char(4),
  horallegada time not null,
  horasalida time,
  primary key(patente,horallegada)
 );