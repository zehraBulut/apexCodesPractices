import { LightningElement } from 'lwc';
export default class A07ArabaCOMPOSITION extends LightningElement {
 

    value1 = '';
    get arabalar() {
        return [
            { label: 'Opel', value: 'Opel' },
            { label: 'Toyota', value: 'Toyota' },
            { label: 'Jip', value: 'Jip' },
            { label: 'Honda', value: 'Honda' },
        ]
    }

    handleAraba(event) {
        this.value1 = event.detail.value;
    }

   
    value2 = '';
    get motorCinsi() {
        return [
            { label: 'V tipi', value: 'V' },
            { label: 'Duz', value: 'Duz' },
            { label: 'Boksor', value: 'Boksor' },
            { label: 'W tipi', value: 'W' },
        ]
    }
    handleMotorCinsi(event) {
        this.value2 = event.detail.value;
    }




    
    value3 = '';
    get motorHacmi() {
        return [
            { label: 'Buyuk Motor', value: 'Buyuk Motor' },
            { label: 'Kucuk Motor', value: 'Kucuk Motor' },
        ]
    }
    handleMotorHacmi(event) {
        this.value3 = event.detail.value;
    }



    value4 = '';
    get motorGucu() {
        return [
            { label: 'Icten Yanmali', value: 'Icten Yanmali' },
            { label: 'Distan Yanmali', value: 'Distan Yanmali' },          
        ]
    }
    handleMotorGucu(event) {
        this.value4 = event.detail.value;
    }





   
    value5 = '';
    get yakitTuru() {
        return [
            { label: 'benzin', value: 'Benzin' },
            { label: 'Dizel', value: 'Dizel' },
            { label: 'Elektrik', value: 'Elektrik' },
            { label: 'Lpg', value: 'Lpg' },
        ]
    }
    handleYakitTuru(event) {
        this.value5 = event.detail.value;
    }

}
