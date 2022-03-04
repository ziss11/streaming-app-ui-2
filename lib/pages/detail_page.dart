import 'package:flutter/material.dart';
import 'package:streaming_app_2/utilities/colors.dart';
import 'package:streaming_app_2/utilities/constants.dart';

class DetailPage extends StatelessWidget {
  static const routeName = 'detail-page';
  const DetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PreferredSize _appBar() {
      return PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: SafeArea(
          child: AppBar(
            backgroundColor: backgroundColor,
            elevation: 0,
            automaticallyImplyLeading: false,
            centerTitle: true,
            flexibleSpace: Container(
              margin: EdgeInsets.only(
                left: defaultMargin,
                right: defaultMargin,
                top: 20,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () => Navigator.pop(context),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(
                        'images/back_icon.png',
                        width: 10,
                        color: whiteColor,
                      ),
                    ),
                  ),
                  Text(
                    'Details Movie',
                    style: Theme.of(context).textTheme.headline6!.copyWith(
                          fontSize: 18,
                        ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      'images/bookmark_icon.png',
                      width: 24,
                      color: whiteColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }

    Widget _content() {
      Widget _categoryTile(String category) {
        return Container(
          margin: const EdgeInsets.only(right: 12),
          padding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 4,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              defaultRadius,
            ),
            color: blackColor,
          ),
          child: Text(
            category,
            style: Theme.of(context).textTheme.bodyText1!.copyWith(
                  fontWeight: regular,
                ),
          ),
        );
      }

      return ListView(
        padding: EdgeInsets.all(defaultMargin),
        physics: const BouncingScrollPhysics(),
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(
              defaultRadius,
            ),
            child: Image.asset(
              'images/movie_poster.png',
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Text(
            'Behind Her Eyes',
            style: Theme.of(context).textTheme.headline5,
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            children: [
              Text(
                'Director: Erik Richter Strand | ',
                style: Theme.of(context).textTheme.bodyText1,
              ),
              const Icon(
                Icons.star,
                size: 16,
                color: orangeColor,
              ),
              const SizedBox(
                width: 2,
              ),
              Text(
                '4,9',
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          Row(
            children: [
              _categoryTile('Drama'),
              _categoryTile('Supernatural fiction'),
            ],
          ),
          SizedBox(
            height: defaultMargin,
          ),
          Text(
            'Storyline',
            style: Theme.of(context).textTheme.headline5,
          ),
          const SizedBox(
            height: 10,
          ),
          Text.rich(
            TextSpan(
              text: '''Adele is a Scottish heiress whose extremely
wealthy family owns estates and grounds.
When she was a teenager. ''',
              style: Theme.of(context).textTheme.bodyText1,
              children: [
                TextSpan(
                  text: 'Read More',
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        color: primaryColor,
                      ),
                ),
              ],
            ),
            textAlign: TextAlign.justify,
          ),
          const SizedBox(
            height: 80,
          ),
        ],
      );
    }

    Widget _watchButton() {
      return SizedBox(
        width: MediaQuery.of(context).size.width - (2 * defaultMargin),
        height: 56,
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(primaryColor),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(defaultRadius),
              ),
            ),
          ),
          onPressed: () {},
          child: Text(
            'Watch Movie',
            style: Theme.of(context).textTheme.headline6!.copyWith(
                  fontSize: 18,
                ),
          ),
        ),
      );
    }

    return Scaffold(
      appBar: _appBar(),
      body: _content(),
      floatingActionButton: _watchButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
