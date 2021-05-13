<?php
header('Content-Type: application/json');
include('db_config.php');

$response = array();


 

 

 $checkEmailQuery = "SELECT `PIR_ID`, `DEVICE_ID`, `PIR_VALUE`, `COUNT`, `READING_TIME` FROM `pir_sensor_table` "; // change here.
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

$citydetails['PIR_ID'] = $city['PIR_ID'];
$citydetails['DEVICE_ID'] = $city['DEVICE_ID'];
$citydetails['PIR_VALUE'] = $city['PIR_VALUE'];
$citydetails['COUNT'] = $city['COUNT'];
$citydetails['READING_TIME'] = $city['READING_TIME'];




array_push($citynames,$citydetails);

}
}
 $response["pir"] = $citynames; // change in response name.
$response["error"] = FALSE;
 $response["message"] = "Successfully City Found.";
 echo json_encode($response);
 exit;
 }
 
?>
