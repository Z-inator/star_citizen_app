import 'package:flutter/material.dart';


class ComponentTile extends StatelessWidget {
  const ComponentTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      padding: EdgeInsets.all(10),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Material(
            color: Theme.of(context).colorScheme.primaryVariant,
            elevation: 4,
            shape: BeveledRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
            ),
            child: Container(
              width: 80.0,
              child: Column(
                children: [
                  TextButton(
                    child: Text('Gimbal S4'),
                    onPressed: () {},
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Icon(Icons.bolt_rounded),
                      Text('34'),
                      Spacer(),
                      Icon(Icons.ac_unit_rounded),
                      Text('26')
                    ],
                  )
                ],
              ),
            ),
          ),
          Container(
            width: 24.0,
            height: 2.0,
            color: Theme.of(context).colorScheme.secondary,
          ),
          Material(
            color: Theme.of(context).colorScheme.primaryVariant,
            elevation: 4,
            shape: BeveledRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
            ),
            child: Container(
              width: 80.0,
              child: Column(
                children: [
                  TextButton(
                    child: Text('Revenant'),
                    onPressed: () {},
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Icon(Icons.bolt_rounded),
                      Text('34'),
                      Spacer(),
                      Icon(Icons.ac_unit_rounded),
                      Text('26')
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}