import 'package:flutter/material.dart';
import 'package:pizza/companes/widgets/big_text_widget.dart';
import 'package:pizza/companes/widgets/chip_button_widget.dart';

import 'package:pizza/companes/widgets/small_text_widget.dart';
import 'package:pizza/companes/widgets/text_form_field_button.dart';
import 'package:pizza/data/category_models.dart';

import 'package:pizza/theme/app_textstyle.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  bool isSelected = true;
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 70),
                  child: Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(Icons.arrow_back_ios)),
                      const Text(
                        'Категории',
                        style: AppTextStyle.bigTextStyle,
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),

                const TextFormFieldButton(),
                const SizedBox(
                  height: 5,
                ),

                // SizedBox(
                //   height: MediaQuery.of(context).size.height * 0.1,
                //   child: ListView.builder(
                //       shrinkWrap: true,
                //       scrollDirection: Axis.horizontal,
                //       itemCount: 6,
                //       itemBuilder: ((context, index) {
                //         return Padding(
                //             padding:
                //                 EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                //             child: ChoiceChip(
                //               side: BorderSide(
                //                   color: AppColors.elevatedButtonColor),
                //               backgroundColor: Colors.white,
                //               selectedColor: AppColors.elevatedButtonColor,
                //               label: Text('Margarita'),
                //               labelStyle: AppTextStyle.smallTextStyle,
                //               selected: selectedIndex == index,
                //               onSelected: (value) {
                //                 selectedIndex = index;
                //                 setState(() {});
                //               },
                //             ));
                //       })),
                // ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      ChipButtonWidget(text: 'Маргарита'),
                      ChipButtonWidget(text: 'Пепперони'),
                      ChipButtonWidget(text: 'Азиатская'),
                      ChipButtonWidget(text: 'Четыре сыра'),
                      ChipButtonWidget(text: 'Цезарь'),
                      ChipButtonWidget(text: 'Мексиканская'),
                    ],
                  ),
                ),

                Container(
                  height: 700,
                  child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: categoryList.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.only(
                            left: 10,
                            right: 10,
                          ),
                          child: Card(
                            color: const Color(0xffEEEEEE),
                            child: Row(
                              children: [
                                //image container
                                Container(
                                  width: 150,
                                  height: 130,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.red,
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: AssetImage(
                                            categoryList[index].image,
                                          ))),
                                ),
                                const SizedBox(width: 15),
                                // text container
                                Expanded(
                                  child: Container(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        BigText(
                                          text: categoryList[index].text,
                                        ),
                                        const SizedBox(
                                          height: 15,
                                        ),
                                        SmallText(
                                          text: 'Описание пиццы',
                                          //text: categoryList[index].description
                                        ),
                                        const SizedBox(
                                          height: 15,
                                        ),
                                        const Text(
                                          '650 c',
                                          //categoryList[index].price,
                                          style: AppTextStyle.smallTextStyle,
                                        )
                                      ],
                                    ),
                                  ),
                                ),

                                // )
                              ],
                            ),
                          ),
                        );
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
