import 'package:favorite_country/Global/Resource_Context.dart';
import 'package:favorite_country/Model/Model.dart';
import 'package:favorite_country/Services/regres_services.dart';
import 'package:favorite_country/Services_Dio/Project_Dio_Mixin.dart';
import 'package:favorite_country/View_Model/Favorite.dart';
import 'package:favorite_country/View_Model/View_Provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class Label_View extends StatefulWidget {
  const Label_View({super.key});

  @override
  State<Label_View> createState() => _Label_ViewState();
}

class _Label_ViewState extends State<Label_View> with ProjectDioMixin {
  Iterable<Ulke> favorite = [];
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ReqresProvider>(
      create: (BuildContext context) => ReqresProvider(RequestService(service)),
      builder: (context, child) => Scaffold(
          appBar: AppBar(
            actions: [
              IconButton(
                  onPressed: () {
                    context.read<ReqresProvider>().SaveToLocal(context.read<ResourceContext>());

                    Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                      return Favorite_Country(
                        iterableFavoriteCountry: favorite,
                      ); //--> Diyer sayfaya git buraya basınca
                    }));
                  },
                  icon: Icon(
                    Icons.favorite,
                    color: Colors.red,
                  ))
            ],
            backgroundColor: Colors.grey,
            title: Text(" Countries in the World  "),
          ),
          body: Center(
            child: context.watch<ReqresProvider>().isLoading
                ? CircularProgressIndicator()
                : ListView.separated(
                    itemBuilder: (context, index) {
                      return Card(
                        child: ListTile(
                          leading: Container(
                              width: MediaQuery.of(context).size.width * 0.1,
                              height: MediaQuery.of(context).size.height * 0.1,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(50), // Image border
                                child: SizedBox.fromSize(
                                  size: Size.fromRadius(48), // Image radius
                                  child: Image.network(
                                    context.watch<ReqresProvider>().country[index].flags?.png ?? "",
                                  ),
                                ),
                              )),
                          title: Text(context.watch<ReqresProvider>().country[index].name?.common ?? ""),
                          subtitle: Text(context.watch<ReqresProvider>().country[index].region ?? ""),
                          trailing: IconButton(
                            icon: Icon((context.watch<ReqresProvider>().country[index].favorite ?? false)
                                ? Icons.favorite
                                : Icons.favorite_border),
                            onPressed: () {
                              setState(() {
                                context.read<ReqresProvider>().country[index].favorite ?? true
                                    ? context.read<ReqresProvider>().country[index].favorite = false
                                    : context.read<ReqresProvider>().country[index].favorite = true;

                                favorite =
                                    context.read<ReqresProvider>().country.where((Country) => Country.favorite == true);
                              });
                            },
                          ),
                        ),
                      );
                    },
                    itemCount: context.watch<ReqresProvider>().country.length,
                    separatorBuilder: (context, index) => Divider(),
                  ),
          )),
    );
  }
}
