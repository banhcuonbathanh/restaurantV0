import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:restauranttdd0/common/extensions/string_hardcoded.dart';

import '../../../../../../common/provider/search_provider/search_provider.dart';
import '../../../../../../common/widget/form/custom_text_form_field.dart';
import '../../../controller/search_controller.dart';

class SearchButton extends ConsumerStatefulWidget {
  const SearchButton({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SearchButtonState();
}

class _SearchButtonState extends ConsumerState<SearchButton> {
  final TextEditingController _searchController2 = TextEditingController();
  @override
  void dispose() {
    _searchController2.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      labelText: ''.hardcoded,
      hintText: 'Search '.hardcoded,
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      controller: _searchController2,
      prefixIcon: const Icon(Icons.search),
      suffixIcon: IconButton(
        onPressed: () {
          _searchController2.clear();
        },
        icon: const Icon(Icons.clear),
      ),
      validator: (value) {},
      onChanged: (String? value) {
        ref.read(searchProvider.notifier).state = value!;
        ref.read(searchControllerProvider.notifier).int();
      },
    );
  }

  // void _runFilter( {required String enteredKeyword, result}) {
  //   List<Map<String, dynamic>> results = [];
  //   if (enteredKeyword.isEmpty) {
  //     // if the search field is empty or only contains white-space, we'll display all users
  //     results = _allUsers;
  //   } else {
  //     results = _allUsers
  //         .where((user) =>
  //             user["name"].toLowerCase().contains(enteredKeyword.toLowerCase()))
  //         .toList();
  //     // we use the toLowerCase() method to make it case-insensitive
  //   }
  // }
}
