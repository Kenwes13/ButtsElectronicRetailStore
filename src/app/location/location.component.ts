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
    {lat:37.978347,lng:-122.322537, label:"3139 Garrity Way, Richmond, CA 94806"},
    {lat:37.292759,lng:-121.851698, label:"Goble Lane San Jose, CA 95111"},
    {lat:37.388079,lng:-121.967919, label:"2386 Mission College Blvd Santa Clara, CA 95054"},
    {lat:37.545165,lng:-122.295469 ,label:"Across from 900 Yates Way San Mateo, CA 94403"},
    {lat:37.655331,lng:-122.429529 ,label:"Across from 816 Antoinette Ln South San Francisco, CA 94080"},
    {lat:37.770352,lng:-122.419098 ,label:"1695 Mission St San Francisco, CA 94103"},
    {lat:37.737660, lng:-122.475911,label:"2699 19th Ave San Francisco, CA 94116"},

  ]

}

export interface marker {
  lat: number;
  lng: number;
  label: string;
}
