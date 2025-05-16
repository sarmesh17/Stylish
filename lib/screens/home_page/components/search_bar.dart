import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomSearchBar extends ConsumerStatefulWidget {
  const CustomSearchBar({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _CustomSearchBar();
  }
}

class _CustomSearchBar extends ConsumerState<CustomSearchBar> {
  final query = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SearchBar(
        controller: query,
        leading: Image.asset(
          'assets/images/ic_search.png',
          width: 24,
          height: 24,
        ),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        ),
        elevation: WidgetStateProperty.all(1),
        backgroundColor: WidgetStateProperty.all(Colors.white),
        hintText: 'Search Any Product',
        hintStyle: WidgetStateProperty.all(TextStyle(color: Colors.grey)),


    );
  }
}
