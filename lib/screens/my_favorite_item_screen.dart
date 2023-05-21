import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/favorite_provider.dart';

class MyFavoriteItemScreen extends StatefulWidget {
  const MyFavoriteItemScreen({Key? key}) : super(key: key);

  @override
  State<MyFavoriteItemScreen> createState() => _MyFavoriteItemScreenState();
}

class _MyFavoriteItemScreenState extends State<MyFavoriteItemScreen> {
  @override
  Widget build(BuildContext context) {
  final favoriteProvider = Provider.of<FavoriteItemProvider>(context);
    print("Build");
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Favorite Items"),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: favoriteProvider.selectedItem.length,
                itemBuilder: (context, index){
                  return Consumer<FavoriteItemProvider>(builder: (context,value,child){
                    return ListTile(
                      onTap: (){

                        if(value.selectedItem.contains(index)){
                          value.removeItem(index);
                        }else{
                          value.addItem(index);
                        }
                      },
                      title: Text("Item $index"),
                      trailing: Icon(value.selectedItem.contains(index) ? Icons.favorite : Icons.favorite_outline),
                    );
                  });
                }
            ),
          )
        ],
      ),
    );
  }
}
