class PlantaoSocial {
  String name;
  String telefone;
  String address;
  String propertyOwner;
  String timeLiveState;
  String howManyFamilies;
  String howManyPeopleLive;
  String socialProfile;
  String kindImprovemente;
  String constructionStatus;
  String observations;
  String responsibleCompany;
  String date;
  String visitor;
  String socialWorker;

  PlantaoSocial({
    this.name = '',
    this.telefone = '',
    this.address = '',
    this.propertyOwner = '',
    this.timeLiveState = '',
    this.howManyFamilies = '',
    this.howManyPeopleLive = '',
    this.socialProfile = '',
    this.kindImprovemente = '',
    this.constructionStatus = '',
    this.observations = '',
    this.responsibleCompany = '',
    this.date = '',
    this.visitor = '',
    this.socialWorker = '',
  });

  @override
  String toString() {
    return 'PlantaoSocial{name: $name, telefone: $telefone, address: $address, propertyOwner: $propertyOwner, timeLiveState: $timeLiveState, howManyFamilies: $howManyFamilies, howManyPeopleLive: $howManyPeopleLive, kindImprovemente: $kindImprovemente, constructionStatus: $constructionStatus, observations: $observations, responsibleCompany: $responsibleCompany, date: $date, visitor: $visitor, socialWorker: $socialWorker}';
  }
}
