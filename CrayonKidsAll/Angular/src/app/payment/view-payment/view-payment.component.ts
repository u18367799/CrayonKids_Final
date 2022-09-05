import { Component, OnInit } from '@angular/core';
import { MatTableDataSource } from '@angular/material/table';
import { Router } from '@angular/router';
import { ParentService } from 'src/app/services/parent.service';
import { Payment } from 'src/app/shared/payment';

@Component({
  selector: 'app-view-payment',
  templateUrl: './view-payment.component.html',
  styleUrls: ['./view-payment.component.scss']
})
export class ViewPaymentComponent implements OnInit {


  paymentData: Payment

  
  Student: any; 
  // studentData: Student

  public displayedColumns = ['Payment ID', 'Payment Date', 'view'];
  public dataSource = new MatTableDataSource<Payment>();
  constructor(private parentService: ParentService, private router: Router) { }

  ngOnInit(): void {
    this.getPayments()
  }
  getPayments(){
    this.parentService
    .viewPayment()
    .subscribe((res) => {(this.dataSource.data = res as Payment[]), console.log(this.dataSource.data), this.Student = res[0].Student_ID});
  }

  setID(id){
    localStorage['Payment_ID'] = id
    this.router.navigate(["/viewpoppdf/" +id]);
  }

}
