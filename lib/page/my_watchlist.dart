import 'package:flutter/material.dart';
import 'package:counter_7/page/drawer.dart';
import 'package:counter_7/model/mywatchlist.dart';
import 'package:counter_7/page/my_watchlist_detail.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MyWatchlistPage extends StatefulWidget {
  const MyWatchlistPage({super.key});

  @override
  State<MyWatchlistPage> createState() => _MyWatchlistState();
}

class _MyWatchlistState extends State<MyWatchlistPage> {
  Future<List<MyWatchlist>> fetchWatchlist() async {
    var url =
        Uri.parse('https://edutjie-pbp-2.herokuapp.com/mywatchlist/json/');
    var response = await http.get(
      url,
      headers: {
        "Access-Control-Allow-Origin": "*",
        "Content-Type": "application/json",
      },
    );

    // melakukan decode response menjadi bentuk json
    var data = jsonDecode(utf8.decode(response.bodyBytes));

    // melakukan konversi data json menjadi object MyWatchlist
    List<MyWatchlist> listMyWatchlist = [];
    for (var d in data) {
      if (d != null) {
        listMyWatchlist.add(MyWatchlist.fromJson(d));
      }
    }

    return listMyWatchlist;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('My Watch List'),
        ),
        drawer: const DrawerApp(),
        body: FutureBuilder(
            future: fetchWatchlist(),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return const Center(child: CircularProgressIndicator());
              } else {
                if (!snapshot.hasData) {
                  return Column(
                    children: const [
                      Text(
                        "Tidak ada watch list :(",
                        style:
                            TextStyle(color: Color(0xff59A5D8), fontSize: 20),
                      ),
                      SizedBox(height: 8),
                    ],
                  );
                } else {
                  return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (_, index) => Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Material(
                                elevation: 2.0,
                                borderRadius: BorderRadius.circular(5.0),
                                shadowColor: Colors.blueGrey,
                                child: ListTile(
                                  onTap: () {
                                    // Route menu ke halaman utama
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => MyWatchlistDetailPage(
                                            movie: snapshot.data![index],
                                          ),
                                        ));
                                  },
                                  title:
                                      Text(snapshot.data![index].fields.title),
                                )),
                          ));
                }
              }
            }));
  }
}
