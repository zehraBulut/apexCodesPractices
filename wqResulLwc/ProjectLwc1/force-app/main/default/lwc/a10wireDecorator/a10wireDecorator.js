import { LightningElement ,wire} from 'lwc';
import tumAccountlarGelsin from '@salesforce/apex/AccountController.getAllAccounts'
import filtreIleAcc from'@salesforce/apex/AccountController.accountFiltre'
import imperativeFiltre from'@salesforce/apex/AccountController.accountFiltreImperative'
export default class A10wireDecorator extends LightningElement {
 

//xxxx= js de method ismidir sen koy
 @wire(tumAccountlarGelsin) //Wiring the Output of Apex method to a property
 armut;


//filtre ile liste getırmek 1.yontem
//parametre gondermek ıcn {} ekle

 filtre= 'xxxxxxx'

handleAccount(event){
    this.filtre= event.target.value
}
@wire(filtreIleAcc , {accIsim : '$filtre' })
 filtreIleAccountListesi;

 


//filtre ıle liste getırmek 2.yontem
  filtreIki= 'xxxxxxx'

  handleAccountIki(event){
    this.filtreIki= event.target.value
}
    

  dataListesi
  hata

@wire(filtreIleAcc , {accIsim : '$filtreIki' })
 filtreIleAccountListesiIki( {data,error}){
 if(data){
    this.dataListesi = data
    this.hata= undefined
 }else if(error){
   this.dataListesi = undefined
   this.hata= error

 }
}

//imperative Yontem(wire kulanmıcaz, parameter kulanmalyz ama)

filtreImperative= 'xxxxxxx'
handleAccountImperative(event){
this.filtreImperative = event.target.value
}

imperativeListe
imperativeHata

handleAccountGetir(){
imperativeFiltre( {accIsim:this.filtreImperative})

.then((data)=>{
this.imperativeListe= data
this.imperativeHata= undefined
})

.catch((error)=>{
this.imperativeListe = undefined
this.imperativeHata = error

})

}

}