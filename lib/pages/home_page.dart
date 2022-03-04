import 'package:flutter/material.dart';
import 'package:streaming_app_2/utilities/colors.dart';
import 'package:streaming_app_2/utilities/constants.dart';
import 'package:streaming_app_2/widgets/tv_tile.dart';

import '../widgets/movie_card.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/';
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    PreferredSize _appBar() {
      return PreferredSize(
        child: SafeArea(
          child: AppBar(
            elevation: 0,
            automaticallyImplyLeading: false,
            backgroundColor: backgroundColor,
            flexibleSpace: Container(
              margin: EdgeInsets.only(
                left: defaultMargin,
                right: defaultMargin,
                top: 20,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(
                      50,
                    ),
                    child: Image.asset(
                      'images/profile_image.png',
                      width: 47,
                      height: 48,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Good Morning,',
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      Text(
                        'Alex Samm',
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              color: whiteColor,
                              fontWeight: medium,
                            ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.asset(
                        'images/notification_icon.png',
                        width: 18,
                        height: 19,
                      ),
                      Container(
                        width: 6,
                        height: 6,
                        margin: const EdgeInsets.only(bottom: 10, left: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: pinkColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        preferredSize: const Size.fromHeight(80),
      );
    }

    Widget _topMovie() {
      final _topMovieList = [
        const MovieCard(
          image: 'images/movie_medium1.png',
          name: 'Avatar',
          rating: 5,
        ),
        const MovieCard(
          image: 'images/movie_medium2.png',
          name: 'Joker',
          rating: 4.5,
        ),
      ];
      return Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: 20,
              horizontal: defaultMargin,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Top Movie',
                  style: Theme.of(context).textTheme.headline5,
                ),
                Text(
                  'See more',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 306,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemCount: _topMovieList.length,
              padding: EdgeInsets.only(
                left: defaultMargin,
              ),
              itemBuilder: (context, index) => _topMovieList[index],
            ),
          ),
        ],
      );
    }

    Widget _tvSeries() {
      final _tvList = [
        const TvTile(
          image: 'images/tv_small1.png',
          category: 'Drama',
          name: 'Behind Her Eyes',
          rating: 4.5,
        ),
        const TvTile(
          image: 'images/tv_small2.png',
          category: 'Crime',
          name: 'Money Heist',
          rating: 4,
        ),
      ];
      return Column(
        children: [
          SizedBox(
            height: defaultMargin,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: defaultMargin,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Tv Series',
                  style: Theme.of(context).textTheme.headline5,
                ),
                Text(
                  'See more',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: _tvList.length,
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.symmetric(
              horizontal: defaultMargin,
            ),
            itemBuilder: (context, index) => _tvList[index],
          ),
        ],
      );
    }

    Widget _bottomNavBar() {
      Widget _navBarIcon(int index, String image) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                setState(() {
                  currentIndex = index;
                  // ignore: avoid_print
                  print(currentIndex);
                });
              },
              child: Padding(
                padding: const EdgeInsets.all(6),
                child: Image.asset(
                  image,
                  color: currentIndex == index ? primaryColor : greyColor,
                  width: 24,
                ),
              ),
            ),
            currentIndex == index
                ? Container(
                    height: 6,
                    width: 6,
                    decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(50),
                    ),
                  )
                : const SizedBox(),
          ],
        );
      }

      return SizedBox(
        height: 88,
        child: BottomAppBar(
          color: backgroundColor,
          elevation: 1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _navBarIcon(0, 'images/home_icon.png'),
              _navBarIcon(1, 'images/search_icon.png'),
              _navBarIcon(2, 'images/bookmark_icon.png'),
              _navBarIcon(3, 'images/person_icon.png'),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      appBar: _appBar(),
      bottomNavigationBar: _bottomNavBar(),
      body: SafeArea(
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            _topMovie(),
            _tvSeries(),
          ],
        ),
      ),
    );
  }
}
