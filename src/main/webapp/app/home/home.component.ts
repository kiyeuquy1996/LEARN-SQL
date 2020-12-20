import { Component, OnInit, ViewEncapsulation } from '@angular/core';
import { NgbModal, NgbModalRef } from '@ng-bootstrap/ng-bootstrap';
import { JhiAlertService, JhiEventManager } from 'ng-jhipster';
import { LoginModalService, AccountService, Account } from 'app/core';
import { DataService } from 'app/layouts/data.service';
import { ContentService } from 'app/entities/content';
import { IContent } from 'app/shared/model/content.model';
import { filter, map } from 'rxjs/operators';
import { ICategory } from 'app/shared/model/category.model';
import { CategoryService } from 'app/entities/category';
import { CustomerService } from 'app/entities/customer';
import { ICustomer } from 'app/shared/model/customer.model';
import { IEmployees } from 'app/shared/model/employees.model';
import { EmployeesService } from 'app/entities/employees';
import { IOrders } from 'app/shared/model/orders.model';
import { OrdersService } from 'app/entities/orders';
import { IShipper } from 'app/shared/model/shipper.model';
import { ShipperService } from 'app/entities/shipper';
import { ActivatedRoute, Router } from '@angular/router';
import { ITryIt, TryIt } from 'app/shared/model/tryit.model';
import { SERVER_API_URL } from 'app/app.constants';
import { HttpClient, HttpErrorResponse, HttpResponse } from '@angular/common/http';
import { ICategoryType } from 'app/shared/model/category-type.model';
import { CategoryTypeService } from 'app/entities/category-type';
import { IExercises } from 'app/shared/model/exercises.model';
import { IExercisesAnswer } from 'app/shared/model/exercises-answer.model';
import { ExercisesService } from 'app/entities/exercises';
import { ExercisesAnswerService } from 'app/entities/exercises-answer';

@Component({
    selector: 'jhi-home',
    templateUrl: './home.component.html',
    encapsulation: ViewEncapsulation.None,
    styleUrls: ['home.scss']
})
export class HomeComponent implements OnInit {
    account: Account;
    modalRef: NgbModalRef;
    limitRecord: number;
    arrayHighLight: any[];

    globalreplace: any;
    globalreplace2: any;
    publicDeals: ICategory[] = [];

    idContent: number;
    nameContent: string;
    titleContent: string;
    descriptionContent: string;
    tableDataContent: string;

    contents: IContent[];
    exercises: IExercises[];
    exercisesAnswers: IExercisesAnswer[];
    categories: ICategory[];
    categoryTypes: ICategoryType[];
    lengcategories: number;

    customers: ICustomer[];
    employees: IEmployees[];
    orders: IOrders[];
    shippers: IShipper[];

    category: ICategory;
    tryIt: ITryIt;
    datas: any[];

    public resourceUrl = SERVER_API_URL + 'api/try-it';

