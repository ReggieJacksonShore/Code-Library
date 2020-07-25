<?php

  // Check for empty field and validate email email address.
  
  if(empty($_POST['name']) 
    || empty($_POST['email']) 
    || empty($_POST['phone']) 
    || empty($_POST['message']) 
    || !filter_var($_POST['email'], FILTER_VALIDATE_EMAIL)) {
    
    // Set response code
      http_response_code(500);
    
       exit();
  
  } else {

  }

  // 
  
    $name = strip_tags(htmlspecialchars($_POST['name']));
    $email = strip_tags(htmlspecialchars($_POST['email']));
    $phone = strip_tags(htmlspecialchars($_POST['phone']));
    $message = strip_tags(htmlspecialchars($_POST['message']));

  // Create the email and send the message
    
    $to = "Email Address";
    $subject = "Subject";
    $body = "Body";
    $header = "From: noreply@yourdomain.com\n";
    $header .= "Reply-To: Email Address";	
    $header = 'MIME-Version: 1.0' . '\r\n';
    $header .= 'Content-type:text/html;charset=UTF-8' . '\r\n';
    $header .= 'From: <Team@Website.com>' . '\r\n';
    $header .= 'Cc: Red88@aol.com' . '\r\n';
    
  // 

    if(!mail($to, $subject, $body, $header))
      http_response_code(500);

?>