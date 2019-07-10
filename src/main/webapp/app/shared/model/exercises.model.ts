import { Moment } from 'moment';
import { IExercisesAnswer } from 'app/shared/model/exercises-answer.model';

export interface IExercises {
    id?: number;
    nameExercises?: string;
    question?: string;
    score?: number;
    timeOnMinutes?: number;
    createdBy?: string;
    createdDate?: Date;
    lastModifiedBy?: string;
    lastModifiedDate?: Date;
    categoryId?: number;
    categoryName?: string;
    exercisesIDS?: IExercisesAnswer[];
}

export class Exercises implements IExercises {
    constructor(
        public id?: number,
        public nameExercises?: string,
        public question?: string,
        public score?: number,
        public timeOnMinutes?: number,
        public createdBy?: string,
        public createdDate?: Date,
        public lastModifiedBy?: string,
        public lastModifiedDate?: Date,
        public categoryId?: number,
        public categoryName?: string,
        public exercisesIDS?: IExercisesAnswer[]
    ) {}
}
