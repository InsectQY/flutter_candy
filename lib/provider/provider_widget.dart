import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class ProviderWidget<T extends ChangeNotifier> extends StatefulWidget {
  final ValueWidgetBuilder<T> builder;
  final T viewModel;
  final Widget child;
  final Function(T) onModelReady;

  ProviderWidget({
    Key key,
    @required this.builder,
    @required this.viewModel,
    this.child,
    this.onModelReady,
  }) : super(key: key);

  _ProviderWidgetState<T> createState() => _ProviderWidgetState<T>();
}

class _ProviderWidgetState<T extends ChangeNotifier>
    extends State<ProviderWidget<T>> {
  T model;

  @override
  void initState() {
    model = widget.viewModel;
    widget.onModelReady?.call(model);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>.value(
      value: model,
      child: Consumer<T>(
        builder: widget.builder,
        child: widget.child,
      ),
    );
  }
}

class ProviderWidget2<A extends ChangeNotifier, B extends ChangeNotifier>
    extends StatefulWidget {
  final Widget Function(BuildContext context, A model1, B model2, Widget child)
      builder;
  final A viewModel1;
  final B viewModel2;
  final Widget child;
  final Function(A, B) onModelReady;

  ProviderWidget2({
    Key key,
    @required this.builder,
    @required this.viewModel1,
    @required this.viewModel2,
    this.child,
    this.onModelReady,
  }) : super(key: key);

  _ProviderWidgetState2<A, B> createState() => _ProviderWidgetState2<A, B>();
}

class _ProviderWidgetState2<A extends ChangeNotifier, B extends ChangeNotifier>
    extends State<ProviderWidget2<A, B>> {
  A model1;
  B model2;

  @override
  void initState() {
    model1 = widget.viewModel1;
    model2 = widget.viewModel2;
    widget.onModelReady?.call(model1, model2);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<A>.value(value: model1),
          ChangeNotifierProvider<B>.value(value: model2),
        ],
        child: Consumer2<A, B>(
          builder: widget.builder,
          child: widget.child,
        ));
  }
}
