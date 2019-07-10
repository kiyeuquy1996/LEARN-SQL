import { Moment } from 'moment';

export interface ISQLQuery {
    id?: number;
    title?: string;
    nameUrl?: string;
    query?: string;
    description?: string;
    createdBy?: string;
    createdDate?: Date;
    lastModifiedBy?: string;
    lastModifiedDate?: Date;
}

export class SQLQuery implements ISQLQuery {
    constructor(
        public id?: number,
        public title?: string,
        public nameUrl?: string,
        public query?: string,
        public description?: string,
        public createdBy?: string,
        public createdDate?: Date,
        public lastModifiedBy?: string,
        public lastModifiedDate?: Date,
    ) {}
}
