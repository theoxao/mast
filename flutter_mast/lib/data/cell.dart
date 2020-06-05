class Cell {
    String desc;
    Group group;
    String icon;
    int id;
    String name;
    List<Param> params;
    Room room;
    String type;

    Cell({this.desc, this.group, this.icon, this.id, this.name, this.params, this.room, this.type});

    factory Cell.fromJson(Map<String, dynamic> json) {
        return Cell(
            desc: json['desc'],
            group: json['group'] != null ? Group.fromJson(json['group']) : null,
            icon: json['icon'],
            id: json['id'],
            name: json['name'],
            params: json['params'] != null ? (json['params'] as List).map((i) => Param.fromJson(i)).toList() : null,
            room: json['room'] != null ? Room.fromJson(json['room']) : null,
            type: json['type'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['desc'] = this.desc;
        data['icon'] = this.icon;
        data['id'] = this.id;
        data['name'] = this.name;
        data['type'] = this.type;
        if (this.group != null) {
            data['group'] = this.group.toJson();
        }
        if (this.params != null) {
            data['params'] = this.params.map((v) => v.toJson()).toList();
        }
        if (this.room != null) {
            data['room'] = this.room.toJson();
        }
        return data;
    }
}


class Room {
    List<Cell> cells;
    int id;
    String name;
    String image;

    Room({this.cells, this.id, this.name , this.image});

    factory Room.fromJson(Map<String, dynamic> json) {
        return Room(
            cells: json['cells'] != null ? (json['cells'] as List).map((i) => Cell.fromJson(i)).toList() : null,
            id: json['id'],
            name: json['name'],
            image: json['image']
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['id'] = this.id;
        data['name'] = this.name;
        data['image'] = this.image;
        if (this.cells != null) {
            data['cells'] = this.cells.map((v) => v.toJson()).toList();
        }
        return data;
    }
}


class Group {
    int id;
    String name;

    Group({this.id, this.name});

    factory Group.fromJson(Map<String, dynamic> json) {
        return Group(
            id: json['id'],
            name: json['name'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['id'] = this.id;
        data['name'] = this.name;
        return data;
    }
}

class Param {
    int cellId;
    String desc;
    int editable;
    int id;
    String key;
    String type;
    String value;

    Param({this.cellId, this.desc, this.editable, this.id, this.key, this.type, this.value});

    factory Param.fromJson(Map<String, dynamic> json) {
        return Param(
            cellId: json['cellId'],
            desc: json['desc'],
            editable: json['editable'],
            id: json['id'],
            key: json['key'],
            type: json['type'],
            value: json['value'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['cellId'] = this.cellId;
        data['desc'] = this.desc;
        data['editable'] = this.editable;
        data['id'] = this.id;
        data['key'] = this.key;
        data['type'] = this.type;
        data['value'] = this.value;
        return data;
    }
}
