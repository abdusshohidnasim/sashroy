import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sashroy/features/home/model/best_selling_model.dart' as bs;
import 'package:sashroy/features/home/model/recent_producted_model.dart' as rp;
import 'package:sashroy/networks/api_acess.dart';
import 'home_state.dart';

class HomeBloc extends Cubit<HomeStateData> {
  HomeBloc() : super(const HomeStateData(state: HomeState.initial)) {
    fetchHomeData();
  }

  final PageController newArrivalController =
      PageController(viewportFraction: 0.5);
  final PageController bestSellingController =
      PageController(viewportFraction: 0.5);
  final PageController topRatedController =
      PageController(viewportFraction: 0.5);
  final PageController _dealsScrollController =
      PageController(viewportFraction: 0.45);

  PageController get dealsScrollController => _dealsScrollController;

  static const int totalTopRated = 6;

  // ==================== FETCH API DATA ====================

  Future<void> fetchHomeData() async {
    emit(state.copyWith(state: HomeState.loading));
    try {
      final results = await Future.wait([
        getBestSellingRxObj.fetchfunctionName(),
        getRecentActivityRxObj.fetchfunctionName(),
      ]);

      if (results[0] && results[1]) {
        final bsData =
            getBestSellingRxObj.dataFetcher.value as bs.BestSellingModel;
        final rpData =
            getRecentActivityRxObj.dataFetcher.value as rp.RecentProductsModel;

        emit(state.copyWith(
          state: HomeState.success,
          bestSellingProducts: bsData.products,
          newArrivalProducts: rpData.products,
        ));
      } else {
        emit(state.copyWith(
          state: HomeState.failure,
          errorMessage: "Failed to fetch home data",
        ));
      }
    } catch (e) {
      emit(state.copyWith(
        state: HomeState.failure,
        errorMessage: e.toString(),
      ));
    }
  }

  // ==================== INDEX CHANGE HANDLERS ====================

  void onNewArrivalPageChanged(int index) {
    emit(state.copyWith(newArrivalIndex: index));
  }

  void onBestSellingPageChanged(int index) {
    emit(state.copyWith(bestSellingIndex: index));
  }

  void onTopRatedPageChanged(int index) {
    emit(state.copyWith(topRatedIndex: index));
  }

  void onDealsPageChanged(int index) {
    emit(state.copyWith(dealsActiveIndex: index));
  }

  // ==================== NAVIGATION (LEFT/RIGHT BUTTON) ====================

  void newArrivalPrev() {
    if (state.newArrivalIndex == 0) return;
    newArrivalController.previousPage(
        duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
  }

  void newArrivalNext() {
    if (state.newArrivalProducts.isEmpty) return;
    int maxIndex = state.newArrivalProducts.length - 2;
    if (maxIndex < 0) maxIndex = 0;
    if (state.newArrivalIndex >= maxIndex) return;
    newArrivalController.nextPage(
        duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
  }

  void bestSellingPrev() {
    if (state.bestSellingIndex == 0) return;
    bestSellingController.previousPage(
        duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
  }

  void bestSellingNext() {
    if (state.bestSellingProducts.isEmpty) return;
    int maxIndex = state.bestSellingProducts.length - 2;
    if (maxIndex < 0) maxIndex = 0;
    if (state.bestSellingIndex >= maxIndex) return;
    bestSellingController.nextPage(
        duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
  }

  void topRatedPrev() {
    if (state.topRatedIndex == 0) return;
    topRatedController.previousPage(
        duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
  }

  void topRatedNext() {
    if (state.topRatedIndex == totalTopRated - 1) return;
    topRatedController.nextPage(
        duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
  }

  // ==================== DEALS SCROLL LISTENER REMOVED ====================

  // ==================== FAVORITE ====================

  void toggleFavorite(String productId) {
    final updatedSet = Set<String>.from(state.favoriteProductIds);
    if (updatedSet.contains(productId)) {
      updatedSet.remove(productId);
    } else {
      updatedSet.add(productId);
    }
    emit(state.copyWith(favoriteProductIds: updatedSet));
  }

  bool isFavorite(String productId) =>
      state.favoriteProductIds.contains(productId);

  // ==================== DISPOSE ====================

  @override
  Future<void> close() {
    newArrivalController.dispose();
    bestSellingController.dispose();
    topRatedController.dispose();
    _dealsScrollController.dispose();
    return super.close();
  }
}
