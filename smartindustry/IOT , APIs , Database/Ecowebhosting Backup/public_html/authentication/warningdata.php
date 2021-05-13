<?php
header('Content-Type: application/json');
include('db_config.php');

$response = array();


 

 

 $checkEmailQuery = " SELECT `W_ID`, `DEVICE_ID`, `IR_VALUE`, `ULTRASONIC_VALUE`, `TEMPERATURE_VALUE`, `HUMIDITY_VALUE`, `SMOKE_VALUE`, `FLAME_VALUE`, `SOILM_VALUE`, `LDR_VALUE`, `PIR_VALUE`, `READING_TIME` FROM `warnings_table` "; // change here.
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

$citydetails['W_ID'] = $city['W_ID'];
$citydetails['DEVICE_ID'] = $city['DEVICE_ID'];
$citydetails['IR_VALUE'] = $city['IR_VALUE'];
$citydetails['ULTRASONIC_VALUE'] = $city['ULTRASONIC_VALUE'];
$citydetails['TEMPERATURE_VALUE'] = $city['TEMPERATURE_VALUE'];
$citydetails['HUMIDITY_VALUE'] = $city['HUMIDITY_VALUE'];
$citydetails['SMOKE_VALUE'] = $city['SMOKE_VALUE'];
$citydetails['FLAME_VALUE'] = $city['FLAME_VALUE'];
$citydetails['SOILM_VALUE'] = $city['SOILM_VALUE'];
$citydetails['LDR_VALUE'] = $city['LDR_VALUE'];
$citydetails['PIR_VALUE'] = $city['PIR_VALUE'];
$citydetails['READING_TIME'] = $city['READING_TIME'];




array_push($citynames,$citydetails);

}
}
 $response["warning"] = $citynames; // change in response name.
$response["error"] = FALSE;
 $response["message"] = "Successfully City Found.";
 echo json_encode($response);
 exit;
 }
 
?>
