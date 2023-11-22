import 'package:as_fin/app_theme.dart';
import 'package:as_fin/ext.dart';
import 'package:as_fin/models/one_news_item.dart';
import 'package:as_fin/router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AdditionalNewCard extends StatelessWidget {
  const AdditionalNewCard({super.key, required this.newsItem});
  final OneNew newsItem;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.pushNamed(Routes.oneNew, extra: newsItem),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: CustomTheme.justGrey),
        ),
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(
                newsItem.imagePath,
                fit: BoxFit.fitWidth,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              newsItem.title,
              style: context.textTheme.displaySmall,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 10),
            Text(
              newsItem.subtitle,
              style: context.textTheme.titleMedium,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            )
          ],
        ),
      ),
    );
  }
}
