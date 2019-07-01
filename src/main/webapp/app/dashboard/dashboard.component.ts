import {AfterViewInit, ChangeDetectorRef, Component, OnInit, ViewChild} from '@angular/core';
import {MdbTableDirective, MdbTablePaginationComponent} from 'angular-bootstrap-md';

@Component({
    selector: 'jhi-dashboard',
    templateUrl: './dashboard.component.html',
    styleUrls: ['./dashboard.scss']
})
export class DashboardComponent implements OnInit, AfterViewInit {

    @ViewChild(MdbTablePaginationComponent) mdbTablePagination: MdbTablePaginationComponent;
    @ViewChild(MdbTableDirective) mdbTable: MdbTableDirective;
    elements: any = [];
    previous: any = [];
    headElements = ['ID', 'First', 'Last', 'Handle'];

    constructor(private cdRef: ChangeDetectorRef) {
    }

    ngOnInit() {
        for (let i = 1; i <= 15; i++) {
            this.elements.push({id: (i * 2).toString(), first: 'User ' + i, last: 'Name ' + i, handle: 'Handle ' + i});
        }
        console.log(this.elements);
        this.mdbTable.setDataSource(this.elements);
        this.elements = this.mdbTable.getDataSource();
        this.previous = this.mdbTable.getDataSource();
    }

    ngAfterViewInit() {
        this.mdbTablePagination.setMaxVisibleItemsNumberTo(5);

        this.mdbTablePagination.calculateFirstItemIndex();
        this.mdbTablePagination.calculateLastItemIndex();
        this.cdRef.detectChanges();
    }
}
