<?php
header('Content-Type: application/json');
include('db_config.php');

$response = array();

if(isset($_POST["email"]) ){
    //login user
 
    $email = $_POST['email'];
   
    $userQuery = "SELECT `LOGIN_ID`, `EMAIL_ID`, `PASSWORD`, `PHONE_NO`, `ROLE`, `STATUS` FROM `tbl_login` WHERE EMAIL_ID = '$email' ";
     
    //"SELECT `l_name` FROM `tbl_detail` WHERE  l_id = 11";
    $result = mysqli_query($conn,$userQuery);
 
    if($result->num_rows==0){
         
    $response["error"] = TRUE;
$response["message"] = "Sorry Details Not found.";
echo json_encode($response);
exit;
    }else
       
        $user = mysqli_fetch_assoc($result);
$response["error"] = FALSE;
        $response["message"] = "Successfully Found.";
        $response["details"] = $user;
        echo json_encode($response);
        exit;
    }
 
else {

    // Invalid parameters
    $response["error"] = TRUE;
    $response["message"] ="Invalid parameters";
    echo json_encode($response);
exit;}

?>