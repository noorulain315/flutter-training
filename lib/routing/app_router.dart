import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_training/assigment_two/trip_list_screen.dart';
import 'package:flutter_training/assignment_eight/datasource/post_remote_data_source.dart';
import 'package:flutter_training/assignment_eight/network/api_client.dart';
import 'package:flutter_training/assignment_eight/posts_cubit.dart';
import 'package:flutter_training/assignment_eight/screens/posts_screen.dart';
import 'package:flutter_training/assignment_four_five/add_trip_screen.dart';
import 'package:flutter_training/assignment_four_five/trip_details_screen.dart';
import 'package:flutter_training/assignment_nine/screens/riverpod_posts_screen.dart';
import 'package:flutter_training/assignment_eleven/camera_screen.dart';
import 'package:flutter_training/assignment_ten/presentation/screens/posts_screen.dart';
import 'package:flutter_training/assignment_one/trip_repository.dart';
import 'package:flutter_training/assignment_six/TripsCubit.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) {
        return TripListScreen();
      },
    ),
    GoRoute(
      path: '/trip-details',
      builder: (context, state) {
        final trip = state.extra as Trip;
        return TripDetailsScreen(trip);
      },
    ),
    GoRoute(
      path: '/add-trip',
      builder: (context, state) => const AddTripScreen(),
    ),
    GoRoute(
      path: '/posts',
      builder: (context, state) {
        return BlocProvider(
          create: (_) => PostsCubit(
            PostRemoteDataSource(ApiClient().dio),
          )..loadPosts(),
          child: const PostsScreen(),
        );
      },
    ),
    GoRoute(
      path: '/riverpod-posts',
      builder: (context, state) => const RiverpodPostsScreen(),
    ),
    GoRoute(
      path: '/clean-posts',
      builder: (context, state) => const CleanPostsScreen(),
    ),
    GoRoute(
      path: '/camera',
      builder: (context, state) => const CameraScreen(),
    ),
  ],
);
