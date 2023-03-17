import 'package:ai_govinds_radio/pages/podcast_view_page.dart';
import 'package:flutter/material.dart';

class PodCastTab extends StatefulWidget {
  PodCastTab({Key? key}) : super(key: key);

  @override
  State<PodCastTab> createState() => _PodCastTabState();
}

class _PodCastTabState extends State<PodCastTab> {
  List<String> fakeData = [
    'Technology',
    'Music',
    "Podcast 1",
    "Podcast 2",
    "Podcast 3",
    "Podcast 4",
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 84),
              Container(
                margin: EdgeInsets.only(left: 22),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Explore".toUpperCase(),
                      maxLines: 1,
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4),
                    SizedBox(
                      width: 200,
                      child: Text(
                        "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                        maxLines: 2,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 18),
              SectionDividerWithTitleAndBody(
                title: 'New',
                bodyWidget: Container(
                  height: 200,
                  child: ListView.builder(
                    itemCount: fakeData.length,
                    itemExtent: 144,
                    padding: EdgeInsets.only(left: 18, right: 6),
                    scrollDirection: Axis.horizontal,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return PodCastCard(
                        title: fakeData[index],
                        imageUrl: '',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return PodCastViewPage();
                              },
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
              SectionDividerWithTitleAndBody(
                title: 'Top Listened',
                bodyWidget: Container(
                  height: 200,
                  child: ListView.builder(
                    itemCount: fakeData.length,
                    itemExtent: 144,
                    padding: EdgeInsets.only(left: 18, right: 6),
                    scrollDirection: Axis.horizontal,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return PodCastCard(
                        title: fakeData[index],
                        imageUrl: '',
                        onTap: () {},
                      );
                    },
                  ),
                ),
              ),
              SectionDividerWithTitleAndBody(
                title: 'Top Liked',
                bodyWidget: Container(
                  height: 200,
                  child: ListView.builder(
                    itemCount: fakeData.length,
                    itemExtent: 144,
                    padding: EdgeInsets.only(left: 18, right: 6),
                    scrollDirection: Axis.horizontal,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return PodCastCard(
                        title: fakeData[index],
                        imageUrl: '',
                        onTap: () {},
                      );
                    },
                  ),
                ),
              ),
              SizedBox(height: 12),
            ],
          ),
        ),
      ),
    );
  }
}

class PodCastCard extends StatelessWidget {
  const PodCastCard({
    super.key,
    required this.title,
    required this.imageUrl,
    required this.onTap,
  });

  final String title;
  final String imageUrl;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        // color: Colors.deepPurple,
        borderRadius: BorderRadius.circular(8),
      ),
      child: InkWell(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 164,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  'https://www.forbes.com/advisor/wp-content/uploads/2022/06/Image_-_Podcast_.jpeg.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 4),
            Text(
              title.toUpperCase(),
              maxLines: 1,
              style: TextStyle(
                fontSize: 14,
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SectionDividerWithTitleAndBody extends StatelessWidget {
  const SectionDividerWithTitleAndBody({Key? key, required this.title, required this.bodyWidget}) : super(key: key);

  final String title;
  final Widget bodyWidget;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 18, bottom: 8),
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                color: Color.fromARGB(255, 227, 227, 227),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          // SizedBox(height: 16),
          bodyWidget,
        ],
      ),
    );
  }
}
