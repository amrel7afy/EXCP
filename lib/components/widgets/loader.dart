import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../cubit/loader_cubit/loader_cubit.dart';
import '../../cubit/loader_cubit/loader_state.dart';

class Loader extends StatelessWidget {
  const Loader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<Loading, LoadingState>(
        bloc: Loading.instance(),
        builder: (context, state) {
          if (state.loading) {
            return Container(
                height: 1.sh,
                width: 1.sw,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  color: Colors.black.withOpacity(.1),
                ),
                child: const Center(child: CircularProgressIndicator()));
          } else {
            return const SizedBox.shrink();
          }
        });
  }
}
