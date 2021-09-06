<?php
    $connection = new mysqli("localhost", "root", "040319659", "ssystem") or die("not connected".mysqli_connect_error());

    if(isset($_GET['id'])) {
        $id = $_GET['id'];
        
        $sql = "DELETE FROM customers WHERE id = $id";
        $query = mysqli_query($connection, $sql);
        if($query){
            echo"1 row deleted";
        }else{
            echo mysqli_error($connection);
        }
    }
    mysqli_close($connection);
?>