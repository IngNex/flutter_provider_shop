import 'package:flutter/material.dart';
import 'package:flutter_provider_shop/domain/repository/api_repository.dart';
import 'package:flutter_provider_shop/domain/repository/local_storage_repository.dart';
import 'package:flutter_provider_shop/ui/common/theme.dart';
import 'package:flutter_provider_shop/ui/screens/home/home_screen.dart';
import 'package:flutter_provider_shop/ui/screens/login/login_screen.dart';
import 'package:flutter_provider_shop/ui/screens/splash/splash_bloc.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen._();

  static Widget init(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SplashBloc(
        localRepositoryInterface: context.read<LocalRepositoryInterface>(),
        apiRepositoryInterface: context.read<ApiRepositoryInterface>(),
      ),
      builder: (_, __) => SplashScreen._(),
    );
  }

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void _init() async {
    final bloc = context.read<SplashBloc>();
    final result = await bloc.validateSession();
    if (result) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (_) => HomeScreen(),
        ),
      );
    } else {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (_) => LoginScreen.init(context),
        ),
      );
    }
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        _init();
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: deliveryGradients,
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              top: size.height * 0.4,
              left: 0,
              right: 0,
              child: Column(
                children: [
                  TweenAnimationBuilder(
                    tween: Tween(begin: 1.0, end: 0.0),
                    duration: const Duration(milliseconds: 700),
                    curve: Curves.ease,
                    builder: (context, value, child) {
                      return Transform.translate(
                        offset: Offset(0, 100.0 * value),
                        child: CircleAvatar(
                          backgroundColor: DeliveryColors.white,
                          radius: 80,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset('assets/images/ingnex.png'),
                          ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 10),
                  TweenAnimationBuilder(
                    tween: Tween(begin: 1.0, end: 0.0),
                    duration: const Duration(milliseconds: 850),
                    curve: Curves.ease,
                    builder: (context, value, child) {
                      return Transform.translate(
                        offset: Offset(0, 100.0 * value),
                        child: Text(
                          "IngNex Shop",
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .headline4
                              ?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: DeliveryColors.white),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 10,
              left: 0,
              right: 0,
              child: Text(
                "© MaicolDev",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline4?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                    fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
