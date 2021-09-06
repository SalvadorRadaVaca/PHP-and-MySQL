<?php
class Car {
    private $brand; 
    private $price;
    private $model;

    function __construct($brand, $price, $model) {
        $this->brand = $brand;
        $this->price = $price;
        $this->model = $model;
    }

    function __get($property) {
        return $this->$property;
    }
}

?>