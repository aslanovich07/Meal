import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:meals/screens/tabs_screen.dart';
// import 'package:meals/widgets/main_drawer.dart';
import 'package:meals/providers/filter_provider.dart';

class FilterScreen extends ConsumerStatefulWidget {
  const FilterScreen({super.key});

  @override
  ConsumerState<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends ConsumerState<FilterScreen> {
  var _glutenFreeFilterSet = false;
  var _lactosFreeFilterSet = false;
  var _vegeterianFreeFilterSet = false;
  var _veganFreeFilterSet = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final activeFilters = ref.read(filterProvider);
    _glutenFreeFilterSet = activeFilters[Filter.glutenFree]!;
    _lactosFreeFilterSet = activeFilters[Filter.lactosFree]!;
    _veganFreeFilterSet = activeFilters[Filter.veganFree]!;
    _vegeterianFreeFilterSet = activeFilters[Filter.vegetarianFree]!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Filtered Screen")),
      // drawer:
      //  MainDrawer(
      //   onSelect: (identifier) {
      //     Navigator.of(context).pop();
      //     if (identifier == "meals") {
      //       Navigator.of(context).push(MaterialPageRoute(
      //         builder: (context) => const TabsScreen(),
      //       ));
      //     }
      //   },
      // ),
      body: WillPopScope(
        onWillPop: () async {
          ref.read(filterProvider.notifier).setFilters({
            Filter.glutenFree: _glutenFreeFilterSet,
            Filter.lactosFree: _lactosFreeFilterSet,
            Filter.veganFree: _veganFreeFilterSet,
            Filter.vegetarianFree: _vegeterianFreeFilterSet
          });
       
          return true;
        },
        child: Column(children: [
          SwitchListTile(
            value: _glutenFreeFilterSet,
            onChanged: (value) {
              setState(() {
                _glutenFreeFilterSet = value;
              });
            },
            title: Text(
              "Gluten-free ",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            subtitle: Text(
              "only include  gluten-free meals",
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
          ),
          SwitchListTile(
            value: _lactosFreeFilterSet,
            onChanged: (value) {
              setState(() {
                _lactosFreeFilterSet = value;
              });
            },
            title: Text(
              "Lactos-free ",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            subtitle: Text(
              "only include  lactos-free meals",
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
          ),
          SwitchListTile(
            value: _vegeterianFreeFilterSet,
            onChanged: (value) {
              setState(() {
                _vegeterianFreeFilterSet = value;
              });
            },
            title: Text(
              "Vegeterian-free ",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            subtitle: Text(
              "only include  vegeterian-free meals",
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
          ),
          SwitchListTile(
            value: _veganFreeFilterSet,
            onChanged: (value) {
              setState(() {
                _veganFreeFilterSet = value;
              });
            },
            title: Text(
              "Vegan-free ",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            subtitle: Text(
              "only include  vegan-free meals",
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
          ),
        ]),
      ),
    );
  }
}
