class Recomen {
  int? id;
  String? imageUrl;
  int? price;
  String? location;
  String? nama;
  int? rating;
  String? address;
  String? phone;
  String? mapUrl;
  List? photos;
  int? numberOfKitchen;
  int? numberBedroom;
  int? numberOfCupBoard;

  Recomen(
      {this.id,
      this.imageUrl,
      this.price,
      this.location,
      this.nama,
      this.rating,
      this.address,
      this.mapUrl,
      this.phone,
      this.photos,
      this.numberBedroom,
      this.numberOfCupBoard,
      this.numberOfKitchen});

  Recomen.fromJson(json) {
    id = json['id'];
    imageUrl = json['image_url'];
    price = json['price'];
    location = json['city'] + json['country'];
    photos = json['photos'];
    nama = json['name'];
    rating = json['rating'];
    address = json['address'];
    mapUrl = json['map_url'];
    phone = json['phone'];
    numberBedroom = json['number_of_bedrooms'];
    numberOfKitchen = json['number_of_kitchens'];
    numberOfCupBoard = json['number_of_cupboards'];
  }
}
