import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:recipebook/pages/components/header_widget/entities/header_item.dart';

import 'state.dart';

Widget buildView(MainState state, Dispatch dispatch, ViewService viewService) {
  final headerWidget = viewService.buildComponent('header_widget');

  return Scaffold(
    body: SingleChildScrollView(
      child: Center(
        child: SizedBox(
          width: 1200,
          child: Column(
            children: [
              headerWidget,
              _buildBody(state, viewService),
            ],
          ),
        ),
      ),
    ),
  );
}

Widget _buildBody(MainState state, ViewService viewService) {
  switch (state.headerWidgetState.selectedItem) {
    case HeaderItem.home:
      return viewService.buildComponent('home_page');
    case HeaderItem.recipes:
      return viewService.buildComponent('recipes_page');
    case HeaderItem.favorite:
    // return viewService.buildComponent('favorite_page');
    case HeaderItem.recipeForm:
    // return viewService.buildComponent('recipe_form_page');
    case HeaderItem.recipeDetail:
    // return viewService.buildComponent('recipe_detail_page');
    case HeaderItem.profile:
    // return viewService.buildComponent('profile_page');
    default:
      return viewService.buildComponent('recipes_page');
  }
}
