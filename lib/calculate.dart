import 'package:scoped_model/scoped_model.dart';
import 'package:week4/main.dart';

class car extends Model {
  List<Carmod> cart = [];
  double totalvalue = 0;
  int get total => cart.length;

  void addcar(item) {
    cart.add(item);
  }

  String Totalprice() {
    totalvalue = 0;
    cart.forEach((f) {
      totalvalue += f.price;
    });
    return 'Total price: ' + totalvalue.toString() + ' \฿';
  }
}
