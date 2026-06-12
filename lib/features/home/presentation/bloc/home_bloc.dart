import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'home_state.dart';

class HomeBloc extends Cubit<HomeStateData> {
  HomeBloc() : super(const HomeStateData(state: HomeState.initial)) {
    _dealsScrollController.addListener(_onDealsScroll);
  }

  // 💡 Controllers — state এর বাইরে রাখা হলো কারণ এগুলো Equatable props এ যাবে না
  final PageController newArrivalController =
      PageController(viewportFraction: 0.5);
  final PageController bestSellingController =
      PageController(viewportFraction: 0.5);
  final PageController topRatedController =
      PageController(viewportFraction: 0.5);
  final ScrollController _dealsScrollController = ScrollController();

  ScrollController get dealsScrollController => _dealsScrollController;

  static const int totalNewArrival = 6;
  static const int totalBestSelling = 6;
  static const int totalTopRated = 6;

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

  // ==================== NAVIGATION (LEFT/RIGHT BUTTON) ====================

  void newArrivalPrev() {
    if (state.newArrivalIndex == 0) return;
    newArrivalController.previousPage(
        duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
  }

  void newArrivalNext() {
    if (state.newArrivalIndex == totalNewArrival - 1) return;
    newArrivalController.nextPage(
        duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
  }

  void bestSellingPrev() {
    if (state.bestSellingIndex == 0) return;
    bestSellingController.previousPage(
        duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
  }

  void bestSellingNext() {
    if (state.bestSellingIndex == totalBestSelling - 1) return;
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

  // ==================== DEALS SCROLL LISTENER ====================

  void _onDealsScroll() {
    if (!_dealsScrollController.hasClients) return;

    final double offset = _dealsScrollController.offset;
    final double width0 = 165.w + 12.w;
    final double width1 = 135.w + 12.w;

    int index = 0;
    if (offset < width0 / 2) {
      index = 0;
    } else if (offset < width0 + width1 / 2) {
      index = 1;
    } else if (offset < width0 + width1 + width1 / 2) {
      index = 2;
    } else {
      index = 3;
    }

    if (index != state.dealsActiveIndex && index >= 0 && index < 4) {
      emit(state.copyWith(dealsActiveIndex: index));
    }
  }

  // ==================== FAVORITE ====================

  void toggleFavorite(int productId) {
    final updatedSet = Set<int>.from(state.favoriteProductIds);
    if (updatedSet.contains(productId)) {
      updatedSet.remove(productId);
    } else {
      updatedSet.add(productId);
    }
    emit(state.copyWith(favoriteProductIds: updatedSet));
  }

  bool isFavorite(int productId) =>
      state.favoriteProductIds.contains(productId);

  // ==================== DISPOSE ====================

  @override
  Future<void> close() {
    newArrivalController.dispose();
    bestSellingController.dispose();
    topRatedController.dispose();
    _dealsScrollController.removeListener(_onDealsScroll);
    _dealsScrollController.dispose();
    return super.close();
  }
}