    constructor(
        protected exercisesService: ExercisesService,
        protected exercisesAnswerService: ExercisesAnswerService,
        protected categoryTypeService: CategoryTypeService,
        private modalService: NgbModal,
        protected http: HttpClient,
        protected customerService: CustomerService,
        protected employeesService: EmployeesService,
        protected ordersService: OrdersService,
        protected shipperService: ShipperService,
        protected jhiAlertService: JhiAlertService,
        protected activatedRoute: ActivatedRoute,
        private data: DataService,
        private contentService: ContentService,
        private categoryService: CategoryService,
        private accountService: AccountService,
        private loginModalService: LoginModalService,
        private eventManager: JhiEventManager,
        protected router: Router
    ) {
        this.limitRecord = 5;
        this.arrayHighLight = [
            'ADD',
            'ADD CONSTRAINT',
            'ALTER',
            'ALTER COLUMN',
            'ALTER TABLE',
            'ALL',
            'AND',
            'ANY',
            'AS',
            'ASC',
            'BACKUP DATABASE',
            'BETWEEN',
            'CASE',
            'CHECK',
            'COLUMN',
            'CONSTRAINT',
            'CREATE',
            'CREATE DATABASE',
            'CREATE INDEX',
            'CREATE OR REPLACE VIEW',
            'CREATE TABLE',
            'CREATE PROCEDURE',
            'CREATE UNIQUE INDEX',
            'CREATE VIEW',
            'DATABASE',
            'DEFAULT',
            'DELETE',
            'DESC',
            'DISTINCT',
            'DROP',
            'DROP COLUMN',
            'DROP CONSTRAINT',
            'DROP DATABASE',
            'DROP DEFAULT',
            'DROP INDEX',
            'DROP TABLE',
            'DROP VIEW',
            'EXEC',
            'EXISTS',
            'FOREIGN KEY',
            'FROM',
            'FULL OUTER JOIN',
            'GROUP BY',
            'HAVING',
            'IN',
            'INDEX',
            'INNER JOIN',
            'INSERT INTO',
            'INSERT INTO SELECT',
            'IS NULL',
            'IS NOT NULL',
            'JOIN',
            'LEFT JOIN',
            'LIKE',
            'LIMIT',
            'NOT',
            'NOT NULL',
            'OR',
            'ORDER BY',
            'OUTER JOIN',
            'PRIMARY KEY',
            'PROCEDURE',
            'RIGHT JOIN',
            'ROWNUM',
            'SELECT',
            'SELECT DISTINCT',
            'SELECT INTO',
            'SELECT TOP',
            'SET',
            'TABLE',
            'TOP',
            'TRUNCATE TABLE',
            'UNION',
            'UNION ALL',
            'UNIQUE',
            'UPDATE',
            'VALUES',
            'VIEW',
            'WHERE'
        ];
        this.loadAll();
        this.loadServiceDataTable();
        this.globalreplace = / /g;
        this.globalreplace2 = /,/g;
    }

    loadAll() {
        this.contentService
            .query()
            .pipe(
                filter((res: HttpResponse<IContent[]>) => res.ok),
                map((res: HttpResponse<IContent[]>) => res.body)
            )
            .subscribe(
                (res: IContent[]) => {
                    this.contents = res;
                },
                // (res: HttpErrorResponse) => this.onError(res.message)
                (res: HttpErrorResponse) => console.log('contentService went wrong in HomeComponent!')
            );
        this.categoryService
            .query()
            .pipe(
                filter((res: HttpResponse<ICategory[]>) => res.ok),
                map((res: HttpResponse<ICategory[]>) => res.body)
            )
            .subscribe(
                (res: ICategory[]) => {
                    this.categories = res;
                    this.lengcategories = res.length;
                },
                // (res: HttpErrorResponse) => this.onError(res.message)
                (res: HttpErrorResponse) => console.log('categoryService went wrong in HomeComponent!')
            );
        this.categoryTypeService
            .query()
            .pipe(
                filter((res: HttpResponse<ICategoryType[]>) => res.ok),
                map((res: HttpResponse<ICategoryType[]>) => res.body)
            )
            .subscribe(
                (res: ICategoryType[]) => {
                    this.categoryTypes = res;
                },
                (res: HttpErrorResponse) => this.onError(res.message)
            );
        this.exercisesService
            .query()
            .pipe(
                filter((res: HttpResponse<IExercises[]>) => res.ok),
                map((res: HttpResponse<IExercises[]>) => res.body)
            )
            .subscribe(
                (res: IExercises[]) => {
                    this.exercises = res;
                },
                (res: HttpErrorResponse) => this.onError(res.message)
            );
        this.exercisesAnswerService
            .query()
            .pipe(
                filter((res: HttpResponse<IExercisesAnswer[]>) => res.ok),
                map((res: HttpResponse<IExercisesAnswer[]>) => res.body)
            )
            .subscribe(
                (res: IExercisesAnswer[]) => {
                    this.exercisesAnswers = res;
                },
                (res: HttpErrorResponse) => this.onError(res.message)
            );
    }

