<?php
require_once 'db_connector.php';
// BD => json
$IMAGES_DIR = "resources/images/";
$array_result = array();

if ($result_referentiel = $mysqli->query("SELECT id_referentiel AS id, label AS text, '".$IMAGES_DIR."article.gif' AS icon, 'folder' AS cls, description AS qtip FROM referentiel_etude")) {
	while($row_referentiel=$result_referentiel->fetch_assoc()) {
		$id_referentiel =   $row_referentiel['id'];
		$query_axe = "SELECT referentiel_axe.id_axe AS id, label AS text,  'folder' AS cls,  '".$IMAGES_DIR."post_go.gif' AS icon, description AS qtip
		FROM referentiel_axe
		INNER JOIN referentiel_axe_etude ON referentiel_axe_etude.id_referentiel =  '".$id_referentiel."'
		AND referentiel_axe_etude.id_axe = referentiel_axe.id_axe";
		if ($result_axe = $mysqli->query($query_axe)) {
			$associated_axes = $result_axe->fetch_all(MYSQLI_ASSOC);	// type of array: MYSQLI_ASSOC, MYSQLI_NUM, or MYSQLI_BOTH
			$row_referentiel["children"] = $associated_axes;
			$result_axe->close();	/* free result set */
		}
		array_push($array_result,$row_referentiel);
	}
	$result_referentiel->close();	/* free result set */
}

// $array_result = array_merge($data1, $data2)

echo json_encode($array_result);

$mysqli->close();
?>