<?php
header('Content-Type: application/json');
include('db_config.php');

$response = array();


 

 

 $checkEmailQuery = " SELECT `ULTRASONIC_ID`, `DEVICE_ID`, `ULTRASONIC_VALUE`, `READING_TIME` FROM `ultrasonic_table` "; // change here.
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

$citydetails['ULTRASONIC_ID'] = $city['ULTRASONIC_ID'];
$citydetails['DEVICE_ID'] = $city['DEVICE_ID'];
$citydetails['ULTRASONIC_VALUE'] = $city['ULTRASONIC_VALUE'];
$citydetails['READING_TIME'] = $city['READING_TIME'];




array_push($citynames,$citydetails);

}
}
 $response["ultrasonic"] = $citynames; // change in response name.
$response["error"] = FALSE;
 $response["message"] = "Successfully City Found.";
 echo json_encode($response);
 exit;
 }
 
?>
