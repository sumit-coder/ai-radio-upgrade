import 'package:flutter/material.dart';

import '../model/news_model.dart';
import '../services/api_service.dart';

class NewsTab extends StatefulWidget {
  NewsTab({Key? key}) : super(key: key);

  @override
  State<NewsTab> createState() => _NewsTabState();
}

class _NewsTabState extends State<NewsTab> {
  int activeCategoryIndex = 0;

  ScrollController _controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 44,
              margin: const EdgeInsets.only(top: 18),
              child: ListView.builder(
                shrinkWrap: true,
                padding: const EdgeInsets.only(left: 18, right: 18),
                scrollDirection: Axis.horizontal,
                itemCount: listOfCategory.length,
                itemBuilder: (conext, index) {
                  return CategoryButton(
                    title: listOfCategory[index],
                    isActive: activeCategoryIndex == index ? true : false,
                    onTap: () {
                      print('object');
                      // MyApiService().apiGet(0);
                      setState(() {
                        activeCategoryIndex = index;
                      });
                      // take to top of List
                      _controller.animateTo(
                        0,
                        duration: Duration(milliseconds: 500),
                        curve: Curves.bounceIn,
                      );
                    },
                  );
                },
              ),
            ),
            SizedBox(height: 18),
            Expanded(
              child: Container(
                // height: 300,
                child: FutureBuilder<NewsData?>(
                    future: MyApiService().apiGet(activeCategoryIndex),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        Center(
                          child: Text('Loading..'),
                        );
                      }
                      if (snapshot.hasData) {
                        return ListView.builder(
                          controller: _controller,
                          itemCount: snapshot.data!.data!.length,
                          itemBuilder: (conext, index) {
                            return NewsCard(
                              onTap: () {},
                              title: snapshot.data!.data![index].title!,
                              imageUrl: snapshot.data!.data![index].imageUrl!,
                              shortDiscription: snapshot.data!.data![index].content!,
                            );
                          },
                        );
                      }
                      return Center(child: CircularProgressIndicator());
                    }),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class NewsCard extends StatelessWidget {
  const NewsCard({
    super.key,
    required this.title,
    required this.onTap,
    required this.shortDiscription,
    required this.imageUrl,
  });
  final String title;
  final String shortDiscription;
  final String imageUrl;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 4, left: 4),
      decoration: BoxDecoration(
        // color: Colors.black87,
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      child: InkWell(
        onTap: onTap,
        child: Column(
          children: [
            SizedBox(
              height: 212,
              width: double.maxFinite,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Column(
                children: [
                  SizedBox(height: 8),
                  Text(
                    title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                      color: Colors.white70,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    shortDiscription,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      color: Colors.grey.shade600,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryButton extends StatelessWidget {
  const CategoryButton({
    super.key,
    required this.title,
    required this.onTap,
    required this.isActive,
  });
  final String title;
  final VoidCallback onTap;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        color: isActive ? Colors.grey : Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
      child: InkWell(
        onTap: onTap,
        child: Center(
          child: Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
          ),
        ),
      ),
    );
  }
}
