import 'package:equatable/equatable.dart';
import 'package:sashroy/features/home/model/best_selling_model.dart' as bs;
import 'package:sashroy/features/home/model/recent_producted_model.dart' as rp;

enum HomeState { initial, loading, success, failure }

class HomeStateData extends Equatable {
  final HomeState state;
  final String? errorMessage;
  final Set<String> favoriteProductIds;

  // Indicators
  final int newArrivalIndex;
  final int bestSellingIndex;
  final int topRatedIndex;
  final int dealsActiveIndex;

  // Products
  final List<rp.Product> newArrivalProducts;
  final List<bs.Product> bestSellingProducts;

  const HomeStateData({
    required this.state,
    this.errorMessage,
    this.favoriteProductIds = const {},
    this.newArrivalIndex = 0,
    this.bestSellingIndex = 0,
    this.topRatedIndex = 0,
    this.dealsActiveIndex = 0,
    this.newArrivalProducts = const [],
    this.bestSellingProducts = const [],
  });

  HomeStateData copyWith({
    HomeState? state,
    String? errorMessage,
    Set<String>? favoriteProductIds,
    int? newArrivalIndex,
    int? bestSellingIndex,
    int? topRatedIndex,
    int? dealsActiveIndex,
    List<rp.Product>? newArrivalProducts,
    List<bs.Product>? bestSellingProducts,
  }) {
    return HomeStateData(
      state: state ?? this.state,
      errorMessage: errorMessage ?? this.errorMessage,
      favoriteProductIds: favoriteProductIds ?? this.favoriteProductIds,
      newArrivalIndex: newArrivalIndex ?? this.newArrivalIndex,
      bestSellingIndex: bestSellingIndex ?? this.bestSellingIndex,
      topRatedIndex: topRatedIndex ?? this.topRatedIndex,
      dealsActiveIndex: dealsActiveIndex ?? this.dealsActiveIndex,
      newArrivalProducts: newArrivalProducts ?? this.newArrivalProducts,
      bestSellingProducts: bestSellingProducts ?? this.bestSellingProducts,
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
        newArrivalProducts,
        bestSellingProducts,
      ];
}