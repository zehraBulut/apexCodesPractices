import { LightningElement } from 'lwc';
export default class A12get extends LightningElement {
//variable ile olusturdum
sayi1=2
sayi2=3
toplam= this.sayi1 + this.sayi2

//get method ıle olusturdm
get toplamGet(){
return this.sayi1 + this.sayi2
}

//array olustur sımdıde
isimler=['ayse','fatma','resul','ali']
secilenIsim= this.isimler[0]



//get ile array olustur(bu code ılede aynı sonucu alrsn)
isimler=['ayse','fatma','resul','ali']
get secilenIsimGet(){
return this.secilenIsim
}


//input ile isim ekranda gosterıcem
girilenIndex =0

handleIndex(event){
this.girilenIndex= parseInt(event.target.value)
}
secilenIsimFiltre= this.isimler[this.girilenIndex]

//GET -  input ile isim ekranda gostericem(get ıle herzaman calısır ama dgerı ıle calısmaz)
get secilenIsimFiltreGet(){
if(this.girilenIndex < this.isimler.length){
return this.isimler[this.girilenIndex]
}else{
window.alert('buyuk rakam girdin') //return 'yanlis secim' dıyedebılırsın ama eror mesajı dha orjınal
}

}









}