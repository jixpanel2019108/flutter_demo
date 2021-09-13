//@dart=2.9
import 'dart:convert';

ListMenuAppResponse listMenuAppResponseFromJson(String str) => ListMenuAppResponse.fromJson(json.decode(str));

String listMenuAppResponseToJson(ListMenuAppResponse data) => json.encode(data.toJson());

class ListMenuAppResponse {
    ListMenuAppResponse({
        this.msg,
        this.code,
        this.error,
        this.menu,
    });

    String msg;
    String code;
    bool error;
    List<Menu> menu;

    factory ListMenuAppResponse.fromJson(Map<String, dynamic> json) => ListMenuAppResponse(
        msg: json["msg"],
        code: json["code"],
        error: json["error"],
        menu: List<Menu>.from(json["menu"].map((x) => Menu.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "msg": msg,
        "code": code,
        "error": error,
        "menu": List<dynamic>.from(menu.map((x) => x.toJson())),
    };
}

class Menu {
    Menu({
        this.parentId,
        this.listado,
        this.menu,
        this.parentLogo,
    });

    String parentId;
    List<dynamic> listado;
    String menu;
    String parentLogo;

    factory Menu.fromJson(Map<String, dynamic> json) => Menu(
        parentId: json["parent_id"],
        listado: List<dynamic>.from(json["listado"].map((x) => x)),
        menu: json["menu"],
        parentLogo: json["parent_logo"],
    );

    Map<String, dynamic> toJson() => {
        "parent_id": parentId,
        "listado": List<dynamic>.from(listado.map((x) => x)),
        "menu": menu,
        "parent_logo": parentLogo,
    };
}
