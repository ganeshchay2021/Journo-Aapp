import 'package:auto_route/auto_route.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jurney_blog_app/core/constant/my_colors.dart';
import 'package:jurney_blog_app/data/models/message_model.dart';
import 'package:jurney_blog_app/presentation/routers/routers_imports.gr.dart';
import 'package:jurney_blog_app/presentation/screens/general/category/bloc/category_bloc.dart';
import 'package:jurney_blog_app/presentation/screens/general/category/bloc/category_event.dart';
import 'package:jurney_blog_app/presentation/screens/general/category/widgets/category_model.dart';
import 'package:jurney_blog_app/presentation/screens/general/category/widgets/widgets_imports.dart';
import 'package:jurney_blog_app/presentation/state/common_state.dart';
import 'package:overlay_loader_with_app_icon/overlay_loader_with_app_icon.dart';
import 'package:velocity_x/velocity_x.dart';
part '../category.dart';

