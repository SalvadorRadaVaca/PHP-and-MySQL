<?php
    $connection = new mysqli("localhost", "root", "040319659", "ssystem") or die("not connected".mysqli_connect_error());

    if(isset($_GET['name'])) {
        $name = $_GET['name'];
        $lastname = $_GET['lastname'];
        $email = $_GET['email'];
        $phone = $_GET['phone'];
        $detail = $_GET['detail'];
        
        $sql = "INSERT INTO customers(name, lastname, email, phone, detail) VALUES ('$name', '$lastname', '$email', '$phone', '$detail')";
        $query = mysqli_query($connection, $sql);
        if($query){
            echo"1 row inserted";
        }else{
            echo mysqli_error($connection);
        }
    }
    mysqli_close($connection);
?>