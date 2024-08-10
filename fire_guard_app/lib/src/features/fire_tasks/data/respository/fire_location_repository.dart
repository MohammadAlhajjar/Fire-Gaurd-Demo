// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:dartz/dartz.dart';
import 'package:fire_guard_app/src/features/fire_tasks/data/models/fire_location_model.dart';
import 'package:fire_guard_app/src/features/fire_tasks/data/service/fire_location_service.dart';

import '../../../../../core/error/fauilers.dart';
import '../../../../../core/network/network_connection_info.dart';

abstract class FireLocationRepo {
  Future<Either<Failure, FireLocationOrHistoryModel>> getFireLocation(
      {required int fireId});
}

class FireLocationRepoImpl implements FireLocationRepo {
  InternetConnectionInfo internetConnectionInfo;
  FireLocationService fireLocationService;
  FireLocationRepoImpl({
    required this.internetConnectionInfo,
    required this.fireLocationService,
  });

  @override
  Future<Either<Failure, FireLocationOrHistoryModel>> getFireLocation(
      {required int fireId}) async {
    try {
      if (await internetConnectionInfo.isConnected) {
        try {
          var result =
              await fireLocationService.getFireLocation(fireId: fireId);
          FireLocationOrHistoryModel fireLocation =
              FireLocationOrHistoryModel.fromMap(result);
          return Right(fireLocation);
        } on Exception catch (e) {
          print('-------<<Exception: $e>>---------------------------');
          return Left(ServerFailure());
        }
      } else {
        return Left(OfflineFailure());
      }
    } on Exception catch (e) {
      print('-------<<Exception: $e>>---------------------------');
      return Left(ServerFailure());
    }
  }
}