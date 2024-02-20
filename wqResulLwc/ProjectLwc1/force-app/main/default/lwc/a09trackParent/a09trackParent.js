import { LightningElement } from 'lwc';

export default class Ao0trackParent extends LightningElement {

isim=''
soyIsim=''


handleIsim(event){
this.isim=event.target.value
//this.fullIsim=event.target.value

}

handleSoyIsim(event){
    this.soyIsim= event.target.value
}




}