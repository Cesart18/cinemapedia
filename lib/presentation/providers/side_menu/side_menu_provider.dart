import 'package:cinemapedia/domain/entities/menu_items/menu_items.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final itemsMenuProvider = StateNotifierProvider<MenuItemsProvider, List<MenuItem>>((ref) {
  return MenuItemsProvider();
});

class MenuItemsProvider extends StateNotifier<List<MenuItem>> {
  MenuItemsProvider() : super(menuItems);

  void navigateItem(){

    
    

  }
}
