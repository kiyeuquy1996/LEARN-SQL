import { Moment } from 'moment';
import { IContent } from 'app/shared/model/content.model';

export interface ITypeContent {
    id?: number;
    nameTypeContent?: string;
    priority?: number;
    createdBy?: string;
    createdDate?: Date;
    lastModifiedBy?: string;
    lastModifiedDate?: Date;
    typeContentIDS?: IContent[];
}

export class TypeContent implements ITypeContent {
    constructor(
        public id?: number,
        public nameTypeContent?: string,
        public priority?: number,
        public createdBy?: string,
        public createdDate?: Date,
        public lastModifiedBy?: string,
        public lastModifiedDate?: Date,
        public typeContentIDS?: IContent[]
    ) {}
}
