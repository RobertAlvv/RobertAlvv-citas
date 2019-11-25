class  ClienteModel {
  int id;
  String nombreCompleto;
  String correo;
  String direccion;
  String telefono;

   ClienteModel(
      {this.id, this.nombreCompleto, this.correo, this.direccion, this.telefono});

  //Constructor
   ClienteModel.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    nombreCompleto = map['nombre_completo'];
    correo = map['correo'];
    direccion = map['direccion'];
    telefono = map['telefono'];
  }

  //Method
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nombre_completo': nombreCompleto,
      'correo': correo,
      'direccion': direccion,
      'telefono': telefono,
    };
  }
}
