
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:stylish/repo/location/location_repo.dart';

part 'location_provider.g.dart';

@riverpod
LocationRepo locationRepo(LocationRepoRef ref) => LocationRepo();

@riverpod
Future<String> userLocation(Ref ref) async {

  final service = ref.watch(locationRepoProvider);
  final position = await service.getCurrentPosition();
  if(position == null){

    return "Location unavailable";
  }else{

   return await service.getAddress(position) ?? "Address not found";
  }


}
