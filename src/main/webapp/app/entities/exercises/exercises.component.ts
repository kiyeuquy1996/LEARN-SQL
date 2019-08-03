import {Component, OnInit, OnDestroy, AfterViewInit, ViewChild, ChangeDetectorRef, HostListener} from '@angular/core';
import {HttpErrorResponse, HttpResponse} from '@angular/common/http';
import {ActivatedRoute} from '@angular/router';
import {Subscription} from 'rxjs';
import {filter, map} from 'rxjs/operators';
import {JhiEventManager, JhiAlertService} from 'ng-jhipster';

import {IExercises} from 'app/shared/model/exercises.model';
import {AccountService} from 'app/core';
import {ExercisesService} from './exercises.service';
import {MdbTableDirective, MdbTablePaginationComponent} from 'angular-bootstrap-md';

@Component({
    selector: 'jhi-exercises',
    templateUrl: './exercises.component.html'
})
export class ExercisesComponent implements OnInit, AfterViewInit, OnDestroy {
    exercises: IExercises[] = [];
    @ViewChild(MdbTablePaginationComponent) mdbTablePagination: MdbTablePaginationComponent;
    @ViewChild(MdbTableDirective) mdbTable: MdbTableDirective;
    previous: IExercises[];
    currentAccount: any;
    eventSubscriber: Subscription;
    currentSearch: string;
    searchText: string;

    constructor(
        private cdRef: ChangeDetectorRef,
        protected exercisesService: ExercisesService,
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
            this.exercises = this.mdbTable.getDataSource();
        }

        if (this.searchText) {
            this.exercises = this.mdbTable.searchLocalDataBy(this.searchText);
            this.mdbTable.setDataSource(prev);
        }
    }

    loadAll() {
        if (this.currentSearch) {
            this.exercisesService
                .search({
                    query: this.currentSearch
                })
                .pipe(
                    filter((res: HttpResponse<IExercises[]>) => res.ok),
                    map((res: HttpResponse<IExercises[]>) => res.body)
                )
                .subscribe((res: IExercises[]) => (this.exercises = res), (res: HttpErrorResponse) => this.onError(res.message));
            return;
        }
        this.exercisesService
            .query()
            .pipe(
                filter((res: HttpResponse<IExercises[]>) => res.ok),
                map((res: HttpResponse<IExercises[]>) => res.body)
            )
            .subscribe(
                (res: IExercises[]) => {
                    this.exercises = res;
                    this.mdbTable.setDataSource(this.exercises);
                    this.exercises = this.mdbTable.getDataSource();
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
        this.registerChangeInExercises();
    }

    ngOnDestroy() {
        this.eventManager.destroy(this.eventSubscriber);
    }

    trackId(index: number, item: IExercises) {
        return item.id;
    }

    registerChangeInExercises() {
        this.eventSubscriber = this.eventManager.subscribe('exercisesListModification', response => this.loadAll());
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
