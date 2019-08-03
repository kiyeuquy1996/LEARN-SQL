import {Component, OnInit, OnDestroy, HostListener, ViewChild, ChangeDetectorRef, AfterViewInit} from '@angular/core';
import {HttpErrorResponse, HttpResponse} from '@angular/common/http';
import {ActivatedRoute} from '@angular/router';
import {Subscription} from 'rxjs';
import {filter, map} from 'rxjs/operators';
import {JhiEventManager, JhiAlertService} from 'ng-jhipster';

import {ITypeContent} from 'app/shared/model/type-content.model';
import {AccountService} from 'app/core';
import {TypeContentService} from './type-content.service';
import {MdbTableDirective, MdbTablePaginationComponent} from 'angular-bootstrap-md';

@Component({
    selector: 'jhi-type-content',
    templateUrl: './type-content.component.html'
})
export class TypeContentComponent implements OnInit, AfterViewInit, OnDestroy {
    @ViewChild(MdbTablePaginationComponent) mdbTablePagination: MdbTablePaginationComponent;
    @ViewChild(MdbTableDirective) mdbTable: MdbTableDirective;
    typeContents: ITypeContent[] = [];
    previous: ITypeContent[];
    currentAccount: any;
    eventSubscriber: Subscription;
    currentSearch: string;
    searchText: string;

    constructor(
        private cdRef: ChangeDetectorRef,
        protected typeContentService: TypeContentService,
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
            this.typeContents = this.mdbTable.getDataSource();
        }

        if (this.searchText) {
            this.typeContents = this.mdbTable.searchLocalDataBy(this.searchText);
            this.mdbTable.setDataSource(prev);
        }
    }

    loadAll() {
        if (this.currentSearch) {
            this.typeContentService
                .search({
                    query: this.currentSearch
                })
                .pipe(
                    filter((res: HttpResponse<ITypeContent[]>) => res.ok),
                    map((res: HttpResponse<ITypeContent[]>) => res.body)
                )
                .subscribe((res: ITypeContent[]) => (this.typeContents = res), (res: HttpErrorResponse) => this.onError(res.message));
            return;
        }
        this.typeContentService
            .query()
            .pipe(
                filter((res: HttpResponse<ITypeContent[]>) => res.ok),
                map((res: HttpResponse<ITypeContent[]>) => res.body)
            )
            .subscribe(
                (res: ITypeContent[]) => {
                    this.typeContents = res;
                    this.mdbTable.setDataSource(this.typeContents);
                    this.typeContents = this.mdbTable.getDataSource();
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
        this.registerChangeInTypeContents();
    }

    ngOnDestroy() {
        this.eventManager.destroy(this.eventSubscriber);
    }

    trackId(index: number, item: ITypeContent) {
        return item.id;
    }

    registerChangeInTypeContents() {
        this.eventSubscriber = this.eventManager.subscribe('typeContentListModification', response => this.loadAll());
    }

    protected onError(errorMessage: string) {
        this.jhiAlertService.error(errorMessage, null, null);
    }

    ngAfterViewInit() {
        this.mdbTablePagination.setMaxVisibleItemsNumberTo(10);

        this.mdbTablePagination.calculateFirstItemIndex();
        this.mdbTablePagination.calculateLastItemIndex();
        this.cdRef.detectChanges();
    }
}
