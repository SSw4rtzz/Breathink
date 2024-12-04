import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class Search extends StatelessWidget {
  final String hintText;

  const Search({super.key, this.hintText = 'Pesquisar'});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 50, left: 20, right: 20),
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
          hintText: hintText,
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
          ),
        ),
      ),
    );
  }
}

