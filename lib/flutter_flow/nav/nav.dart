import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';

import '/auth/base_auth_user_provider.dart';

import '/flutter_flow/flutter_flow_util.dart';

import '/index.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

GlobalKey<NavigatorState> appNavigatorKey = GlobalKey<NavigatorState>();

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  BaseAuthUser? initialUser;
  BaseAuthUser? user;
  bool showSplashImage = true;
  String? _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(BaseAuthUser newUser) {
    final shouldUpdate =
        user?.uid == null || newUser.uid == null || user?.uid != newUser.uid;
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    // No need to update unless the user has changed.
    if (notifyOnAuthChange && shouldUpdate) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      navigatorKey: appNavigatorKey,
      errorBuilder: (context, state) => RootPageContext.wrap(
        appStateNotifier.loggedIn ? HomeWidget() : LoginWidget(),
        errorRoute: state.uri.toString(),
      ),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) => RootPageContext.wrap(
            appStateNotifier.loggedIn ? HomeWidget() : LoginWidget(),
          ),
        ),
        FFRoute(
          name: InitWidget.routeName,
          path: InitWidget.routePath,
          builder: (context, params) => InitWidget(),
        ),
        FFRoute(
          name: Intro1Widget.routeName,
          path: Intro1Widget.routePath,
          builder: (context, params) => Intro1Widget(),
        ),
        FFRoute(
          name: RoomDetailsPageWidget.routeName,
          path: RoomDetailsPageWidget.routePath,
          requireAuth: true,
          builder: (context, params) => RoomDetailsPageWidget(
            post: params.getParam<PostRoomViewRow>(
              'post',
              ParamType.SupabaseRow,
            ),
          ),
        ),
        FFRoute(
          name: HomeTenantWidget.routeName,
          path: HomeTenantWidget.routePath,
          requireAuth: true,
          builder: (context, params) => HomeTenantWidget(),
        ),
        FFRoute(
          name: RetrievePasswordPageWidget.routeName,
          path: RetrievePasswordPageWidget.routePath,
          builder: (context, params) => RetrievePasswordPageWidget(),
        ),
        FFRoute(
          name: EnterCodeForgotPasswordWidget.routeName,
          path: EnterCodeForgotPasswordWidget.routePath,
          builder: (context, params) => EnterCodeForgotPasswordWidget(),
        ),
        FFRoute(
          name: CreateNewPasswordPageWidget.routeName,
          path: CreateNewPasswordPageWidget.routePath,
          builder: (context, params) => CreateNewPasswordPageWidget(),
        ),
        FFRoute(
          name: LoginWidget.routeName,
          path: LoginWidget.routePath,
          builder: (context, params) => LoginWidget(),
        ),
        FFRoute(
          name: SignUpWidget.routeName,
          path: SignUpWidget.routePath,
          builder: (context, params) => SignUpWidget(
            type: params.getParam<Role>(
              'type',
              ParamType.Enum,
            ),
          ),
        ),
        FFRoute(
          name: HomeWidget.routeName,
          path: HomeWidget.routePath,
          requireAuth: true,
          builder: (context, params) => HomeWidget(),
        ),
        FFRoute(
          name: SearchRoomWidget.routeName,
          path: SearchRoomWidget.routePath,
          requireAuth: true,
          builder: (context, params) => SearchRoomWidget(
            cityId: params.getParam(
              'cityId',
              ParamType.int,
            ),
            roomTypeId: params.getParam(
              'roomTypeId',
              ParamType.int,
            ),
          ),
        ),
        FFRoute(
          name: NotificationTenantWidget.routeName,
          path: NotificationTenantWidget.routePath,
          requireAuth: true,
          builder: (context, params) => NotificationTenantWidget(),
        ),
        FFRoute(
          name: ProfileTenantWidget.routeName,
          path: ProfileTenantWidget.routePath,
          requireAuth: true,
          builder: (context, params) => ProfileTenantWidget(),
        ),
        FFRoute(
          name: ChatTenantWidget.routeName,
          path: ChatTenantWidget.routePath,
          requireAuth: true,
          builder: (context, params) => ChatTenantWidget(),
        ),
        FFRoute(
          name: ChatMessagesWidget.routeName,
          path: ChatMessagesWidget.routePath,
          requireAuth: true,
          builder: (context, params) => ChatMessagesWidget(
            chatId: params.getParam(
              'chatId',
              ParamType.String,
            ),
            post: params.getParam<PostRoomViewRow>(
              'post',
              ParamType.SupabaseRow,
            ),
          ),
        ),
        FFRoute(
          name: HomeLandlordWidget.routeName,
          path: HomeLandlordWidget.routePath,
          requireAuth: true,
          builder: (context, params) => HomeLandlordWidget(),
        ),
        FFRoute(
          name: ChatLandlordWidget.routeName,
          path: ChatLandlordWidget.routePath,
          requireAuth: true,
          builder: (context, params) => ChatLandlordWidget(),
        ),
        FFRoute(
          name: NotificationLandlordWidget.routeName,
          path: NotificationLandlordWidget.routePath,
          requireAuth: true,
          builder: (context, params) => NotificationLandlordWidget(),
        ),
        FFRoute(
          name: SettingLandlordWidget.routeName,
          path: SettingLandlordWidget.routePath,
          requireAuth: true,
          builder: (context, params) => SettingLandlordWidget(),
        ),
        FFRoute(
          name: EditRoomWidget.routeName,
          path: EditRoomWidget.routePath,
          requireAuth: true,
          builder: (context, params) => EditRoomWidget(
            id: params.getParam(
              'id',
              ParamType.String,
            ),
            type: params.getParam(
              'type',
              ParamType.String,
            ),
            buidingId: params.getParam(
              'buidingId',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: BuildingManagementWidget.routeName,
          path: BuildingManagementWidget.routePath,
          requireAuth: true,
          builder: (context, params) => BuildingManagementWidget(),
        ),
        FFRoute(
          name: EditBuildingWidget.routeName,
          path: EditBuildingWidget.routePath,
          requireAuth: true,
          builder: (context, params) => EditBuildingWidget(
            type: params.getParam(
              'type',
              ParamType.String,
            ),
            id: params.getParam(
              'id',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: EditPostWidget.routeName,
          path: EditPostWidget.routePath,
          requireAuth: true,
          builder: (context, params) => EditPostWidget(
            type: params.getParam(
              'type',
              ParamType.String,
            ),
            id: params.getParam(
              'id',
              ParamType.String,
            ),
            roomId: params.getParam(
              'roomId',
              ParamType.String,
            ),
            buildingId: params.getParam(
              'buildingId',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: AllMyPostsWidget.routeName,
          path: AllMyPostsWidget.routePath,
          requireAuth: true,
          builder: (context, params) => AllMyPostsWidget(),
        ),
        FFRoute(
          name: LandlordInformationWidget.routeName,
          path: LandlordInformationWidget.routePath,
          requireAuth: true,
          builder: (context, params) => LandlordInformationWidget(
            id: params.getParam(
              'id',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: ViewingAppointmentsTenantWidget.routeName,
          path: ViewingAppointmentsTenantWidget.routePath,
          requireAuth: true,
          builder: (context, params) => ViewingAppointmentsTenantWidget(),
        ),
        FFRoute(
          name: ViewingAppointmentsLandlordWidget.routeName,
          path: ViewingAppointmentsLandlordWidget.routePath,
          requireAuth: true,
          builder: (context, params) => ViewingAppointmentsLandlordWidget(
            tab: params.getParam(
              'tab',
              ParamType.int,
            ),
          ),
        ),
        FFRoute(
          name: FavouritePostsWidget.routeName,
          path: FavouritePostsWidget.routePath,
          requireAuth: true,
          builder: (context, params) => FavouritePostsWidget(),
        ),
        FFRoute(
          name: UpdateProfileWidget.routeName,
          path: UpdateProfileWidget.routePath,
          requireAuth: true,
          builder: (context, params) => UpdateProfileWidget(),
        ),
        FFRoute(
          name: UpdatePasswordWidget.routeName,
          path: UpdatePasswordWidget.routePath,
          builder: (context, params) => UpdatePasswordWidget(),
        ),
        FFRoute(
          name: EnterCodeSignUpWidget.routeName,
          path: EnterCodeSignUpWidget.routePath,
          builder: (context, params) => EnterCodeSignUpWidget(),
        ),
        FFRoute(
          name: StatsPageWidget.routeName,
          path: StatsPageWidget.routePath,
          requireAuth: true,
          builder: (context, params) => StatsPageWidget(),
        )
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
      observers: [routeObserver],
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState => AppStateNotifier.instance;
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void clearRedirectLocation() => appState.clearRedirectLocation();
  void setRedirectLocationIfUnset(String location) =>
      appState.updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(uri.queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.allParams.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, {
    bool isList = false,
    List<String>? collectionNamePath,
    StructBuilder<T>? structBuilder,
  }) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(
      param,
      type,
      isList,
      collectionNamePath: collectionNamePath,
      structBuilder: structBuilder,
    );
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        redirect: (context, state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.uri.toString());
            return '/login';
          }
          return null;
        },
        pageBuilder: (context, state) {
          fixStatusBarOniOS16AndBelow(context);
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
              ? Container(
                  color: Colors.white,
                  child: Image.asset(
                    'assets/images/logo_app.png',
                    fit: BoxFit.fitWidth,
                  ),
                )
              : page;

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).buildTransitions(
                    context,
                    animation,
                    secondaryAnimation,
                    child,
                  ),
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => TransitionInfo(hasTransition: false);
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouterState.of(context).uri.toString();
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}

extension GoRouterLocationExtension on GoRouter {
  String getCurrentLocation() {
    final RouteMatch lastMatch = routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : routerDelegate.currentConfiguration;
    return matchList.uri.toString();
  }
}
