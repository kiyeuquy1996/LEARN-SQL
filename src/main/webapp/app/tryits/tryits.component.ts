import {Component, ElementRef, OnInit, ViewChild} from '@angular/core';
import {ICustomer} from 'app/shared/model/customer.model';
import {IEmployees} from 'app/shared/model/employees.model';
import {IOrders} from 'app/shared/model/orders.model';
import {IShipper} from 'app/shared/model/shipper.model';
import {CustomerService} from 'app/entities/customer';
import {EmployeesService} from 'app/entities/employees';
import {OrdersService} from 'app/entities/orders';
import {ShipperService} from 'app/entities/shipper';
import {filter, map} from 'rxjs/operators';
import {HttpClient, HttpErrorResponse, HttpResponse} from '@angular/common/http';
import {JhiAlertService} from 'ng-jhipster';
import {TryItService} from 'app/layouts/try-it.service';
import {SERVER_API_URL} from 'app/app.constants';
import {ITryIt, TryIt} from 'app/shared/model/tryit.model';
import {MDBModalRef} from 'angular-bootstrap-md';

@Component({
    selector: 'jhi-try-it',
    templateUrl: './tryits.component.html',
    styleUrls: ['tryits.scss']
})
export class TryitsComponent implements OnInit {

    customers: ICustomer[];
    employees: IEmployees[];
    orders: IOrders[];
    shippers: IShipper[];

    isHidden: boolean = true;

    lengthCustomers: number;
    lengthEmployees: number;
    lengthOrders: number;
    lengthShippers: number;

    query: string;
    duplicate: string;
    listYourNameTable: any[];
    data: any[];
    reStoreData: any;
    createTableName: any;
    deleteTblS: any;

    public html: string = '<span class="btn btn-danger"><strong>Note: </strong>If you confirm, your entire data sheet created earlier will be deleted</span>';

    tryIt: ITryIt;

    @ViewChild('frame') dialog: MDBModalRef;
    @ViewChild('alert') alert: ElementRef;

    public resourceUrl = SERVER_API_URL + 'api/try-it';
    public resourceUrlRestore = SERVER_API_URL + 'api/restore';
    public resourceUrlCreateTable = SERVER_API_URL + 'api/create-table';
    public resourceUrlDeleteTable = SERVER_API_URL + 'api/delete-table';
    public resourceUrlYourTable = SERVER_API_URL + 'api/loadTable';

    constructor(
        private tryitService: TryItService,
        private customerService: CustomerService,
        private employeesService: EmployeesService,
        private ordersService: OrdersService,
        private shipperService: ShipperService,
        private jhiAlertService: JhiAlertService,
        protected http: HttpClient
    ) {
        this.loadServiceDataTable();
    }

    ngOnInit() {
        this.query = null;
    }

    closeAlert() {
        this.alert.nativeElement.classList.remove('show');
    }

    getQuerySQL(query?: any) {
        let params0: string;
        let params1: string;
        let params2: string;
        const nametable = query.split(' ', 3);

        params0 = nametable[0];
        params1 = nametable[1];
        params2 = nametable[2];

        this.tryIt = new TryIt(query);

        if (params0.toUpperCase() === 'CREATE' && params1.toUpperCase() === 'TABLE') {
            if (params2.toUpperCase() === 'CUSTOMER' ||
                params2.toUpperCase() === 'EMPLOYEES' ||
                params2.toUpperCase() === 'ORDERS' ||
                params2.toUpperCase() === 'SHIPPER') {
                this.clearQuery();
                this.duplicate = 'Duplicate name table available!';
            } else {
                this.http
                    .post(this.resourceUrlCreateTable, this.tryIt, {observe: 'response'})
                    .pipe(
                        filter((res: HttpResponse<any>) => res.ok),
                        map((res: HttpResponse<any>) => res.body)
                    )
                    .subscribe((res: any) => {
                        this.isHidden = false;
                        this.clearQuery();
                        this.loadServiceDataTable();
                        this.createTableName = res;
                        console.log(res);
                        console.log('create table');
                    }, (res: HttpErrorResponse) => console.log(res));
            }
        } else {
            this.http
                .post(this.resourceUrl, this.tryIt, {observe: 'response'})
                .pipe(
                    filter((res: HttpResponse<any[]>) => res.ok),
                    map((res: HttpResponse<any[]>) => res.body)
                )
                .subscribe((res: any[]) => {
                    this.clearQuery();
                    this.loadServiceDataTable();
                    this.data = res;
                    console.log(res);
                    console.log('query sql');
                }, (res: HttpErrorResponse) => console.log(res));
        }
    }

