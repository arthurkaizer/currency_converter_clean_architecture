import 'package:flutter/cupertino.dart';

class HomeStore extends ValueNotifier<bool>{
  HomeStore() : super(false);

  void setLoading(bool v) => value = v;
}