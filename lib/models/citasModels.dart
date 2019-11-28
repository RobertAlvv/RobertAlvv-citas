class  CitasModel {
  int    id;
  int id_cliente;
  int id_especialista;
  int id_servicio;
  DateTime fecha;

   CitasModel(
      {this.id, this.id_cliente, this.id_especialista, this.id_servicio, this.fecha});

  //Constructor
   CitasModel.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    id_cliente = map['id_cliente'];
    id_especialista = map['id_especialista'];
    id_servicio = map['id_servicio'];
    fecha = map['fecha'];
  }

  //Method
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'id_cliente': id_cliente,
      'id_especialista': id_especialista,
      'id_servicio': id_servicio,
      'fecha': fecha,
    };
  }
}
