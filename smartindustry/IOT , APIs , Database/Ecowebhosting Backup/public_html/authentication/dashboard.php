<?php
include('db_config.php');

$response = array();
header('Content-Type: application/json');

 
if(isset($_POST["DEVICE_ID"])){

 $device_id = $_POST['DEVICE_ID'];

 $checkQuery = "SELECT MAX(`FLAME_VALUE`) as 'FLAME_VALUE' FROM `flame_sensor_table` where DEVICE_ID = '1' ";
 $result = mysqli_query($conn,$checkQuery);
 $fetchco2 = mysqli_fetch_array($result);
 $flame = $fetchco2['FLAME_VALUE'];
 
 
 $check1Query = "SELECT MAX(`IR_VALUE`) as 'IR_VALUE' FROM `ir_table` where DEVICE_ID = '1' ";
 $result1 = mysqli_query($conn,$check1Query);
 $fetchflame = mysqli_fetch_array($result1);
 $ir = $fetchflame['IR_VALUE'];
 
 
 $check2Query = "SELECT MAX(`LDR_VALUE`) as 'LDR_VALUE' FROM `ldr_table` where DEVICE_ID = '1'";
 $result2 = mysqli_query($conn,$check2Query);
 $fetchgas = mysqli_fetch_array($result2);
 $ldr = $fetchgas['LDR_VALUE'];
 
 
 $check3Query = "SELECT MAX(`PIR_VALUE`) as 'PIR_VALUE' FROM `pir_sensor_table` where DEVICE_ID = '1'";
 $result3 = mysqli_query($conn,$check3Query);
 $fetchsmoke = mysqli_fetch_array($result3);
 $pir = $fetchsmoke['PIR_VALUE'];
 
 
 $check4Query = "SELECT MAX(`SMOKE_VALUE`) as 'SMOKE_VALUE' FROM `smoke_sensor_table` where DEVICE_ID = '1'";
 $result4 = mysqli_query($conn,$check4Query);
 $fetchsound = mysqli_fetch_array($result4);
 $smoke = $fetchsound['SMOKE_VALUE'];
 
 
 $check5Query = "SELECT MAX(`SOILM_VALUE`) as 'SOILM_VALUE' FROM `soil_mositure_table` where DEVICE_ID = '1'";
 $result5 = mysqli_query($conn,$check5Query);
 $fetchtemp = mysqli_fetch_array($result5);
 $soil = $fetchtemp['SOILM_VALUE'];
 
 
 $check6Query = "SELECT MAX(`HUMIDITY_VALUE`) as 'HUMIDITY_VALUE' FROM `temperature_table` where DEVICE_ID = '1'";
 $result6 = mysqli_query($conn,$check6Query);
 $fetchhum = mysqli_fetch_array($result6);
 $hum = $fetchhum['HUMIDITY_VALUE'];
 
 $check7Query = "SELECT MAX(`TEMPERATURE_VALUE`) as 'TEMPERATURE_VALUE' FROM `temperature_table` where DEVICE_ID = '1'";
 $result7 = mysqli_query($conn,$check7Query);
 $fetchhum = mysqli_fetch_array($result7);
 $temp = $fetchhum['TEMPERATURE_VALUE'];
 
 $check8Query = "SELECT MAX(`ULTRASONIC_VALUE`) as 'ULTRASONIC_VALUE' FROM `ultrasonic_table` where DEVICE_ID = '1'";
 $result8 = mysqli_query($conn,$check8Query);
 $fetchhum = mysqli_fetch_array($result8);
 $ultrasonic = $fetchhum['ULTRASONIC_VALUE'];

 if(!$result)
 {
 $response["error"] = mysqli_error($conn);
 $response["message"] = "Sorry no data found.";
 echo json_encode($response);
 exit;
 }
 else
 {
$response["flame"] = $flame;
$response["ir"] = $ir;
$response["ldr"] = $ldr;
$response["pir"] = $pir;
$response["smoke"] = $smoke;
$response["soil"] = $soil;
$response["hum"] = $hum;
$response["temp"] = $temp;
$response["ultrasonic"] = $ultrasonic;
$response["error"] = FALSE;
$response["message"] = "Successfully data Found.";
echo json_encode($response);
exit;

}
}
 else {

    // Invalid parameters
    $response["error"] = TRUE;
    $response["message"] ="Invalid parameters";
    echo json_encode($response);
exit;}
 
?>