    loadTree() {
        for (const i of this.categoryTypes) {
            for (const j of this.categories) {
                if (i.id === j.categoryTypeId) {
                    this.publicDeals.push(j);
                }
            }
        }
    }

    next() {
        const splitted = this.router.url.split('/', 4);
        this.loadTree();

        if (+splitted[3] === this.publicDeals[this.publicDeals.length - 1].id) {
            console.log('Cannot navigate to categories');
        } else {
            for (let i = 0; i < this.publicDeals.length; i++) {
                if (+splitted[3] === this.publicDeals[i].id) {
                    const x = ++i;
                    const name =
                        '/view/' +
                        this.publicDeals[x].nameCategory
                            .toString()
                            .replace(this.globalreplace, '_')
                            .replace(this.globalreplace2, '') +
                        '/' +
                        this.publicDeals[x].id;
                    this.data.currentId.subscribe(id => {
                        this.idContent = this.publicDeals[x].id;
                        this.router.navigate([name]);
                    });
                    break;
                }
            }
        }
        this.publicDeals = [];
    }

    previous() {
        const splitted = this.router.url.split('/', 4);
        this.loadTree();

        if (+splitted[3] === this.publicDeals[0].id) {
            console.log('Cannot navigate to categories');
        } else {
            for (let i = 0; i < this.publicDeals.length; i++) {
                if (+splitted[3] === this.publicDeals[i].id) {
                    const x = --i;
                    const name =
                        '/view/' +
                        this.publicDeals[x].nameCategory
                            .toString()
                            .replace(this.globalreplace, '_')
                            .replace(this.globalreplace2, '') +
                        '/' +
                        this.publicDeals[x].id;
                    this.data.currentId.subscribe(id => {
                        this.idContent = this.publicDeals[x].id;
                        this.router.navigate([name]);
                    });
                    break;
                }
            }
        }
        this.publicDeals = [];
    }

    openXl(content, query) {
        this.modalService.open(content, { size: 'lg' });
        this.getQuerySQL(query);
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
                },
                (res: HttpErrorResponse) => this.onError(res.message)
            );
    }

    ngOnInit() {
        this.data.currentId.subscribe(id => {
            if (id === null) {
                this.idContent = 1;
                this.router.navigate(['/dashboard']);
            } else {
                this.idContent = id;
            }
        });

        // this.data.currentName.subscribe(name => this.nameContent = name);
        // this.data.currentTitle.subscribe(title => this.titleContent = title);
        // this.data.currentDescription.subscribe(des => this.descriptionContent = des);
        // this.data.currentTable.subscribe(table => this.tableDataContent = table);

        this.accountService.identity().then((account: Account) => {
            this.account = account;
        });

        this.activatedRoute.data.subscribe(({ category }) => {
            this.category = category;
        });

        this.registerAuthenticationSuccess();
    }

    getQuerySQL(query?: any) {
        console.log(query);

        this.tryIt = new TryIt(query);

        this.http
            .post(this.resourceUrl, this.tryIt, { observe: 'response' })
            .pipe(
                filter((res: HttpResponse<any[]>) => res.ok),
                map((res: HttpResponse<any[]>) => res.body)
            )
            .subscribe((res: any[]) => {
                this.datas = res;
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

    getTitle(id: number) {
        for (let i = 0; i < this.lengcategories; i++) {
            if (this.categories[i].id === id) {
                return this.categories[i].title;
            }
        }
    }

    getTableData(id: number) {
        for (let i = 0; i < this.lengcategories; i++) {
            if (this.categories[i].id === id) {
                return this.categories[i].nameTableData;
            }
        }
    }

    registerAuthenticationSuccess() {
        this.eventManager.subscribe('authenticationSuccess', message => {
            this.accountService.identity().then(account => {
                this.account = account;
            });
        });
    }

    isAuthenticated() {
        return this.accountService.isAuthenticated();
    }

    login() {
        this.modalRef = this.loginModalService.open();
    }

    protected onError(errorMessage: string) {
        this.jhiAlertService.error(errorMessage, null, null);
    }
}
