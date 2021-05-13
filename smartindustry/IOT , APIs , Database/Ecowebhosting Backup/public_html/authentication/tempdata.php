<?php
header('Content-Type: application/json');
include('db_config.php');

$response = array();


 

 

 $checkEmailQuery = " SELECT `TEMP_ID`, `DEVICE_ID`, `TEMPERATURE_VALUE`, `HUMIDITY_VALUE`, `READING_TIME` FROM `temperature_table` "; // change here.
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

$citydetails['TEMP_ID'] = $city['TEMP_ID'];
$citydetails['DEVICE_ID'] = $city['DEVICE_ID'];
$citydetails['TEMPERATURE_VALUE'] = $city['TEMPERATURE_VALUE'];
$citydetails['HUMIDITY_VALUE'] = $city['HUMIDITY_VALUE'];
$citydetails['READING_TIME'] = $city['READING_TIME'];




array_push($citynames,$citydetails);

}
}
 $response["Temperature"] = $citynames; // change in response name.
$response["error"] = FALSE;
 $response["message"] = "Successfully City Found.";
 echo json_encode($response);
 exit;
 }
 
?>
