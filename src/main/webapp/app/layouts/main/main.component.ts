import {Component, HostListener, OnInit} from '@angular/core';
import { Router, ActivatedRouteSnapshot, NavigationEnd, NavigationError } from '@angular/router';

import { JhiLanguageHelper } from 'app/core';
import {SERVER_API_URL} from 'app/app.constants';
import {HttpClient} from '@angular/common/http';

@Component({
    selector: 'jhi-main',
    templateUrl: './main.component.html'
})
export class JhiMainComponent implements OnInit {

    public resourceUrlDeleteTable = SERVER_API_URL + 'api/delete-table';

    constructor(private jhiLanguageHelper: JhiLanguageHelper, private router: Router, protected http: HttpClient) {}

    private getPageTitle(routeSnapshot: ActivatedRouteSnapshot) {
        let title: string = routeSnapshot.data && routeSnapshot.data['pageTitle'] ? routeSnapshot.data['pageTitle'] : 'learnSqlApp';
        if (routeSnapshot.firstChild) {
            title = this.getPageTitle(routeSnapshot.firstChild) || title;
        }
        return title;
    }

    ngOnInit() {
        this.router.events.subscribe(event => {
            if (event instanceof NavigationEnd) {
                this.jhiLanguageHelper.updateTitle(this.getPageTitle(this.router.routerState.snapshot.root));
            }
            if (event instanceof NavigationError && event.error.status === 404) {
                this.router.navigate(['/404']);
            }
        });
    }

    @HostListener('window:beforeunload', ['$event'])
    beforeunloadHandler(event) {
        this.endChat();
    }

    endChat() {
        this.http
            .post(this.resourceUrlDeleteTable, {observe: 'response'})
            .subscribe((res: any) => {
                console.log(res);
                console.log('delete table');
            });
    }
}
