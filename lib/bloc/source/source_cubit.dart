import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/api/api_manger.dart';
import 'package:news/bloc/source/source_state.dart';

class SourceCubit extends Cubit<SourceState> {
  //todo hold data - handle logic
  int selectedIndex=0;
  SourceCubit() : super(InitialState());
  void getSource(String categoryId) async {
    try {
      emit(LoadingState());
      var response = await ApiManger.getSource(categoryId);
      if (response.status == 'ok') {
        emit(SuccessState(sourceList: response.sources));
      } else {
        emit(ErrorState(errorMessage: response.message));
      }
    } catch (e) {
      emit(ErrorState(errorMessage: e.toString()));
    }
  }
  void changeIndex(int index){
    selectedIndex=index;
    emit(ChangeIndexState());
  }
}
