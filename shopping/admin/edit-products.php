<?php
session_start();
include('include/config.php');
if (strlen($_SESSION['alogin']) == 0) {
	header('location:index.php');
} else {
	$pid = intval($_GET['id']); // product id
	if (isset($_POST['submit'])) {
		$category = $_POST['category'];
		$subcat = $_POST['subcategory'];
		$productname = $_POST['bookName'];
		$bookauthor = $_POST['bookAuthor'];
		$bookprice = $_POST['bookPrice'];
		$productpricebd = $_POST['productpricebd'];
		$bookDescription = $_POST['bookDescription'];
		$productscharge = $_POST['productShippingcharge'];
		$bookavailability = $_POST['bookAvailability'];

		$sql = mysqli_query($con, "update  products set category='$category',subCategory='$subcat',bookName='$productname',bookAuthor='$bookauthor',bookPrice='$bookprice',bookDescription='$bookDescription',shippingCharge='$productscharge',bookAvailability='$bookavailability',bookPriceBeforeDiscount='$productpricebd' where id='$pid' ");
		$_SESSION['msg'] = "Product Updated Successfully !!";

	}


	?>
	<!DOCTYPE html>
	<html lang="en">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>Admin| Insert Book</title>
		<link type="text/css" href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
		<link type="text/css" href="bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet">
		<link type="text/css" href="css/theme.css" rel="stylesheet">
		<link type="text/css" href="images/icons/css/font-awesome.css" rel="stylesheet">
		<link type="text/css" href='http://fonts.googleapis.com/css?family=Open+Sans:400italic,600italic,400,600'
			rel='stylesheet'>
		<script src="http://js.nicedit.com/nicEdit-latest.js" type="text/javascript"></script>
		<script type="text/javascript">bkLib.onDomLoaded(nicEditors.allTextAreas);</script>

		<script>
			function getSubcat(val) {
				$.ajax({
					type: "POST",
					url: "get_subcat.php",
					data: 'cat_id=' + val,
					success: function (data) {
						$("#subcategory").html(data);
					}
				});
			}
			function selectCountry(val) {
				$("#search-box").val(val);
				$("#suggesstion-box").hide();
			}
		</script>
	</head>

	<body>
		<?php include('include/header.php'); ?>

		<div class="wrapper">
			<div class="container">
				<div class="row">
					<?php include('include/sidebar.php'); ?>
					<div class="span9">
						<div class="content">

							<div class="module">
								<div class="module-head">
									<h3>Insert Book</h3>
								</div>
								<div class="module-body">

									<?php if (isset($_POST['submit'])) { ?>
										<div class="alert alert-success">
											<button type="button" class="close" data-dismiss="alert">×</button>
											<strong>Well done!</strong>
											<?php echo htmlentities($_SESSION['msg']); ?>
											<?php echo htmlentities($_SESSION['msg'] = ""); ?>
										</div>
									<?php } ?>


									<?php if (isset($_GET['del'])) { ?>
										<div class="alert alert-error">
											<button type="button" class="close" data-dismiss="alert">×</button>
											<strong>Oh snap!</strong>
											<?php echo htmlentities($_SESSION['delmsg']); ?>
											<?php echo htmlentities($_SESSION['delmsg'] = ""); ?>
										</div>
									<?php } ?>

									<br />

									<form class="form-horizontal row-fluid" name="insertproduct" method="post"
										enctype="multipart/form-data">

										<?php

										$query = mysqli_query($con, "select products.*,category.categoryName as catname,category.id as cid,subcategory.subcategory as subcatname,subcategory.id as subcatid from products join category on category.id=products.category join subcategory on subcategory.id=products.subCategory where products.id='$pid'");
										$cnt = 1;
										while ($row = mysqli_fetch_array($query)) {
											?>
											<div class="control-group">
												<label class="control-label" for="basicinput">Category</label>
												<div class="controls">
													<select name="category" class="span8 tip" onChange="getSubcat(this.value);"
														required>
														<option value="<?php echo htmlentities($row['cid']); ?>"><?php echo htmlentities($row['catname']); ?></option>
														<?php $query = mysqli_query($con, "select * from category");
														while ($rw = mysqli_fetch_array($query)) {
															if ($row['catname'] == $rw['categoryName']) {
																continue;
															} else {
																?>

																<option value="<?php echo $rw['id']; ?>"><?php echo $rw['categoryName']; ?></option>
															<?php }
														} ?>
													</select>
												</div>
											</div>

											<div class="control-group">
												<label class="control-label" for="basicinput">Sub Category</label>
												<div class="controls">

													<select name="subcategory" id="subcategory" class="span8 tip" required>
														<option value="<?php echo htmlentities($row['subcatid']); ?>"><?php echo htmlentities($row['subcatname']); ?></option>
													</select>
												</div>
											</div>

											<div class="control-group">
												<label class="control-label" for="basicinput">Book Name</label>
												<div class="controls">
													<input type="text" name="bookName" placeholder="Enter Book Name"
														value="<?php echo htmlentities($row['bookName']); ?>" class="span8 tip">
												</div>
											</div>

											<div class="control-group">
												<label class="control-label" for="basicinput">Book Author</label>
												<div class="controls">
													<input type="text" name="bookAuthor" placeholder="Enter Author Name"
														value="<?php echo htmlentities($row['bookAuthor']); ?>"
														class="span8 tip" required>
												</div>
											</div>
											<div class="control-group">
												<label class="control-label" for="basicinput">Book Price
													Before Discount</label>
												<div class="controls">
													<input type="text" name="productpricebd" placeholder="Enter Book Price"
														value="<?php echo htmlentities($row['bookPriceBeforeDiscount']); ?>"
														class="span8 tip" required>
												</div>
											</div>

											<div class="control-group">
												<label class="control-label" for="basicinput">Book Price</label>
												<div class="controls">
													<input type="text" name="bookPrice" placeholder="Enter Book Price"
														value="<?php echo htmlentities($row['bookPrice']); ?>" class="span8 tip"
														required>
												</div>
											</div>

											<div class="control-group">
												<label class="control-label" for="basicinput">Book Description</label>
												<div class="controls">
													<textarea name="bookDescription" placeholder="Enter Book Description"
														rows="6" class="span8 tip">
																																																																		<?php echo htmlentities($row['bookDescription']); ?>
																																																																		</textarea>
												</div>
											</div>

											<div class="control-group">
												<label class="control-label" for="basicinput">Product Shipping Charge</label>
												<div class="controls">
													<input type="text" name="productShippingcharge"
														placeholder="Enter Product Shipping Charge"
														value="<?php echo htmlentities($row['shippingCharge']); ?>"
														class="span8 tip" required>
												</div>
											</div>

											<div class="control-group">
												<label class="control-label" for="basicinput">Product Availability</label>
												<div class="controls">
													<select name="bookAvailability" id="bookAvailability" class="span8 tip"
														required>
														<option value="<?php echo htmlentities($row['bookAvailability']); ?>">
															<?php echo htmlentities($row['bookAvailability']); ?></option>
														<option value="In Stock">In Stock</option>
														<option value="Out of Stock">Out of Stock</option>
													</select>
												</div>
											</div>

											<div class="control-group">
												<label class="control-label" for="basicinput">Product Image1</label>
												<div class="controls">
													<img src="productimages/<?php echo htmlentities($pid); ?>/<?php echo htmlentities($row['productImage1']); ?>"
														width="200" height="100"> <a
														href="update-image1.php?id=<?php echo $row['id']; ?>">Change Image</a>
												</div>
											</div>

											<div class="control-group">
												<label class="control-label" for="basicinput">Product Image2</label>
												<div class="controls">
													<img src="productimages/<?php echo htmlentities($pid); ?>/<?php echo htmlentities($row['productImage2']); ?>"
														width="200" height="100"> <a
														href="update-image2.php?id=<?php echo $row['id']; ?>">Change Image</a>
												</div>
											</div>

											<div class="control-group">
												<label class="control-label" for="basicinput">Product Image3</label>
												<div class="controls">
													<img src="productimages/<?php echo htmlentities($pid); ?>/<?php echo htmlentities($row['productImage3']); ?>"
														width="200" height="100"> <a
														href="update-image3.php?id=<?php echo $row['id']; ?>">Change Image</a>
												</div>
											</div>
										<?php } ?>
										<div class="control-group">
											<div class="controls">
												<button type="submit" name="submit" class="btn">Update</button>
											</div>
										</div>
									</form>
								</div>
							</div>
						</div><!--/.content-->
					</div><!--/.span9-->
				</div>
			</div><!--/.container-->
		</div><!--/.wrapper-->

		<?php include('include/footer.php'); ?>

		<script src="scripts/jquery-1.9.1.min.js" type="text/javascript"></script>
		<script src="scripts/jquery-ui-1.10.1.custom.min.js" type="text/javascript"></script>
		<script src="bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
		<script src="scripts/flot/jquery.flot.js" type="text/javascript"></script>
		<script src="scripts/datatables/jquery.dataTables.js"></script>
		<script>
			$(document).ready(function () {
				$('.datatable-1').dataTable();
				$('.dataTables_paginate').addClass("btn-group datatable-pagination");
				$('.dataTables_paginate > a').wrapInner('<span />');
				$('.dataTables_paginate > a:first-child').append('<i class="icon-chevron-left shaded"></i>');
				$('.dataTables_paginate > a:last-child').append('<i class="icon-chevron-right shaded"></i>');
			});
		</script>
	</body>
<?php } ?>