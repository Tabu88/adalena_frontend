
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../helpers/enums.dart';

class WebNavigationController extends GetxController{

  Rx<AdalenaPageType> adalenaPageType = AdalenaPageType.home.obs;

  Rx<AdalenaPages> adalenaPages = AdalenaPages.home.obs;
}