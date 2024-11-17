import 'package:admin/core/common/shimmers/shimmer.dart';
import 'package:admin/core/common/widgets/images/rounded_images.dart';
import 'package:admin/core/constants/colors.dart';
import 'package:admin/core/constants/enums.dart';
import 'package:admin/core/constants/images.dart';
import 'package:admin/core/constants/sizes.dart';
import 'package:admin/core/utils/device/device_utility.dart';
import 'package:admin/features/authentication/domain/entities/user_entity.dart';
import 'package:admin/features/template/cubit/header/header_cubit.dart';
import 'package:admin/features/template/cubit/sidebar/sidebar_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';

class CustomHeaderLayout extends StatelessWidget
    implements PreferredSizeWidget {
  const CustomHeaderLayout({super.key});

  @override
  Widget build(BuildContext context) {
    // Key
    final GlobalKey<ScaffoldState> scaffoldKey =
        context.read<SidebarCubit>().scaffoldKey;

    return BlocBuilder<HeaderCubit, HeaderState>(
      builder: (BuildContext context, state) {
        switch (state) {
          case HeaderLoading():
            return const LoadingHeaderLayout();
          case HeaderSuccess():
            return SuccessHeaderLayout(
              user: state.user,
              scaffoldKey: scaffoldKey,
            );
          case HeaderFailure():
            return FailureHeaderLayout(failure: state.failure.message);
        }
      },
    );
  }

  @override
  Size get preferredSize =>
      Size.fromHeight(UDeviceUtils.getAppBarHeight() + 15);
}

class SuccessHeaderLayout extends StatelessWidget {
  const SuccessHeaderLayout({super.key, this.scaffoldKey, required this.user});

  final GlobalKey<ScaffoldState>? scaffoldKey;

  final UserEntity user;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: CSizes.md, vertical: CSizes.sm),
      decoration: const BoxDecoration(
          color: CColors.white,
          border: Border(bottom: BorderSide(color: CColors.grey))),
      child: AppBar(
        // Drawer
        leading: !UDeviceUtils.isDesktopScreen(context)
            ? IconButton(
                onPressed: () {
                  scaffoldKey!.currentState!.openDrawer();
                },
                icon: const Icon(Iconsax.menu))
            : null,

        // Search
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

          // Notifications
          IconButton(onPressed: () {}, icon: const Icon(Iconsax.notification)),
          const SizedBox(width: CSizes.spaceBtwItems / 2),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Profile Image
              CustomRoundedImage(
                image: user.profilePicture.isNotEmpty
                    ? user.profilePicture
                    : CImages.user,
                imageType: user.profilePicture.isNotEmpty
                    ? ImageType.network
                    : ImageType.asset,
                width: 40,
                height: 40,
                padding: 2,
              ),
              const SizedBox(width: CSizes.sm),

              // User Email
              if (!UDeviceUtils.isMobileScreen(context))
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(user.email,
                        style: Theme.of(context).textTheme.titleLarge),
                    Text(user.fullName,
                        style: Theme.of(context).textTheme.labelMedium)
                  ],
                )
            ],
          )
        ],
      ),
    );
  }
}

class LoadingHeaderLayout extends StatelessWidget {
  const LoadingHeaderLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: CSizes.sm),
      child: CustomShimmerEffect(
        width: double.infinity,
        height: UDeviceUtils.getAppBarHeight() + 15,
      ),
    );
  }
}

class FailureHeaderLayout extends StatelessWidget {
  const FailureHeaderLayout({super.key, required this.failure});

  final String failure;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        failure,
        style: Theme.of(context)
            .textTheme
            .bodyLarge
            ?.copyWith(color: CColors.error),
      ),
    );
  }
}
