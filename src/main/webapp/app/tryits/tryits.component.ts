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
import {MDBModalRef} from "angular-bootstrap-md";

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

    lengthCustomers: number;
    lengthEmployees: number;
    lengthOrders: number;
    lengthShippers: number;

    query: string;
    nameArray: any[];
    data: any[];
    reStoreData: any;
    createTableName: any;

    tryIt: ITryIt;

    @ViewChild('frame') dialog: MDBModalRef;

    public resourceUrl = SERVER_API_URL + 'api/try-it';
    public resourceUrlRestore = SERVER_API_URL + 'api/restore';
    public resourceUrlCreateTable = SERVER_API_URL + 'api/create-table';

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

    getQuerySQL(query?: any) {
        console.log(query);

        let params0: string;
        let params1: string;
        let params2: string;
        let nametable = query.split(' ', 3);

        params0 = nametable[0];
        params1 = nametable[1];
        params2 = nametable[2];

        this.tryIt = new TryIt(query);

        if (params0.toUpperCase() === 'CREATE' && params1.toUpperCase() === 'TABLE') {
            if (params2.toUpperCase() === 'CUSTOMER' ||
                params2.toUpperCase() === 'EMPLOYEES' ||
                params2.toUpperCase() === 'ORDERS' ||
                params2.toUpperCase() === 'SHIPPER') {
                console.log('Duplicate name table');
            } else {
                this.http
                    .post(this.resourceUrlCreateTable, this.tryIt, {observe: 'response'})
                    .subscribe((res: any) => {
                        this.createTableName = res;
                        console.log(res);
                    });
            }
        }

        this.http
            .post(this.resourceUrl, this.tryIt, {observe: 'response'})
            .pipe(
                filter((res: HttpResponse<any[]>) => res.ok),
                map((res: HttpResponse<any[]>) => res.body)
            )
            .subscribe((res: any[]) => {
                this.data = res;
                console.log(res);

                console.log(Object.keys(res[0]));

                // if (res.length > 0) {
                //     this.nameArray = Object.keys(res[0]);
                // this.nameArray = this.nameArray.sort((x, y) => {
                //     return x.length - y.length;
                // });
                // }
            });
    }

    reStoreDB() {
        this.http
            .post(this.resourceUrlRestore, {observe: 'response'})
            .subscribe((res: any) => {
                this.reStoreData = res;
                this.dialog.hide();
                console.log(res);
                console.log(this.reStoreData);
            });
    }

    clearQuerySQL() {
        this.query = null;
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

    restoreDatabase() {
        alert('Restore Database');
    }

    onClose(event: any) {
        console.log(event);
    }

    loadServiceDataTable() {
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
