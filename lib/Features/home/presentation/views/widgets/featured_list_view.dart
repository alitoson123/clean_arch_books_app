import 'package:clean_arch_books_app/Features/home/Domain/Entities/book_entity.dart';
import 'package:flutter/material.dart';
import 'custom_book_item.dart';

class FeaturedBooksListView extends StatelessWidget {
  const FeaturedBooksListView({Key? key, required this.bookEntityList})
    : super(key: key);

  final List<BookEntity> bookEntityList;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .3,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: bookEntityList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding:  EdgeInsets.symmetric(horizontal: 8),
            child: CustomBookImage(imageUrl: bookEntityList[index].imageUrl ?? ''),
          );
        },
      ),
    );
  }
}
