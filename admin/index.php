<?php
include("../db.php");
session_start();



// Handle form submission for admin login
if(isset($_POST["login_admin"])) {
    // Validate admin credentials
    $email = mysqli_real_escape_string($con, $_POST["email"]);
    $password = $_POST["password"];
    
    $sql = "SELECT * FROM admin_info WHERE admin_email = '$email' AND admin_password = '$password'";
    $run_query = mysqli_query($con, $sql);
    $count = mysqli_num_rows($run_query);

    if($count == 1) {
        $row = mysqli_fetch_array($run_query);
        $_SESSION["admin_id"] = $row["admin_id"];
        $_SESSION["admin_name"] = $row["admin_name"];
        echo "login_success";
        header('Location: profile.php'); // Redirect to admin profile page
        exit;
    } else {
        $error_msg = "Invalid email or password";
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">
  <title>Admin</title>
  <style>
    body {
      width: 100%;
      height: 100vh;
      background-color: #C8A2C8; 
      display: flex;
      justify-content: center;
      align-items: center;
      margin: 0;
    }
   
    .login-container {
      width: 50%;
      max-width: 400px; 
      background-color: #fff; 
      padding: 20px;
      border-radius: 10px;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }
    
    .login-marg {
      display: flex;
      justify-content: center;
    }
    
    .input-borders {
      border: 1px solid #ccc;
      border-radius: 5px;
      padding: 10px;
      margin-bottom: 15px;
      width: 100%;
      box-sizing: border-box;
    }
    .primary-btn {
      background-color:  #C8A2C8;
      color: #fff;
      border: none;
      border-radius: 5px;
      padding: 12px 20px;
      cursor: pointer;
      width: 100%;
      box-sizing: border-box;
    }
    .primary-btn:hover {
      background-color: #0056b3;
    }
    .text-pad {
      text-align: right;
      margin-top: -10px;
    }
    .text-pad a {
      color: #007bff;
    }
    .text-pad a:hover {
      color: #0056b3;
    }
  </style>
</head>

<body>
  <div style="background-color:  #C8A2C8; width: 100%; height: 100%; display: flex; justify-content: center; align-items: center;">
    <div class="login-container">
      <div class="wait overlay">
        <div class="loader"></div>
      </div>
      <div class="container-fluid">
        <div class="login-marg">
          <form method="post" class="login100-form" id="login">
            <div class="billing-details jumbotron">
              <div class="section-title">
                <h2 class="login100-form-title p-b-49">Admin Login</h2>
              </div>
              <?php if(isset($error_msg)) { ?>
                <div class="alert alert-danger"><?php echo $error_msg; ?></div>
              <?php } ?>
              <div class="form-group">
                <label for="email">Email</label>
                <input class="input input-borders" type="email" name="email" placeholder="Email" required>
              </div>
              <div class="form-group">
                <label for="password">Password</label>
                <input class="input input-borders" type="password" name="password" placeholder="Password" required>
              </div>
              <button class="primary-btn btn-block" type="submit" name="login_admin">Login</button>
            </div>
          </form>
        </div>
      </div>
    </div>
  </div>
</body>
</html>