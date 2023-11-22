import 'package:as_fin/ext.dart';
import 'package:as_fin/models/one_news_item.dart';
import 'package:as_fin/router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NewsItemWidget extends StatelessWidget {
  const NewsItemWidget({super.key, required this.newsItem});
  final OneNew newsItem;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.pushNamed(Routes.oneNew, extra: newsItem),
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 12),
        child: Row(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    newsItem.title,
                    style: context.textTheme.displaySmall,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    newsItem.subtitle,
                    style: context.textTheme.titleMedium,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  )
                ],
              ),
            ),
            const SizedBox(width: 16),
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                newsItem.imagePath,
                fit: BoxFit.fitWidth,
                width: 100,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
