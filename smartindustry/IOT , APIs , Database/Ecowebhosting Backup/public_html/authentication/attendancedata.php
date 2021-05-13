<?php
header('Content-Type: application/json');
include('db_config.php');

$response = array();


 

 

 $checkEmailQuery = "SELECT `ATTENDANCE_ID`, `ALLOCATION_ID`, `STATUS`, `TIME` FROM `attendance_table` "; // change here.

 $result = mysqli_query($conn,$checkEmailQuery);

  $numrow = mysqli_num_rows($result);
 
 if($result->num_rows == 0)
 {
 $response["error"] = TRUE;
 $response["message"] = "Sorry no city found.";
 echo json_encode($response);
 exit;
 }
 else
 {
 

$citynames = array();

for($i=1;$i<=$numrow;$i++)
{
 while($city = mysqli_fetch_assoc($result))
 {

$citydetails['ATTENDANCE_ID'] = $city['ATTENDANCE_ID'];
$aid = $city['ALLOCATION_ID'];

$q = "SELECT `EMAIL_ID` FROM rfid_table WHERE ALLOCATION_ID = '$aid'";
$exe = mysqli_query($conn,$q);
$getmail = mysqli_fetch_array($exe);
$email = $getmail['EMAIL_ID'];

$citydetails['ALLOCATION_ID'] = $email;
// $citydetails['EMAIL'] = $email;

$citydetails['STATUS'] = $city['STATUS'];
$citydetails['TIME'] = $city['TIME'];




array_push($citynames,$citydetails);

}
}
 $response["attendace"] = $citynames; // change in response name.
$response["error"] = FALSE;
 $response["message"] = "Successfully user Found.";
 echo json_encode($response);
 exit;
 }
 
?>
