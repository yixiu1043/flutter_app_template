import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_app_template/gen/colors.gen.dart';

typedef LibraryLoader = Future<void> Function();
typedef DeferredWidgetBuilder = Widget Function();

///延迟加载组件
class DeferredWidget extends StatefulWidget {
  DeferredWidget(this.libraryLoader, this.createWidget,
      {Key? key, Widget? placeholder})
      : placeholder = placeholder ?? Container(color: ColorName.color111425),
        super(key: key);

  final LibraryLoader libraryLoader;
  final DeferredWidgetBuilder createWidget;
  final Widget placeholder;

  // 存储 libraryLoader 对应的 future 数据
  static final Map<LibraryLoader, Future<void>> _moduleLoaders = {};

  // 存储已经预加载过了的 libraryLoader
  static final Set<LibraryLoader> _loadedModules = {};

  static Future<void>? preload(LibraryLoader loader) {
    if (!_moduleLoaders.containsKey(loader)) {
      _moduleLoaders[loader] = loader().then((dynamic _) {
        _loadedModules.add(loader);
      });
    }
    return _moduleLoaders[loader];
  }

  @override
  State<DeferredWidget> createState() => _DeferredWidgetState();
}

class _DeferredWidgetState extends State<DeferredWidget> {
  Widget? _loadedChild;

  @override
  void initState() {
    if (DeferredWidget._loadedModules.contains(widget.libraryLoader)) {
      _onLibraryLoaded();
    } else {
      DeferredWidget.preload(widget.libraryLoader)
          ?.then((dynamic _) => _onLibraryLoaded());
    }
    super.initState();
  }

  void _onLibraryLoaded() {
    setState(() {
      _loadedChild = widget.createWidget();
    });
  }

  @override
  Widget build(BuildContext context) {
    return _loadedChild ?? widget.placeholder;
  }
}
