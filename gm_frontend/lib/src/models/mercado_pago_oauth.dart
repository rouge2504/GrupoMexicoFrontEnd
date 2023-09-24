// To parse this JSON data, do
//
//     final mercadoPagoOauth = mercadoPagoOauthFromJson(jsonString);

import 'dart:convert';

MercadoPagoOauth mercadoPagoOauthFromJson(String str) =>
    MercadoPagoOauth.fromJson(json.decode(str));

String mercadoPagoOauthToJson(MercadoPagoOauth data) =>
    json.encode(data.toJson());

class MercadoPagoOauth {
  String? accessToken;
  String? tokenType;
  String? expiresIn;
  String? scope;
  String? userId;
  String? refreshToken;
  String? publicKey;
  String? liveMode;

  MercadoPagoOauth({
    this.accessToken,
    this.tokenType,
    this.expiresIn,
    this.scope,
    this.userId,
    this.refreshToken,
    this.publicKey,
    this.liveMode,
  });

  factory MercadoPagoOauth.fromJson(Map<String, dynamic> json) =>
      MercadoPagoOauth(
        accessToken: json["access_token"],
        tokenType: json["token_type"],
        expiresIn: json["expires_in"],
        scope: json["scope"],
        userId: json["user_id"],
        refreshToken: json["refresh_token"],
        publicKey: json["public_key"],
        liveMode: json["live_mode"].toString(),
      );

  Map<String, dynamic> toJson() => {
        "access_token": accessToken,
        "token_type": tokenType,
        "expires_in": expiresIn,
        "scope": scope,
        "user_id": userId,
        "refresh_token": refreshToken,
        "public_key": publicKey,
        "live_mode": liveMode,
      };
}
