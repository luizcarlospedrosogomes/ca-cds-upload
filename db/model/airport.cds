using { Currency, managed, sap } from '@sap/cds/common';
namespace manager.airport;

entity Airplanes : managed {
  key ID : Integer;
  name  : localized String(111);
  descr  : localized String(1111);    
}

@cds.persistence.skip
entity AirplanesUpload : managed {
  @Core.MediaType: mediaType
  content : LargeBinary ;
  @Core.IsMediaType: true
  mediaType : String;
  fileName : String;
}

entity Airports : managed {
  key ID : Integer;
  name   : String(111);
  locale: String(111)
}
