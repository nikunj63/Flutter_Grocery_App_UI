import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_shop_app/cart_model.dart';
import 'package:grocery_shop_app/grocery_items_tile.dart';
import 'package:grocery_shop_app/pages/cart_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left:24.0),
          child: Icon(
            Icons.location_on,
            color:Colors.grey[700]
          ),
        ),
        title:Text(
          'Uttar Pradesh,India',
          style: TextStyle(
            fontSize:16,
            color:Colors.grey[700],
          ),
        ),
        centerTitle:false,
        actions:[
          Padding(
            padding: const EdgeInsets.only(right:24.0),
            child: Container(
              padding:EdgeInsets.all(16),
              decoration: BoxDecoration(
                color:Colors.grey[200],
                borderRadius:BorderRadius.circular(12),
              ),
              child:Icon(
                Icons.person,
                color:Colors.grey,
              )
            ),
          )
        ]
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed:()=>Navigator.push(
          context,
          MaterialPageRoute(
            builder:(context){
              return CartPage();
            }
          ),
        ),
        child:const Icon(Icons.shopping_bag),
      ),
      body:  Column(
        crossAxisAlignment:CrossAxisAlignment.start,
        children: [
           const SizedBox(height:48),
          // good morning
            const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: Text('Good Morning'),
          ),
           const SizedBox(height:4),
          // let's order Fresh Items for you
          Padding(
            padding:  EdgeInsets.symmetric(horizontal:24.0),
            child:Text(
              "Let's order fresh items for you",
              style: GoogleFonts.notoSerif(
                fontSize: 36,
                fontWeight:FontWeight.bold,
              ),
            )
          ),
          const SizedBox(height:24),

          const Padding(
            padding:EdgeInsets.symmetric(horizontal:24.0),
            child:Divider(),
          ),

          const SizedBox(height:24),

          //categories -> horizontal listiew
          Padding(
            padding:const EdgeInsets.symmetric(horizontal:24.0),
            child:Text(
              "Fresh Items",
              style: GoogleFonts.notoSerif(
               // fontWeight: FontWeight.bold,
                fontSize:18,
              )
            )
          ),
          // recent order -> show last 3
          Expanded(
            child: Consumer<CartModel>(
              builder: (context ,value,child){
                return GridView.builder(
                  padding: const EdgeInsets.all(12),
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: value.shopItems.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount:2,
                    childAspectRatio:1/1.2,
                  ),
                  itemBuilder:(context ,index){
                    return GroceryItemTile(
                      itemName:value.shopItems[index][0],
                      itemPrice:value.shopItems[index][1],
                      imagePath:value.shopItems[index][2],
                      color:value.shopItems[index][3],
                      onPressed: () =>
                      Provider.of<CartModel>(context,listen:false).addItemsToCart(index), 
                    );
                  }
                );
              }
            )
          )

        ],
      )
    );
  }
}