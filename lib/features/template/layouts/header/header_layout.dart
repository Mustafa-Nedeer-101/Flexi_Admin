import 'package:admin/core/common/widgets/images/rounded_images.dart';
import 'package:admin/core/constants/colors.dart';
import 'package:admin/core/constants/images.dart';
import 'package:admin/core/constants/sizes.dart';
import 'package:admin/core/utils/device/device_utility.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class CustomHeaderLayout extends StatelessWidget
    implements PreferredSizeWidget {
  const CustomHeaderLayout({super.key, this.scaffoldKey});

  final GlobalKey<ScaffoldState>? scaffoldKey;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: CSizes.md, vertical: CSizes.sm),
      decoration: const BoxDecoration(
          color: CColors.white,
          border: Border(bottom: BorderSide(color: CColors.grey))),
      child: AppBar(
        leading: !UDeviceUtils.isDesktopScreen(context)
            ? IconButton(
                onPressed: () {
                  scaffoldKey?.currentState!.openDrawer();
                },
                icon: const Icon(Iconsax.menu))
            : null,
        title: UDeviceUtils.isDesktopScreen(context)
            ? SizedBox(
                width: 400,
                child: TextFormField(
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Iconsax.search_normal),
                      hintText: 'Search...'),
                ),
              )
            : null,
        actions: [
          if (!UDeviceUtils.isDesktopScreen(context))
            IconButton(
                onPressed: () {}, icon: const Icon(Iconsax.search_normal)),
          IconButton(onPressed: () {}, icon: const Icon(Iconsax.notification)),
          const SizedBox(width: CSizes.spaceBtwItems / 2),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CustomRoundedImage(
                image: CImages.user,
                width: 40,
                height: 40,
                padding: 2,
              ),
              const SizedBox(width: CSizes.sm),
              if (!UDeviceUtils.isMobileScreen(context))
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('mustafanedeer1@gmail.com',
                        style: Theme.of(context).textTheme.titleLarge),
                    Text('Mustafa Nedeer',
                        style: Theme.of(context).textTheme.labelMedium)
                  ],
                )
            ],
          )
        ],
      ),
    );
  }

  @override
  Size get preferredSize =>
      Size.fromHeight(UDeviceUtils.getAppBarHeight() + 15);
}
