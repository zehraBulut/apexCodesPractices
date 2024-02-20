import { LightningElement } from 'lwc';

export default class MyComponent extends LightningElement {
  
    result;
  
    connectedCallback() {
    const paragraph = this.template.querySelector('#my-paragraph');
    this.result=paragraph;
  }
}