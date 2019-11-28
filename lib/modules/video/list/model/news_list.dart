import 'dart:convert';

import 'package:flutter_candy/modules/ugc_video/list/model/ugc_video_list.dart';
import 'package:flutter_candy/utils/string_util.dart';

class NewsListModel {
  /// 单条新闻内容(返回数据为 JSON 字符串)
  NewsModel content;

  NewsListModel({this.content});

  NewsListModel.fromJson(Map<String, dynamic> tmpJSON) {
    String jsonContent = tmpJSON['content'];
    Map<String, dynamic> content = json.decode(jsonContent);
    this.content = NewsModel.fromJson(content);
  }
}

class NewsModel {
  String digest;
  String actionExtra;
  int aggrType;
  bool allowDownload;
  int articleSubType;
  int articleType;
  String articleUrl;
  int banComment;
  int banDanmakuSend;
  int banDownload;
  int banImmersive;
  int behotTime;
  int buryCount;
  int canCommentLevel;
  int commentCount;
  int composition;
  String contentDecoration;
  int cursor;
  int danmakuCount;
  int dataType;
  int defaultDanmaku;
  int diggCount;
  String displayUrl;
  int groupFlags;
  int groupId;
  int groupSource;
  int hot;
  int id;
  int ignoreWebTransform;
  int impressionCount;
  String interactionData;
  bool isOriginal;
  bool isSubject;
  bool isSubscribe;
  int itemId;
  int itemVersion;
  List<UrlList> largeImageList;
  int level;
  MediaInfo userInfo;
  String mediaName;
  int needClientImprRecycle;
  String playAuthToken;
  String playBizToken;
  String preadParams;
  int publishTime;
  int readCount;
  int repinCount;
  String reqId;
  String rid;
  int shareCount;
  int shareType;
  String shareUrl;
  String source;
  int sourceIconStyle;
  String sourceOpenUrl;
  String tag;
  int tip;
  String title;
  String url;
  int userRepin;
  int userVerified;
  String verifiedContent;
  String verifyReason;
  int videoDuration;
  String videoId;
  int videoLikeCount;
  VideoDetailInfo videoDetailInfo;
  VideoPlayInfo videoPlayInfo;
  int videoStyle;
  int videoUserLike;

  String get commentCountString => StringUtil.countString(commentCount);

  NewsModel(
      {this.digest,
      this.actionExtra,
      this.aggrType,
      this.allowDownload,
      this.articleSubType,
      this.articleType,
      this.articleUrl,
      this.banComment,
      this.banDanmakuSend,
      this.banDownload,
      this.banImmersive,
      this.behotTime,
      this.buryCount,
      this.canCommentLevel,
      this.commentCount,
      this.composition,
      this.contentDecoration,
      this.cursor,
      this.danmakuCount,
      this.dataType,
      this.defaultDanmaku,
      this.diggCount,
      this.displayUrl,
      this.groupFlags,
      this.groupId,
      this.groupSource,
      this.hot,
      this.id,
      this.ignoreWebTransform,
      this.impressionCount,
      this.interactionData,
      this.isOriginal,
      this.isSubject,
      this.isSubscribe,
      this.itemId,
      this.itemVersion,
      this.largeImageList,
      this.level,
      this.userInfo,
      this.mediaName,
      this.needClientImprRecycle,
      this.playAuthToken,
      this.playBizToken,
      this.preadParams,
      this.publishTime,
      this.readCount,
      this.repinCount,
      this.reqId,
      this.rid,
      this.shareCount,
      this.shareType,
      this.shareUrl,
      this.source,
      this.sourceIconStyle,
      this.sourceOpenUrl,
      this.tag,
      this.tip,
      this.title,
      this.url,
      this.userRepin,
      this.userVerified,
      this.verifiedContent,
      this.verifyReason,
      this.videoDuration,
      this.videoId,
      this.videoLikeCount,
      this.videoPlayInfo,
      this.videoStyle,
      this.videoUserLike,
      this.videoDetailInfo});

