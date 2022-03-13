<?php
// Legolàctics - CargoConnect
// https://legolactics.omicsuab.org/legolactics_cargoconnect.php
// https://www.flaticon.com/packs/user-interface-828

// 1.- IDENTIFICACION nombre de la base, del usuario, clave y servidor
$db_host="myhost";
$db_name="legolactics_cargoconnect";
$db_login="myusername";
$db_pswd="mypassword";

// 2.- CONEXION A LA BASE DE DATOS
$link = new mysqli($db_host, $db_login, $db_pswd, $db_name);

$boton = $_GET['boton']; //nom del botó

///////////////////////////////   INSERTAR USUARI ////////////////////////////////////
if ($boton == "btnNouUsuari"){
    $telefon = $_GET['telefon'];
    $correu_e = $_GET['correu_e'];
    $contrasenya = $_GET['contrasenya'];
    $nom = $_GET['nom'];
    $query="insert into usuaris (telefon, correu_e, contrasenya, nom) values ('$telefon','$correu_e','$contrasenya','$nom')";
$result = mysqli_query($link, $query);
print("Usuari afegit a la base de dades.");
mysqli_close($link);
}

///////////////////////////////   INSERTAR PAQUET ////////////////////////////////////
if ($boton == "btnEnviarPaquet"){
    $id = $_GET['id'];
    $pes = $_GET['pes'];
    $volum = $_GET['volum'];
    $cost = $_GET['cost'];
    $origen = $_GET['origen'];
	$destinacio = $_GET['destinacio'];
	$tipus = $_GET['tipus'];
	$query="insert into paquets (id, pes, volum, cost, origen, destinacio, data_enviament, estat, tipus) values ('$id','$pes','$volum','$cost','$origen','$destinacio',now(),'En trànsit','$tipus')";
$result = mysqli_query($link, $query);

    $emisor = $_GET['telefon'];
    $receptor = $_GET['telefon_receptor'];
    $query="insert into usuaris_paquets (id, emisor, receptor) values ('$id','$emisor','$receptor')";
$result = mysqli_query($link, $query);
print("Paquet afegit a la base de dades.");
mysqli_close($link);
}

///////////////////////////////   ESBORRAR USUARI  ////////////////////////////////////
if ($boton == "btnEliminarUsuari"){
    $telefon = $_GET['telefon'];
    $query="delete from usuaris where telefon='$telefon'";
$result = mysqli_query($link, $query);
print("Usuari esborrat de la base de dades.");
mysqli_close($link);
}

//////////////////////////////   ACTUALIZAR ESTAT PAQUET ///////////////////////////////
if ($boton == "btnActualitzarEstat"){
    $id = $_GET['id'];
    $estat = $_GET['estat'];
	
	$query="SELECT destinacio, receptor FROM paquets INNER JOIN usuaris_paquets ON paquets.id=usuaris_paquets.id WHERE id='$id'";
	$result = mysqli_query($link, $query);
	$paquet = mysqli_fetch_row($result);
	$destinacio = $paquet[0];
	$receptor = $paquet[1];	
	
	// si estat està buit, agafem un espai lliure automàticament
	if ($estat == "") {
		$query="SELECT DISTINCT estat FROM paquets WHERE estat REGEXP '^[0-9]+$'";
		$result = mysqli_query($link, $query);
		while ($paquet = mysqli_fetch_row($result)) {
			$usedids[] = $paquet[0];
		}
		//print(">>>".$usedids[0]."|".$usedids[1]."|".$usedids[2]."|".$usedids[3]."|".$usedids[4]."|");

		for($i=1;$i<=5;$i++){
			if(in_array($i, $usedids)){
			} else {
				$availableids[] = $i;
			}
		}
		//print(">>>".$availableids[0]."|".$availableids[1]."|".$availableids[2]."|".$availableids[3]."|".$availableids[4]."|");
		
		$estat = $availableids[0];
		$print = $estat;
		
	} elseif ($estat == "Recollit") {
		$query="SELECT estat FROM paquets WHERE id='$id'";
		$result = mysqli_query($link, $query);
		$paquet = mysqli_fetch_row($result);
		
		$print = $paquet[0];
		
	} else {
		
		$print = $estat;
	}
		
	$query="update paquets set data_recepcio=now(), estat='$estat' WHERE id='$id'";
	$result = mysqli_query($link, $query);
	
	if ($estat == "Recollit") {
		print($print);
	} else {
		print($print.",".$destinacio.",".$receptor);
	}
	
	mysqli_close($link);
}

///////////////////// LLISTAR PAQUETS PER USUARI  - ENVIATS /////////////////////////////
if ($boton == "btnLlistarPaquetsEnviats"){
	$telefon=$_GET['telefon'];
	$query="SELECT * FROM paquets INNER JOIN usuaris_paquets ON paquets.id = usuaris_paquets.id WHERE emisor='$telefon' ORDER BY data_enviament DESC";
	$result = mysqli_query($link, $query);
	while ($paquet = mysqli_fetch_row($result)) {
		print($paquet[0].",Pes: ".$paquet[1]." g. Volum: ".$paquet[2]." cm3. Cost: ".$paquet[3]." euros. Origen: ".$paquet[4].". Destinació: ".$paquet[5].". Data d'enviament: ".$paquet[6].". Data de recepció: ".$paquet[7].",".$paquet[8]."|");
	}
	mysqli_close($link);
}

///////////////////// LLISTAR PAQUETS PER USUARI  - REBUTS /////////////////////////////
if ($boton == "btnLlistarPaquetsRebuts"){
	$telefon=$_GET['telefon'];
	$query="SELECT * FROM paquets INNER JOIN usuaris_paquets ON paquets.id = usuaris_paquets.id WHERE receptor='$telefon' ORDER BY data_enviament DESC";
	$result = mysqli_query($link, $query);
	while ($paquet = mysqli_fetch_row($result)) {
		print($paquet[0].",Pes: ".$paquet[1]." g. Volum: ".$paquet[2]." cm3. Cost: ".$paquet[3]." euros. Origen: ".$paquet[4].". Destinació: ".$paquet[5].". Data d'enviament: ".$paquet[6].". Data de recepció: ".$paquet[7].",".$paquet[8]."|");
	}
	mysqli_close($link);
}

///////////////////// buscar usuari /////////////////////////////
if ($boton == "btnLogin"){
	$telefon=$_GET['telefon'];
	$query="SELECT * FROM usuaris WHERE telefon='$telefon'";
	$result = mysqli_query($link, $query);
	$usuari = mysqli_fetch_row($result);
	print($usuari[2].",".$usuari[3]);
	mysqli_close($link);
}
?>			