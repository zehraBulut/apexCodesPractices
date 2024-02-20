import { LightningElement } from 'lwc';
export default class FunctionExample extends LightningElement {
  sum;
  a=12;
  b=18;
    addNumbers(a, b) {
    return a + b;
  }
  renderedCallback(){
    this.sum = this.addNumbers(this.a,this.b);
  }
}
