// ignore_for_file: non_constant_identifier_names

import 'package:shopping_app/data/item_model.dart';
import 'cart_model.dart';

List<CartModel> cartItems = [];

void updateCart(
    int ID, String name, double pricePerKg, String pathToImg, int qty) {
  bool found = false;
  int index = 0;
  for (int i = 0; i < cartItems.length; i++) {
    if (cartItems[i].item.ID == ID) {
      found = true;
      index = i;
      break;
    } else {
      found = false;
    }
  }

  if (found && qty > 0) {
    cartItems[index].qty = qty;
  } else if (found && qty == 0) {
    cartItems.removeWhere((element) => element.item.ID == ID);
  } else if (!found && qty > 0) {
    cartItems.add(CartModel(
        item: ItemModel(
            ID: ID, name: name, pricePerKg: pricePerKg, pathToImg: pathToImg),
        qty: qty));
  }
}

double getTotal() {
  double total = 0;
  for (int i = 0; i < cartItems.length; i++) {
    total += cartItems[i].item.pricePerKg * cartItems[i].qty;
  }
  return total;
}
