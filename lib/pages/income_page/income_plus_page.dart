import 'package:as_fin/app_theme.dart';
import 'package:as_fin/ext.dart';
import 'package:as_fin/models/income.dart';
import 'package:as_fin/widgets_global/main_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

class IncomePlusPage extends StatefulWidget {
  const IncomePlusPage({super.key});

  @override
  State<IncomePlusPage> createState() => _IncomePlusPageState();
}

class _IncomePlusPageState extends State<IncomePlusPage> {
  final TextEditingController _incomeController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 16,
                  top: 16,
                ),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: InkWell(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
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
                          'Add Income',
                          style: context.textTheme.displaySmall,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 24,
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          color: CustomTheme.secGrey,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: TextField(
                          autofocus: true,
                          controller: _incomeController,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                          ],
                          decoration: InputDecoration(
                            hintText: 'Income amount',
                            hintStyle: context.textTheme.titleMedium,
                            border: const OutlineInputBorder(
                                borderSide: BorderSide.none),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Container(
                        decoration: BoxDecoration(
                          color: CustomTheme.secGrey,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: TextField(
                          controller: _descriptionController,
                          decoration: InputDecoration(
                            hintText: 'Income description',
                            hintStyle: context.textTheme.titleMedium,
                            border: const OutlineInputBorder(
                                borderSide: BorderSide.none),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: MainButton(
            height: 60,
            width: MediaQuery.of(context).size.width * 0.6,
            title: 'Continue',
            onTap: () {
              final amount = int.tryParse(_incomeController.text) ?? 0;

              if (amount == 0) {
                context.pop();
              }

              final income = Income(
                amount,
                _descriptionController.text,
                DateTime.now(),
              );

              context.pop(income);
            },
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }
}
