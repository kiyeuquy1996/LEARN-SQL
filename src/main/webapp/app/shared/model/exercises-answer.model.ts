import { Moment } from 'moment';

export interface IExercisesAnswer {
    id?: number;
    result?: string;
    isCorrect?: boolean;
    createdBy?: string;
    createdDate?: Date;
    lastModifiedBy?: string;
    lastModifiedDate?: Date;
    exercisesId?: number;
    exercisesName?: string;
}

export class ExercisesAnswer implements IExercisesAnswer {
    constructor(
        public id?: number,
        public result?: string,
        public isCorrect?: boolean,
        public createdBy?: string,
        public createdDate?: Date,
        public lastModifiedBy?: string,
        public lastModifiedDate?: Date,
        public exercisesId?: number,
        public exercisesName?: string
    ) {
        this.isCorrect = this.isCorrect || false;
    }
}
