import 'package:admin/features/template/cubit/sidebar/sidebar_cubit.dart';
import 'package:admin/features/template/widgets/body/body_layout.dart';
import 'package:admin/features/template/widgets/header/header_layout.dart';
import 'package:admin/features/template/widgets/sidebar/sidebar_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomTabletTemplate extends StatelessWidget {
  const CustomTabletTemplate({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // Key
    final GlobalKey<ScaffoldState> scaffoldKey =
        context.read<SidebarCubit>().scaffoldKey;

    return Scaffold(
        key: scaffoldKey,
        drawer: const CustomDrawerLayout(),
        appBar: const CustomHeaderLayout(),
        body: const CustomBodyLayout());
  }
}
