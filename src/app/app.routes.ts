import {ModuleWithProviders} from '@angular/core';
import {Routes, RouterModule } from '@angular/router';
import {HomeComponent} from './home/home.component';
import {SignInOutComponent} from './signInOut/signin.component';
import {LocationComponent } from './location/location.component';

export const routes: Routes = [
  {path: 'home', component: HomeComponent},
  {path: 'signInOut', component: SignInOutComponent},
  {path: 'storelocations', component: LocationComponent},


];

export const routing: ModuleWithProviders = RouterModule.forRoot(routes);
