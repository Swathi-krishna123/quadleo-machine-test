import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quadleo_machine_test/utils/constants/app_colors.dart';
import 'package:quadleo_machine_test/utils/constants/app_fonts.dart';
import 'package:quadleo_machine_test/utils/router/app_router.dart';
import 'package:quadleo_machine_test/views/auth/bloc/auth_bloc.dart';
import 'package:quadleo_machine_test/views/auth/bloc/auth_event.dart';
import 'package:quadleo_machine_test/views/auth/bloc/auth_state.dart';
import 'package:quadleo_machine_test/views/common_widgets/custom_textformfield.dart';
import 'package:quadleo_machine_test/views/home/bloc/product_bloc.dart';
import 'package:quadleo_machine_test/views/home/bloc/product_event.dart';
import 'package:quadleo_machine_test/views/home/bloc/product_state.dart';
import 'package:quadleo_machine_test/views/home/repository/model/home_model.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController searchController = TextEditingController();
  @override
  void initState() {
    super.initState();
    context.read<ProductBloc>().add(FetchProducts());
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthUnauthenticated) {
          Navigator.pushNamedAndRemoveUntil(
            context,
            AppRouter.login,
            (route) => false,
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text("Products"),
          actions: [
            InkWell(
              onTap: () {
                context.read<AuthBloc>().add(LogoutRequested());
              },
              child: Icon(Icons.logout),
            ),
            SizedBox(width: 15),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              SizedBox(height: 10),

              Row(
                children: [
                  Expanded(
                    child: CustomTextformfield(
                      controller: searchController,
                      hintText: "Search",
                      suffixicon: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: SvgPicture.asset("assets/svg/search.svg"),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  SvgPicture.asset("assets/svg/filter.svg"),
                ],
              ),
              SizedBox(height: 15),
              Expanded(
                child: BlocBuilder<ProductBloc, ProductState>(
                  builder: (context, state) {
                    if (state is ProductLoading) {
                      return Center(
                        child: CircularProgressIndicator(
                          color: AppColors.primary,
                          padding: EdgeInsets.all(15),
                        ),
                      );
                    } else if (state is ProductLoaded) {
                      final products = state.products;
                      return GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 4 / 5,
                          crossAxisSpacing: 16,
                          mainAxisSpacing: 16,
                        ),
                        itemCount: products.length,
                        itemBuilder: (context, index) {
                          final ProductModel product = products[index];
                          return Container(
                            decoration: BoxDecoration(
                              color: AppColors.foreground,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 15),
                                Expanded(
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(8),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 25,
                                      ),
                                      child: Image.network(
                                        product.image,
                                        fit: BoxFit.contain,
                                        width: double.infinity,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        product.title,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: AppFonts.bodySmall,
                                      ),
                                      SizedBox(height: 4),
                                      Text(
                                        '\₹ ${product.price}',
                                        style: AppFonts.amountText,
                                      ),
                                      SizedBox(height: 2),
                                      Row(
                                        children: [
                                          Text(
                                            product.rating.rate.toString(),
                                            style: AppFonts.bodySmall,
                                          ),
                                          SizedBox(width: 4),
                                          Icon(
                                            Icons.star,
                                            color: AppColors.green,
                                            size: 14,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    } else if (state is ProductError) {
                      return Center(child: Text(state.message));
                    }
                    return SizedBox();
                  },
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
