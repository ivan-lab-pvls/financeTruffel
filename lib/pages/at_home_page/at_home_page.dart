import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:as_fin/app_theme.dart';
import 'package:as_fin/ext.dart';
import 'package:as_fin/const.dart';
import 'package:as_fin/models/income.dart';
import 'package:as_fin/pages/at_home_page/widgets/news_item_widget.dart';
import 'package:as_fin/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AtHomePage extends StatefulWidget {
  const AtHomePage({super.key});

  @override
  State<AtHomePage> createState() => _AtHomePageState();
}

class _AtHomePageState extends State<AtHomePage> {
  late final SharedPreferences _sharedPrefs;
  late final StreamController<bool> _updateStream;
  var balance = 0;

  @override
  void initState() {
    super.initState();
    _sharedPrefs = context.read<SharedPreferences>();
    _updateStream = context.read<StreamController<bool>>();
    _updateStream.stream.listen(_update);
    _update(null);
  }

  void _update(_) {
    var b = 0;
    final cachedIncomes = _sharedPrefs.getString('incomes') ?? '';
    if (cachedIncomes.isEmpty) {
      return;
    }

    final decode = jsonDecode(cachedIncomes) as List<dynamic>;

    final incomes = decode.map((e) => Income.fromJson(e)).toList();

    for (var income in incomes) {
      b += income.amount;
    }
    setState(() {
      balance = b;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            elevation: 0,
            title: Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Welcome to your\nFinancial assistant',
                    style: context.textTheme.displayLarge,
                  ),
                  InkWell(
                    onTap: () => context.push(Routes.set),
                    child: SvgPicture.asset('pics/gear.svg'),
                  ),
                ],
              ),
            ),
            pinned: true,
          ),
          SliverToBoxAdapter(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 40),
                Container(
                  width: MediaQuery.of(context).size.width * 0.6,
                  decoration: BoxDecoration(
                    color: CustomTheme.secGrey,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(height: 16),
                      Text(
                        '\$${balance.toStringAsFixed(2)}',
                        style: context.textTheme.displayLarge?.copyWith(
                          color: context.theme.primaryColor,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Card balance',
                        style: context.textTheme.titleSmall,
                      ),
                      const SizedBox(height: 16),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 40),
                  child: Divider(
                    thickness: 1,
                    color: CustomTheme.secGrey,
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(
                      Const.courses.length,
                      (index) {
                        final c = Const.courses[index];
                        return Container(
                          margin: EdgeInsets.only(
                            right: 12,
                            left: index == 0 ? 12 : 0,
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 16),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: CustomTheme.secGrey,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.network(
                                  c.imagePath,
                                  width: 100,
                                  height: 80,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(height: 12),
                              SizedBox(
                                width: 110,
                                child: Text(
                                  c.title,
                                  style: context.textTheme.displayLarge,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              const SizedBox(height: 12),
                              Text(
                                'Training completed: ',
                                style: context.textTheme.titleLarge,
                              ),
                              const SizedBox(height: 12),
                              Stack(
                                children: [
                                  Container(
                                    height: 2,
                                    width: 80,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(100),
                                      color: const Color(0xFF5A5B61),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Container(
                                      height: 2,
                                      width: Random().nextInt(61) + 10,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(100),
                                        color: context.theme.primaryColor,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    ).toList(),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 40),
                  child: Divider(
                    thickness: 1,
                    color: CustomTheme.secGrey,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
                  child: Row(
                    children: [
                      const Expanded(
                        child: Text(
                          'News',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () => context.go(Routes.news),
                        child: Text(
                          'View all',
                          style: TextStyle(
                            color: context.theme.primaryColor,
                            fontSize: 12,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            sliver: SliverList.builder(
              itemCount: 2,
              itemBuilder: (context, index) {
                final newsItem = Const.news[index];
                return NewsItemWidget(newsItem: newsItem);
              },
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(height: 40),
          ),
        ],
      ),
    );
  }
}
