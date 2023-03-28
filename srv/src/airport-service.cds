using { manager.airport as db } from '../../db/schema';
service AirportService {
  entity Airplanes as projection on db.Airplanes;
  entity AirplanesUpload as projection on db.AirplanesUpload;
  entity Airports as projection on db.Airports;
}