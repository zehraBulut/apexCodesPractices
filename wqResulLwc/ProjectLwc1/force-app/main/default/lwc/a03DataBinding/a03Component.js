import { LightningElement } from 'lwc';

export default class A03Component extends LightningElement {


    name='DESTİNA'
    
    ad='Sukufe'
    handleIsim(event){
    this.ad=event.target.value
    console.log('RENDER EDILDI')
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

//******************************************************** */

sayi1=0
handleNum1(event){

    this.sayi1 = event.target.value
}

sayi2=0
handleNum2(event){
    this.sayi2 = event.target.value

}
sayiToplam=0
get toplam(){

this.sayiToplam= parseInt(this.sayi1) + parseInt(this.sayi2)
return this.sayiToplam

}

    }

