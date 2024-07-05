import 'package:flutter/material.dart';

class ProductDiscription extends StatefulWidget {
  const ProductDiscription({super.key});

  @override
  State<ProductDiscription> createState() => _ProductDiscriptionState();
}

class _ProductDiscriptionState extends State<ProductDiscription> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Details',style: TextStyle(fontWeight: FontWeight.bold),),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           ClipRRect(
               child: Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSNaw7LDnd2As1eE4C0BcCtYRRSywYoYv_1zA&s',
                 fit: BoxFit.cover,
                 width: double.infinity,
                 height: 200,
               ),
           ),
            SizedBox(height: 20,),
            Text('Puma Footware',style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),),
            SizedBox(height: 20,),
            Text('Product Description',style: TextStyle(fontSize: 16,height: 1.5),),
            SizedBox(height: 20,),
            Text('Rs:300',style: TextStyle(
              fontSize: 20,
              color: Colors.green,
              fontWeight: FontWeight.bold,
            ),),
            SizedBox(height: 20,),
            TextFormField(

              decoration: InputDecoration(
                labelText: 'Enter Your Billing Adress',

                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              maxLines: 4,
            ),
            SizedBox(height: 20,),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 15,),backgroundColor: Colors.indigo,
                ),
                  onPressed: (){

              }, child: Text('Buy Now',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,

                ),
              )),
            )
          ],
        ),
      ),
    );
  }
}
