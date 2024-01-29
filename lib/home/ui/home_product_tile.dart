import 'package:flutter/material.dart';
import 'package:flutter_bloc_shopping_cart/Colors/my_colors.dart';
import 'package:flutter_bloc_shopping_cart/home/bloc/home_bloc.dart';
import 'package:flutter_bloc_shopping_cart/home/models/product.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductTile extends StatelessWidget {
  final ProductModel product;
  final HomeBloc homebloc;
  const ProductTile({super.key, required this.product, required this.homebloc});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      child: Row(
        children: [
          //showing the product image
          ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: Hero(
                tag: product.imagePath,
                child: Image.asset(
                  product.imagePath,
                  width: 185,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              )),

          //sized box for spacing
          const SizedBox(width: 20),

          //product details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //adding the shoe name
                Text(product.shoename,
                    style: GoogleFonts.poppins(
                        fontSize: 20,
                        height: 1.4,
                        color: MyColors.black,
                        fontWeight: FontWeight.w600)),

                Text("${product.description.substring(0, 70)}...",
                    style: GoogleFonts.poppins(
                        fontSize: 14,
                        color: MyColors.secondary,
                        fontWeight: FontWeight.w500)),

                const SizedBox(height: 5),

                Text('\$${product.price}',
                    style: GoogleFonts.poppins(
                        fontSize: 24,
                        color: MyColors.secondary,
                        fontWeight: FontWeight.bold)),

                const SizedBox(height: 18),

                InkWell(
                  onTap: (){
                    homebloc.add(HomeProductViewButtomCickedEvent(productModel: product));
                  },
                  child: Container(
                      width: 150,
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          color: MyColors.primary),
                      child: Center(
                          child: Text("View Product",
                              style: GoogleFonts.dmSans(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  ),
                              textAlign: TextAlign.center))),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
