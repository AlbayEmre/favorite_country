import 'package:favorite_country/Global/Resource_Context.dart';
import 'package:favorite_country/Model/Model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class Favorite_Country extends StatelessWidget {
  Favorite_Country({super.key, required this.iterableFavoriteCountry});

  Iterable<Ulke> iterableFavoriteCountry;

  @override
  Widget build(BuildContext context) {
    List<Ulke> favoriteCountry = iterableFavoriteCountry.toList() ?? [];
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        body: ListView.separated(
          itemBuilder: ((context, index) {
            return Card(
              child: ListTile(
                  title: Text(favoriteCountry[index].name?.common ?? ""),
                  leading: Container(
                    width: MediaQuery.of(context).size.width * 0.1,
                    height: MediaQuery.of(context).size.height * 0.1,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50), // Image border
                      child: SizedBox.fromSize(
                        size: Size.fromRadius(48), // Image radius
                        child: Image.network(
                          favoriteCountry[index].flags?.png ?? "",
                        ),
                      ),
                    ),
                  ),
                  trailing: IconButton(
                    icon: Icon(Icons.favorite, color: Colors.red),
                    onPressed: () {},
                  )),
            );
          }),
          itemCount: favoriteCountry.length,
          separatorBuilder: (BuildContext context, int index) => Divider(),
        ));
    ;
  }
}
