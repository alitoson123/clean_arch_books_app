import 'package:clean_arch_books_app/Features/home/presentation/View_model/featured_books_cubit/featured_books_cubit.dart';
import 'package:clean_arch_books_app/Features/home/presentation/View_model/featured_books_cubit/featured_books_states.dart';
import 'package:clean_arch_books_app/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'best_seller_list_view.dart';
import 'custom_app_bar.dart';
import 'featured_list_view.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: CustomAppBar(),
              ),
              BlocBuilder<FeaturedBooksCubit, FeaturedBooksStates>(
                builder: (context, state) {
                  if (state is FeaturedBooksSuccess) {
                    return FeaturedBooksListView(bookEntityList: state.books,);
                  } else if (state is FeaturedBooksFailure) {
                    return Text(state.errorMessage);
                  } else {
                    return  Center(child: CircularProgressIndicator());
                  }
                },
              ),
              const SizedBox(height: 50),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Text('Best Seller', style: Styles.textStyle18),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
        const SliverFillRemaining(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: BestSellerListView(),
          ),
        ),
      ],
    );
  }
}
