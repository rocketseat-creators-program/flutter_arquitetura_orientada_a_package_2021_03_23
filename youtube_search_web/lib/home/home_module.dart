import 'package:flutter_modular/flutter_modular.dart';
import 'package:youtube_search_web/home/controller/home_controller.dart';

import 'home_page.dart';
import 'package:youtube_search_business/youtube_search_business.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    ...YoutubeModularAdapter().binds(),
    Bind.factory((i) => HomeController(i())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (context, args) => HomePage(controller: Modular.get())),
  ];
}
