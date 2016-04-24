function sumfing(){
	var x = window.localStorage.getItem('b');

	x = x *1 + 1;

	window.localStorage.setItem('b' , x);

	alert(x);
}
function add_to_cart(id){
	var name = 'product_' + id;
	var x = window.localStorage.getItem(name);
	x = x * 1 + 1;
	window.localStorage.setItem(name , x);

}

function clear_local(){
	window.localStorage.clear();
	alert('Ваша корзина очищена');
}