  NewsModel.fromJson(Map<String, dynamic> tmpJSON) {
    digest = tmpJSON['abstract'];
    actionExtra = tmpJSON['action_extra'];
    aggrType = tmpJSON['aggr_type'];
    allowDownload = tmpJSON['allow_download'];
    articleSubType = tmpJSON['article_sub_type'];
    articleType = tmpJSON['article_type'];
    articleUrl = tmpJSON['article_url'];
    banComment = tmpJSON['ban_comment'];
    banDanmakuSend = tmpJSON['ban_danmaku_send'];
    banDownload = tmpJSON['ban_download'];
    banImmersive = tmpJSON['ban_immersive'];
    behotTime = tmpJSON['behot_time'];
    buryCount = tmpJSON['bury_count'];
    canCommentLevel = tmpJSON['can_comment_level'];
    commentCount = tmpJSON['comment_count'];
    composition = tmpJSON['composition'];
    contentDecoration = tmpJSON['content_decoration'];
    cursor = tmpJSON['cursor'];
    danmakuCount = tmpJSON['danmaku_count'];
    dataType = tmpJSON['data_type'];
    defaultDanmaku = tmpJSON['default_danmaku'];
    diggCount = tmpJSON['digg_count'];
    displayUrl = tmpJSON['display_url'];
    groupFlags = tmpJSON['group_flags'];
    groupId = tmpJSON['group_id'];
    groupSource = tmpJSON['group_source'];
    hot = tmpJSON['hot'];
    id = tmpJSON['id'];
    ignoreWebTransform = tmpJSON['ignore_web_transform'];
    impressionCount = tmpJSON['impression_count'];
    interactionData = tmpJSON['interaction_data'];
    isOriginal = tmpJSON['is_original'];
    isSubject = tmpJSON['is_subject'];
    isSubscribe = tmpJSON['is_subscribe'];
    itemId = tmpJSON['item_id'];
    itemVersion = tmpJSON['item_version'];
    level = tmpJSON['level'];
    videoDetailInfo = tmpJSON['video_detail_info'] != null
        ? new VideoDetailInfo.fromJson(tmpJSON['video_detail_info'])
        : null;
    userInfo = tmpJSON['user_info'] != null
        ? new MediaInfo.fromJson(tmpJSON['user_info'])
        : null;
    mediaName = tmpJSON['media_name'];
    needClientImprRecycle = tmpJSON['need_client_impr_recycle'];
    playAuthToken = tmpJSON['play_auth_token'];
    playBizToken = tmpJSON['play_biz_token'];
    preadParams = tmpJSON['pread_params'];
    publishTime = tmpJSON['publish_time'];
    readCount = tmpJSON['read_count'];
    repinCount = tmpJSON['repin_count'];
    reqId = tmpJSON['req_id'];
    rid = tmpJSON['rid'];
    shareCount = tmpJSON['share_count'];
    shareType = tmpJSON['share_type'];
    shareUrl = tmpJSON['share_url'];
    source = tmpJSON['source'];
    sourceIconStyle = tmpJSON['source_icon_style'];
    sourceOpenUrl = tmpJSON['source_open_url'];
    tag = tmpJSON['tag'];
    tip = tmpJSON['tip'];
    title = tmpJSON['title'];
    url = tmpJSON['url'];
    userRepin = tmpJSON['user_repin'];
    userVerified = tmpJSON['user_verified'];
    verifiedContent = tmpJSON['verified_content'];
    verifyReason = tmpJSON['verify_reason'];
    videoDuration = tmpJSON['video_duration'];
    videoId = tmpJSON['video_id'];
    videoLikeCount = tmpJSON['video_like_count'];
    String jsonContent = tmpJSON['video_play_info'];
    if (jsonContent != null) {
      Map<String, dynamic> videoPlayInfoData = json.decode(jsonContent);
      videoPlayInfo = VideoPlayInfo.fromJson(videoPlayInfoData);
    } else {
      videoPlayInfo = null;
    }
    videoStyle = tmpJSON['video_style'];
    videoUserLike = tmpJSON['video_user_like'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['abstract'] = this.digest;
    data['action_extra'] = this.actionExtra;
    data['aggr_type'] = this.aggrType;
    data['allow_download'] = this.allowDownload;
    data['article_sub_type'] = this.articleSubType;
    data['article_type'] = this.articleType;
    data['article_url'] = this.articleUrl;
    data['ban_comment'] = this.banComment;
    data['ban_danmaku_send'] = this.banDanmakuSend;
    data['ban_download'] = this.banDownload;
    data['ban_immersive'] = this.banImmersive;
    data['behot_time'] = this.behotTime;
    data['bury_count'] = this.buryCount;
    data['can_comment_level'] = this.canCommentLevel;
    data['comment_count'] = this.commentCount;
    data['composition'] = this.composition;
    data['content_decoration'] = this.contentDecoration;
    data['cursor'] = this.cursor;
    data['danmaku_count'] = this.danmakuCount;
    data['data_type'] = this.dataType;
    data['default_danmaku'] = this.defaultDanmaku;
    data['digg_count'] = this.diggCount;
    data['display_url'] = this.displayUrl;
    data['group_flags'] = this.groupFlags;
    data['group_id'] = this.groupId;
    data['group_source'] = this.groupSource;
    data['hot'] = this.hot;
    data['id'] = this.id;
    data['ignore_web_transform'] = this.ignoreWebTransform;
    data['impression_count'] = this.impressionCount;
    data['interaction_data'] = this.interactionData;
    data['is_original'] = this.isOriginal;
    data['is_subject'] = this.isSubject;
    data['is_subscribe'] = this.isSubscribe;
    data['item_id'] = this.itemId;
    data['item_version'] = this.itemVersion;
    data['level'] = this.level;
    if (this.userInfo != null) {
      data['user_info'] = this.userInfo.toJson();
    }
    data['media_name'] = this.mediaName;
    data['need_client_impr_recycle'] = this.needClientImprRecycle;
    data['play_auth_token'] = this.playAuthToken;
    data['play_biz_token'] = this.playBizToken;
    data['pread_params'] = this.preadParams;
    data['publish_time'] = this.publishTime;
    data['read_count'] = this.readCount;
    data['repin_count'] = this.repinCount;
    data['req_id'] = this.reqId;
    data['rid'] = this.rid;
    data['share_count'] = this.shareCount;
    data['share_type'] = this.shareType;
    data['share_url'] = this.shareUrl;
    data['source'] = this.source;
    data['source_icon_style'] = this.sourceIconStyle;
    data['source_open_url'] = this.sourceOpenUrl;
    data['tag'] = this.tag;
    data['tip'] = this.tip;
    data['title'] = this.title;
    data['url'] = this.url;
    data['user_repin'] = this.userRepin;
    data['user_verified'] = this.userVerified;
    data['verified_content'] = this.verifiedContent;
    data['verify_reason'] = this.verifyReason;
    data['video_duration'] = this.videoDuration;
    data['video_id'] = this.videoId;
    data['video_like_count'] = this.videoLikeCount;
    data['video_play_info'] = this.videoPlayInfo;
    data['video_style'] = this.videoStyle;
    data['video_user_like'] = this.videoUserLike;
    return data;
  }
}

class MediaInfo {
  String avatarUrl;
  int mediaId;
  String name;
  int userId;
  bool userVerified;
  String verifiedContent;

