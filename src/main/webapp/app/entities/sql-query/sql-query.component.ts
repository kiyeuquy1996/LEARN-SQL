import {Component, OnInit, OnDestroy, AfterViewInit, ViewChild, ChangeDetectorRef, HostListener} from '@angular/core';
import {HttpErrorResponse, HttpResponse} from '@angular/common/http';
import {ActivatedRoute} from '@angular/router';
import {Subscription} from 'rxjs';
import {filter, map} from 'rxjs/operators';
import {JhiEventManager, JhiAlertService} from 'ng-jhipster';

import {ISQLQuery} from 'app/shared/model/sql-query.model';
import {AccountService} from 'app/core';
import {SQLQueryService} from './sql-query.service';
import {MdbTableDirective, MdbTablePaginationComponent} from 'angular-bootstrap-md';

@Component({
    selector: 'jhi-sql-query',
    templateUrl: './sql-query.component.html'
})
export class SQLQueryComponent implements OnInit, AfterViewInit, OnDestroy {
    @ViewChild(MdbTablePaginationComponent) mdbTablePagination: MdbTablePaginationComponent;
    @ViewChild(MdbTableDirective) mdbTable: MdbTableDirective;
    previous: ISQLQuery[];
    sQLQueries: ISQLQuery[] = [];
    currentAccount: any;
    eventSubscriber: Subscription;
    currentSearch: string;
    searchText: string;

    constructor(
        private cdRef: ChangeDetectorRef,
        protected sQLQueryService: SQLQueryService,
        protected jhiAlertService: JhiAlertService,
        protected eventManager: JhiEventManager,
        protected activatedRoute: ActivatedRoute,
        protected accountService: AccountService
    ) {
        this.currentSearch =
            this.activatedRoute.snapshot && this.activatedRoute.snapshot.params['search']
                ? this.activatedRoute.snapshot.params['search']
                : '';
    }

    @HostListener('input') oninput() {
        this.searchItems();
    }

    searchItems() {
        const prev = this.mdbTable.getDataSource();

        if (!this.searchText) {
            this.mdbTable.setDataSource(this.previous);
            this.sQLQueries = this.mdbTable.getDataSource();
        }

        if (this.searchText) {
            this.sQLQueries = this.mdbTable.searchLocalDataBy(this.searchText);
            this.mdbTable.setDataSource(prev);
        }
    }

    loadAll() {
        if (this.currentSearch) {
            this.sQLQueryService
                .search({
                    query: this.currentSearch
                })
                .pipe(
                    filter((res: HttpResponse<ISQLQuery[]>) => res.ok),
                    map((res: HttpResponse<ISQLQuery[]>) => res.body)
                )
                .subscribe((res: ISQLQuery[]) => (this.sQLQueries = res), (res: HttpErrorResponse) => this.onError(res.message));
            return;
        }
        this.sQLQueryService
            .query()
            .pipe(
                filter((res: HttpResponse<ISQLQuery[]>) => res.ok),
                map((res: HttpResponse<ISQLQuery[]>) => res.body)
            )
            .subscribe(
                (res: ISQLQuery[]) => {
                    this.sQLQueries = res;
                    this.mdbTable.setDataSource(this.sQLQueries);
                    this.sQLQueries = this.mdbTable.getDataSource();
                    this.previous = this.mdbTable.getDataSource();
                    this.currentSearch = '';
                },
                (res: HttpErrorResponse) => this.onError(res.message)
            );
    }

    search(query) {
        if (!query) {
            return this.clear();
        }
        this.currentSearch = query;
        this.loadAll();
    }

    clear() {
        this.currentSearch = '';
        this.loadAll();
    }

    ngOnInit() {
        this.loadAll();
        this.accountService.identity().then(account => {
            this.currentAccount = account;
        });
        this.registerChangeInSQLQueries();
    }

    ngOnDestroy() {
        this.eventManager.destroy(this.eventSubscriber);
    }

    trackId(index: number, item: ISQLQuery) {
        return item.id;
    }

    registerChangeInSQLQueries() {
        this.eventSubscriber = this.eventManager.subscribe('sQLQueryListModification', response => this.loadAll());
    }

    protected onError(errorMessage: string) {
        this.jhiAlertService.error(errorMessage, null, null);
    }

    ngAfterViewInit() {
        this.mdbTablePagination.setMaxVisibleItemsNumberTo(5);

        this.mdbTablePagination.calculateFirstItemIndex();
        this.mdbTablePagination.calculateLastItemIndex();
        this.cdRef.detectChanges();
    }
}
