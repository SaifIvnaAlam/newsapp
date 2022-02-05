import 'package:flutter/material.dart';
import 'package:newsapp/get_news.dart';
import 'package:searchbar_animation/searchbar_animation.dart';
import 'api_response.dart';

class NewsApp extends StatefulWidget {
  NewsApp({Key? key}) : super(key: key);

  @override
  State<NewsApp> createState() => _NewsAppState();
}

class _NewsAppState extends State<NewsApp> {
  String searchQuery = 'india';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: SearchBarAnimation(
        textEditingController: TextEditingController(),
        isOriginalAnimation: false,
        isSearchBoxOnRightSide: true,
        onFieldSubmitted: (string, value) {
          setState(() {
            searchQuery = value;
          });
        },
      ),
      appBar: AppBar(
        centerTitle: true,
        title: const Text("News App"),
      ),
      body: FutureBuilder<AutoGenerate>(
        future: getNews(searchQuery),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.articles.length,
              itemBuilder: (BuildContext context, int index) {
                final articale = snapshot.data!.articles[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.network(articale.urlToImage ??
                                  'https://images.unsplash.com/photo-1579373903781-fd5c0c30c4cd?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1374&q=80'),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                articale.title,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                articale.description,
                                style: const TextStyle(
                                    fontWeight: FontWeight.w100),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
