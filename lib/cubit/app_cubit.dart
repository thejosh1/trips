import 'package:bloc/bloc.dart';
import 'package:trips/cubit/app_cubit_states.dart';
import 'package:trips/models/data_models.dart';
import 'package:trips/services/data_services.dart';

class AppCubit extends Cubit<CubitState> {
  AppCubit({required this.data}) : super(InitializeState()) {
    emit(WelcomeState());
  }
  final Dataservices data;
  late final places;
  void getState() async {
    try {
      emit(LoadingState());
      places = await data.getInfo();
      emit(LoadedState(places));
    } catch (e) {}
  }

  void detailstate(DataModel data) async {
    emit(DetailState(data));
  }

  void goback() {
    emit(LoadedState(places));
  }
}
