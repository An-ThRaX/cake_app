import 'package:flutter/material.dart';
import 'package:flutter_net_ninja_tutorial/cake_app/utils.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: textStyling('De-ale gurii',
          fontWeight: FontWeight.w900, customSize: 40.0),
      centerTitle: true,
      backgroundColor: const Color.fromARGB(251, 247, 255, 255),
      leading: IconButton(
        icon: const Icon(Icons.fast_rewind_rounded),
        // icon: const Icon(Icons.scatter_plot_outlined),
        color: const Color.fromARGB(255, 255, 199, 194),
        iconSize: 40,
        // it will return to home page
        onPressed: () {},
      ),
    );
  }
}
