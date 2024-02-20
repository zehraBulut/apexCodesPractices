import { LightningElement } from 'lwc';
export default class breakExample extends LightningElement {
        loopOutput = '';
        handleLoop() {
          for (let i = 0; i < 10; i++) {
            if (i === 3) {
              break;
            }
            this.loopOutput += `The number is ${i}<br>`;
    }
       }
    }
