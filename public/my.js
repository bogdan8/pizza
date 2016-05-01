function add_to_cart(id) {
    var name = 'product_' + id;
    var x = window.localStorage.getItem(name);
    x = x * 1 + 1;
    window.localStorage.setItem(name, x);
    document.getElementById("count" + id).innerHTML = x;
    document.getElementById("count").innerHTML = get_count_items();
    update_orders();
}

function delete_to_cart(id) {
    var name = 'product_' + id;
    var x = window.localStorage.getItem(name);
    console.log(x);
    if (x == '-1') {
        alert("Ви недодали піцу");
        window.localStorage.clear();
        location.reload();
    } else {
        x = x * 1 - 1;
        window.localStorage.setItem(name, x);
        document.getElementById("count" + id).innerHTML = x;
        document.getElementById("count").innerHTML = get_count_items();
        update_orders();
    }
}

function clear_local() {
    window.localStorage.clear();
    location.reload();
    alert('Ваша корзина очищена');
}

function get_count_items() {
    var cnt = 0;
    for (var i = 0; i < window.localStorage.length; i++) {
        var key = window.localStorage.key(i);//ключ
        var value = window.localStorage.getItem(key);//значення

        if (key.indexOf('product_') == 0) {
            cnt = cnt + value * 1;
        }
    }
    return cnt;
}

function update_orders() {
    var orders = get_orders();
    console.log(orders);
    document.getElementById('orders_input').value = orders;
}


function get_orders() {
    var orders = '';
    for (var i = 0; i < window.localStorage.length; i++) {
        var key = window.localStorage.key(i);//ключ
        var value = window.localStorage.getItem(key);//значення

        if (key.indexOf('product_') == 0) {
            orders = orders + key + '=' + value + ',';
        }
    }
    return orders;
}