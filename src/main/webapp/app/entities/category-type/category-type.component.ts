import {Component, OnInit, OnDestroy, AfterViewInit, ViewChild, ChangeDetectorRef, HostListener} from '@angular/core';
import {HttpErrorResponse, HttpResponse} from '@angular/common/http';
import {ActivatedRoute} from '@angular/router';
import {Subscription} from 'rxjs';
import {filter, map} from 'rxjs/operators';
import {JhiEventManager, JhiAlertService} from 'ng-jhipster';

import {ICategoryType} from 'app/shared/model/category-type.model';
import {AccountService} from 'app/core';
import {CategoryTypeService} from './category-type.service';
import {MdbTableDirective, MdbTablePaginationComponent} from 'angular-bootstrap-md';

@Component({
    selector: 'jhi-category-type',
    templateUrl: './category-type.component.html',
    styleUrls: ['../search.scss']
})
export class CategoryTypeComponent implements OnInit, AfterViewInit, OnDestroy {
    @ViewChild(MdbTablePaginationComponent) mdbTablePagination: MdbTablePaginationComponent;
    @ViewChild(MdbTableDirective) mdbTable: MdbTableDirective;
    previous: ICategoryType[];
    categoryTypes: ICategoryType[] = [];
    searchText: string;
    currentAccount: any;
    eventSubscriber: Subscription;
    currentSearch: string;

    constructor(
        private cdRef: ChangeDetectorRef,
        protected categoryTypeService: CategoryTypeService,
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
            this.categoryTypes = this.mdbTable.getDataSource();
        }

        if (this.searchText) {
            this.categoryTypes = this.mdbTable.searchLocalDataBy(this.searchText);
            this.mdbTable.setDataSource(prev);
        }
    }

    loadAll() {
        if (this.currentSearch) {
            this.categoryTypeService
                .search({
                    query: this.currentSearch
                })
                .pipe(
                    filter((res: HttpResponse<ICategoryType[]>) => res.ok),
                    map((res: HttpResponse<ICategoryType[]>) => res.body)
                )
                .subscribe((res: ICategoryType[]) => (this.categoryTypes = res), (res: HttpErrorResponse) => this.onError(res.message));
            return;
        }
        this.categoryTypeService
            .query()
            .pipe(
                filter((res: HttpResponse<ICategoryType[]>) => res.ok),
                map((res: HttpResponse<ICategoryType[]>) => res.body)
            )
            .subscribe(
                (res: ICategoryType[]) => {
                    this.categoryTypes = res;
                    this.mdbTable.setDataSource(this.categoryTypes);
                    this.categoryTypes = this.mdbTable.getDataSource();
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
        this.registerChangeInCategoryTypes();
    }

    ngOnDestroy() {
        this.eventManager.destroy(this.eventSubscriber);
    }

    trackId(index: number, item: ICategoryType) {
        return item.id;
    }

    registerChangeInCategoryTypes() {
        this.eventSubscriber = this.eventManager.subscribe('categoryTypeListModification', response => this.loadAll());
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
