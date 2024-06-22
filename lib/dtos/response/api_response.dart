import 'dart:convert';

ApiResponseDto<T> apiResponseDtoFromJson<T>(
        String str, T Function(dynamic) fromJsonT) =>
    ApiResponseDto<T>.fromJson(json.decode(str), fromJsonT);

String apiResponseDtoToJson<T>(ApiResponseDto<T> data) =>
    json.encode(data.toJson());

class ApiResponseDto<T> {
  List<T> data;
  String message;
  Meta meta;

  ApiResponseDto({
    required this.data,
    required this.message,
    required this.meta,
  });

  factory ApiResponseDto.fromJson(
          Map<String, dynamic> json, T Function(dynamic) fromJsonT) =>
      ApiResponseDto<T>(
        data: List<T>.from(json["Data"].map((x) => fromJsonT(x))),
        message: json["Message"],
        meta: Meta.fromJson(json["Meta"]),
      );

  Map<String, dynamic> toJson() => {
        "Data": List<dynamic>.from(data.map((x) => (x as dynamic).toJson())),
        "Message": message,
        "Meta": meta.toJson(),
      };
}

class Meta {
  int totalCount;
  int pageSize;
  int currentPage;
  int totalPages;
  bool hasNexPage;
  bool hasPreviousPage;
  String nextPageUrl;
  String previousPageUrl;
  int nextPageNumber;
  int previousPageNumber;

  Meta({
    required this.totalCount,
    required this.pageSize,
    required this.currentPage,
    required this.totalPages,
    required this.hasNexPage,
    required this.hasPreviousPage,
    required this.nextPageUrl,
    required this.previousPageUrl,
    required this.nextPageNumber,
    required this.previousPageNumber,
  });

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        totalCount: json["TotalCount"],
        pageSize: json["PageSize"],
        currentPage: json["CurrentPage"],
        totalPages: json["TotalPages"],
        hasNexPage: json["HasNexPage"],
        hasPreviousPage: json["HasPreviousPage"],
        nextPageUrl: json["NextPageUrl"],
        previousPageUrl: json["PreviousPageUrl"],
        nextPageNumber: json["NextPageNumber"],
        previousPageNumber: json["PreviousPageNumber"],
      );

  Map<String, dynamic> toJson() => {
        "TotalCount": totalCount,
        "PageSize": pageSize,
        "CurrentPage": currentPage,
        "TotalPages": totalPages,
        "HasNexPage": hasNexPage,
        "HasPreviousPage": hasPreviousPage,
        "NextPageUrl": nextPageUrl,
        "PreviousPageUrl": previousPageUrl,
        "NextPageNumber": nextPageNumber,
        "PreviousPageNumber": previousPageNumber,
      };
}
