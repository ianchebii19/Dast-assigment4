import 'dart:math';


abstract class Shape {
  double get area; 

  void printDetails();
}

class Rectangle implements Shape {
  double width;
  double height;

  Rectangle(this.width, this.height);

  @override
  double get area => width * height;

  @override
  void printDetails() {
    print("Rectangle: Width - $width, Height - $height, Area - $area");
  }
}

class Circle implements Shape {
  double radius;

  Circle(this.radius);

  @override
  double get area => pi * radius * radius;

  @override
  void printDetails() {
    print("Circle: Radius - $radius, Area - $area");
  }
}

List<String> readFileData(String filePath) {
  return ["5.0, 10.0", "3.0"];
}

void processShapes(String filePath) {
  List<String> data = readFileData(filePath);

  for (String line in data) {
    List<double> values =
        line.split(",").map((e) => double.tryParse(e) ?? 0.0).toList();

    if (values.length == 2) {
      Shape shape = Rectangle(values[0], values[1]);
      shape.printDetails();
    } else if (values.length == 1) {
      Shape shape = Circle(values[0]);
      shape.printDetails();
    } else {
      print("Invalid data format in line: $line");
    }
  }
}

void main() {
  String filePath = "shapes.txt";
  processShapes(filePath);
}
