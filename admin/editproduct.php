<?php
session_start();
include("../db.php");

// Check if the form is submitted for updating the product
if(isset($_POST['btn_update'])) {
    // Retrieve form data
    $product_id = $_POST['product_id'];
    $product_name = $_POST['product_name'];
    $details = $_POST['details'];
    $price = $_POST['price'];
    $product_type = $_POST['product_type'];
    $tags = $_POST['tags'];

    // Picture handling
    $picture_name = $_FILES['picture']['name'];
    $picture_type = $_FILES['picture']['type'];
    $picture_tmp_name = $_FILES['picture']['tmp_name'];
    $picture_size = $_FILES['picture']['size'];

    // Check if a new picture is uploaded
    if(!empty($picture_name)) {
        if($picture_type == "image/jpeg" || $picture_type == "image/jpg" || $picture_type == "image/png" || $picture_type == "image/gif") {
            if($picture_size <= 50000000) {
                $pic_name = time()."_".$picture_name;
                move_uploaded_file($picture_tmp_name, "../product_images/".$pic_name);

                // Update product information with the new picture
                mysqli_query($con, "UPDATE products SET product_cat='$product_type', product_title='$product_name', product_price='$price', product_desc='$details', product_image='$pic_name', product_keywords='$tags' WHERE product_id='$product_id'") or die ("Query incorrect");
            }
        }
    } else {
        // Update product information without changing the picture
        mysqli_query($con, "UPDATE products SET product_cat='$product_type', product_title='$product_name', product_price='$price', product_desc='$details', product_keywords='$tags' WHERE product_id='$product_id'") or die ("Query incorrect");
    }

    // Redirect to the editproduct.php page with success message
    header("location: editproduct.php?product_id=$product_id&success=1");
}

// Fetch product details to pre-fill the form fields if product_id is set in the URL
if(isset($_GET['product_id'])) {
    $product_id = $_GET['product_id'];
    $result = mysqli_query($con, "SELECT * FROM products WHERE product_id='$product_id'");
    if($result && mysqli_num_rows($result) > 0) {
        $row = mysqli_fetch_assoc($result); 
    } else {
       
        exit("Product not found."); 
    }
}

include "sidenav.php";
include "topheader.php";
?>

<div class="content">
    <div class="container-fluid">
        <form action="" method="post" type="form" name="form" enctype="multipart/form-data">
            <div class="row">
                <div class="col-md-7">
                    <div class="card">
                        <div class="card-header card-header-primary">
                            <h5 class="title">Edit Product</h5>
                        </div>
                        <div class="card-body">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label>Product Title</label>
                                        <input type="text" id="product_name" required name="product_name" class="form-control" value="<?php echo isset($row['product_title']) ? $row['product_title'] : ''; ?>">
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="">
                                        <label for="">Change Image</label>
                                        <input type="file" name="picture" class="btn btn-fill btn-success" id="picture">
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label>Description</label>
                                        <textarea rows="4" cols="80" id="details" required name="details" class="form-control"><?php echo isset($row['product_desc']) ? $row['product_desc'] : ''; ?></textarea>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label>Pricing</label>
                                        <input type="text" id="price" name="price" required class="form-control" value="<?php echo isset($row['product_price']) ? $row['product_price'] : ''; ?>">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-5">
                    <div class="card">
                        <div class="card-header card-header-primary">
                            <h5 class="title">Categories</h5>
                        </div>
                        <div class="card-body">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label>Product Category</label>
                                        <input type="number" id="product_type" name="product_type" required class="form-control" value="<?php echo isset($row['product_cat']) ? $row['product_cat'] : ''; ?>">
                                    </div>
                                </div>
                                <!-- Removed the Product Brand field -->
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label>Product Keywords</label>
                                        <input type="text" id="tags" name="tags" required class="form-control" value="<?php echo isset($row['product_keywords']) ? $row['product_keywords'] : ''; ?>">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="card-footer">
                            <input type="hidden" name="product_id" value="<?php echo isset($row['product_id']) ? $row['product_id'] : ''; ?>">
                            <button type="submit" id="btn_update" name="btn_update" class="btn btn-fill btn-primary">Update Product</button>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </div>
</div>

<?php include "footer.php"; ?>
