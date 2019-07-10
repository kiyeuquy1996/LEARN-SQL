import {Component, OnInit} from '@angular/core';
import {HttpClient, HttpErrorResponse, HttpResponse} from '@angular/common/http';
import {SERVER_API_URL} from 'app/app.constants';
import {ISQLQuery} from 'app/shared/model/sql-query.model';
import {SQLQueryService} from 'app/entities/sql-query';
import {filter, map} from 'rxjs/operators';
import {JhiAlertService} from 'ng-jhipster';

@Component({
    selector: 'jhi-sample-query',
    templateUrl: './samplequery.component.html',
    styleUrls: ['samplequery.scss']
})
export class SamplequeryComponent implements OnInit {

    sQLQueries: ISQLQuery[];

    constructor(
        protected sQLQueryService: SQLQueryService,
        protected jhiAlertService: JhiAlertService,
    ) {
    }

    loadAll() {
        this.sQLQueryService
            .query()
            .pipe(
                filter((res: HttpResponse<ISQLQuery[]>) => res.ok),
                map((res: HttpResponse<ISQLQuery[]>) => res.body)
            )
            .subscribe(
                (res: ISQLQuery[]) => {
                    this.sQLQueries = res;
                },
                (res: HttpErrorResponse) => this.onError(res.message)
            );
    }

    ngOnInit(): void {
        this.loadAll();
    }

    protected onError(errorMessage: string) {
        this.jhiAlertService.error(errorMessage, null, null);
    }
}
