<?php
header('Content-Type: application/json');
include('db_config.php');

$response = array();



if(isset($_POST["rfidvalue"]) && isset($_POST["emailvalue"]))
{
	  

	  $rfidvalue = $_POST["rfidvalue"];
	  $email = $_POST["emailvalue"];


	  $query = "INSERT INTO `rfid_table`( `EMAIL_ID`, `RFID_KEY`, `DEVICE_ID`) VALUES ('$emailvalue','$rfidvalue','1')";
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