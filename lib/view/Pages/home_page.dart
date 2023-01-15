import 'package:app_store/view/componend/cart_compn.dart';
import 'package:app_store/view/componend/products_compn.dart';
import 'package:app_store/view/componend/serch_compn.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int k = 0;
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: (k == 0 || k == 2)
          ? CustomScrollView(
              slivers: [
                CupertinoSliverNavigationBar(
                  largeTitle: (k == 0)
                      ? Text("Cupertino Store")
                      : Text("Shopping Cart"),
                ),
                SliverFillRemaining(
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      IndexedStack(
                        index: k,
                        children: [
                          Productscomp(),
                          search_com(),
                          Shopping_cart(),
                        ],
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: CupertinoTabBar(
                          onTap: (value) {
                            setState(() {
                              k = value;
                            });
                          },
                          currentIndex: k,
                          items: [
                            BottomNavigationBarItem(
                              icon: Icon(CupertinoIcons.home),
                              label: "Products",
                            ),
                            BottomNavigationBarItem(
                              icon: Icon(CupertinoIcons.search),
                              label: "Search",
                            ),
                            BottomNavigationBarItem(
                              icon: Icon(CupertinoIcons.cart),
                              label: "Cart",
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
          : Stack(
              alignment: Alignment.bottomCenter,
              children: [
                IndexedStack(
                  index: k,
                  children: [
                    Productscomp(),
                    search_com(),
                    Shopping_cart(),
                  ],
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: CupertinoTabBar(
                    onTap: (value) {
                      setState(() {
                        k = value;
                      });
                    },
                    currentIndex: k,
                    items: [
                      BottomNavigationBarItem(
                        icon: Icon(CupertinoIcons.home),
                        label: "Products",
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(CupertinoIcons.search),
                        label: "Search",
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(CupertinoIcons.cart),
                        label: "Cart",
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
