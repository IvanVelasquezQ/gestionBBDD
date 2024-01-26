--Preguntas de la base de datos grupo 2
--1.	¿Cuantos clientes han realizado su registro eléctrico por Distritos en el año 2023?
		select grupo2.distrito.Nomb_Distrito, count(*) as 'Cantidad'
		from grupo2.RegistrosElectricos
		INNER JOIN grupo2.Distrito
		on grupo2.registroselectricos.id_distrito=grupo2.distrito.id_distrito
		where YEAR(grupo2.RegistrosElectricos.Fecha_Puesta_Servicio)=2023
		group by grupo2.distrito.Nomb_distrito
		order by 'Cantidad' desc

--2.	Cuál es la varición de registros realizados del 2022 al 2023?
		select count(*) from grupo2.RegistrosElectricos
		where YEAR(grupo2.RegistrosElectricos.Fecha_Puesta_Servicio)=2022
		
		select count(*) from grupo2.RegistrosElectricos
		where YEAR(grupo2.RegistrosElectricos.Fecha_Puesta_Servicio)=2023

--3.	Qué modelo de controlador es el más instalado por distrito del 2023?
		select Dist.Nomb_Distrito,Cont.Modelo_Controlador, count(*) as 'Cantidad'
		from grupo2.RegistrosElectricos RegElec
		INNER JOIN grupo2.Distrito Dist
		on RegElec.id_distrito=Dist.id_distrito
		INNER JOIN grupo2.Controlador Cont
		on RegElec.id_controlador=Cont.id_Controlador
		group by Cont.Modelo_Controlador,Dist.Nomb_Distrito
		order by 'Cantidad' desc

--4.	Cual es la cantidad de registros eléctricos que se encuentran operativos 2023?
		select count(*) as 'Cantidad Operativos'
		from grupo2.RegistrosElectricos RegElec
		INNER JOIN grupo2.Detalle_Estado Detalle
		on RegElec.id_Detalle_Estado=Detalle.id_Detalle_Estado
		where Detalle.id_Detalle_Estado=1
		
--5.	Cuál es el tipo de tensión de los suministros eléctricos que más solicitan los clientes (M, T) durante los últimos 3 meses?
		select Sumi.Descripcion_Tension, count(*) as 'Cantidad'
		from grupo2.Suministro Sumi
		inner join grupo2.RegistrosElectricos RegElec
		on sumi.id_Suministro=RegElec.id_Suministro
		where MONTH(RegElec.Fecha_Puesta_Servicio)=7 or
		MONTH(RegElec.Fecha_Puesta_Servicio)=6 or
		MONTH(RegElec.Fecha_Puesta_Servicio)=5
		group by Sumi.Descripcion_Tension

--6.	Que marca de batería son los más instalados en el último trimestre?
		select Bate.Marca_Bateria, count(*) as 'Cantidad'
		from grupo2.RegistrosElectricos RegElec
		INNER JOIN grupo2.Bateria Bate
		on RegElec.id_Bateria=bate.id_Bateria
		where MONTH(RegElec.Fecha_Puesta_Servicio)=7 or
		MONTH(RegElec.Fecha_Puesta_Servicio)=6 or
		MONTH(RegElec.Fecha_Puesta_Servicio)=5
		group by Bate.Marca_Bateria
		order by 'Cantidad' desc

--7.	Cuál es la cantidad de suministros instalados de tipo trifásico en el año 2022?
		select Sumi.Descripcion_Tension, count(*) as 'Cantidad'
		from grupo2.Suministro Sumi
		inner join grupo2.RegistrosElectricos RegElec
		on sumi.id_Suministro=RegElec.id_Suministro
		where YEAR(RegElec.Fecha_Puesta_Servicio)=2022 and
		Sumi.Descripcion_Tension='Trifásico'
		group by Sumi.Descripcion_Tension

--8.	Cuál es la marca de batría más instalados en los suministros del 2023?
		select Bate.Marca_Bateria, count(*) as 'Cantidad'
		from grupo2.RegistrosElectricos RegElec
		INNER JOIN grupo2.Bateria Bate
		on RegElec.id_Bateria=bate.id_Bateria
		where YEAR(RegElec.Fecha_Puesta_Servicio)=2023
		group by Bate.Marca_Bateria
		order by 'Cantidad' desc

--9.	Que Distritos solicitan más suministros eléctricos de tipo monofásico en el 2022 y 2023?
		select Dist.Nomb_Distrito, count(*) as 'Cantidad'
		from grupo2.Suministro Sumi
		inner join grupo2.RegistrosElectricos RegElec
		on sumi.id_Suministro=RegElec.id_Suministro
		INNER JOIN grupo2.Distrito Dist
		on RegElec.id_distrito=Dist.id_distrito
		where (YEAR(RegElec.Fecha_Puesta_Servicio)=2022 or
		YEAR(RegElec.Fecha_Puesta_Servicio)=2023) and
		Sumi.Descripcion_Tension='Monofásico'
		group by Dist.Nomb_Distrito

--10.	Cuántos suministros tienen batería con falla en el año 2023?
		select count(*) as 'Cantidad Falla Batería'
		from grupo2.RegistrosElectricos RegElec
		INNER JOIN grupo2.Detalle_Estado Detalle
		on RegElec.id_Detalle_Estado=Detalle.id_Detalle_Estado
		where Detalle.id_Detalle_Estado=2 and
		YEAR(RegElec.Fecha_Puesta_Servicio)=2023