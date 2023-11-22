import 'package:as_fin/app_theme.dart';
import 'package:as_fin/ext.dart';
import 'package:as_fin/models/one_news_item.dart';
import 'package:flutter/material.dart';

class OneNewPage extends StatelessWidget {
  const OneNewPage({
    super.key,
    required this.newsItem,
  });

  final OneNew newsItem;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 16,
                  top: 16,
                  bottom: 36,
                ),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: InkWell(
                    radius: 16,
                    onTap: () => Navigator.of(context).pop(null),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.chevron_left,
                          color: CustomTheme.blackFontColor,
                          size: 24,
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Text(
                          'News',
                          style: context.textTheme.displaySmall,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.network(
                        newsItem.imagePath,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                    const SizedBox(height: 24),
                    Text(
                      newsItem.title,
                      style: context.textTheme.displayLarge,
                    ),
                    const SizedBox(height: 32),
                    Text(
                      newsItem.subtitle,
                      style: context.textTheme.titleLarge,
                    ),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
