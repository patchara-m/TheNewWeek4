import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:week4/calculate.dart';

void main() {
  runApp(MyApp(
    model: car(),
  ));
}

class MyApp extends StatelessWidget {
  final car model;
  const MyApp({Key key, @required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScopedModel<car>(
      model: model,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'CarStore',
        home: Listscreen(),
      ),
    );
  }
}

class Listscreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Colors.black54,
        title: Text('Car Store'),
      ),
      body: ListView.builder(
          itemExtent: 80,
          itemCount: itemList.length,
          itemBuilder: (context, index) {
            return ScopedModelDescendant<car>(
                builder: (context, child, model) {
                  return ListTile(
                      leading: CircleAvatar(
                          backgroundImage: AssetImage(itemList[index].image)),
                      title: Text(itemList[index].title),
                      subtitle: Text('\฿' + itemList[index].price.toString()),
                      trailing: Icon(Icons.keyboard_arrow_right),
                      onTap: () {
                        model.addcar(itemList[index]);
                        print('Add: ' + itemList[index].title);
                        print(model.Totalprice());
                      });
                });
          }),
    );
  }
}

class Carmod {
  int price;
  int id;
  String title;
  String image;
  Carmod(
      {@required this.price,
        @required this.id,
        @required this.title,
        @required this.image});
}

List<Carmod> itemList = [
  Carmod(
      id: 1,
      title: 'Porsche Sport Car EV',
      image: 'assets/images/carnum1.jpg',
      price: 6000000),
  Carmod(
      id: 2,
      title: 'Porsche Cayenne Coupe',
      image: 'assets/images/carnum2.jpg',
      price: 6500000),
  Carmod(
      id: 3,
      title: 'Lamborghini Urus',
      image: 'assets/images/carnum3.jpg',
      price: 23420000),
  Carmod(
      id: 4,
      title: 'BMW i8 Roadster',
      image: 'assets/images/carnum4.jpg',
      price: 10000000),
  Carmod(
      id: 5,
      title: 'Lamborghini Aventador',
      image: 'assets/images/carnum5.jpg',
      price: 38500000),
  Carmod(
      id: 6,
      title: 'BMW x6',
      image: 'assets/images/carnum6.jpg',
      price: 8000000),
  Carmod(
      id: 7,
      title: 'Benz glc250',
      image: 'assets/images/carnum7.jpg',
      price: 3290000),
  Carmod(
      id: 8,
      title: 'Maserati Levante',
      image: 'assets/images/carnum8.jpg',
      price: 6500000),
  Carmod(
      id: 9,
      title: 'Maserati Quattroporte',
      image: 'assets/images/carnum9.jpg',
      price: 8900000),
  Carmod(
      id: 10,
      title: 'Porsche Cayman',
      image: 'assets/images/carnum10.jpg',
      price: 6600000),
];