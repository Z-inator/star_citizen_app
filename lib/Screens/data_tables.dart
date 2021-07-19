import 'package:flutter/material.dart';

class DataTable extends StatelessWidget {
  const DataTable({Key? key}) : super(key: key);
  final int rowsLength;
  final int columnsLength;
  final Widget legendCell;
  final Widget Function(int columnIndex) columnsTitleBuilder;
  final Widget Function(int rowIndex) rowsTitleBuilder;
  final Widget Function(int columnIndex, int rowIndex) contentCellBuilder;
  final CellDimensions cellDimensions;
  final CellAlignments cellAlignments;
  final Function() onStickyLegendPressed;
  final Function(int columnIndex) onColumnTitlePressed;
  final Function(int rowIndex) onRowTitlePressed;
  final Function(int columnIndex, int rowIndex) onContentCellPressed;
  final double initialScrollOffsetX;
  final double initialScrollOffsetY;
  final Function(double x, double y)? onEndScrolling;
  final ScrollControllers scrollControllers;


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            // STICKY LEGEND
            // GestureDetector(
            //   behavior: HitTestBehavior.opaque,
            //   onTap: widget.onStickyLegendPressed,
            //   child: Container(
            //     width: widget.cellDimensions.stickyLegendWidth,
            //     height: widget.cellDimensions.stickyLegendHeight,
            //     alignment: widget.cellAlignments.stickyLegendAlignment,
            //     child: widget.legendCell,
            //   ),
            // ),
            // STICKY ROW
            Expanded(
              child: NotificationListener<ScrollNotification>(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(
                      columnsLength,
                      (i) => GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: () => onColumnTitlePressed(i),
                        child: Container(
                          width: cellDimensions.stickyWidth(i),
                          height: cellDimensions.stickyLegendHeight,
                          alignment: cellAlignments.rowAlignment(i),
                          child: columnsTitleBuilder(i),
                        ),
                      ),
                    ),
                  ),
                  controller:
                      scrollControllers._horizontalTitleController,
                ),
                onNotification: (ScrollNotification notification) {
                  final didEndScrolling =
                      _horizontalSyncController.processNotification(
                    notification,
                    widget.scrollControllers._horizontalTitleController,
                  );
                  if (widget.onEndScrolling != null && didEndScrolling) {
                    _scrollOffsetX = widget
                        .scrollControllers._horizontalTitleController.offset;
                    widget.onEndScrolling!(_scrollOffsetX, _scrollOffsetY);
                  }
                  return true;
                },
              ),
            )
          ],
        ),
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // STICKY COLUMN
              NotificationListener<ScrollNotification>(
                child: SingleChildScrollView(
                  child: Column(
                    children: List.generate(
                      widget.rowsLength,
                      (i) => GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: () => widget.onRowTitlePressed(i),
                        child: Container(
                          width: widget.cellDimensions.stickyLegendWidth,
                          height: widget.cellDimensions.stickyHeight(i),
                          alignment: widget.cellAlignments.columnAlignment(i),
                          child: widget.rowsTitleBuilder(i),
                        ),
                      ),
                    ),
                  ),
                  controller: widget.scrollControllers._verticalTitleController,
                ),
                onNotification: (ScrollNotification notification) {
                  final didEndScrolling =
                      _verticalSyncController.processNotification(
                    notification,
                    widget.scrollControllers._verticalTitleController,
                  );
                  if (widget.onEndScrolling != null && didEndScrolling) {
                    _scrollOffsetY = widget
                        .scrollControllers._verticalTitleController.offset;
                    widget.onEndScrolling!(_scrollOffsetX, _scrollOffsetY);
                  }
                  return true;
                },
              ),
              // CONTENT
              Expanded(
                child: NotificationListener<ScrollNotification>(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    controller:
                        widget.scrollControllers._horizontalBodyController,
                    child: NotificationListener<ScrollNotification>(
                      child: SingleChildScrollView(
                        controller:
                            widget.scrollControllers._verticalBodyController,
                        child: Column(
                          children: List.generate(
                            widget.rowsLength,
                            (int rowIdx) => Row(
                              children: List.generate(
                                widget.columnsLength,
                                (int columnIdx) => GestureDetector(
                                  behavior: HitTestBehavior.opaque,
                                  onTap: () => widget.onContentCellPressed(
                                      columnIdx, rowIdx),
                                  child: Container(
                                    width: widget.cellDimensions
                                        .contentSize(rowIdx, columnIdx)
                                        .width,
                                    height: widget.cellDimensions
                                        .contentSize(rowIdx, columnIdx)
                                        .height,
                                    alignment: widget.cellAlignments
                                        .contentAlignment(rowIdx, columnIdx),
                                    child: widget.contentCellBuilder(
                                        columnIdx, rowIdx),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      onNotification: (ScrollNotification notification) {
                        final didEndScrolling =
                            _verticalSyncController.processNotification(
                          notification,
                          widget.scrollControllers._verticalBodyController,
                        );
                        if (widget.onEndScrolling != null && didEndScrolling) {
                          _scrollOffsetY = widget
                              .scrollControllers._verticalBodyController.offset;
                          widget.onEndScrolling!(
                              _scrollOffsetX, _scrollOffsetY);
                        }
                        return true;
                      },
                    ),
                  ),
                  onNotification: (ScrollNotification notification) {
                    final didEndScrolling =
                        _horizontalSyncController.processNotification(
                      notification,
                      widget.scrollControllers._horizontalBodyController,
                    );
                    if (widget.onEndScrolling != null && didEndScrolling) {
                      _scrollOffsetX = widget
                          .scrollControllers._horizontalBodyController.offset;
                      widget.onEndScrolling!(_scrollOffsetX, _scrollOffsetY);
                    }
                    return true;
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    )
    );
  }
}

class ScrollControllers {
  final ScrollController _verticalTitleController;
  final ScrollController _verticalBodyController;

  final ScrollController _horizontalBodyController;
  final ScrollController _horizontalTitleController;

  ScrollControllers({
    ScrollController? verticalTitleController,
    ScrollController? verticalBodyController,
    ScrollController? horizontalBodyController,
    ScrollController? horizontalTitleController,
  })  : this._verticalTitleController =
            verticalTitleController ?? ScrollController(),
        this._verticalBodyController =
            verticalBodyController ?? ScrollController(),
        this._horizontalBodyController =
            horizontalBodyController ?? ScrollController(),
        this._horizontalTitleController =
            horizontalTitleController ?? ScrollController();
}

/// SyncScrollController keeps scroll controllers in sync.
class _SyncScrollController {
  _SyncScrollController(List<ScrollController> controllers) {
    controllers
        .forEach((controller) => _registeredScrollControllers.add(controller));
  }

  final List<ScrollController> _registeredScrollControllers = [];

  ScrollController? _scrollingController;
  bool _scrollingActive = false;

  /// Returns true if reached scroll end
  bool processNotification(
    ScrollNotification notification,
    ScrollController controller,
  ) {
    if (notification is ScrollStartNotification && !_scrollingActive) {
      _scrollingController = controller;
      _scrollingActive = true;
      return false;
    }

    if (identical(controller, _scrollingController) && _scrollingActive) {
      if (notification is ScrollEndNotification) {
        _scrollingController = null;
        _scrollingActive = false;
        return true;
      }

      if (notification is ScrollUpdateNotification) {
        for (ScrollController controller in _registeredScrollControllers) {
          if (identical(_scrollingController, controller)) continue;
          controller.jumpTo(_scrollingController!.offset);
        }
      }
    }
    return false;
  }
}