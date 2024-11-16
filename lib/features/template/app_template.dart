import 'package:admin/core/common/widgets/responsive/responsive_widget.dart';
import 'package:admin/features/template/cubit/header/header_cubit.dart';
import 'package:admin/features/template/layouts/desktop_template.dart';
import 'package:admin/features/template/layouts/mobile_template.dart';
import 'package:admin/features/template/layouts/tablet_template.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomAppTemplate extends StatelessWidget {
  const CustomAppTemplate({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // Init Header cubit
    context.read<HeaderCubit>().initUserData();

    return const CustomResponsiveWidget(
      desktop: CustomDesktopTemplate(),
      tablet: CustomTabletTemplate(),
      mobile: CustomMoblieTemplate(),
    );
  }
}
