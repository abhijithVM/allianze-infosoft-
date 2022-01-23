import 'package:allianze/core/data_base/fire_baseapi.dart';
import 'package:allianze/core/services/auth.dart';
import 'package:flutter/material.dart';

class CustomSearchBar extends StatefulWidget {
  const CustomSearchBar({Key? key}) : super(key: key);

  @override
  _CustomSearchBarState createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  final _controller = TextEditingController();
  final DataBaseMethods _databaseMethod = DataBaseMethods();
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: TextFormField(
          validator: (value) {
            if (value != null && value.isEmpty) {
              return "required";
            }
          },
          controller: _controller,
          maxLines: 1,
          onFieldSubmitted: (value) {
            FocusScope.of(context).unfocus();
            if (value.isNotEmpty) {
              _databaseMethod.getUserByName(value);
            }
          },
          decoration: InputDecoration(
            isDense: true,
            fillColor: Colors.white,
            contentPadding: const EdgeInsets.all(15),
            filled: true,
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(6.0),
              ),
            ),
            hintText: "search",
            hintStyle: const TextStyle(fontSize: 12),
            suffixIcon: Container(
              decoration: const BoxDecoration(
                  color: Colors.lightBlue,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(6),
                      bottomRight: Radius.circular(6))),
              child: IconButton(
                onPressed: () {
                  FocusScope.of(context).unfocus();
                  if (_controller.text.isNotEmpty) {
                    _databaseMethod
                        .getUserByName(_controller.text)
                        .then((val) => debugPrint(val.toString()));
                  }
                },
                icon: const Icon(Icons.search_rounded,
                    color: Colors.white, size: 34),
              ),
            ),
          ),
        ));
  }
}

class CustomAutoHideAppBarDelegate extends SliverPersistentHeaderDelegate {
  const CustomAutoHideAppBarDelegate({
    @required this.child,
  });

  final Widget? child;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final theme = Theme.of(context);
    return SizedBox(
      child: Material(
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: DefaultTextStyle.merge(
            style: theme.primaryTextTheme.subtitle1,
            child: IconTheme.merge(
              data: theme.primaryIconTheme,
              child: child!,
            ),
          ),
        ),
      ),
    );
  }

  @override
  double get minExtent => kToolbarHeight;

  @override
  double get maxExtent => kToolbarHeight;

  @override
  bool shouldRebuild(CustomAutoHideAppBarDelegate oldDelegate) =>
      child != oldDelegate.child;
}
