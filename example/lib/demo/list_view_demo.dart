import 'package:flutter/material.dart';
import 'package:flutter_candies_demo_library/flutter_candies_demo_library.dart';
import 'package:loading_more_list/loading_more_list.dart';
import 'package:ff_annotation_route/ff_annotation_route.dart';

@FFRoute(
    name: 'fluttercandies://ListViewDemo',
    routeName: 'ListView',
    description: 'Show how to build loading more ListView quickly')
class ListViewDemo extends StatefulWidget {
  @override
  _ListViewDemoState createState() => _ListViewDemoState();
}

class _ListViewDemoState extends State<ListViewDemo> {
  TuChongRepository listSourceRepository;
  @override
  void initState() {
    listSourceRepository = TuChongRepository();
    super.initState();
  }

  @override
  void dispose() {
    listSourceRepository?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: <Widget>[
          AppBar(
            title: const Text('ListViewDemo'),
          ),
          Expanded(
            child: LoadingMoreList<TuChongItem>(
              ListConfig<TuChongItem>(
                itemBuilder: itemBuilder,
                sourceList: listSourceRepository,
//                    showGlowLeading: false,
//                    showGlowTrailing: false,
                padding: const EdgeInsets.all(0.0),
                extendedListDelegate: ExtendedListDelegate(
                  collectGarbage: (List<int> indexes) {
                    ///collectGarbage
                  },
                  viewportBuilder: (int firstIndex, int lastIndex) {
                    print('viewport : [$firstIndex,$lastIndex]');
                  },
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
