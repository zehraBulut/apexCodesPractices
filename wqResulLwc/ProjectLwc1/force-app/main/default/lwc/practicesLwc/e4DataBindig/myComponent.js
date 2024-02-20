import { LightningElement } from 'lwc';
export default class A03Component extends LightningElement {
    name='DESTİNA'
    ad='Sukufe'
    handleIsim(event){
    this.ad=event.target.value
    }
    fullIsim =" "
    ilkIsim =' ';
    handleFirstName(event){
     this.ilkIsim=event.target.value  
    }
    sonIsim=' ';
    handleLastName(event){
        this.sonIsim=event.target.value           
    }
  get tumIsim(){
this.fullIsim=this.ilkIsim.toUpperCase() + ' ' + this.sonIsim.toUpperCase()
return this.fullIsim
  }
}




