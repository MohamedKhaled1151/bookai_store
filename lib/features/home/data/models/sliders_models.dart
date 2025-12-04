class SlidersModels {
  Data? data;
  String? message;

  int? status;

  SlidersModels({this.data, this.message, this.status});

  SlidersModels.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    message = json['message'];

    status = json['status'];
  }
}

class Data {
  List<Sliders>? sliders;

  Data({this.sliders});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['sliders'] != null) {
      sliders = <Sliders>[];
      json['sliders'].forEach((v) {
        sliders!.add(Sliders.fromJson(v));
      });
    }
  }
}

class Sliders {
  String? image;

  Sliders({this.image});

  Sliders.fromJson(Map<String, dynamic> json) {
    image = json['image'];
  }
}
