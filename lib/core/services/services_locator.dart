import 'package:get_it/get_it.dart';
import '../../features/login/data/datasource/login_remote_data_source.dart';
import '../../features/login/data/repository/login_repo.dart';
import '../../features/login/domain/repository/base_login_repo.dart';
import '../../features/login/domain/usecases/capture_token_uc.dart';
import '../../features/login/domain/usecases/check_if_login_before_uc.dart';
import '../../features/login/domain/usecases/login_uc.dart';
import '../../features/login/domain/usecases/logout_uc.dart';
import '../../features/login/domain/usecases/update_profile_uc.dart';
import '../../features/login/presentation/controller/login_bloc.dart';
import '../../features/messages/data/datasource/msgs_remote_data_source.dart';
import '../../features/messages/data/repository/msgs_repo.dart';
import '../../features/messages/domain/repository/base_msgs_repo.dart';
import '../../features/messages/domain/usecases/get_notifications_uc.dart';
import '../../features/messages/presentation/controller/msgs_bloc.dart';
import '../../features/referee/data/datasource/ref_remote_data_source.dart';
import '../../features/referee/data/repository/ref_repo.dart';
import '../../features/referee/domain/repository/base_ref_repo.dart';
import '../../features/referee/domain/usecases/get_ref_activities_uc.dart';
import '../../features/referee/domain/usecases/get_ref_categories_uc.dart';
import '../../features/referee/domain/usecases/update_ref_activity_uc.dart';
import '../../features/referee/presentation/controller/ref_bloc.dart';
import '../../features/team/data/datasource/team_remote_data_source.dart';
import '../../features/team/data/repository/team_repo.dart';
import '../../features/team/domain/repository/base_team_repo.dart';
import '../../features/team/domain/usecases/add_activity_uc.dart';
import '../../features/team/domain/usecases/chose_photos_paths_uc.dart';
import '../../features/team/domain/usecases/chose_videos_paths_uc.dart';
import '../../features/team/domain/usecases/get_activities_uc.dart';
import '../../features/team/domain/usecases/get_categories_uc.dart';
import '../../features/team/domain/usecases/remove_photo_path_uc.dart';
import '../../features/team/domain/usecases/remove_video_path_uc.dart';
import '../../features/team/domain/usecases/set_data_activity_uc.dart';
import '../../features/team/domain/usecases/update_activity_uc.dart';
import '../../features/team/presentation/controller/team_bloc.dart';

final sl = GetIt.instance;

class ServicesLocator {
  void init() {
    //Bloc
    sl.registerFactory(() => LoginBloc(sl(), sl(), sl(), sl(), sl()));
    sl.registerFactory(
        () => TeamBloc(sl(), sl(), sl(), sl(), sl(), sl(), sl(), sl(), sl()));
    sl.registerFactory(() => RefBloc(sl(), sl(), sl()));
    sl.registerFactory(() => MsgsBloc(sl()));

    //Use Case
    sl.registerLazySingleton(() => LoginUc(sl()));
    sl.registerLazySingleton(() => GetCategoriesUc(sl()));
    sl.registerLazySingleton(() => GetActivitiesUc(sl()));
    sl.registerLazySingleton(() => ChosePhotosPathsUc(sl()));
    sl.registerLazySingleton(() => ChoseVideosPathsUc(sl()));
    sl.registerLazySingleton(() => AddActivityUc(sl()));
    sl.registerLazySingleton(() => UpdateActivityUc(sl()));
    sl.registerLazySingleton(() => RemovePhotoPathUc(sl()));
    sl.registerLazySingleton(() => RemoveVideoPathUc(sl()));
    sl.registerLazySingleton(() => SetDateActivityUc(sl()));

    sl.registerLazySingleton(() => CaptureTokenUc(sl()));
    sl.registerLazySingleton(() => CheckIfLoginBeforeUc(sl()));

    sl.registerLazySingleton(() => GetRefCategoriesUc(sl()));

    sl.registerLazySingleton(() => GetRefActivitiesUc(sl()));
    sl.registerLazySingleton(() => UpdateRefActivityUc(sl()));
    sl.registerLazySingleton(() => LogoutUc(sl()));
    sl.registerLazySingleton(() => UpdateProfileUc(sl()));

    sl.registerLazySingleton(() => GetNotificationsUc(sl()));

    //Repo
    sl.registerLazySingleton<BaseLoginRepo>(() => LoginRepo(sl()));
    sl.registerLazySingleton<BaseTeamRepo>(() => TeamRepo(sl()));
    sl.registerLazySingleton<BaseRefRepo>(() => RefRepo(sl()));
    sl.registerLazySingleton<BaseMsgsRepo>(() => MsgsRepo(sl()));

    //Data Source
    sl.registerLazySingleton<BaseLoginRemoteDataSource>(
        () => LoginRemoteDataSource());
    sl.registerLazySingleton<BaseTeamRemoteDataSource>(
        () => TeamRemoteDataSource());
    sl.registerLazySingleton<BaseRefRemoteDataSource>(
        () => RefRemoteDataSource());
    sl.registerLazySingleton<BaseMsgsRemoteDataSource>(
        () => MsgsRemoteDataSource());
  }
}
