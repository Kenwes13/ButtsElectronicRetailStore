import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { HttpModule } from '@angular/http';

import { AgmCoreModule } from 'angular2-google-maps/core';
import { AppComponent } from './app.component';
import {HomeComponent} from './home/home.component';
import {SignInOutComponent} from './signInOut/signin.component'
import {NavComponent} from './shared/nav.component'
import {routing} from './app.routes';
import {LocationComponent} from "./location/location.component";

@NgModule({
  declarations: [
    AppComponent,
    HomeComponent,
    SignInOutComponent,
    NavComponent,
    LocationComponent
  ],
  imports: [
    BrowserModule,
    FormsModule,
    HttpModule,
    routing,
    AgmCoreModule.forRoot({
      apiKey: 'AIzaSyBFH2S9Cc2jAlala-UA6YXVEt50cEz1TTc'
    })

  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
