<?php
header('Content-Type: application/json');
include('db_config.php');

$response = array();



if(isset($_GET["ir"]) && isset($_GET["ultrasonic"]) && isset($_GET["temp"]) && isset($_GET["hum"]) && isset($_GET["smoke"]) && isset($_GET["flame"]) && isset($_GET["soil"]) && isset($_GET["ldr"]) && isset($_GET["pir"]))
{
	  
	  $ir = $_GET["ir"];
	  $ultrasonic = $_GET["ultrasonic"];
	  $temp = $_GET["temp"];
	  $hum = $_GET["hum"];
	  $smoke = $_GET["smoke"];
	  $flame = $_GET["flame"];
	  $soil = $_GET["soil"];
	  $ldr = $_GET["ldr"];
	  $pir = $_GET["pir"];

	  $query = "INSERT INTO `warnings_table`( `DEVICE_ID`, `IR_VALUE`, `ULTRASONIC_VALUE`, `TEMPERATURE_VALUE`, 
	  `HUMIDITY_VALUE`, `SMOKE_VALUE`, `FLAME_VALUE`, `SOILM_VALUE`, `LDR_VALUE`, `PIR_VALUE`, `READING_TIME`) 
	  VALUES ('1','$ir','$ultrasonic','$temp','$hum','$smoke','$flame','$soil','$ldr','$pir',CURRENT_TIMESTAMP())";
	  $result = mysqli_query($conn,$query);
	  
	
	
	  
	  if($result)
	  {
	
		  
			  $response["error"] = FALSE;
			  $response["message"] = "Successfully added.";
			  echo json_encode($response);
			  exit;
	  }
	  else
	  {
		  
	  	  $response["error"] = TRUE;
		  $response["message"] = "Sorry not able to insert";
		  $response["errr"] = mysqli_error($conn);
		  echo json_encode($response);
			  
		  
	  }
}
  else
  {
	  //Invalid parameters
	  $response["error"] = TRUE;
	  $response["message"] = "Invalid Parameters";
	 
	  echo json_encode($response);
	  exit;
  }
?>