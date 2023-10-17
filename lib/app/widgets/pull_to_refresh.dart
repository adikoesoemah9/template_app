import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:base_app/app/values/app_color.dart';
import 'package:base_app/helper/extensions/widget_ext.dart';

class PullToRefresh extends StatefulWidget {
  const PullToRefresh({
    Key? key,
    required this.child,
    this.list,
    this.onRefresh,
    this.scrollController,
    this.refreshTriggerPullDistance,
    this.positionedTop,
    this.indicatorColor,
    this.isOneChild = false,
  }) : super(key: key);

  final Widget child;
  final Widget? list;
  final Future<void> Function()? onRefresh;
  final ScrollController? scrollController;
  final double? refreshTriggerPullDistance;
  final double? positionedTop;
  final Color? indicatorColor;
  final bool isOneChild;

  @override
  State<PullToRefresh> createState() => _PullToRefreshState();
}

class _PullToRefreshState extends State<PullToRefresh> {
  var _isRefreshDone = false;

  @override
  Widget build(BuildContext context) {
    var pullDistance = widget.refreshTriggerPullDistance ?? 100.h;

    return CustomScrollView(
      controller: widget.scrollController,
      physics:
          const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
      slivers: [
        CupertinoSliverRefreshControl(
          refreshTriggerPullDistance: pullDistance,
          onRefresh: widget.onRefresh,
          builder: (context, mode, offset, _, __) {
            if (mode == RefreshIndicatorMode.inactive) {
              _isRefreshDone = true;
              Future.delayed(const Duration(seconds: 1), () {
                _isRefreshDone = false;
              });
            }

            var top = widget.positionedTop ?? 0.0;

            return Center(
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Positioned(
                    top: top,
                    left: 0.0,
                    right: 0.0,
                    child: Row(
                      children: [
                        const Spacer(),
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 150),
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation(
                              widget.indicatorColor ?? AppColor.white,
                            ),
                            strokeWidth: 3.r,
                            value: mode == RefreshIndicatorMode.drag
                                ? (offset.clamp(20, pullDistance) - 20) /
                                    (pullDistance - 20)
                                : _isRefreshDone ||
                                        mode == RefreshIndicatorMode.done
                                    ? 0
                                    : null,
                          ),
                        ).sizedBox(width: 20.r, height: 20.r),
                        const Spacer(),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
        widget.isOneChild
            ? SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, _) => widget.child,
                  childCount: 1,
                ),
              )
            : widget.child,
      ],
    );
  }
}
