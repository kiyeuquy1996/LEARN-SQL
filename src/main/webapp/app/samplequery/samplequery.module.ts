import {NgModule, CUSTOM_ELEMENTS_SCHEMA} from '@angular/core';
import {RouterModule} from '@angular/router';

import {LearnSqlSharedModule} from 'app/shared';
import {MDBBootstrapModule} from 'angular-bootstrap-md';
import {SAMPLE_ROUTE} from 'app/samplequery/samplequery.route';
import {SamplequeryComponent} from 'app/samplequery/samplequery.component';
import {MatExpansionModule} from '@angular/material/expansion';
import {KeysPipe2} from 'app/layouts/safe-pipe';

@NgModule({
    imports: [
        LearnSqlSharedModule,
        MatExpansionModule,
        RouterModule.forChild(SAMPLE_ROUTE),
        MDBBootstrapModule.forRoot()
    ],
    declarations: [SamplequeryComponent, KeysPipe2],
    schemas: [CUSTOM_ELEMENTS_SCHEMA]
})
export class SamplequeryModule {
}
