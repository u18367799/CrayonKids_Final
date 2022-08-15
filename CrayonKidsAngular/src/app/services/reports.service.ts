import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { environment } from 'src/environments/environment';

@Injectable({
  providedIn: 'root'
})
export class ReportsService {

  constructor(private http: HttpClient) { }

  getStudentNumbers() {
    return this.http.get('https://localhost:44365/api/Student_Numbers/getStudentNumbers'
      )
  }
  getEmployees(date) {
    return this.http
      .post(
        'https://localhost:44365/api/EmployeeReport/getEmployees/', date
      )
      
  }
  getMenuItems(date) {
    return this.http
      .post(
        'https://localhost:44365/api/Menu_Report/getMenuItems/', date
      )
      
  }
}
