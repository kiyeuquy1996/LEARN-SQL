import { Moment } from 'moment';
import { IContent } from 'app/shared/model/content.model';
import { IExercises } from 'app/shared/model/exercises.model';

export interface ICategory {
    id?: number;
    nameCategory?: string;
    title?: string;
    isKeyword?: boolean;
    description?: string;
    nameTableData?: string;
    createdBy?: string;
    createdDate?: Date;
    lastModifiedBy?: string;
    lastModifiedDate?: Date;
    categoryTypeName?: string;
    categoryTypeId?: number;
    cateIDS?: IContent[];
    categoryIDS?: IExercises[];
}

export class Category implements ICategory {
    constructor(
        public id?: number,
        public nameCategory?: string,
        public title?: string,
        public isKeyword?: boolean,
        public description?: string,
        public nameTableData?: string,
        public createdBy?: string,
        public createdDate?: Date,
        public lastModifiedBy?: string,
        public lastModifiedDate?: Date,
        public categoryTypeName?: string,
        public categoryTypeId?: number,
        public cateIDS?: IContent[],
        public categoryIDS?: IExercises[]
    ) {
        this.isKeyword = this.isKeyword || false;
    }
}
