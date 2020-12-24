import { Route } from '@angular/router';

import { ActivateComponent } from 'app/account';

export const activateRoute: Route = {
    path: 'activate',
    component: ActivateComponent,
    data: {
        authorities: [],
        pageTitle: 'activate.title'
    }
};
