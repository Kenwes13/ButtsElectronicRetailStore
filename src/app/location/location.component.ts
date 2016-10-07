import {Component} from '@angular/core';

@Component({
  selector: 'location-component',
  templateUrl:'./location.component.html',
  styleUrls: ['location.component.css']
})

export class LocationComponent {
  lat:number = 37.3351874;
  lng:number = -121.8832602;

  markers: marker[] = [
    {lat:37.655508 , lng:-122.070641, label:"25453 Mission Blvd, Hayward, CA 94544"},
    {lat: 37.815671, lng:-122.287572, label:"2107 Poplar St, Oakland, CA 94607"},
    {lat:38.005712 ,lng:-122.089431 ,label:"4596 Pacheco Blvd, Martinez, CA 94553"},
    {lat:37.978347,lng:-122.322537, label:"3139 Garrity Way, Richmond, CA 94806"}
  ]

}

export interface marker {
  lat: number;
  lng: number;
  label: string;
}
