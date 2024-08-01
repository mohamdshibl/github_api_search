import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit() : super(FavoriteInitial());

  static FavoriteCubit get(context) => BlocProvider.of(context);


  bool isFavorite = false;
  void favoriteBtmToggle() {
    isFavorite =!isFavorite;
    emit(ChangeFavoriteBtmState());
  }


}
