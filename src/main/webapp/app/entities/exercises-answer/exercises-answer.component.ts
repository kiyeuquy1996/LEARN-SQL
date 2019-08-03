import {Component, OnInit, OnDestroy, AfterViewInit, ViewChild, ChangeDetectorRef, HostListener} from '@angular/core';
import {HttpErrorResponse, HttpResponse} from '@angular/common/http';
import {ActivatedRoute} from '@angular/router';
import {Subscription} from 'rxjs';
import {filter, map} from 'rxjs/operators';
import {JhiEventManager, JhiAlertService} from 'ng-jhipster';

import {IExercisesAnswer} from 'app/shared/model/exercises-answer.model';
import {AccountService} from 'app/core';
import {ExercisesAnswerService} from './exercises-answer.service';
import {MdbTableDirective, MdbTablePaginationComponent} from 'angular-bootstrap-md';

@Component({
    selector: 'jhi-exercises-answer',
    templateUrl: './exercises-answer.component.html'
})
export class ExercisesAnswerComponent implements OnInit, AfterViewInit, OnDestroy {
    @ViewChild(MdbTablePaginationComponent) mdbTablePagination: MdbTablePaginationComponent;
    @ViewChild(MdbTableDirective) mdbTable: MdbTableDirective;
    previous: IExercisesAnswer[];
    exercisesAnswers: IExercisesAnswer[] = [];
    currentAccount: any;
    eventSubscriber: Subscription;
    currentSearch: string;
    searchText: string;

    constructor(
        private cdRef: ChangeDetectorRef,
        protected exercisesAnswerService: ExercisesAnswerService,
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
            this.exercisesAnswers = this.mdbTable.getDataSource();
        }

        if (this.searchText) {
            this.exercisesAnswers = this.mdbTable.searchLocalDataBy(this.searchText);
            this.mdbTable.setDataSource(prev);
        }
    }

    loadAll() {
        if (this.currentSearch) {
            this.exercisesAnswerService
                .search({
                    query: this.currentSearch
                })
                .pipe(
                    filter((res: HttpResponse<IExercisesAnswer[]>) => res.ok),
                    map((res: HttpResponse<IExercisesAnswer[]>) => res.body)
                )
                .subscribe(
                    (res: IExercisesAnswer[]) => (this.exercisesAnswers = res),
                    (res: HttpErrorResponse) => this.onError(res.message)
                );
            return;
        }
        this.exercisesAnswerService
            .query()
            .pipe(
                filter((res: HttpResponse<IExercisesAnswer[]>) => res.ok),
                map((res: HttpResponse<IExercisesAnswer[]>) => res.body)
            )
            .subscribe(
                (res: IExercisesAnswer[]) => {
                    this.exercisesAnswers = res;
                    this.mdbTable.setDataSource(this.exercisesAnswers);
                    this.exercisesAnswers = this.mdbTable.getDataSource();
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
        this.registerChangeInExercisesAnswers();
    }

    ngOnDestroy() {
        this.eventManager.destroy(this.eventSubscriber);
    }

    trackId(index: number, item: IExercisesAnswer) {
        return item.id;
    }

    registerChangeInExercisesAnswers() {
        this.eventSubscriber = this.eventManager.subscribe('exercisesAnswerListModification', response => this.loadAll());
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
