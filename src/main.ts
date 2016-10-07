import './polyfills.ts';

import { platformBrowserDynamic } from '@angular/platform-browser-dynamic';
import { enableProdMode } from '@angular/core';
import { environment } from './environments/environment';
import { AppModule } from './app/app.module';
//import {bootstrap} from 'angular2/platform/browser';
import {AppComponent} from './app/app.component'

if (environment.production) {
  enableProdMode();
}
//bootstrap(AppComponent);
platformBrowserDynamic().bootstrapModule(AppModule);
