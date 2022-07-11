import 'package:flutter/material.dart';
import 'package:pro_3/Models/meal.dart';
import 'package:pro_3/Screens/meal_detail_screen.dart';

class MealItem extends StatelessWidget {
  final String imageUrl;
  final String id;
  final String path;
  final String name;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;

  MealItem({
    @required this.affordability,
    @required this.id,
    @required this.duration,
    @required this.name,
    @required this.imageUrl,
    @required this.path,
    @required this.complexity,
  });

  void selectMeal(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
      MealDetailScreen.routeName,
      arguments: id,
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectMeal(context),
      child: Card(
        elevation: 4,
        margin: EdgeInsets.all(10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  child: Image.asset(
                    path,
                    fit: BoxFit.cover,
                    height: 250,
                    width: double.infinity,
                  ),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 10,
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    width: 300,
                    color: Colors.black54,
                    child: Text(
                      name,
                      overflow: TextOverflow.fade,
                      softWrap: true,
                      style: TextStyle(fontSize: 24, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Icon(Icons.schedule),
                      SizedBox(
                        width: 5,
                      ),
                      Text("$duration min"),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.work),
                      SizedBox(
                        width: 5,
                      ),
                      Text("${complexity.toString().split(".")[1]}"),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.attach_money),
                      SizedBox(
                        width: 5,
                      ),
                      Text("${affordability.toString().split(".")[1]}"),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
