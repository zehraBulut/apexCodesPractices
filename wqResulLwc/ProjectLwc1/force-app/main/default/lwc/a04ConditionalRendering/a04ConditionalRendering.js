import { LightningElement } from 'lwc';

export default class A04ConditionalRendering extends LightningElement {
   //Conditional Rendering
        flag=false
     handleCheckbox(event){
     this.flag = event.target.checked
    }
//******************************************************************* */
   //Conditional Rendering PAROLA ornegi
  //parola --> elma

  bayrak = 'false';
  password = 'elma';

  handleInput(event){
 this.password=event.target.value;

     if(this.password === 'elma'){
     this.bayrak = true;

     } else{
        this.bayrak = false;

     }
     
    

    }
//********************************************************** */

}





