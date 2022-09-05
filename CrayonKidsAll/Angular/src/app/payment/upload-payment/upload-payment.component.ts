import { Component, OnInit } from '@angular/core';
import { ParentService } from 'src/app/services/parent.service';
import { Payment } from 'src/app/shared/payment';
import Swal from 'sweetalert2';

@Component({
  selector: 'app-upload-payment',
  templateUrl: './upload-payment.component.html',
  styleUrls: ['./upload-payment.component.scss']
})
export class UploadPaymentComponent implements OnInit {
  src = 'https://vadimdez.github.io/ng2-pdf-viewer/assets/pdf-test.pdf';

  paymentData: Payment
  constructor(private parentService: ParentService) { }

  ngOnInit(): void {
    this.initialiseForm()
  }

  initialiseForm() {
    this.paymentData = {
      Payment_ID: 0,
      Student_ID: localStorage['Student_ID'],
      Proof_Of_Payment: '',
      Payment_Date: new Date()
    };
  }

  onSubmit() {
    this.parentService
      .addPayment(this.paymentData)
      .subscribe((res) => {
        this.initialiseForm(); 
        this.successfullAdd()        
      });
}
public object: any = {};
file(i){
  if(i.files && i.files[0]){
    var r = new FileReader();
    r.onload = (e : any) => {
      console.log(e.target.result)
      this.paymentData.Proof_Of_Payment = e.target.result;

      this.object.url = e.target.result;
    }
    r.readAsDataURL(i.files[0]);
  }
}

successfullAdd(){  
  Swal.fire(
    'Success!',
    'POP uploaded successfully!',
   
  ).then(res => location.reload())   
}

}
