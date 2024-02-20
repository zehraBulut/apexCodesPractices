import { LightningElement, api , track} from 'lwc';
export default class A09trackDecoratorObject extends LightningElement {

   @api ad='Destina'
   @api soyad='Ozgur'   
   @api age= 18

   @track
   fullIsim = {
     name: 'Noooruyonn',
       lastName: 'Hatcee',
       age:18
 }

    handleIsim(event){
    this.ad= event.target.value
    this.fullIsim.name= event.target.value

    }

    handleSoyIsim(event){
    this.soyad= event.target.value
    this.fullIsim.lastName= event.target.value
   
    }

    handleAge(event){
   this.age= event.target.value
   this.fullIsim.age= event.target.value

    }

  }
