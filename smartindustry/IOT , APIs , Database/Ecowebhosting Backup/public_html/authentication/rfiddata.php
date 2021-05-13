<?php
header('Content-Type: application/json');
include('db_config.php');

$response = array();


 

 

 $checkEmailQuery = "SELECT `ALLOCATION_ID`, `EMAIL_ID`, `RFID_KEY`, `DEVICE_ID` FROM `rfid_table`"; // change here.
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

$citydetails['ALLOCATION_ID'] = $city['ALLOCATION_ID'];
$citydetails['EMAIL_ID'] = $city['EMAIL_ID'];
$citydetails['RFID_KEY'] = $city['RFID_KEY'];
$citydetails['DEVICE_ID'] = $city['DEVICE_ID'];
// $citydetails['READING_TIME'] = $city['READING_TIME'];




array_push($citynames,$citydetails);

}
}
 $response["rfid"] = $citynames; // change in response name.
$response["error"] = FALSE;
 $response["message"] = "Successfully City Found.";
 echo json_encode($response);
 exit;
 }
 
?>
