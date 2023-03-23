import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../common/widget/glassmorphic_container/glassmorphic.dart';

class SearchingButton extends StatefulWidget {
  const SearchingButton({Key? key}) : super(key: key);

  @override
  _SearchingBarState createState() => _SearchingBarState();
}

class _SearchingBarState extends State<SearchingButton> {
  @override
  Widget build(BuildContext context) {
    return GlassmorphicContainer(
      width: 40,
      height: 40,
      borderRadius: 20,
      blur: 10,
      alignment: Alignment.center,
      border: 2,
      linearGradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Colors.white.withOpacity(0.1),
          Colors.white.withOpacity(0.01),
        ],
        stops: const [
          0.1,
          1,
        ],
      ),
      borderGradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Colors.white.withOpacity(0.1),
          Colors.white.withOpacity(0.05),
        ],
      ),
      child: GestureDetector(
        onTap: () {
          context.push('/search');
          // Perform search operation
        },
        child: const Icon(
          Icons.search,
          color: Colors.white,
          size: 20,
        ),
      ),
    );
  }
}
// TextField(
//         controller: textController,
//         decoration: InputDecoration(
//           border: InputBorder.none,
//           hintText: 'Search',
//           hintStyle: TextStyle(
//             color: Colors.grey[400],
//             fontSize: 16,
//           ),
//           prefixIcon: Icon(
//             Icons.search,
//             color: Colors.white,
//             size: 16,
//           ),
//           contentPadding: EdgeInsets.symmetric(
//             vertical: 8,
//             horizontal: 10,
//           ),
//         ),
//       )