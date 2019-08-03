import {Component, OnInit, OnDestroy, AfterViewInit, ViewChild, ChangeDetectorRef, HostListener} from '@angular/core';
import {HttpErrorResponse, HttpResponse} from '@angular/common/http';
import {ActivatedRoute} from '@angular/router';
import {Subscription} from 'rxjs';
import {filter, map} from 'rxjs/operators';
import {JhiEventManager, JhiAlertService} from 'ng-jhipster';

import {IContent} from 'app/shared/model/content.model';
import {AccountService} from 'app/core';
import {ContentService} from './content.service';
import {MdbTableDirective, MdbTablePaginationComponent} from 'angular-bootstrap-md';

@Component({
    selector: 'jhi-content',
    templateUrl: './content.component.html'
})
export class ContentComponent implements OnInit, AfterViewInit, OnDestroy {
    @ViewChild(MdbTablePaginationComponent) mdbTablePagination: MdbTablePaginationComponent;
    @ViewChild(MdbTableDirective) mdbTable: MdbTableDirective;
    contents: IContent[] = [];
    previous: IContent[];
    currentAccount: any;
    eventSubscriber: Subscription;
    currentSearch: string;
    searchText: string;

    constructor(
        private cdRef: ChangeDetectorRef,
        protected contentService: ContentService,
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
            this.contents = this.mdbTable.getDataSource();
        }

        if (this.searchText) {
            this.contents = this.mdbTable.searchLocalDataBy(this.searchText);
            this.mdbTable.setDataSource(prev);
        }
    }

    loadAll() {
        if (this.currentSearch) {
            this.contentService
                .search({
                    query: this.currentSearch
                })
                .pipe(
                    filter((res: HttpResponse<IContent[]>) => res.ok),
                    map((res: HttpResponse<IContent[]>) => res.body)
                )
                .subscribe((res: IContent[]) => (this.contents = res), (res: HttpErrorResponse) => this.onError(res.message));
            return;
        }
        this.contentService
            .query()
            .pipe(
                filter((res: HttpResponse<IContent[]>) => res.ok),
                map((res: HttpResponse<IContent[]>) => res.body)
            )
            .subscribe(
                (res: IContent[]) => {
                    this.contents = res;
                    this.mdbTable.setDataSource(this.contents);
                    this.contents = this.mdbTable.getDataSource();
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
        this.registerChangeInContents();
    }

    ngOnDestroy() {
        this.eventManager.destroy(this.eventSubscriber);
    }

    trackId(index: number, item: IContent) {
        return item.id;
    }

    registerChangeInContents() {
        this.eventSubscriber = this.eventManager.subscribe('contentListModification', response => this.loadAll());
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
