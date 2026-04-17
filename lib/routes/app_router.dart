import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

import '../Auth/presentation/screens/splash_screen/splash_screen.dart';
import '../features/invitation/data/model/invitation_event_data.dart';
import '../features/invitation/data/model/invitation_template_model.dart';
import '../features/invitation/presentations/screens/card_editor_page.dart';
import '../features/invitation/presentations/screens/template_selection_page.dart';

import 'app_routes.dart';

class AppRouter {
  AppRouter._();

  static final GoRouter router = GoRouter(
    initialLocation: AppRoutes.splash,
    routes: [
      GoRoute(
        path: AppRoutes.splash,
        name: 'splash',
        builder: (context, state) => const SplashScreen(),
      ),
      // GoRoute(
      //   path: AppRoutes.onboarding,
      //   name: 'onboarding',
      //   builder: (context, state) => const OnboardingScreen(),
      // ),
      // GoRoute(
      //   path: AppRoutes.login,
      //   name: 'login',
      //   builder: (context, state) => BlocProvider(
      //     create: (_) => GetIt.I<AuthBloc>(),
      //     child: const LoginController(),
      //   ),
      // ),
      // GoRoute(
      //   path: AppRoutes.signup,
      //   name: 'signup',
      //   builder: (context, state) => BlocProvider(
      //     create: (_) => GetIt.I<AuthBloc>(),
      //     child: const SignUpController(),
      //   ),
      // ),
      // GoRoute(
      //   path: AppRoutes.forgetPassword,
      //   name: 'forgetPassword',
      //   builder: (context, state) => const ForgetPasswordController(),
      // ),
      // GoRoute(
      //   path: AppRoutes.confirmPassword,
      //   name: 'confirmPassword',
      //   builder: (context, state) => const ConfirmPasswordController(),
      // ),
      // GoRoute(
      //   path: AppRoutes.home,
      //   name: 'home',
      //   builder: (context, state) => const MainNavigation(),
      // ),
      // GoRoute(
      //   path: AppRoutes.eventsList,
      //   builder: (context, state) => const EventsListScreen(),
      // ),
      // GoRoute(
      //   path: AppRoutes.createEvent,
      //   builder: (context, state) => CreateEventController(),
      // ),
      // GoRoute(
      //   path: AppRoutes.eventDashboard,
      //   builder: (context, state) => const EventDashboardScreen(
      //     eventName: '',
      //     eventType: '',
      //     eventLocation: '',
      //   ),
      // ),
      // GoRoute(
      //   path: AppRoutes.guestList,
      //   builder: (context, state) => const GuestListScreen(),
      // ),
      // GoRoute(
      //   path: AppRoutes.rsvp,
      //   builder: (context, state) => const RSVPManagementScreen(),
      // ),
      // GoRoute(
      //   path: AppRoutes.eventDetails,
      //   builder: (context, state) => const EventDetailsScreen(),
      // ),
      //
      // GoRoute(
      //   path: AppRoutes.notification,
      //   name: 'notification',
      //   builder: (context, state) => const NotificationScreen(),
      // ),
      // GoRoute(
      //   path: AppRoutes.invitationType,
      //   builder: (context, state) => const InvitationTypePage(),
      // ),

      /// Template Selection
      // GoRoute(
      //   path: AppRoutes.templateSelection,
      //   builder: (context, state) {
      //     final extra = state.extra;
      //     return TemplateSelectionPage(
      //       eventData: extra is InvitationEventData ? extra : null,
      //     );
      //   },
      // ),

      /// Card Editor
      GoRoute(
        path: '/card-editor',
        builder: (context, state) {
          final extra = state.extra as Map<String, dynamic>;

          return CardEditorPage(
            template: extra['template'] as InvitationTemplateModel,
            eventData: extra['eventData'] as InvitationEventData,
          );
        },
      ),
    ],
  );
}
