import 'package:flutter/material.dart';

class ProductCard extends StatefulWidget {
  final String name;
  final String imageurl;
  final double price;
  final String offerTag;
  final Function onTap;

  const ProductCard({
    Key? key,
    required this.name,
    required this.imageurl,
    required this.price,
    required this.offerTag, required this.onTap,
  }) : super(key: key);

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        widget.onTap();
      },
      child: Card(
        elevation: 3,
        child: Padding(
          padding: const EdgeInsets.all(7.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                widget.imageurl,
                fit: BoxFit.cover,
                width: double.infinity,
                height: 120,
              ),
              SizedBox(height: 5),
              Text(
                widget.name,
                style: TextStyle(
                  fontSize: 16,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              SizedBox(height: 5),
              Text(
                'Rs: ${widget.price.toStringAsFixed(2)}', // Formatting price with 2 decimal places
                style: TextStyle(
                  fontSize: 16,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              SizedBox(height: 4),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  widget.offerTag,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
