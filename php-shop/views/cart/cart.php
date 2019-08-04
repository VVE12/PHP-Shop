<h2 style="...">Корзина</h2>

<?
if ($session['cart']) {
?>

<table class="table table-striped">
    <thead>
        <tr>
            <th scope="col">Фото</th>
            <th scope="col">Наименование</th>
            <th scope="col">Количество</th>
            <th scope="col">Цена</th>
            <th scope="col"></th>
        </tr>
    </thead>
    <tbody>
    <? foreach ($session['cart'] as $id => $good) { ?>
        <tr>
            <td style="..." width="150"><img src="/img/<?=$good['img']?>" alt="<?=$good['name']?>"></td>
            <td style="..." ><?=$good['name']?></td>
            <td style="..." ><?=$good['goodQuantity']?></td>
            <td style="..." ><?=$good['price']*$good['goodQuantity']?> рублей</td>
            <td class="delete" data-id="<?=$id?>" style="text-align: center; cursor: pointer; vertical-align: middle; color: red"><span>&#10006;</span></td>
        </tr>
    <? } ?>
        <tr style="border-top: 4px solid black;">
            <td colspan="4">Всего товаров</td>
            <td class="total-quantity"><?=$session['totalQuantity']?></td>
        </tr>
        <tr>
            <td colspan="4">На сумму</td>
            <td class="font-weight: 700"><?=$session['totalSum']?> рублей</td>
        </tr>
    </tbody>
</table>
<div class="modal-buttons" style="...">
    <button type="button" class="btn btn-danger" onclick="clearCart(event)">Очистить корзину</button>
    <button type="button" class="btn btn-secondary btn-close">Продолжить покупки</button>
    <button type="button" class="btn btn-success btn-next">Оформить заказ</button>
</div>
<? } else {?>

<h3>В вашей корзине ничего нет :(</h3>
<button type="button" class="btn btn-secondary btn-close" style="width: 200px;">Начать покупки</button>

<? }