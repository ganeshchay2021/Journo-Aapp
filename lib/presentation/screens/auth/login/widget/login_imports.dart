import 'package:animation_wrappers/animations/faded_scale_animation.dart';
import 'package:auto_route/auto_route.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jurney_blog_app/core/constant/my_colors.dart';
import 'package:jurney_blog_app/presentation/common%20widgets/app_logo.dart';
import 'package:jurney_blog_app/presentation/common%20widgets/custom_button.dart';
import 'package:jurney_blog_app/presentation/routers/routers_imports.gr.dart';
import 'package:jurney_blog_app/presentation/screens/auth/login/widget/login_model.dart';
import 'package:jurney_blog_app/presentation/state/common_state.dart';
import 'package:jurney_blog_app/utils/utils.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:jurney_blog_app/data/repositories/repository.dart';

import '../cubit/login_cubit.dart';

part "../login.dart";
part "../widget/login_view_model.dart";