  MediaInfo(
      {this.avatarUrl,
      this.mediaId,
      this.name,
      this.userId,
      this.userVerified,
      this.verifiedContent});

  MediaInfo.fromJson(Map<String, dynamic> json) {
    avatarUrl = json['avatar_url'];
    mediaId = json['media_id'];
    name = json['name'];
    userId = json['user_id'];
    userVerified = json['user_verified'];
    verifiedContent = json['verified_content'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['avatar_url'] = this.avatarUrl;
    data['media_id'] = this.mediaId;
    data['name'] = this.name;
    data['user_id'] = this.userId;
    data['user_verified'] = this.userVerified;
    data['verified_content'] = this.verifiedContent;
    return data;
  }
}

class LargeImageList {
  double height;
  String url;
  double width;

  LargeImageList({this.height, this.url, this.width});

  LargeImageList.fromJson(Map<String, dynamic> json) {
    height = json['height'].toDouble();
    url = json['url'];
    width = json['width'].toDouble();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['height'] = this.height;
    data['url'] = this.url;
    data['width'] = this.width;
    return data;
  }
}

class VideoDetailInfo {
  LargeImageList detailVideoLargeImage;
  String videoId;
  int videoWatchCount;

  String get videoWatchCountString =>
      StringUtil.countString(videoWatchCount) ?? '';

  VideoDetailInfo(
      {this.detailVideoLargeImage, this.videoId, this.videoWatchCount});

  VideoDetailInfo.fromJson(Map<String, dynamic> json) {
    detailVideoLargeImage = json['detail_video_large_image'] != null
        ? new LargeImageList.fromJson(json['detail_video_large_image'])
        : null;
    videoId = json['video_id'];
    videoWatchCount = json['video_watch_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['video_id'] = this.videoId;
    data['video_watch_count'] = this.videoWatchCount;
    return data;
  }
}

class VideoPlayInfo {
  VideoList videoList;

  VideoPlayInfo({this.videoList});

  VideoPlayInfo.fromJson(Map<String, dynamic> json) {
    videoList = json['video_list'] != null
        ? new VideoList.fromJson(json['video_list'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    if (this.videoList != null) {
      data['video_list'] = this.videoList.toJson();
    }

    return data;
  }
}

class VideoList {
  Video video1;
  Video video2;
  Video video3;

  VideoList({this.video1, this.video2, this.video3});

  VideoList.fromJson(Map<String, dynamic> json) {
    video1 =
        json['video_1'] != null ? new Video.fromJson(json['video_1']) : null;
    video2 =
        json['video_2'] != null ? new Video.fromJson(json['video_2']) : null;
    video3 =
        json['video_3'] != null ? new Video.fromJson(json['video_3']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.video1 != null) {
      data['video_1'] = this.video1.toJson();
    }
    if (this.video2 != null) {
      data['video_2'] = this.video2.toJson();
    }
    if (this.video3 != null) {
      data['video_3'] = this.video3.toJson();
    }
    return data;
  }
}

class Video {
  String definition;
  String mainUrl;

  Video({this.definition, this.mainUrl});

  Video.fromJson(Map<String, dynamic> json) {
    definition = json['definition'];
    mainUrl = json['main_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['definition'] = this.definition;
    data['main_url'] = this.mainUrl;
    return data;
  }
}
