import 'package:flutter/material.dart';
import 'package:shadcn_flutter/shadcn_flutter.dart';

abstract class RouteBase {
  final String label;
  final String path;
  final IconData icon;

  RouteBase({required this.label, required this.path, required this.icon});
}

enum RouteMapper implements RouteBase {
  dashboard(label: 'Dashboard', path: '/', icon: RadixIcons.dashboard),
  usersOverview(
      label: 'Utilisateurs',
      path: '/accounts/users/overview',
      icon: RadixIcons.avatar),
  membersOverview(
      label: 'Membres',
      path: '/accounts/members/overview',
      icon: RadixIcons.avatar),
  organizationOverview(
      label: 'Organisations', path: '/organization', icon: RadixIcons.stack),
  structuresOverview(
      label: 'Structures', path: '/structures', icon: RadixIcons.home),
  featuresOverview(
      label: 'Features', path: '/features', icon: RadixIcons.rocket),
  subscriptionOverview(
      label: 'Souscriptions', path: '/subscriptions', icon: RadixIcons.lightningBolt);

  @override
  final String label;

  @override
  final String path;

  @override
  final IconData icon;

  const RouteMapper(
      {required this.label, required this.path, required this.icon});
}

final List<RouteBase> defaultLinks = [RouteMapper.dashboard];
final List<RouteBase> accountLinks = [
  RouteMapper.usersOverview,
  RouteMapper.membersOverview
];

final List<RouteBase> platformLinks = [
  RouteMapper.organizationOverview,
  RouteMapper.structuresOverview,
  RouteMapper.featuresOverview,
  RouteMapper.subscriptionOverview
];

final routerLinks = [...defaultLinks, ...accountLinks, ...platformLinks];
