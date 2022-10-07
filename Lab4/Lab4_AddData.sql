insert into Stop(StopNumber, StopAddress) values (1, '123 Temple Avenue');
insert into Stop(StopNumber, StopAddress) values (2, '256 Temple Avenue');

insert into Trip(TripNumber, StartLocationName, DestinationName) values (1, 'Pomona', 'Pasadena');
insert into Trip(TripNumber, StartLocationName, DestinationName) values (2, 'Pomona', 'Fontana');

insert into TripStopInfo(TripNumber, StopNumber, SequenceNumber, DrivingTime) values (1, 1, 1, 1);
insert into TripStopInfo(TripNumber, StopNumber, SequenceNumber, DrivingTime) values (1, 2, 2, '0.2');