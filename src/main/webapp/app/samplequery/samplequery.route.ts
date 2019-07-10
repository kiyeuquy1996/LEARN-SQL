import {Routes} from '@angular/router';
import {SamplequeryComponent} from 'app/samplequery/samplequery.component';

export const SAMPLE_ROUTE: Routes = [
    {
        path: 'sql-queries-sample',
        component: SamplequeryComponent,
        data: {
            authorities: [],
            pageTitle: 'home.title'
        }
    }
];
