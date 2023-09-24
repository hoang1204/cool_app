import 'package:brandshop/search/controller/seach-controller.dart';
import 'package:brandshop/search/widgets/search_not_found.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../cart/controller/cart_controller.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SearchController1>(
      builder: (searchController) => Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 50,
              ),
              TextButton(
                  onPressed: () {
                    return Get.back();
                  },
                  child: Text("Back")),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  "assets/images/logo.png",
                  width: MediaQuery.sizeOf(context).width / 2,
                ),
              ),
              Center(
                child: Container(
                  width: MediaQuery.sizeOf(context).width - 30,
                  child: TextFormField(
                    onChanged: (value) {
                      return searchController.filterItem(value);
                    },
                    decoration: InputDecoration(
                      hintText: "Search",
                      labelStyle: const TextStyle(
                        color: Colors.black,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.3122410774),
                        borderSide: const BorderSide(
                          color: Color(0xffc0c0c0),
                        ),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 14, vertical: 6),
                    ),
                  ),
                ),
              ),
              StaggeredGridView.countBuilder(
                crossAxisSpacing: 2,
                mainAxisSpacing: 2,
                itemCount: searchController.results.length,
                crossAxisCount: 2,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                staggeredTileBuilder: (int index) => const StaggeredTile.fit(1),
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 300,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all()),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 140,
                              child: ClipRRect(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(16),
                                  topRight: Radius.circular(16),
                                ),
                                child: InkWell(
                                  onTap: () {},
                                  child: Container(
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: NetworkImage(searchController
                                              .results[index].productImage!),
                                          fit: BoxFit.contain),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                      left: 8,
                                      right: 8,
                                      top: 6,
                                    ),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Flexible(
                                              child: Text(
                                                searchController.results[index]
                                                    .productName!,
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 8,
                                        ),
                                        Text(
                                          searchController
                                              .results[index].productPrice!
                                              .toString(),
                                          style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 13,
                                            height: 1.4,
                                          ),
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        InkWell(
                                          onTap: () {
                                            Get.find<CartController>()
                                                .addProductToCart(
                                                    searchController
                                                        .searchDatalist[index]);
                                            Get.snackbar("SUCCESS",
                                                "Your cart was added product");
                                            searchController.update();
                                          },
                                          child: Container(
                                              height: 40,
                                              width: 60,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(16),
                                                color: const Color.fromARGB(
                                                  255,
                                                  113,
                                                  113,
                                                  114,
                                                ),
                                              ),
                                              child: Icon(
                                                Icons.shopping_cart,
                                                color: Colors.white,
                                              )),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
