import 'package:cars/utils/utils.dart';
import 'package:flutter/material.dart';
import '../models/cars.dart';
import '../screens/car_detail.dart';

class CarsGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: ScrollPhysics(),
      shrinkWrap: true,
      itemCount: allCars.cars.length,
      itemBuilder: (ctx, i) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (ctx) => CarDetail(
                      title: allCars.cars[i].title,
                      brand: allCars.cars[i].brand,
                      fuel: allCars.cars[i].fuel,
                      price: allCars.cars[i].price,
                      path: allCars.cars[i].path,
                      gearbox: allCars.cars[i].gearbox,
                      color: allCars.cars[i].color,
                    )));
          },
          child: Container(
              margin: EdgeInsets.only(
                  top: i.isEven ? 10 : 10, bottom: i.isEven ? 10 : 10),
              decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black26, blurRadius: 5, spreadRadius: 1)
                  ]),
              child: Column(
                children: [
                  Hero(
                      tag: allCars.cars[i].title,
                      child: Image.asset(allCars.cars[i].path)),
                  Text(
                    allCars.cars[i].title,
                    style: BasicHeading,
                  ),
                  Text((allCars.cars[i].price).toString(), style: SubHeading),
                  Text('per month')
                ],
              )),
        ),
      ),
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1),
    );
  }
}
