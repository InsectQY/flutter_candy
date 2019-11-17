class UGCVideoPageData {
  List<UGCCategory> data;
  String version;

  UGCVideoPageData({this.data, this.version});

  UGCVideoPageData.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = new List<UGCCategory>();
      json['data'].forEach((v) {
        data.add(new UGCCategory.fromJson(v));
      });
    }
    version = json['version'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class UGCCategory {
  String category;
  String name;

  UGCCategory({
    this.category,
    this.name,
  });

  UGCCategory.fromJson(Map<String, dynamic> json) {
    category = json['category'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['category'] = this.category;
    data['name'] = this.name;
    return data;
  }
}
