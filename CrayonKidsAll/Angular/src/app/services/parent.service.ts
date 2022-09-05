import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Parent } from '../shared/parent';
import { Payment } from '../shared/payment';
import { SchoolFees } from '../shared/school-fees';

@Injectable({
  providedIn: 'root'
})
export class ParentService {

  url = "https://localhost:44365/api";

  parentData: Parent
  constructor(private http: HttpClient) { }

  getParent() {
    return this.http.get(this.url+ '/Parent_Guardian').toPromise();
  }

  addParent(obj: Parent) {
    return this.http.post(this.url + '/Parent_Guardian', obj);
  }

  updateParent(obj: Parent) {
    return this.http.put(this.url+ '/Parent_Guardian/' + localStorage['Parent_Guardian_ID'], obj);
  }

  deleteParent(id: number) {
    return this.http.delete(this.url + '/Parent_Guardian/' + localStorage['Parent_Guardian_ID']);
  }
  viewParent(id: string) {
    return this.http.get(this.url + '/Parent_Guardian/' + id);
  }

  //Payment
  addPayment(obj: Payment) {
    return this.http.post(this.url + '/Payments', obj);
  }

   //School Fees
   addSchoolFee(obj: SchoolFees) {
    return this.http.post(this.url + '/School_Fees', obj);
  }
  viewPayment() {
    return this.http.get(this.url + '/getPayments/' + localStorage['Student_ID']);
  }
  
  viewPaymentpdf() {
    return this.http.get(this.url + '/Payments/' + localStorage['Payment_ID']);
  }

}
