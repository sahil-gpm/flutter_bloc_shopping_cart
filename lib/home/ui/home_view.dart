// ignore_for_file: unnecessary_type_check
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_shopping_cart/Colors/my_colors.dart';
import 'package:flutter_bloc_shopping_cart/home/bloc/home_bloc.dart';
import 'package:flutter_bloc_shopping_cart/home/product/ui/product_view.dart';
import 'package:flutter_bloc_shopping_cart/home/ui/home_product_tile.dart';
import 'package:flutter_bloc_shopping_cart/wishlist/ui/wishlist_view.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  //creating an instance of the homebloc : there is another optimized way to do this i guess , i will explore it in future
  final HomeBloc homeBloc = HomeBloc();

  @override
  void initState() {
    // this initstate will call the init home event to load the required data
    super.initState();
    //firing home initial event
    homeBloc.add(HomeInitialEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      //assining bloc
      bloc: homeBloc,

      //listening for the events to peroform an operation
      listener: (context, state) {
        if (state is HomeNavigateToWishlistActionState) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const WishlistView()));
        }
        if (state is HomeNavigateToProductViewActionState) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ProductView(
                        productModel: state.product,
                      )));
        }
      },

      //when to listen for events to perform a certain action
      listenWhen: (previous, current) => current is HomeActionState,

      //when to build the ui similarly to the set state
      buildWhen: (previous, current) => current is! HomeActionState,

      //builder for the bloc to render the appropriate ui
      builder: (context, state) {
        switch (state.runtimeType) {
          case HomeLoadingState:
            return const HomeLoadingWidget();

          case HomeLoadedState:
            final homeLoadedState = state as HomeLoadedState;
            return Scaffold(
              backgroundColor: MyColors.white,

              //appbar
              appBar: AppBar(
                backgroundColor: MyColors.white,
                title: Text("Bloc Sneakers",
                    style: GoogleFonts.dmSans(
                        textStyle: const TextStyle(
                            fontSize: 25, color: MyColors.black),
                        fontWeight: FontWeight.w500)),
                actions: [
                  IconButton(
                      onPressed: () {
                        homeBloc.add(HomeAppbarWishlistClickedEvent());
                      },
                      icon: const Icon(Icons.favorite_border),
                      color: MyColors.primary),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.shopping_cart_outlined,
                          color: MyColors.primary))
                ],
              ),

              body: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: ListView.builder(
                    itemCount: homeLoadedState.products.length,
                    itemBuilder: (context, index) {
                      return ProductTile(
                        product: homeLoadedState.products[index],
                        homebloc: homeBloc,
                      );
                    }),
              ),
            );
          default:
            return const SizedBox(height: 10);
        }
      },
    );
  }
}

//different widgets for different states
class HomeLoadingWidget extends StatelessWidget {
  const HomeLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * .35),
            const CircularProgressIndicator(color: MyColors.primary),
            const SizedBox(height: 20),
            Text("BlocSneakers",
                style: GoogleFonts.dmSans(
                    color: MyColors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.w700))
          ],
        ),
      ),
    );
  }
}
