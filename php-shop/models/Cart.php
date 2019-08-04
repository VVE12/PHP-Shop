<?php


namespace app\models;


use yii\db\ActiveRecord;

class Cart extends ActiveRecord
{
    public function addToCart($good) {
        if(isset($_SESSION['cart'][$good->id])) {
            $_SESSION['cart'][$good->id]['goodQuantity'] += 1;
        } else {
            $_SESSION['cart'][$good->id] = [
                'goodQuantity' => 1,
                'name' => $good['name'],
                'price' => $good['price'],
                'img' => $good['img'],
            ];
        }
        $_SESSION['cart.totalQuantity'] = isset($_SESSION['cart.totalQuantity']) ? $_SESSION['cart.totalQuantity'] + 1 : 1;
        $_SESSION['cart.totalSum'] = isset($_SESSION['cart.totalSum']) ? $_SESSION['cart.totalSum'] + $good->price : $good->price;
    }

    public function recalcCart($id) {
        $quantity = $_SESSION['cart'][$id]['goodQuantity'];
        $price = $_SESSION['cart'][$id]['price'] * $quantity;
        $_SESSION['cart.totalQuantity'] -= $quantity;
        $_SESSION['cart.totalSum'] -= $price;
        unset($_SESSION['cart'][$id]);
    }
}