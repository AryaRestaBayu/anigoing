import 'package:flutter/material.dart';

class TestPage extends StatelessWidget {
  const TestPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List list = [
      {
        "mal_id": 4,
        "type": "anime",
        "name": "Comedy",
        "url": "https://myanimelist.net/anime/genre/4/Comedy"
      },
      // {
      //   "mal_id": 10,
      //   "type": "anime",
      //   "name": "Fantasy",
      //   "url": "https://myanimelist.net/anime/genre/10/Fantasy"
      // }
    ];
    return Scaffold(
      body: ListView.builder(
          itemCount: 2,
          itemBuilder: (context, index) {
            if (index < list.length) {
              String name = list[index]['name'];
              return Text(name);
            } else {
              return Text('kosong');
            }
          }),
    );
  }
}
