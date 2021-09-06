<?php
    $connection = new mysqli("localhost", "root", "040319659", "ssystem") or die("not connected".mysqli_connect_error());

    if(isset($_GET['name'])) {
        $id = $_GET['id'];
        $name = $_GET['name'];
        $lastname = $_GET['lastname'];
        $email = $_GET['email'];
        $phone = $_GET['phone'];
        $detail = $_GET['detail'];
        
        $sql = "UPDATE customers SET name = '$name', lastname = '$lastname', email = '$email', phone = '$phone', detail = '$detail' WHERE id = $id";
        $query = mysqli_query($connection, $sql);
        if($query){
            echo"1 row updated";
        }else{
            echo mysqli_error($connection);
        }
    }
    mysqli_close($connection);
?>