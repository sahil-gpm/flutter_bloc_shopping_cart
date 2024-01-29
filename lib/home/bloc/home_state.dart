part of 'home_bloc.dart';

@immutable
//for building home ui
sealed class HomeState {}

// for performing actions
sealed class HomeActionState extends HomeState {}

final class HomeInitial extends HomeState {}

//states building the ui
//states for loading and error
class HomeLoadingState extends HomeState {}

class HomeLoadedState extends HomeState {
  final List<ProductModel> products;
  HomeLoadedState({required this.products});
}

class HomeErrorState extends HomeState {}

//states doing some action
//state for navigating to wish list
class HomeNavigateToWishlistActionState extends HomeActionState {}

//state for navigating to cart
class HomeNavigateToCartActionState extends HomeActionState {}

//state for navigating to productview
class HomeNavigateToProductViewActionState extends HomeActionState {
  final ProductModel product;
  HomeNavigateToProductViewActionState({required this.product});
}
