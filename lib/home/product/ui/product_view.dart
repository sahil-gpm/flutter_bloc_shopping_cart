import 'package:flutter/material.dart';
import 'package:flutter_bloc_shopping_cart/Colors/my_colors.dart';
import 'package:flutter_bloc_shopping_cart/home/models/product.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductView extends StatelessWidget {
  final ProductModel productModel;

  const ProductView({super.key, required this.productModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 70),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(productModel.shoename,
                    style: GoogleFonts.dmSans(
                        fontSize: 30, fontWeight: FontWeight.w500)),
                const Icon(
                  Icons.favorite_border,
                  color: MyColors.primary,
                )
              ],
            ),

            const SizedBox(height: 20),

            ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Hero(
                  tag: productModel.imagePath,
                  child: Image.asset(
                    productModel.imagePath,
                    height: 360,
                    width: 900,
                    fit: BoxFit.cover,
                  ),
                )),

            const SizedBox(height: 40),
            Text(
              "\$${productModel.price.toString()}",
              style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
            Text(
              productModel.description,
              style: const TextStyle(fontSize: 15.5, fontWeight: FontWeight.w500),
            ),

            const SizedBox(height: 40),

            Container(
              width: 900,
              height: 60,
              decoration: BoxDecoration(
                color: MyColors.primary,
                borderRadius: BorderRadius.circular(12)
              ),
              child: Center(
                child: Text("Make it yours now",style: GoogleFonts.dmSans(
                  fontSize: 19,
                  fontWeight: FontWeight.w600,
                )),
              ),
            ),

            const SizedBox(height: 10,),

            Container(
              width: 900,
              height: 60,
              decoration: BoxDecoration(
                color: MyColors.whiteTint,
                borderRadius: BorderRadius.circular(12)
              ),
              child: Center(
                child: Text("Add to wishlist",style: GoogleFonts.dmSans(
                  fontSize: 19,
                  fontWeight: FontWeight.w600,
                )),
              ),
            )

          ],
        ),
      ),
    );
  }
}
