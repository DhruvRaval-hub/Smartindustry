<?php
header('Content-Type: application/json');
include('db_config.php');

$response = array();

if(isset($_POST["email"]) && isset($_POST["password"]) && isset($_POST["phone"]) && isset($_POST["role"]) )
  {
	  
	
	  $mail = $_POST["email"];
	  $pass = $_POST["password"];
	  $phone = $_POST["phone"];
	  $role = $_POST["role"];
	  
	  
	
	  
	  //check user email whether its already registered
	  $checkEmailQuery = "SELECT * FROM `tbl_login` WHERE EMAIL_ID = '$mail'";
	  $result = mysqli_query($conn,$checkEmailQuery);
	  //print_r(result); exit;
	  
	  if($result->num_rows>0)
	  {
		  $response["error"] = TRUE;
		  $response["message"] = "Sorry email already found.";
		  echo json_encode($response);
		  exit;
	  }
	  else
	  {
		  $signupQuery = "INSERT INTO `tbl_login`(`EMAIL_ID`, `PASSWORD`, `PHONE_NO`, `ROLE`, `STATUS`) VALUES  ('$mail','$pass','$phone','$role', 1)";
		  $signupResult = mysqli_query($conn,$signupQuery);
		  if($signupResult)
		  { 
			  
			  $response["error"] = FALSE;
			  $response["message"] = "Successfully Signed Up.";
			  echo json_encode($response);
			  exit;
		  }
		  else
		  {
		      
		       $response["error"] = TRUE;
			  $response["message"] = "Not Able to do signup!!";
			  echo json_encode($response);
			  exit;
		  }
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