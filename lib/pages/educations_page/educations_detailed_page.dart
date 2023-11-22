import 'package:as_fin/app_theme.dart';
import 'package:as_fin/ext.dart';
import 'package:as_fin/models/one_news_item.dart';
import 'package:as_fin/router.dart';
import 'package:as_fin/widgets_global/main_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class EducationPage extends StatelessWidget {
  const EducationPage({super.key, required this.course});
  final OneNew course;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            elevation: 0,
            title: Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: InkWell(
                onTap: () => context.pop(),
                child: Row(
                  children: [
                    const Icon(
                      Icons.chevron_left,
                      color: CustomTheme.secGrey,
                    ),
                    const SizedBox(width: 16),
                    Text(
                      'Education',
                      style: context.textTheme.displayLarge,
                    ),
                  ],
                ),
              ),
            ),
            pinned: true,
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 32),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.network(
                      course.imagePath,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    course.title,
                    style: context.textTheme.displayLarge,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    course.subtitle,
                    style: context.textTheme.titleLarge,
                  ),
                  const SizedBox(height: 20),
                  MainButton(
                    width: double.infinity,
                    title: 'Continue',
                    onTap: () => context.push(Routes.questions),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
