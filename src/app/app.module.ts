import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { HttpModule } from '@angular/http';

import { AppComponent } from './app.component';
import {HomeComponent} from './home/home.component';
import {SignInOutComponent} from './signInOut/signin.component'
import {NavComponent} from './shared/nav.component'
import {routing} from './app.routes';

@NgModule({
  declarations: [
    AppComponent,
    HomeComponent,
    SignInOutComponent,
    NavComponent
  ],
  imports: [
    BrowserModule,
    FormsModule,
    HttpModule,
    routing

  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
