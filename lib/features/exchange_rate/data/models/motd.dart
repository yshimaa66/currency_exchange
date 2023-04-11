class Motd {
  Motd({
    this.msg,
    this.url,
  });

  final String? msg;
  final String? url;

  factory Motd.fromJson(Map<String, dynamic> json) => Motd(
    msg: json["msg"],
    url: json["url"],
  );

  Map<String, dynamic> toJson() => {
    "msg": msg,
    "url": url,
  };
}
