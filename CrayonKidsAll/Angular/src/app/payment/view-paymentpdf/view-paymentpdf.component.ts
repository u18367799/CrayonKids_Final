import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { ParentService } from 'src/app/services/parent.service';
import { Payment } from 'src/app/shared/payment';

@Component({
  selector: 'app-view-paymentpdf',
  templateUrl: './view-paymentpdf.component.html',
  styleUrls: ['./view-paymentpdf.component.scss']
})
export class ViewPaymentpdfComponent implements OnInit {
  payment;

  constructor(private parentService: ParentService, private router: Router) { }

  ngOnInit(): void {
    this.getPayment()
  }
  getPayment(){
    this.parentService
    .viewPaymentpdf()
    .subscribe((res) => {(this.payment = res as string[]), console.log(this.payment)});
  }

 
}
