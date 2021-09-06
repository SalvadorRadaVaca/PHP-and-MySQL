<?php 

include('Car.php');

$car = new Car("Ford", 31200, 2017);

$car->price = 132132;
echo $car->price;

?>