import 'package:flutter/material.dart';
import 'package:flutter_sixvalley_ecommerce/provider/category_provider.dart';
import 'package:flutter_sixvalley_ecommerce/view/screen/home/widget/category_widget.dart';
import 'package:flutter_sixvalley_ecommerce/view/screen/product/brand_and_category_product_screen.dart';
import 'package:provider/provider.dart';

import 'category_shimmer.dart';

class CategoryView extends StatelessWidget {
  final bool isHomePage;
  const CategoryView({Key? key, required this.isHomePage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<CategoryProvider>(
      builder: (context, categoryProvider, child) {
        return categoryProvider.categoryList.isNotEmpty ?
         SizedBox(
           height: 100,
           child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount:categoryProvider.categoryList.length ,
            itemBuilder: (context, index) {
             return InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => BrandAndCategoryProductScreen(
                  isBrand: false,
                  id: categoryProvider.categoryList[index].id.toString(),
                  name: categoryProvider.categoryList[index].name,
                )));
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: CategoryWidget(category: categoryProvider.categoryList[index]),
              ),
            );
                   },),
         )
        // GridView.builder(
        //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        //     crossAxisCount: 4,
        //     crossAxisSpacing: 15,
        //     mainAxisSpacing: 8,
        //     childAspectRatio: (1/1.4),
        //   ),
        //   itemCount: isHomePage
        //       ? categoryProvider.categoryList.length > 8
        //          ? 8
        //          : categoryProvider.categoryList.length
        //       : categoryProvider.categoryList.length,
        //   shrinkWrap: true,
        //   physics: const NeverScrollableScrollPhysics(),
        //   itemBuilder: (BuildContext context, int index) {
        //
        //     return InkWell(
        //       onTap: () {
        //         Navigator.push(context, MaterialPageRoute(builder: (_) => BrandAndCategoryProductScreen(
        //           isBrand: false,
        //           id: categoryProvider.categoryList[index].id.toString(),
        //           name: categoryProvider.categoryList[index].name,
        //         )));
        //       },
        //       child: CategoryWidget(category: categoryProvider.categoryList[index]),
        //     );
        //
        //   },
        // )

        : const CategoryShimmer();

      },
    );
  }
}



