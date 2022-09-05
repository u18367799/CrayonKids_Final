import { Component, OnInit } from '@angular/core';
import { MatTableDataSource } from '@angular/material/table';
import { Router } from '@angular/router';
import { ParentService } from 'src/app/services/parent.service';
import { StudentService } from 'src/app/services/student.service';
import { Payment } from 'src/app/shared/payment';
import { Student } from 'src/app/shared/student';

@Component({
  selector: 'app-payments',
  templateUrl: './payments.component.html',
  styleUrls: ['./payments.component.scss']
})
export class PaymentsComponent implements OnInit {

  paymentData: Payment

  
  Student: any; 
  // studentData: Student

  public displayedColumns = ['Name', 'Surname', 'Grade', 'view'];
  public dataSource = new MatTableDataSource<Student>();
  constructor(private parentService: ParentService, private studentService: StudentService,private router: Router) { }

  ngOnInit(): void {
    this.getStudents()
  }
  getStudents(){
    this.studentService
    .getStudents()
    .then((res) => {(this.dataSource.data = res as Student[]), console.log(this.dataSource.data)});
  }

  setID(id){
    localStorage['Student_ID'] = id
    this.router.navigate(["/viewpop/" +id]);
  }

}
