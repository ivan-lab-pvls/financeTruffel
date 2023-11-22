import 'package:as_fin/ext.dart';
import 'package:as_fin/const.dart';
import 'package:as_fin/pages/at_home_page/widgets/news_item_widget.dart';
import 'package:as_fin/pages/news_page/widgets/additional_new_card.dart';
import 'package:as_fin/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
export 'one_news_item_page.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(left: 16, top: 16, right: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Follow\nbusiness news',
                      style: context.textTheme.displayLarge,
                    ),
                    InkWell(
                      onTap: () => context.push(Routes.set),
                      child: SvgPicture.asset('pics/gear.svg'),
                    ),
                  ],
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(height: 80),
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              sliver: SliverList.builder(
                itemCount: Const.news.length,
                itemBuilder: (context, index) {
                  final newsItem = Const.news[index];
                  return NewsItemWidget(newsItem: newsItem);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
