import { LightningElement } from 'lwc';

export default class Engin2 extends LightningElement {

    Name;

    nameHandler(event){
this.Name=event.target.value;
    }


}