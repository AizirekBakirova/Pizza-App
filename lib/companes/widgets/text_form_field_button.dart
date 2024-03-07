import 'package:flutter/material.dart';
import 'package:pizza/theme/app_colors.dart';
import 'package:pizza/theme/app_textstyle.dart';

class TextFormFieldButton extends StatelessWidget {
  const TextFormFieldButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(10),
          child: TextFormField(
            cursorHeight: 44,
            cursorWidth: 328,
            decoration: InputDecoration(
                fillColor: Theme.of(context).scaffoldBackgroundColor,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.circular(16)),
                prefixIcon: const Icon(Icons.search),
                prefixIconColor: AppColors.smallTextColor,
                hintText: 'Быстрый поиск',
                hintStyle: AppTextStyle.smallTextStyle),
          ),
        ),
      ],
    );
  }
}
