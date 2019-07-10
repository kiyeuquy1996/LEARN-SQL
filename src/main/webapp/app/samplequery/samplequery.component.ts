import {Component, ElementRef, OnInit, ViewChild, ViewEncapsulation} from '@angular/core';
import {HttpClient, HttpErrorResponse, HttpResponse} from '@angular/common/http';
import {SERVER_API_URL} from 'app/app.constants';
import {ISQLQuery} from 'app/shared/model/sql-query.model';
import {SQLQueryService} from 'app/entities/sql-query';
import {filter, map} from 'rxjs/operators';
import {JhiAlertService} from 'ng-jhipster';
import {TryIt} from 'app/shared/model/tryit.model';
import {MDBModalRef} from 'angular-bootstrap-md';
import {NgbModal} from '@ng-bootstrap/ng-bootstrap';

@Component({
    selector: 'jhi-sample-query',
    templateUrl: './samplequery.component.html',
    encapsulation: ViewEncapsulation.None,
    styleUrls: ['samplequery.scss']
})
export class SamplequeryComponent implements OnInit {
    closeResult: string;
    sQLQueries: ISQLQuery[];
    headElements = ['Title', 'Description', 'Query'];
    data: any[];
    tryIt: TryIt;

    @ViewChild('frame') dialog: ElementRef;
    public resourceUrl = SERVER_API_URL + 'api/try-it';

    constructor(
        private modalService: NgbModal,
        protected sQLQueryService: SQLQueryService,
        protected jhiAlertService: JhiAlertService,
        protected http: HttpClient
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

    getQuerySQL(query?: any) {
        this.tryIt = new TryIt(query);
        this.http
            .post(this.resourceUrl, this.tryIt, {observe: 'response'})
            .pipe(
                filter((res: HttpResponse<any[]>) => res.ok),
                map((res: HttpResponse<any[]>) => res.body)
            )
            .subscribe((res: any[]) => {
                this.data = res;
            }, (res: HttpErrorResponse) => console.log(res));
    }

    openXl(content, query) {
        this.modalService.open(content, {size: 'lg'});
        this.getQuerySQL(query);
    }

    protected onError(errorMessage: string) {
        this.jhiAlertService.error(errorMessage, null, null);
    }
}
