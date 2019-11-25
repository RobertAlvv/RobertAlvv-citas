class  ServicioModel {
  int id;
  String nombre;
  String descripcion;

   ServicioModel(
      {this.id, this.nombre, this.descripcion});

  //Constructor
   ServicioModel.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    nombre = map['nombre'];
    descripcion = map['descripcion'];
  }

  //Method
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nombre': nombre,
      'descripcion': descripcion,
    };
  }
}
