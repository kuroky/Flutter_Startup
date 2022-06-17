//"http://api.douban.com/v2/movie/in_theaters?apikey=0df993c66c0c636e29ecbb5344252a4a&start=0&count=10"
class FilmListBean {
  int? count;
  int? start;
  int? total;
  List<Subjects>? subjects;
  String? title;

  FilmListBean({this.count, this.start, this.total, this.subjects, this.title});

  FilmListBean.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    start = json['start'];
    total = json['total'];
    if (json['subjects'] != null) {
      subjects = [];
      json['subjects'].forEach((v) {
        Subjects sub = Subjects.fromJson(v);
        subjects?.add(sub);
      });
    }
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['count'] = count;
    data['start'] = start;
    data['total'] = total;
    if (subjects != null) {
      data['subjects'] = subjects?.map((v) => v.toJson()).toList();
    }
    data['title'] = title;
    return data;
  }
}

class Subjects {
  Rating? rating;
  String? title;
  Images? images;

  Subjects({this.rating, this.title, this.images});

  Subjects.fromJson(Map<String, dynamic> json) {
    rating = json['rating'] != null ? Rating.fromJson(json['rating']) : null;
    title = json['title'];
    images = json['images'] != null ? Images.fromJson(json['images']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (rating != null) {
      data['rating'] = rating?.toJson();
    }
    data['title'] = title;
    if (images != null) {
      data['images'] = images?.toJson();
    }
    return data;
  }
}

class Rating {
  int? max;
  String? average;
  String? stars;
  int? min;

  Rating({this.max, this.average, this.stars, this.min});

  Rating.fromJson(Map<String, dynamic> json) {
    max = json['max'];
    if (json.containsKey("average")) {
      average = json['average'].toString();
    } else {
      average = "";
    }
    stars = json['stars'];
    min = json['min'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['max'] = max;
    data['average'] = average;
    data['stars'] = stars;
    data['min'] = min;
    return data;
  }
}

class Images {
  String? small;
  String? large;
  String? medium;

  Images({this.small, this.large, this.medium});

  Images.fromJson(Map<String, dynamic> json) {
    small = json['small'];
    large = json['large'];
    medium = json['medium'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['small'] = small;
    data['large'] = large;
    data['medium'] = medium;
    return data;
  }
}
