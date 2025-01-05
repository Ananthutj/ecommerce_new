import 'package:ecommerce_new/data/models/product.g.dart';
import 'package:hive/hive.dart';

@HiveType(typeId: 0)
class ProductAdapter extends TypeAdapter<Product> {
  @override
  final int typeId = 0;

  @override
  Product read(BinaryReader reader) {
    return Product(
      id: reader.readString(),
      name: reader.readString(),
      price: reader.readDouble(),
      images: reader.readList().cast<String>(),
      description: reader.readString(),
      isFavorite: reader.readBool(),
      category: reader.readString(),
      specs: reader.read(),
    );
  }

  @override
  void write(BinaryWriter writer, Product obj) {
    writer.writeString(obj.id);
    writer.writeString(obj.name);
    writer.writeDouble(obj.price);
    writer.writeList(obj.images);
    writer.writeString(obj.description);
    writer.writeBool(obj.isFavorite);
    writer.writeString(obj.category);
    writer.write(obj.specs);
  }
}
