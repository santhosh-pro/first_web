import 'package:first_web/model/navigation_model.dart';
import 'package:flutter/material.dart';

import '../app_localizations.dart';
import '../locator.dart';
import '../navigation_service.dart';
import '../route_names.dart';
import '../router.dart';
import '../theme.dart';
import 'collapsing_list_tile_widget.dart';


class CollapsingNavigationDrawer extends StatefulWidget {
  final Function(int) onTab;
  final Function onClose;


  CollapsingNavigationDrawer({this.onTab,this.onClose});

  @override
  CollapsingNavigationDrawerState createState() {
    return new CollapsingNavigationDrawerState();
  }
}

class CollapsingNavigationDrawerState extends State<CollapsingNavigationDrawer>
    with SingleTickerProviderStateMixin {
  double maxWidth = 210;
  double minWidth = 70;
  bool isCollapsed = false;
  AnimationController _animationController;
  Animation<double> widthAnimation;
  int currentSelectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 300));
    widthAnimation = Tween<double>(begin: maxWidth, end: minWidth)
        .animate(_animationController);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, widget) => getWidget(context, widget),
    );
  }

  Widget getWidget(context, widget) {
    return Material(
      elevation: 80.0,
      child: Container(
        width: widthAnimation.value,
        color: drawerBackgroundColor,
        child: Column(
          children: <Widget>[
            CollapsingListTile(title:  AppLocalizations.of(context).translate('name'), icon: Icons.person, animationController: _animationController,),
            Divider(color: Colors.grey, height: 40.0,),
            Expanded(
              child: ListView.separated(
                separatorBuilder: (context, counter) {
                  return Divider(height: 12.0);
                },
                itemBuilder: (context, counter) {
                  return CollapsingListTile(
                        onTap: () {
                          setState(() {
                            currentSelectedIndex = counter;
                            locator<NavigationService>().navigateTo(navigationItems[counter].routePath);
                          });
                           
                        },
                        isSelected: currentSelectedIndex == counter,
                        title: navigationItems[counter].title,
                        icon: navigationItems[counter].icon,
                        animationController: _animationController,
                    );
                },
                itemCount: navigationItems.length,
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  isCollapsed = !isCollapsed;
                  isCollapsed
                      ? _animationController.forward()
                      : _animationController.reverse();
                });
                this.widget.onClose();
              },
              child: AnimatedIcon(
                icon: AnimatedIcons.close_menu,
                progress: _animationController,
                color: selectedColor,
                size: 50.0,
                
              ),
            ),
            SizedBox(
              height: 50.0,
            ),
          ],
        ),
      ),
    );
  }
}
