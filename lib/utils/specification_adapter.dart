import 'package:hive/hive.dart';
import 'package:ecommerce_new/data/models/specification.g.dart';

@HiveType(typeId: 1)
class SpecificationAdapter extends TypeAdapter<Specification> {
  @override
  final int typeId = 1;

  @override
  Specification read(BinaryReader reader) {
    return Specification(
      color: reader.readString(),
      batteryLife: reader.readString(),
      connectivity: reader.readString(),
      screen: reader.readString(),
      camera: reader.readString(),
      battery: reader.readString(),
      processor: reader.readString(),
      ram: reader.readString(),
      storage: reader.readString(),
    );
  }

  @override
  void write(BinaryWriter writer, Specification obj) {
    writer.writeString(obj.color);
    writer.writeString(obj.batteryLife);
    writer.writeString(obj.connectivity);
    writer.writeString(obj.screen);
    writer.writeString(obj.camera);
    writer.writeString(obj.battery);
    writer.writeString(obj.processor);
    writer.writeString(obj.ram);
    writer.writeString(obj.storage);
  }
}
