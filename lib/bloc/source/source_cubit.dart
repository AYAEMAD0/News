import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:news/bloc/source/source_state.dart';
import 'package:news/data/repository/source/repository/source_repository.dart';

@injectable
class SourceCubit extends Cubit<SourceState> {
  //todo hold data - handle logic
  int selectedIndex = 0;
  SourceRepository sourceRepository;
  // late SourceRemoteDataSource sourceRemoteDataSource;
  // late ApiManger apiManger;

  SourceCubit({required this.sourceRepository}) : super(InitialState()) {
    // apiManger = ApiManger();
    // sourceRemoteDataSource = SourceRemoteDataSourceImpl(apiManger: apiManger);
    // sourceRepository = SourceRepositoryImpl(
    //   sourceRemoteDataSource: sourceRemoteDataSource);
  }
  void getSource(String categoryId) async {
    try {
      emit(LoadingState());
      var response = await sourceRepository.getSource(categoryId);
      if (response.status == 'ok') {
        emit(SuccessState(sourceList: response.sources));
      } else {
        emit(ErrorState(errorMessage: response.message));
      }
    } catch (e) {
      emit(ErrorState(errorMessage: e.toString()));
    }
  }

  void changeIndex(int index) {
    selectedIndex = index;
    emit(ChangeIndexState());
  }
}
