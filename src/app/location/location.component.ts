import {Component} from '@angular/core';

@Component({
    selector: 'location-component',
    templateUrl:'./location.component.html',
})

export class LocationComponent {
    lat:number = 37.3351874;
    lng:number = -121.8832602;
}