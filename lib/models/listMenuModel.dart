// @dart=2.9
import 'dart:convert';

ListMenuResponse listMenuResponseFromJson(String str) => ListMenuResponse.fromJson(json.decode(str));

String listMenuResponseToJson(ListMenuResponse data) => json.encode(data.toJson());

class ListMenuResponse {
    ListMenuResponse({
        this.msg,
        this.code,
        this.error,
        this.menu,
    });

    String msg;
    String code;
    bool error;
    List<Menu> menu;

    factory ListMenuResponse.fromJson(Map<String, dynamic> json) => ListMenuResponse(
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
        this.icono,
        this.listado,
        this.menu1,
        this.menu2,
        this.menu3,
    });

    String icono;
    List<Listado> listado;
    String menu1;
    String menu2;
    String menu3;

    factory Menu.fromJson(Map<String, dynamic> json) => Menu(
        icono: json["icono"],
        listado: List<Listado>.from(json["listado"].map((x) => Listado.fromJson(x))),
        menu1: json["menu1"] == null ? null : json["menu1"],
        menu2: json["menu2"] == null ? null : json["menu2"],
        menu3: json["menu3"] == null ? null : json["menu3"],
    );

    Map<String, dynamic> toJson() => {
        "icono": icono,
        "listado": List<dynamic>.from(listado.map((x) => x.toJson())),
        "menu1": menu1 == null ? null : menu1,
        "menu2": menu2 == null ? null : menu2,
        "menu3": menu3 == null ? null : menu3,
    };
}

class Listado {
    Listado({
        this.pagina,
        this.logo,
        this.url,
    });

    String pagina;
    String logo;
    String url;

    factory Listado.fromJson(Map<String, dynamic> json) => Listado(
        pagina: json["pagina"],
        logo: json["logo"],
        url: json["url"],
    );

    Map<String, dynamic> toJson() => {
        "pagina": pagina,
        "logo": logo,
        "url": url,
    };
}
