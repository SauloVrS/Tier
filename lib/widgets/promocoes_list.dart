import 'package:flutter/material.dart';

class PromoList extends StatelessWidget {
  final String title, imgUrl;
  final double price, newPrice;

  const PromoList(
      {Key? key,
        required this.title,
        required this.imgUrl,
        required this.price,
        required this.newPrice})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: const EdgeInsets.only(right: 20),
        width: 110,
        child: Column(
          children: [
            Container(
                height: 120,
                width: 110,
                margin: const EdgeInsets.only(top: 20, bottom: 10),
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 1),
                      )
                    ]
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    imgUrl,
                    fit: BoxFit.cover,
                  ),
                )),
            Text(
              title.toString(),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                "R\$ ${price.toString()}",
                style: const TextStyle(
                    fontSize: 12, decoration: TextDecoration.lineThrough),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                "R\$ ${newPrice.toString()}",
                style: const TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}