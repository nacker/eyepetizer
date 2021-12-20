import 'package:eyepetizer/http/Url.dart';
import 'package:eyepetizer/model/common_item.dart';
import 'package:eyepetizer/viewmodel/base_list_viewmodel.dart';

class FollowViewModel extends BaseListViewModel<Item, Issue> {
  @override
  String getUrl() {
    return Url.followUrl;
  }

  @override
  Issue getModel(Map<String, dynamic> json) {
    return Issue.fromJson(json);
  }
}