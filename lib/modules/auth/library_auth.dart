library auth;

import 'package:ani_going/shared/controller/auth_controller.dart';
import 'package:ani_going/shared/controller/translations_controller.dart';
import 'package:ani_going/routes.dart';
import 'package:ani_going/constant/AppColor.dart';
import 'package:ani_going/translation/app_translation.dart';
import 'package:ani_going/utils/custom_snackbar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

//view
part 'package:ani_going/modules/auth/view/login_page.dart';
part 'package:ani_going/modules/auth/view/signup_page.dart';

//widget
part 'package:ani_going/modules/auth/widget/custom_text_field.dart';
part 'package:ani_going/modules/auth/widget/custom_button.dart';
part 'package:ani_going/modules/auth/widget/custom_devider.dart';

//controller
part 'package:ani_going/modules/auth/controller/signup_page_controller.dart';
part 'package:ani_going/modules/auth/controller/login_page_controller.dart';

//binding
part 'package:ani_going/modules/auth/binding/signup_page_binding.dart';
part 'package:ani_going/modules/auth/binding/login_page_binding.dart';
