import 'package:as_fin/app_theme.dart';
import 'package:as_fin/ext.dart';
import 'package:as_fin/const.dart';
import 'package:as_fin/router.dart';
import 'package:as_fin/widgets_global/main_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class QuestionsPage extends StatefulWidget {
  const QuestionsPage({super.key});

  @override
  State<QuestionsPage> createState() => _QuestionsPageState();
}

class _QuestionsPageState extends State<QuestionsPage> {
  int _questionIndex = 0;
  bool pass = false;

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
                      color: Colors.black,
                    ),
                    const SizedBox(width: 16),
                    Text(
                      'Test',
                      style: context.textTheme.displayLarge,
                    ),
                  ],
                ),
              ),
            ),
            pinned: true,
          ),
          pass
              ? SliverFillRemaining(
                  hasScrollBody: false,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      children: [
                        const Spacer(),
                        Image.asset(
                          'pics/goblet.png',
                          width: MediaQuery.of(context).size.width * 0.4,
                          height: MediaQuery.of(context).size.width * 0.4,
                        ),
                        const Spacer(flex: 2),
                        Text(
                          'A perfect score ',
                          style: context.textTheme.displaySmall,
                        ),
                        const Spacer(),
                        Text(
                          '10/10',
                          style: context.textTheme.displaySmall?.copyWith(
                            color: context.theme.primaryColor,
                          ),
                        ),
                        const Spacer(),
                        Text(
                          'We are proud of you! You have shown a great result. Keep up the good work!',
                          style: context.textTheme.titleLarge,
                          textAlign: TextAlign.center,
                        ),
                        const Spacer(flex: 2),
                        MainButton(
                          title: 'Continue',
                          onTap: () => context.go(Routes.educations),
                        ),
                        const Spacer(),
                      ],
                    ),
                  ),
                )
              : SliverFillRemaining(
                  hasScrollBody: false,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * 0.4,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 16,
                          ),
                          decoration: BoxDecoration(
                            color: CustomTheme.secGrey,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                Const.victories[_questionIndex].quesiton,
                                style: context.textTheme.displaySmall,
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: GestureDetector(
                                          onTap: () {
                                            if (Const.victories[_questionIndex]
                                                    .rightAnwerIndex ==
                                                0) {
                                              if (_questionIndex == 9) {
                                                setState(() {});
                                                pass = true;
                                                return;
                                              }
                                              setState(() {
                                                _questionIndex++;
                                              });
                                            } else {
                                              setState(() {
                                                _questionIndex = 0;
                                              });
                                            }
                                          },
                                          child: Container(
                                            padding: const EdgeInsets.all(12),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              border: Border.all(
                                                color: const Color(0xFF4D4D4D),
                                              ),
                                            ),
                                            child: FittedBox(
                                              child: Text(
                                                Const.victories[_questionIndex]
                                                    .answers[0],
                                                style: context
                                                    .textTheme.labelSmall,
                                                maxLines: 3,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 12),
                                      Expanded(
                                        child: GestureDetector(
                                          onTap: () {
                                            if (Const.victories[_questionIndex]
                                                    .rightAnwerIndex ==
                                                1) {
                                              if (_questionIndex == 9) {
                                                setState(() {});
                                                pass = true;
                                                return;
                                              }
                                              setState(() {
                                                _questionIndex++;
                                              });
                                            } else {
                                              setState(() {
                                                _questionIndex = 0;
                                              });
                                            }
                                          },
                                          child: Container(
                                            padding: const EdgeInsets.all(12),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              border: Border.all(
                                                color: const Color(0xFF4D4D4D),
                                              ),
                                            ),
                                            child: FittedBox(
                                              child: Text(
                                                Const.victories[_questionIndex]
                                                    .answers[1],
                                                style: context
                                                    .textTheme.labelSmall,
                                                maxLines: 3,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 20),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: GestureDetector(
                                          onTap: () {
                                            if (Const.victories[_questionIndex]
                                                    .rightAnwerIndex ==
                                                2) {
                                              if (_questionIndex == 9) {
                                                setState(() {});
                                                pass = true;
                                                return;
                                              }
                                              setState(() {
                                                _questionIndex++;
                                              });
                                            } else {
                                              setState(() {
                                                _questionIndex = 0;
                                              });
                                            }
                                          },
                                          child: Container(
                                            padding: const EdgeInsets.all(12),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              border: Border.all(
                                                color: const Color(0xFF4D4D4D),
                                              ),
                                            ),
                                            child: FittedBox(
                                              child: Text(
                                                Const.victories[_questionIndex]
                                                    .answers[2],
                                                style: context
                                                    .textTheme.labelSmall,
                                                maxLines: 3,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 12),
                                      Expanded(
                                        child: GestureDetector(
                                          onTap: () {
                                            if (Const.victories[_questionIndex]
                                                    .rightAnwerIndex ==
                                                3) {
                                              if (_questionIndex == 9) {
                                                setState(() {});
                                                pass = true;
                                                return;
                                              }
                                              setState(() {
                                                _questionIndex++;
                                              });
                                            } else {
                                              setState(() {
                                                _questionIndex = 0;
                                              });
                                            }
                                          },
                                          child: Container(
                                            padding: const EdgeInsets.all(12),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              border: Border.all(
                                                color: const Color(0xFF4D4D4D),
                                              ),
                                            ),
                                            child: FittedBox(
                                              child: Text(
                                                Const.victories[_questionIndex]
                                                    .answers[3],
                                                style: context
                                                    .textTheme.labelSmall,
                                                maxLines: 3,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: List.generate(
                            Const.courses.length,
                            (index) => Expanded(
                              child: AnimatedContainer(
                                margin: EdgeInsets.only(
                                    right: index != Const.courses.length - 1
                                        ? 4
                                        : 0),
                                duration: const Duration(milliseconds: 400),
                                height: 6,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  color: index <= _questionIndex
                                      ? const Color(0xFFBCBCBC)
                                      : const Color(0xFF3f484d),
                                ),
                              ),
                            ),
                          ),
                        ),
                        MainButton(
                          width: double.infinity,
                          title: 'Continue',
                          onTap: () {
                            context.pop();
                          },
                        ),
                        // Column(
                        //   children: List.generate(
                        //     Constants.questions[_questionIndex].answers.length,
                        //     (index) {
                        //       final answer = Constants
                        //           .questions[_questionIndex].answers[index];

                        //       return GestureDetector(
                        //         onTap: () {

                        //         },
                        //         child: Container(
                        //           alignment: Alignment.center,
                        //           margin: const EdgeInsets.only(bottom: 8),
                        //           decoration: BoxDecoration(
                        //             borderRadius: BorderRadius.circular(12),
                        //             border:
                        //                 Border.all(color: AppTheme.justGrey1),
                        //           ),
                        //           padding: const EdgeInsets.all(12),
                        //           child: Text(
                        //             answer,
                        //             style: context.textTheme.displaySmall,
                        //           ),
                        //         ),
                        //       );
                        //     },
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
