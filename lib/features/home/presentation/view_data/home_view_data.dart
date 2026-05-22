import '../../domain/entities/link_entity.dart';

class HomeViewData {
  final List<LinkEntity> links;
  final bool isLoading;

  const HomeViewData({
    required this.links,
    required this.isLoading,
  });
}
