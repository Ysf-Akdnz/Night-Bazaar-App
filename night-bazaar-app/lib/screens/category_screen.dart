import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prototip/components/category_card.dart';
import 'package:prototip/model/category_model.dart';
import 'package:prototip/riverpod/category_riverpod.dart';


final categoryRiverpod = ChangeNotifierProvider(((ref) => CategoryRiverpod()));

class CategoryScreen extends ConsumerStatefulWidget {
  const CategoryScreen({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends ConsumerState<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    var read = ref.read(categoryRiverpod);
    double screenHeight = MediaQuery.of(context).size.height;
    return categories(read.categoryModel, screenHeight);
  }

  Widget categories(CategoryModel model, double screenHeight) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(13.0),
            child: SizedBox(
              height: screenHeight,
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 12,
                    mainAxisExtent: 195),
                itemCount: model.category.length,
                padding: const EdgeInsets.only(
                    left: 10, right: 10, top: 7.5, bottom: 7.5),
                scrollDirection: Axis.vertical,
                itemBuilder: ((context, index) {
                  return CategoryCard(
                    category: model.category[index],
                  );
                }),
              ),
            ),
          )
        ],
      ),
    );
  }
}
