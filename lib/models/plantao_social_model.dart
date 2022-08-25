//flutter pub run build_runner build --delete-conflicting-outputs

import 'package:codesaima2/objectbox.g.dart';

@Entity()
class PlantaoSocial {
  int id;
  String name;
  String phoneNumber;
  String address;
  String propertyOwner;
  String timeLiveState;
  String howManyFamilies;
  String howManyPeopleLive;
  String socialProfile;
  String kindImprovemente;
  String constructionStatus;
  String satisfactionState;
  String observations;
  String responsibleCompany;
  String date;
  String visitor;
  String socialWorker;

  PlantaoSocial({
    this.id = 0,
    this.name = '',
    this.phoneNumber = '',
    this.address = '',
    this.propertyOwner = '',
    this.timeLiveState = '',
    this.howManyFamilies = '',
    this.howManyPeopleLive = '',
    this.socialProfile = '',
    this.kindImprovemente = '',
    this.constructionStatus = '',
    this.satisfactionState = '',
    this.observations = '',
    this.responsibleCompany = '',
    this.date = '',
    this.visitor = '',
    this.socialWorker = '',
  });

  @override
  String toString() {
    return 'PlantaoSocial{name: $name, telefone: $phoneNumber, address: $address, propertyOwner: $propertyOwner, timeLiveState: $timeLiveState, howManyFamilies: $howManyFamilies, howManyPeopleLive: $howManyPeopleLive, socialProfile: $socialProfile, kindImprovemente: $kindImprovemente, constructionStatus: $constructionStatus, satisfactionState: $satisfactionState, observations: $observations, responsibleCompany: $responsibleCompany, date: $date, visitor: $visitor, socialWorker: $socialWorker}';
  }

  String get getAddress {
    return address;
  }
}
