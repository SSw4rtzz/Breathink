import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          _searchField(),
        ],
      ),
      
      /*body: Center(
        child: Container(
          width: double.infinity,
          height: 200,
          child: Card(
            color: Colors.blue,
            elevation: 10,
            shadowColor: Colors.red,

            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Text('Home Screen'),
            ),
          ),
        ),
      ),*/
    );
  }

  Container _searchField() {
    return Container(
          margin: EdgeInsets.only(top: 50,left: 20,right: 20),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
              color: const Color(0xff1D1D1D).withOpacity(0.11),
              blurRadius: 40,
              spreadRadius: 0,
              ),
            ],
          ),
          child: TextField(
            decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            contentPadding: const EdgeInsets.all(15),
            hintText: 'Pesquisar', // !Não está a aparecer
            hintStyle: const TextStyle(
              color: Color(0xff1D1D1D),
              fontSize: 14,
            ),
          prefixIcon: const Icon(Iconsax.search_normal_1),
          suffixIcon: const IntrinsicHeight(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                VerticalDivider(
                  color: Colors.black,
                  indent: 10,
                  endIndent: 10,
                  thickness: 0.2,
                ),
                Padding(
                  padding: EdgeInsets.all(15),
                  child: Icon(Iconsax.filter_search),
                  )
              ],
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide.none,
          )
          ),
        ),
        );
  }
}