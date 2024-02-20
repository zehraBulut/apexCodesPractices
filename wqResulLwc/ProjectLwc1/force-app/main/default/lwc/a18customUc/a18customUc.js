import { LightningElement } from 'lwc';
export default class A18customUc extends LightningElement {

 musteri={
    name:'destina',
    yas:39
 }

 handleClick(){
 const cstEvent= new CustomEvent('ayva' , {detail: this.childdanObject})//ne gonderceksen 2iparametera onu yaz
 this.dispatchEvent(cstEvent)
       
 //this.dispatchEvent(new CustomEvent('ayva'))
       
 }
}