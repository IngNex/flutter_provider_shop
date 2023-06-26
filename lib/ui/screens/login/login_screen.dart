import 'package:flutter/material.dart';
import 'package:flutter_provider_shop/domain/repository/api_repository.dart';
import 'package:flutter_provider_shop/domain/repository/local_storage_repository.dart';
import 'package:flutter_provider_shop/ui/common/delivery_button.dart';
import 'package:flutter_provider_shop/ui/common/theme.dart';
import 'package:flutter_provider_shop/ui/screens/home/home_screen.dart';
import 'package:flutter_provider_shop/ui/screens/login/login_bloc.dart';
import 'package:provider/provider.dart';

const logoSize = 45.0;

class LoginScreen extends StatelessWidget {
  LoginScreen._();

  static Widget init(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => LoginBloc(
        localRepositoryInterface: context.read<LocalRepositoryInterface>(),
        apiRepositoryInterface: context.read<ApiRepositoryInterface>(),
      ),
      builder: (_, __) => LoginScreen._(),
    );
  }

  void Login(BuildContext context) async {
    final bloc = context.read<LoginBloc>();
    final result = await bloc.login();
    if (result) {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (_) => HomeScreen()));
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Login Incorrect')));
    }
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.watch<LoginBloc>();
    final size = MediaQuery.of(context).size;
    final width = size.width;
    const moreSize = 50.0;
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 2,
                child: Stack(
                  children: [
                    Positioned(
                      bottom: logoSize,
                      left: -moreSize / 2,
                      right: -moreSize / 2,
                      height: width + moreSize,
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: deliveryGradients,
                            stops: const [
                              0.5,
                              1.0,
                            ],
                          ),
                          borderRadius: BorderRadius.vertical(
                            bottom: Radius.circular(width),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: CircleAvatar(
                        radius: logoSize,
                        backgroundColor: Theme.of(context).canvasColor,
                        child: Padding(
                            padding: const EdgeInsets.all(5),
                            child: Image(
                              image:
                                  const AssetImage('assets/icons/ingnex.png'),
                              color: Theme.of(context).colorScheme.secondary,
                            )),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 4,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const SizedBox(height: 20),
                        Text(
                          'Login',
                          style:
                              Theme.of(context).textTheme.headline6?.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 50),
                        Text(
                          'Username',
                          textAlign: TextAlign.start,
                          style: Theme.of(context).textTheme.caption?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context)
                                  .inputDecorationTheme
                                  .labelStyle
                                  ?.color),
                        ),
                        TextField(
                          controller: bloc.usernameTextController,
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.person_outline,
                              color: Theme.of(context).iconTheme.color,
                            ),
                            hintText: 'username',
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          'Password',
                          textAlign: TextAlign.start,
                          style: Theme.of(context).textTheme.caption?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context)
                                  .inputDecorationTheme
                                  .labelStyle
                                  ?.color),
                        ),
                        TextField(
                          controller: bloc.passwordTextController,
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.person_outline,
                              color: Theme.of(context).iconTheme.color,
                            ),
                            hintText: 'password',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(25),
                child: DeliveryButton(
                  onTap: () => Login(context),
                  text: 'Login',
                  padding: const EdgeInsets.all(15),
                ),
              ),
            ],
          ),
          Positioned.fill(
            child: (bloc.loginState == LoginState.loading)
                ? Container(
                    color: Colors.black26,
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  )
                : const SizedBox.shrink(),
          ),
        ],
      ),
    );
  }
}
