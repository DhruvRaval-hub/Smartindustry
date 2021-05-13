<?php
include('db_config.php');

$response = array();
header('Content-Type: application/json');


if(isset($_GET["key"]) )
{


 $data = $_GET["key"];
 


 $checkQuery = "SELECT `ALLOCATION_ID`, `EMAIL_ID`, `RFID_KEY`, `DEVICE_ID` FROM `rfid_table` WHERE `RFID_KEY`= '$data'";
 $result = mysqli_query($conn,$checkQuery);
 
 if($result->num_rows == 0)
 {
 $response["error"] = TRUE;
 $response["message"] = "unable to find record.";
 echo json_encode($response);
 exit;
 }
 else
 {

 	$getaid = mysqli_fetch_array($result);
 	$aid = $getaid['ALLOCATION_ID'];

	$ls = "IN";
	 
	 $sdd = "SELECT `ATTENDANCE_ID`, `ALLOCATION_ID`, `STATUS`, `TIME` FROM `attendance_table` WHERE ALLOCATION_ID='$aid' ORDER BY `ATTENDANCE_ID` DESC LIMIT 1";
	 $res = mysqli_query($conn,$sdd);
	$getdata = mysqli_fetch_array($res);
	$status = $getdata['STATUS'];

	if($status==null || $status == "IN")
	{
	$ls = "OUT";
	}



 

 $q = "INSERT INTO `attendance_table`(`ALLOCATION_ID`, `STATUS`, `TIME`) VALUES  ('$aid','$ls',CURRENT_TIMESTAMP())";
 $exe = mysqli_query($conn,$q);
 
   $s = "SELECT `ALLOCATION_ID` ,`STATUS` FROM `attendance_table` WHERE ALLOCATION_ID='$aid' ORDER BY `ATTENDANCE_ID` DESC LIMIT 1";
 $res = mysqli_query($conn,$s);
 $getdata = mysqli_fetch_array($res);
 $status1 = $getdata['STATUS'];
 
 if($exe)
 {
 $response["error"] = FALSE;
 $response["message"] = " Status Updated.";
 $response["status"] = $status1;
 
 echo json_encode($response);
 exit;
 }
 else
 {
 $response["error"] = TRUE;
 $response["message"] = "unable to find recordDDDDDD.";
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