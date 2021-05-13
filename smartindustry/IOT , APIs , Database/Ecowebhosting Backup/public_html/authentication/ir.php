<?php
header('Content-Type: application/json');
include('db_config.php');

$response = array();



if(isset($_GET["irvalue"]))
{
	  

	  $irvalue = $_GET["irvalue"];
	 

	  $query = "INSERT INTO `ir_table`( `DEVICE_ID`, `COUNT`, `IR_VALUE`, `READING_TIME`) VALUES ('1','1','$irvalue',CURRENT_TIMESTAMP())";
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