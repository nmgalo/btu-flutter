import 'package:cars_app/data/cars_fake_data.dart';
import 'package:cars_app/model/car.dart';

class CarRepository {
  void createCar(Car car) {
    cars_data.add(car);
  }

  void updateCar(int id, Car car) {
    cars_data[cars_data.indexWhere((element) => element.id == id)] = car;
  }

  List<Car> getAllCars() {
    return cars_data.reversed.toList();
  }

  void removeCarById(int carId) {
    cars_data.removeWhere((element) => element.id == carId);
  }

  Car getById(int id) {
    return cars_data.where((element) => element.id == id).first;
  }

  int getNextCarId() {
    return cars_data.isNotEmpty ? cars_data.last.id + 1 : 1;
  }
}
