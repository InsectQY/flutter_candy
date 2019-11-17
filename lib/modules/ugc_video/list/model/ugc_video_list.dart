import 'dart:convert';

class UGCVideoListModel {
  UGCVideoModel content;

  UGCVideoListModel({this.content});

  UGCVideoListModel.fromJson(Map<String, dynamic> tmpJSON) {
    String jsonContent = tmpJSON['content'];
    Map<String, dynamic> content = json.decode(jsonContent);
    this.content = UGCVideoModel.fromJson(content);
  }
}

class UGCVideoModel {
  RawData rawData;

  UGCVideoModel({
    this.rawData,
  });

  UGCVideoModel.fromJson(Map<String, dynamic> json) {
    rawData = json['raw_data'] != null
        ? new RawData.fromJson(json['raw_data'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.rawData != null) {
      data['raw_data'] = this.rawData.toJson();
    }
    return data;
  }
}

class RawData {
  Action action;
  String distance;
  String extra;
  int groupId;
  int isAd;
  int itemId;
  String label;
  String labelForList;
  List<UrlList> largeImageList;
  String recommandReason;
  String richTitle;
  String title;
  String titleRichSpan;
  User user;
  UGCVideo video;
  String videoContent;
  int videoNeardupId;

  RawData({
    this.action,
    this.distance,
    this.extra,
    this.groupId,
    this.isAd,
    this.itemId,
    this.label,
    this.labelForList,
    this.largeImageList,
    this.recommandReason,
    this.richTitle,
    this.title,
    this.titleRichSpan,
    this.user,
    this.video,
    this.videoContent,
    this.videoNeardupId,
  });

  RawData.fromJson(Map<String, dynamic> json) {
    action =
        json['action'] != null ? new Action.fromJson(json['action']) : null;
    distance = json['distance'];
    extra = json['extra'];

    groupId = json['group_id'];
    isAd = json['is_ad'];
    itemId = json['item_id'];
    label = json['label'];
    labelForList = json['label_for_list'];

    recommandReason = json['recommand_reason'];
    richTitle = json['rich_title'];

    title = json['title'];
    titleRichSpan = json['title_rich_span'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    video = json['video'] != null ? new UGCVideo.fromJson(json['video']) : null;
    videoContent = json['video_content'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.action != null) {
      data['action'] = this.action.toJson();
    }
    data['distance'] = this.distance;
    data['extra'] = this.extra;
    data['group_id'] = this.groupId;
    data['is_ad'] = this.isAd;
    data['item_id'] = this.itemId;
    data['label'] = this.label;
    data['label_for_list'] = this.labelForList;
    data['recommand_reason'] = this.recommandReason;
    data['rich_title'] = this.richTitle;
    data['title'] = this.title;
    data['title_rich_span'] = this.titleRichSpan;
    if (this.user != null) {
      data['user'] = this.user.toJson();
    }
    return data;
  }
}

class Action {
  int buryCount;
  int commentCount;
  int diggCount;
  int forwardCount;
  int playCount;
  int readCount;
  int shareCount;
  int userBury;
  int userDigg;
  int userRepin;

  Action(
      {this.buryCount,
      this.commentCount,
      this.diggCount,
      this.forwardCount,
      this.playCount,
      this.readCount,
      this.shareCount,
      this.userBury,
      this.userDigg,
      this.userRepin});

  Action.fromJson(Map<String, dynamic> json) {
    buryCount = json['bury_count'];
    commentCount = json['comment_count'];
    diggCount = json['digg_count'];
    forwardCount = json['forward_count'];
    playCount = json['play_count'];
    readCount = json['read_count'];
    shareCount = json['share_count'];
    userBury = json['user_bury'];
    userDigg = json['user_digg'];
    userRepin = json['user_repin'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['bury_count'] = this.buryCount;
    data['comment_count'] = this.commentCount;
    data['digg_count'] = this.diggCount;
    data['forward_count'] = this.forwardCount;
    data['play_count'] = this.playCount;
    data['read_count'] = this.readCount;
    data['share_count'] = this.shareCount;
    data['user_bury'] = this.userBury;
    data['user_digg'] = this.userDigg;
    data['user_repin'] = this.userRepin;
    return data;
  }
}

class UrlList {
  double height;
  List<String> urlList;
  double width;

  UrlList({this.height, this.urlList, this.width});

  UrlList.fromJson(Map<String, dynamic> json) {
    height = json['height'];
    if (json['url_list'] != null) {
      urlList = new List<String>();
      json['url_list'].forEach((v) {
        String url = v ?? "";
        urlList.add(url);
      });
    }
    width = json['width'];
  }
}

class User {
  Info info;

  User({this.info});

  User.fromJson(Map<String, dynamic> json) {
    info = json['info'] != null ? new Info.fromJson(json['info']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.info != null) {
      data['info'] = this.info.toJson();
    }
    return data;
  }
}

class Info {
  String avatarUrl;
  bool banStatus;
  String desc;
  String name;
  String originProfileUrl;
  int originUserId;
  String roomSchema;
  String schema;
  String userAuthInfo;
  String userDecoration;
  int userId;
  int userVerified;
  String verifiedContent;

  Info(
      {this.avatarUrl,
      this.banStatus,
      this.desc,
      this.name,
      this.originProfileUrl,
      this.originUserId,
      this.roomSchema,
      this.schema,
      this.userAuthInfo,
      this.userDecoration,
      this.userId,
      this.userVerified,
      this.verifiedContent});

  Info.fromJson(Map<String, dynamic> json) {
    avatarUrl = json['avatar_url'];
    banStatus = json['ban_status'];
    desc = json['desc'];
    name = json['name'];
    originProfileUrl = json['origin_profile_url'];
    originUserId = json['origin_user_id'];
    roomSchema = json['room_schema'];
    schema = json['schema'];
    userAuthInfo = json['user_auth_info'];
    userDecoration = json['user_decoration'];
    userId = json['user_id'];
    userVerified = json['user_verified'];
    verifiedContent = json['verified_content'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['avatar_url'] = this.avatarUrl;
    data['ban_status'] = this.banStatus;
    data['desc'] = this.desc;
    data['name'] = this.name;
    data['origin_profile_url'] = this.originProfileUrl;
    data['origin_user_id'] = this.originUserId;
    data['room_schema'] = this.roomSchema;
    data['schema'] = this.schema;
    data['user_auth_info'] = this.userAuthInfo;
    data['user_decoration'] = this.userDecoration;
    data['user_id'] = this.userId;
    data['user_verified'] = this.userVerified;
    data['verified_content'] = this.verifiedContent;
    return data;
  }
}

class UGCVideo {
  UrlList playAddr;

  UrlList originCover;

  UGCVideo({this.playAddr, this.originCover});

  UGCVideo.fromJson(Map<String, dynamic> json) {
    playAddr = json['play_addr'] != null
        ? new UrlList.fromJson(json['play_addr'])
        : null;
    originCover = json['origin_cover'] != null
        ? new UrlList.fromJson(json['origin_cover'])
        : null;
  }
}
