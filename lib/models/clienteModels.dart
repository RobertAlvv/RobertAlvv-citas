class  ClienteModel {
  int id;
  String nombreCompleto;
  String sexo;
  String direccion;
  String telefono;

   ClienteModel(
      {this.id, this.nombreCompleto, this.sexo, this.direccion, this.telefono});

  //Constructor
   ClienteModel.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    nombreCompleto = map['nombre_completo'];
    sexo = map['sexo'];
    direccion = map['direccion'];
    telefono = map['telefono'];
  }

  //Method
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nombre_completo': nombreCompleto,
      'sexo': sexo,
      'direccion': direccion,
      'telefono': telefono,
    };
  }
}
