import { LightningElement } from 'lwc';

export default class TwowayDataBinding extends LightningElement {


fullName= 'destina';
course= 'salesforce Developer';

changeHandler(event){
this.course = event.target.value;

}
}