import 'package:ai_govinds_radio/model/podcast_model.dart';
import 'package:flutter/material.dart';

class PodCastViewPage extends StatelessWidget {
  const PodCastViewPage({Key? key, required this.podCast}) : super(key: key);

  final PodCast podCast;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2C293A),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 300,
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Hero(
                      tag: 'poster',
                      child: Image.network(
                        podCast.posterUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned.fill(
                    child: Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          end: Alignment.bottomCenter,
                          begin: Alignment.topCenter,
                          colors: [
                            Color.fromARGB(0, 44, 41, 58),
                            Color.fromARGB(0, 44, 41, 58),
                            Color.fromARGB(0, 44, 41, 58),
                            Color.fromARGB(25, 44, 41, 58),
                            Color.fromARGB(50, 44, 41, 58),
                            Color.fromARGB(100, 44, 41, 58),
                            Color.fromARGB(120, 44, 41, 58),
                            Color.fromARGB(150, 44, 41, 58),
                            Color.fromARGB(180, 44, 41, 58),
                            Color.fromARGB(200, 44, 41, 58),
                            Color.fromARGB(230, 44, 41, 58),
                            Color(0xFF2C293A),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 16,
                    left: 18,
                    right: 18,
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              podCast.name.toUpperCase(),
                              maxLines: 1,
                              style: const TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              "Episodes - ${podCast.episodes.length}".toUpperCase(),
                              maxLines: 1,
                              style: const TextStyle(
                                fontSize: 14,
                                color: Color.fromARGB(255, 186, 186, 186),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              child: const Text('afsdf'),
            ),
            Expanded(
              child: Container(
                // height: 300,
                child: ListView.builder(
                  itemCount: podCast.episodes.length,
                  shrinkWrap: false,
                  itemBuilder: (BuildContext context, int index) {
                    return EpisodeCard(
                      imageUrl: podCast.posterUrl,
                      bodyText: podCast.episodes[index].shortDescription,
                      onTap: () {},
                      title: podCast.episodes[index].title,
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class EpisodeCard extends StatelessWidget {
  const EpisodeCard({
    super.key,
    required this.title,
    required this.imageUrl,
    required this.onTap,
    required this.bodyText,
  });

  final String title;
  final String bodyText;
  final String imageUrl;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.only(right: 16),
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 88,
            height: 100,
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  title,
                  maxLines: 3,
                  // textAlign: TextAlign.justify,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  bodyText,
                  maxLines: 1,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          InkWell(
            onTap: onTap,
            child: const Icon(
              Icons.play_arrow,
              size: 42,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
