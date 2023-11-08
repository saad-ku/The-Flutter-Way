import 'package:flutter/material.dart'; 

class GroceryWidget extends StatelessWidget { 
   const GroceryWidget({super.key});
   
   @override 
   Widget build(BuildContext context) { 
      return Scaffold( 
         appBar: AppBar(title: const Text("Product Listing")), 
         body: ListView(
            shrinkWrap: true, 
            padding: const EdgeInsets.fromLTRB(2.0, 10.0, 2.0, 10.0), 
            children: const <Widget>[ 
               ProductBox(
                  name: "Grocery Item 1", 
                  description: "Fresh Item", 
                  price: 1000, 
                  image: "grocery.png"
               ), 
               ProductBox( 
                  name: "Grocery Item 2", 
                  description: "Fresh Item", 
                  price: 800, 
                  image: "grocery.png"
               ), 
               ProductBox( 
                  name: "Grocery Item 3", 
                  description: "Fresh Item", 
                  price: 2000, 
                  image: "grocery.png"
               ), 
               ProductBox( 
                  name: "Grocery Item 4", 
                  description: "Fresh Item", 
                  price: 1500, 
                  image: "grocery.png"
               ), 
               ProductBox( 
                  name: "Grocery Item 5", 
                  description: "Fresh Item", 
                  price: 100, 
                  image: "grocery.png"
               ), 
               ProductBox(
                  name: "Grocery Item 6", 
                  description: "Fresh Item", 
                  price: 20, 
                  image: "grocery.png"
               ), 
            ],
         )
      );
   }
}

class ProductBox extends StatelessWidget {
   const ProductBox({Key? key,
    required this.name,
    required this.description,
    required this.price,
    required this.image}
    ) : super(key: key); 
    
   final String name; 
   final String description; 
   final int price; 
   final String image; 
   
   @override
    Widget build(BuildContext context) {
      return Container(
         padding: const EdgeInsets.all(2), 
         height: 120, 
         child: Card(
          color: Colors.white,
            child: Row(
               mainAxisAlignment: MainAxisAlignment.center, 
               children: <Widget>[ 
                  Image.asset("images/$image"), 
                  Expanded( 
                     child: Container( 
                        padding: const EdgeInsets.all(5), 
                        child: Column(    
                           mainAxisAlignment: MainAxisAlignment.center, 
                           children: <Widget>[ 
                              Text(
                                 name, style: const TextStyle(
                                    fontWeight: FontWeight.bold
                                 )
                              ),
                              Text(description), Text("Price: $price"), 
                           ], 
                        )
                     )
                  )
               ]
            )
         )
      );
   }
}