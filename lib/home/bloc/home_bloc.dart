import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc_shopping_cart/dummy_data/product_data.dart';
import 'package:flutter_bloc_shopping_cart/home/models/product.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    //event to handle the initial home page loading
    on<HomeInitialEvent>(homeInitialEvent);

    //event to handle the button click and to navigate to the wishlist page
    on<HomeAppbarWishlistClickedEvent>(homeAppbarWishlistClickedEvent);

    //event to handle whenever the product view button is pressed and to navigate to product view page
    on<HomeProductViewButtomCickedEvent>(homeProductViewButtomCickedEvent);
  }

  //method for handling initial home load
  FutureOr<void> homeInitialEvent(
      HomeInitialEvent event, Emitter<HomeState> emit) async {
    //emit the home loading state

    emit(HomeLoadingState());

    await Future.delayed(const Duration(seconds: 2));

    //emit the state that the home is loaded successfully
    //note : here we are getting the data from a local dart file , in other scenarios we will fetch the data from database and we are only going to trigger this event if the data is fetched properly else we are throwing an error state
    // print(ShoeDataModel.shoeList.length);
    emit(HomeLoadedState(
        //passing the homestate the list of the shoes i.e shoeList and this list can be accessed in the future
        products: ShoeDataModel.shoeList
            .map((shoe) => ProductModel(
                id: shoe['id'],
                shoename: shoe['shoeName'],
                description: shoe['description'],
                price: shoe['price'],
                color: shoe['color'],
                imagePath: shoe['imagePath'],
                features: shoe['features']))
            .toList()));
  }

  //method to handle wishlist button click in the appbar
  FutureOr<void> homeAppbarWishlistClickedEvent(
      HomeAppbarWishlistClickedEvent event, Emitter<HomeState> emit) {
    emit(HomeNavigateToWishlistActionState());
  }

  FutureOr<void> homeProductViewButtomCickedEvent(
      HomeProductViewButtomCickedEvent event, Emitter<HomeState> emit) {
        emit(HomeNavigateToProductViewActionState(product: event.productModel));
      }
}
