   //Conditional Rendering PAROLA ornegi
  //parola --> elma

  //CODE:
  import { LightningElement } from 'lwc';
  export default class A04ConditionalRendering extends LightningElement {
    bayrak = false;
    parola = 'elma';
    handleInput(event){
   this.parola=event.target.value;
       if(this.parola ==='elma'){
       this.bayrak = true;
       }else{
       this.bayrak = false;
         }
      }
  }
  