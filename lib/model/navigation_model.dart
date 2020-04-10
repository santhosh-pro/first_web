import 'package:first_web/route_names.dart';
import 'package:flutter/material.dart';

class NavigationModel {
  String title;
  IconData icon;
  String routePath;

  NavigationModel({this.title, this.icon,this.routePath});
}

List<NavigationModel> navigationItems = [
  NavigationModel(title: "Overview", icon: Icons.insert_chart, routePath: AboutRoute),
  NavigationModel(title: "Packages", icon: Icons.error, routePath: HomeRoute),
  NavigationModel(title: "Trainees", icon: Icons.search,routePath: EpisodesRoute),
  NavigationModel(title: "Payments", icon: Icons.notifications, routePath: HomeRoute),
  NavigationModel(title: "Reports", icon: Icons.settings,routePath: EpisodesRoute),
];