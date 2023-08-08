library home;

import 'dart:ui';

import 'package:ani_going/constant/AppColor.dart';
import 'package:ani_going/shared/controller/detail_anime_controller.dart';
import 'package:ani_going/shared/model/anime_ongoing_model.dart';
import 'package:ani_going/shared/model/anime_upcoming_model.dart';
import 'package:ani_going/routes.dart';
import 'package:ani_going/services/anime_api.dart';
import 'package:ani_going/shared/widget/shared_widget.dart';
import 'package:ani_going/translation/app_translation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

//view
part 'package:ani_going/modules/home/view/home_page.dart';
part 'package:ani_going/modules/home/view/see_all_page.dart';

//widget
part 'package:ani_going/modules/home/widgets/list_anime.dart';
part 'package:ani_going/modules/home/widgets/header.dart';

//controller
part 'package:ani_going/modules/home/controller/home_page_controller.dart';

//binding
part 'package:ani_going/modules/home/binding/home_page_binding.dart';
