import 'package:flutter/material.dart';

import 'package:flutter_sixvalley_ecommerce/localization/language_constrants.dart';
import 'package:flutter_sixvalley_ecommerce/provider/auth_provider.dart';
import 'package:flutter_sixvalley_ecommerce/provider/profile_provider.dart';
import 'package:flutter_sixvalley_ecommerce/provider/theme_provider.dart';
import 'package:flutter_sixvalley_ecommerce/utill/color_resources.dart';
import 'package:flutter_sixvalley_ecommerce/utill/custom_themes.dart';
import 'package:flutter_sixvalley_ecommerce/utill/dimensions.dart';
import 'package:flutter_sixvalley_ecommerce/utill/images.dart';
import 'package:flutter_sixvalley_ecommerce/view/screen/auth/widget/sign_in_widget.dart';
import 'package:flutter_sixvalley_ecommerce/view/screen/auth/widget/sign_up_widget.dart';
import 'package:provider/provider.dart';

class AuthScreen extends StatelessWidget{
  final int initialPage;
  const AuthScreen({Key? key, this.initialPage = 0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Provider.of<ProfileProvider>(context, listen: false).initAddressTypeList(context);
    Provider.of<AuthProvider>(context, listen: false).isRemember;
    PageController pageController = PageController(initialPage: initialPage);

    return Scaffold(
      body: Stack(
        clipBehavior: Clip.none,
        children: [

          Provider.of<ThemeProvider>(context).darkTheme ? const SizedBox() 
              :SizedBox(),
          /* Image.asset(Images.background, fit: BoxFit.fill,
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width),*/

          Consumer<AuthProvider>(
            builder: (context, auth, child) => SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

              /*    const SizedBox(height: Dimensions.topSpace),
                  Image.asset(Images.logoWithNameImage, height: 150, width: 200),
*/
                  _buildHeaderSection(context),
                  Padding(
                    padding: const EdgeInsets.all(Dimensions.marginSizeLarge),
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Positioned(bottom: 0,
                          right: Dimensions.marginSizeExtraSmall, left: 0,
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: 1, color: ColorResources.getGainsBoro(context),
                          ),
                        ),


                        Consumer<AuthProvider>(
                          builder: (context,authProvider,child)=>Row(
                            children: [
                              InkWell(
                                onTap: () => pageController.animateToPage(0, duration: const Duration(seconds: 1), curve: Curves.easeInOut),
                                child: Column(
                                  children: [
                                    Text(getTranslated('SIGN_IN', context)!,
                                        style: authProvider.selectedIndex == 0 ?
                                        titilliumSemiBold : titilliumRegular),
                                    Container(
                                      height: 1, width: 40,
                                      margin: const EdgeInsets.only(top: 8),
                                      color: authProvider.selectedIndex == 0 ?
                                      Theme.of(context).primaryColor : Colors.transparent,
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: Dimensions.paddingSizeExtraLarge),


                              InkWell(
                                onTap: () => pageController.animateToPage(1,
                                    duration: const Duration(seconds: 1), curve: Curves.easeInOut),
                                child: Column(
                                  children: [

                                    Text(getTranslated('SIGN_UP', context)!,
                                        style: authProvider.selectedIndex == 1 ?
                                        titilliumSemiBold : titilliumRegular),

                                    Container(height: 1, width: 50,
                                        margin: const EdgeInsets.only(top: 8),
                                        color: authProvider.selectedIndex == 1 ?
                                        Theme.of(context).primaryColor : Colors.transparent
                                    ),
                                  ],
                                ),
                              ),

                            ],
                          ),
                        ),
                      ],
                    ),
                  ),


                  Expanded(
                    child: Consumer<AuthProvider>(
                      builder: (context,authProvider,child)=>PageView.builder(
                        itemCount: 2,
                        controller: pageController,
                        itemBuilder: (context, index) {
                          if (authProvider.selectedIndex == 0) {
                            return const SignInWidget();
                          } else {
                            return const SignUpWidget();
                          }
                        },
                        onPageChanged: (index) {
                          authProvider.updateSelectedIndex(index);
                        },
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
  Widget _buildHeaderSection(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.35,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.only(left: 5),
      padding: const EdgeInsets.symmetric(horizontal: 5,),
      decoration: const BoxDecoration(
        //color: Colors.red,
          image: DecorationImage(image: AssetImage(Images.doodleForAuth),fit: BoxFit.fitWidth)),
      child: Column(
        children: [
          const SizedBox(

            height: 20,
          ),
          Image.asset(Images.logoWithNameImageWhite, height: 100, width: 200, scale: 4,),
          const SizedBox(

            height: 30,
          ),
           Align(
            alignment: Alignment.topLeft,
            child: Text(
              'Sign in to your account',
              style: titleH2Header,
            ),
          ),
          const SizedBox(height: 10),
          Container(
            width: 289,
            margin: const EdgeInsets.only(right: 50),
            child: const Text(
              'Lorem Ipsum is simply dummy text of the printing and typesetting industry',maxLines: 2,overflow: TextOverflow.ellipsis,style: robotoRegular,),
          )
        ],
      ),
    );
  }
}

