import 'package:as_fin/ext.dart';
import 'package:as_fin/const.dart';
import 'package:as_fin/pages/settings_page/widgets/set_item.dart';
import 'package:as_fin/router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:in_app_review/in_app_review.dart';
export 'p_screen.dart';

class SetsPage extends StatelessWidget {
  const SetsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
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
                        color: Colors.black,
                      ),
                      const SizedBox(width: 16),
                      Text(
                        'Settings',
                        style: context.textTheme.displayLarge,
                      ),
                    ],
                  ),
                ),
              ),
              pinned: true,
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  SetItem(
                    iconPath: 'pics/settings_tick.svg',
                    title: 'Privacy Policy',
                    onTap: () => context.pushNamed(Routes.p, extra: Const.pP),
                  ),
                  SetItem(
                    iconPath: 'pics/settings_chat.svg',
                    title: 'Terms & Conditions',
                    onTap: () =>
                        context.pushNamed(Routes.p, extra: Const.terms),
                  ),
                  SetItem(
                    iconPath: 'pics/settings_bag.svg',
                    title: 'Support',
                    onTap: () => context.pushNamed(Routes.p,
                        extra: 'https://forms.gle/Mr1C4RDtuYdv6ELG7'),
                  ),
                  SetItem(
                    iconPath: 'pics/settings_star.svg',
                    title: 'Rate app',
                    onTap: () => InAppReview.instance
                        .openStoreListing(appStoreId: '6472856357'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
