import { Moment } from 'moment';
import { ICategory } from 'app/shared/model/category.model';

export interface ICategoryType {
    id?: number;
    nameCategoryType?: string;
    description?: string;
    createdBy?: string;
    createdDate?: Date;
    lastModifiedBy?: string;
    lastModifiedDate?: Date;
    categoryTypeIDS?: ICategory[];
}

export class CategoryType implements ICategoryType {
    constructor(
        public id?: number,
        public nameCategoryType?: string,
        public description?: string,
        public createdBy?: string,
        public createdDate?: Date,
        public lastModifiedBy?: string,
        public lastModifiedDate?: Date,
        public categoryTypeIDS?: ICategory[]
    ) {}
}
