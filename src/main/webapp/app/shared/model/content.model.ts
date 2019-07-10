import { Moment } from 'moment';

export interface IContent {
    id?: number;
    title?: string;
    content?: string;
    createdBy?: string;
    createdDate?: Date;
    lastModifiedBy?: string;
    lastModifiedDate?: Date;
    categoryId?: number;
    typeContentId?: number;
    categoryName?: String;
    typeContentName?: String;
}

export class Content implements IContent {
    constructor(
        public id?: number,
        public title?: string,
        public content?: string,
        public createdBy?: string,
        public createdDate?: Date,
        public lastModifiedBy?: string,
        public lastModifiedDate?: Date,
        public categoryId?: number,
        public typeContentId?: number,
        public categoryName?: String,
        public typeContentName?: String
    ) {}
}
