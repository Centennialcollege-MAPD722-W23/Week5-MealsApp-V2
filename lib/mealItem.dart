import 'package:flutter/material.dart';

class MealItem extends StatelessWidget {
  final String title;
  final String imageURl;
  final int duration;

  const MealItem(this.title, this.imageURl, this.duration);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        margin: EdgeInsets.all(10),
        child: Column(children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
                child: Image.network(
                  imageURl,
                  height: 250,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 26,
                  color: Colors.black,
                ),
                softWrap: true,
                overflow: TextOverflow.fade,
              ),
            ],
          ),
          Row(
            children: [
              Text(
                'Duration :' + duration.toString() + 'm',
                style: const TextStyle(
                  fontSize: 26,
                  color: Colors.black,
                ),
              )
            ],
          )
        ]),
      ),
    );
  }
}
