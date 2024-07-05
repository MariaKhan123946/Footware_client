import 'package:flutter/material.dart';
import 'multi selected.dart';
import 'product_card.dart';
import 'product_discription.dart';
class HomePage2 extends StatefulWidget {
  const HomePage2({Key? key}) : super(key: key);

  @override
  _HomePage2State createState() => _HomePage2State();
}

class _HomePage2State extends State<HomePage2> {
  String? sortItems;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Footwear Store',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              // Implement logout logic
            },
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(6),
                  child: Chip(
                    label: Text('Category $index'), // Use dynamic label
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              children: [
                Expanded(
                  child: MultiSelected(items: ['item1','item2','item3'], onselectionChanged: (selectedItems ) {  },), // Use your custom MultiSelected widget
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        isExpanded: true,
                        hint: Text('Sort'),
                        value: sortItems,
                        onChanged: (String? value) {
                          setState(() {
                            sortItems = value;
                            // Implement sorting logic based on selected value
                          });
                        },
                        items: [
                          'Low to High',
                          'High to Low',
                        ].map((String item) {
                          return DropdownMenuItem<String>(
                            value: item,
                            child: Text(item),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            
          ),
          Expanded(
            child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(

              crossAxisCount: 2,
              childAspectRatio: 0.8,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,

            ),
                itemCount: 10,
                itemBuilder: (
                context,index){


              return ProductCard(name: 'puma shoes', imageurl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSNaw7LDnd2As1eE4C0BcCtYRRSywYoYv_1zA&s', price: 200, offerTag: '30% off', onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDiscription(),));
              },);
            
            }),
          )
          // Add more widgets here as needed
        ],
      ),
    );
  }
}
