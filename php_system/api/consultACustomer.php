<?php
    $connection = new mysqli("localhost", "root", "040319659", "ssystem") or die("not connected".mysqli_connect_error());

    $id = $_GET['id'];

    $sql = "SELECT * FROM customers WHERE id = $id";

    $result = mysqli_query($connection, $sql);

    $customers = array();
    while ($row = mysqli_fetch_array($result)) {
        array_push($customers, $row);
    }

    echo json_encode($customers);

    mysqli_free_result($result);
    mysqli_close($connection);
?>