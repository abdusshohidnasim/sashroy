import 'package:equatable/equatable.dart';

enum HomeState { initial, loading, success, failure }

class HomeStateData extends Equatable {
  final HomeState state;
  final String? errorMessage;
  final Set<int> favoriteProductIds;

  // Indicators
  final int newArrivalIndex;
  final int bestSellingIndex;
  final int topRatedIndex;
  final int dealsActiveIndex;

  const HomeStateData({
    required this.state,
    this.errorMessage,
    this.favoriteProductIds = const {},
    this.newArrivalIndex = 0,
    this.bestSellingIndex = 0,
    this.topRatedIndex = 0,
    this.dealsActiveIndex = 0,
  });

  HomeStateData copyWith({
    
    HomeState? state,
    String? errorMessage,
    Set<int>? favoriteProductIds,
    int? newArrivalIndex,
    int? bestSellingIndex,
    int? topRatedIndex,
    int? dealsActiveIndex,
  }) {
    return HomeStateData(
      state: state ?? this.state,
      errorMessage: errorMessage ?? this.errorMessage,
      favoriteProductIds: favoriteProductIds ?? this.favoriteProductIds,
      newArrivalIndex: newArrivalIndex ?? this.newArrivalIndex,
      bestSellingIndex: bestSellingIndex ?? this.bestSellingIndex,
      topRatedIndex: topRatedIndex ?? this.topRatedIndex,
      dealsActiveIndex: dealsActiveIndex ?? this.dealsActiveIndex,
    );
  }

  @override
  List<Object?> get props => [
        state,
        errorMessage,
        favoriteProductIds,
        newArrivalIndex,
        bestSellingIndex,
        topRatedIndex,
        dealsActiveIndex,
      ];
}