import 'package:api_builder/modals/albums.dart';
import 'package:api_builder/repository/repository.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _repository = Repository();
  late Future<List<Album>> _futureAlbums;

  @override
  void initState() {
    super.initState();
    _futureAlbums = _repository.fetchAlbums();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('API DEMO FUTUTRE'),
      ),
      body: FutureBuilder<List<Album>>(
          future: _futureAlbums,
          builder: (context, snapShot) {
            switch (snapShot.connectionState) {
              case ConnectionState.none:
              case ConnectionState.waiting:
                return const CircularProgressIndicator();
              case ConnectionState.done:
              case ConnectionState.active:
                return ListView.builder(
                    itemBuilder: (context, index) => ListTile(
                          leading: CircleAvatar(
                            child: Text(snapShot.data![index].id.toString()),
                          ),
                          title: Center(
                            child: Text(snapShot.data![index].title),
                          ),
                          trailing: CircleAvatar(
                            child:
                                Text(snapShot.data![index].userId.toString()),
                          ),
                        ));

              default:
                return Center(
                  child: Container(
                    color: Colors.red,
                    child: const Text('Some thing wrong'),
                  ),
                );
            }
          }),
    );
  }
}
