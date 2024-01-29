part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

//home initial event
class HomeInitialEvent extends HomeEvent{}

// event to handle appbar click
class HomeAppbarWishlistClickedEvent extends HomeEvent{}

// event to handle cart click
class HomeAppbarCartClickedEvent extends HomeEvent{}

//event to handle view product button 
class HomeProductViewButtomCickedEvent extends HomeEvent{
  final ProductModel productModel;
  HomeProductViewButtomCickedEvent({required this.productModel});
}