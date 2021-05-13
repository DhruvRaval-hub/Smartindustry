<?php 
header('Content-Type: application/json');
include('db_config.php');

$response = array();

if(isset($_POST["email"]) && isset($_POST["password"])){
    //login user
 
    $email = $_POST['email'];
    $password =  $_POST['password'];
 
    $userQuery = "SELECT `LOGIN_ID`, `EMAIL_ID`, `PASSWORD`, `PHONE_NO`, `ROLE`, `STATUS` FROM `tbl_login` WHERE  EMAIL_ID = '$email' && PASSWORD = '$password'";
    $result = mysqli_query($conn,$userQuery);
  
    if($result->num_rows==0){
         
        $response["error"] = TRUE;
        $response["message"] ="user not found or Invalid login details.";
        $data = array(
        
        "LOGIN_ID" => NULL,
        "EMAIL_ID" => NULL,
        "PASSWORD" => NULL,
        "PHONE_NO" => NULL,
        "PASSWORD" => NULL,
        "ROLE" => NULL,
        "STATUS" => NULL,
        "DOB" => NULL,
        "ADDRESS" => NULL,
        "DP" => NULL,
        
        
        );
        $response["user"] = $data;
    
        echo json_encode($response);
        exit;
    }else
        $user = mysqli_fetch_assoc($result);
        $response["error"] = FALSE;
        $response["message"] = "Successfully logged in.";
        $response["user"] = $user;
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