import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { HeaderComponent } from './components/header/header.component';
import { HeaderCardComponent } from './components/header-card/header-card.component';
import { HomeComponent } from './pages/home/home.component';
import { SharedRoutingModule } from './shared-routing.module';
import { DownloadButtonComponent } from './components/download-button/download-button.component';

@NgModule({
  declarations: [
    HeaderComponent,
    HeaderCardComponent,
    HomeComponent,
    DownloadButtonComponent
  ],
  imports: [
    CommonModule,
    SharedRoutingModule
  ],
  exports: [
    HomeComponent
  ]
})
export class SharedModule { }