    reStoreDB() {
        this.http
            .post(this.resourceUrlRestore, {observe: 'response'})
            .subscribe((res: any) => {
                this.clearQuerySQL();
                this.loadServiceDataTable();
                this.dialog.hide();
                this.reStoreData = res;
            });
    }

    deleteTbl() {
        this.http
            .post(this.resourceUrlDeleteTable, {observe: 'response'})
            .subscribe((res: any) => {
                this.isHidden = true;
                this.clearQuerySQL();
                this.loadServiceDataTable();
                this.deleteTblS = res;
                this.listYourNameTable = null;
                console.log(res);
                console.log('delete table');
            });
    }

    clearQuerySQL() {
        this.deleteTblS = null;
        this.createTableName = null;
        this.reStoreData = null;
        this.duplicate = null;
        this.query = null;
        this.data = null;
    }

    clearQuery() {
        this.deleteTblS = null;
        this.createTableName = null;
        this.reStoreData = null;
        this.duplicate = null;
        this.data = null;
    }

    addTextQuery(query: string) {
        this.query = null;
        this.query = query;
        this.getQuerySQL(query);
    }

    addString(text: string) {
        if (this.query === null || this.query === '') {
            this.query = text + ' ';
        } else {
            this.query = this.query + ' ' + text + ' ';
        }
    }

    onClose(event: any) {
        console.log(event);
    }

    loadServiceDataTable() {
        this.http
            .post(this.resourceUrlYourTable, {observe: 'response'})
            .subscribe((res: any[]) => {
                this.listYourNameTable = res;
                console.log(res);
                console.log('listYourNameTable');

            });

        this.customerService
            .query()
            .pipe(
                filter((res: HttpResponse<ICustomer[]>) => res.ok),
                map((res: HttpResponse<ICustomer[]>) => res.body)
            )
            .subscribe(
                (res: ICustomer[]) => {
                    this.customers = res;
                    this.lengthCustomers = res.length;
                },
                (res: HttpErrorResponse) => this.onError(res.message)
            );

        this.employeesService
            .query()
            .pipe(
                filter((res: HttpResponse<IEmployees[]>) => res.ok),
                map((res: HttpResponse<IEmployees[]>) => res.body)
            )
            .subscribe(
                (res: IEmployees[]) => {
                    this.employees = res;
                    this.lengthEmployees = res.length;
                },
                (res: HttpErrorResponse) => this.onError(res.message)
            );

        this.ordersService
            .query()
            .pipe(
                filter((res: HttpResponse<IOrders[]>) => res.ok),
                map((res: HttpResponse<IOrders[]>) => res.body)
            )
            .subscribe(
                (res: IOrders[]) => {
                    this.orders = res;
                    this.lengthOrders = res.length;
                },
                (res: HttpErrorResponse) => this.onError(res.message)
            );

        this.shipperService
            .query()
            .pipe(
                filter((res: HttpResponse<IShipper[]>) => res.ok),
                map((res: HttpResponse<IShipper[]>) => res.body)
            )
            .subscribe(
                (res: IShipper[]) => {
                    this.shippers = res;
                    this.lengthShippers = res.length;
                },
                (res: HttpErrorResponse) => this.onError(res.message)
            );
    }

    protected onError(errorMessage: string) {
        this.jhiAlertService.error(errorMessage, null, null);
    }

}
