<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
	<head>
		<title>New Customer</title>
		<meta name="GENERATOR" content="PHP">

</head>	
<body style="background-color:#F0F0F0 ;">
		<table align="middle" cellpadding="10">
		<tr>
    <td>
      <h1>Armadillo Trading Post</h1>
      <font size="3">10 Possum Rd<br/>
      Hobbiton, Louisiana  71113<br/>
      phone: 902-555-9837</td>
		<td>
		<!--BC logo and slogan -->
		<img alt="Picture of Trading Post" src="bayou country2.JPG" align="middle" width="400" height="240" /><br />
		<big><em>"Where equipment is as strong as the cypress of the swamp"</em></big></td>
	<table cellpadding="10" align="center">
		<tr><td>
		<h3><a href="armadilloHome.htm">Home</a> &nbsp;&nbsp;&nbsp;
		<a href="Inventory.php">Inventory</a>&nbsp;&nbsp;&nbsp;
		<a href="addInventory.php">Add Inventory</a> &nbsp;&nbsp;&nbsp;
		<a href="Customer.php">Customer Form</a>&nbsp;&nbsp;&nbsp;
		<a href="OrderForm.htm">Order Form</a>
		</h3></td></table>

<table><tr><td>
<?php
$user="root";
$host="localhost";
$password="";
$database="armadillooutdoor";
$cxn=mysqli_connect($host,$user,$password,$database)
        or die ("couldn't connect to server");
$query ="SELECT * FROM `customer_family`";;
$result=mysqli_query($cxn,$query)
        or die ("Couldn't execute query.");

           
    /* Display results in a table */
    echo "<table cellspacing='10' border='1'>\n";
    echo "<tr><td colspan='6'><h2>Customers</h2>&nbsp;&nbsp;</td></tr>\n";
    echo "<tr><th>Customer ID</th><th>First Name</td><td>Last Name</th><th>Address</th><th>City</th>
    <th>State</th><th>ZIP</th><th>Relationship</th></tr>\n";
    while ($row=mysqli_fetch_assoc($result))
    {
      extract($row);
      echo "<tr>\n
            <td><center>$customerId</center></td>\n
            <td>$firstName</td>\n
            <td>$lastName</td>\n
            <td>$address</td>\n
            <td>$city</td>\n
            <td>$state</td>\n
            <td>$zip</td>\n
            <td>$email</td>\n
            </tr>\n";
      echo "<tr><td colspan='5'></td></tr>\n";
      }
      echo "</table>\n";
  ?>
  </td>
  <td align="center" valign="top">
  <form name="frmCustomer" action="CustValidate php.php" method = "get">
  <table align=center width=700 height=121><tr><td>
    First Name:&nbsp;<input type="varchar(6)" name=firstName style="width: 100px" />
    Last Name:&nbsp;<input type="varchar(25)" name=lastName style="width: 150px" /></td></tr>
    <tr><td>Address:&nbsp;<input type="varchar(75)" name=address style="width: 150px" />
   <tr><td>City:&nbsp; <input type="varchar(255)" name=city style="width: 100px" />&nbsp;
    State:&nbsp; &nbsp;<select name=State size=1/>
				<option selected>LA</option>
				<option>TX</option>
				<option>MS</option>
				<option>AR</option>
				</select>&nbsp;&nbsp;
    Zip:&nbsp;<input type=int name=zip style="width: 100px" /></td></tr>
    <tr><td>Email:&nbsp;<input type=int name=email style="width: 100px" />
   </td></tr>
   <tr><td><INPUT TYPE="submit" value="Submit">
    <input type="reset" value="Reset"></td></tr></table>
  </form>
</td></tr></table>
</body>
</html>
