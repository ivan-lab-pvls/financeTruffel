import 'dart:math';

import 'package:as_fin/app_theme.dart';
import 'package:as_fin/ext.dart';
import 'package:as_fin/const.dart';
import 'package:as_fin/models/one_news_item.dart';
import 'package:as_fin/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EducationsPage extends StatelessWidget {
  const EducationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          elevation: 0,
          title: Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Let`s start your\neducation',
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
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                Const.courses.sublist(0, 5).length,
                (index) {
                  final c = Const.courses[index];
                  return InkWell(
                    onTap: () => context.push(
                      Routes.education,
                      extra: c,
                    ),
                    child: Container(
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
                                    borderRadius: BorderRadius.circular(100),
                                    color: context.theme.primaryColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ).toList(),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
            child: Row(
              children: [
                const Expanded(
                  child: Text(
                    'All courses',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                Text(
                  'View all',
                  style: TextStyle(
                    color: context.theme.primaryColor,
                    fontSize: 12,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ],
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 16).copyWith(top: 8),
          sliver: SliverList.builder(
            itemCount: Const.courses.sublist(5).length,
            itemBuilder: (context, index) {
              final course = Const.courses[index + 5];

              return CourseItem(course: course);
            },
          ),
        ),
      ],
    );
  }
}

class CourseItem extends StatelessWidget {
  const CourseItem({super.key, required this.course});
  final OneNew course;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.push(
        Routes.education,
        extra: course,
      ),
      child: Container(
        margin: const EdgeInsets.only(bottom: 8),
        decoration: BoxDecoration(
          color: CustomTheme.secGrey,
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.all(16),
        child: IntrinsicHeight(
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  course.imagePath,
                  width: 80,
                  height: 60,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      course.title,
                      style: context.textTheme.displaySmall,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      course.subtitle,
                      style: context.textTheme.titleLarge,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Future<void> str(SharedPreferences shPre) async {
  final rev = InAppReview.instance;
  bool alreadyRated = shPre.getBool('aleadyRated') ?? false;
  if (!alreadyRated) {
    if (await rev.isAvailable()) {
      rev.requestReview();
      await shPre.setBool('aleadyRated', true);
    }
  }
}
