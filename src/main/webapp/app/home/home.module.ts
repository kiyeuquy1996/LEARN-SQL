import {NgModule, CUSTOM_ELEMENTS_SCHEMA} from '@angular/core';
import {RouterModule} from '@angular/router';

import {LearnSqlSharedModule} from 'app/shared';
import {HOME_ROUTE, HomeComponent} from './';
import {MDBBootstrapModule} from 'angular-bootstrap-md';
import {Highlight, KeysPipe3, SafePipe, SubString} from 'app/layouts/safe-pipe';

@NgModule({
    imports: [LearnSqlSharedModule, RouterModule.forChild(HOME_ROUTE), MDBBootstrapModule.forRoot()],
    declarations: [HomeComponent, SafePipe, Highlight, SubString, KeysPipe3],
    schemas: [CUSTOM_ELEMENTS_SCHEMA]
})
export class LearnSqlHomeModule {
}
