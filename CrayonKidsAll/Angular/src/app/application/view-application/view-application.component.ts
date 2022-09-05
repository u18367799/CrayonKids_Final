import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { ApplicationService } from 'src/app/services/application.service';
import { ParentService } from 'src/app/services/parent.service';
import { StudentService } from 'src/app/services/student.service';
import { UserService } from 'src/app/services/user.service';
import { Parent } from 'src/app/shared/parent';
import { SchoolFees } from 'src/app/shared/school-fees';
import { Student } from 'src/app/shared/student';
import { User } from 'src/app/shared/user';
import Swal from 'sweetalert2';

@Component({
  selector: 'app-view-application',
  templateUrl: './view-application.component.html',
  styleUrls: ['./view-application.component.scss']
})
export class ViewApplicationComponent implements OnInit {
  application: any;
  parentData: Parent;
  studentData: Student;
  feesData: SchoolFees;
  userData: User;
  pName;
  pSurname;
  pContact;
  pEmail;

	constructor(private applicationService: ApplicationService, private parentService: ParentService, private studentService: StudentService, private userService: UserService, private router: Router) {}

  ngOnInit(): void {
    this.getApplication();
    this.initialiseParentForm();
    this.initialiseUserForm();
    this.initialiseStudentForm();
    // this.initialiseFeesForm();
  }
  getApplication(){
    this.applicationService
    .getApplication()
    .then((res) => {
      (this.application = res as string[])
      this.pName = this.application.Parent_Name
      this.pSurname = this.application.Parent_Surname
      this.pContact = this.application.Parent_Contact_No
      this.pEmail = this.application.Parent_Email
    });
  }

  initialiseParentForm() {
    this.parentData = {
      Parent_Guardian_ID: 0,
      Application_ID: localStorage['Application_ID'],
      Parent_Name: '',
      Parent_Surname: '',
      Parent_Contact_No: '',
      Parent_Email_Address: '',
      User_ID: 0
    };
  }

  initialiseStudentForm() {
    this.studentData = {
      Student_ID: 0,
      Student_Name: '',
      Student_Surname: '',
      Student_Grade: 0,
      Parent_Guardian_ID: 0
    };
  }
  initialiseFeesForm(){
    this.feesData = {
      School_Fees_ID: 0,
      Student_ID:  0,
      Fee_Amount:  0,
      Amount_Outstanding:  0,
      Last_Payment:  0,
    }
  }

  initialiseUserForm() {
    this.userData = {
      User_ID: 0,
      User_Type_ID: 2,
      Username: '',
      Password: '123'
    };
  }

  registerUser(){
    this.userService.registerUser(this.userData).subscribe((res) => {
      console.log(res)
      })  }

  addParent(){
    this.parentService
    .addParent(this.parentData)
    .subscribe((res) => {
      console.log(res)            
    });
  }
  addStudent(){
    this.studentService
    .addStudent(this.studentData)
    .subscribe((res) => { 
      console.log(res)      
    });
  }
  addFees(){
    this.parentService.addSchoolFee(this.feesData).subscribe(res => {console.log(res)})
  }

 async register(){
   await this.userService.registerUser(this.userData).subscribe((res) => {
    console.log(res)
    });
 
    await this.parentService
    .addParent(this.parentData)
    .subscribe((res) => {
      console.log(res)            
    });
    // await this.studentService
    // .addStudent(this.studentData)
    // .subscribe((res) => { 
    //   console.log(res)      
    // });


    this.successfullAdd() 
  }


  onSubmit() {
    console.log(this.pName)
    //parent
    // this.parentData.User_ID = this.userData.User_ID;
    this.parentData.Parent_Name = this.pName;
    this.parentData.Parent_Surname = this.pSurname;
    this.parentData.Parent_Contact_No = this.pContact;
    this.parentData.Parent_Email_Address = this.pEmail;
    //user
    this.userData.Username = this.pEmail
    //student
    this.studentData.Student_Name = this.application.Student_Name;
    this.studentData.Student_Surname = this.application.Student_Surname;
    this.studentData.Student_Grade = this.application.Student_Grade;
    //school fees
    // this.feesData.Fee_Amount = 8000

    this.register()
    // this.registerUser();
    // this.addStudent()
    // this.addParent();
  

  }
  successfullAdd(){  
    Swal.fire(
      'Success!',
      'Added Successfully!',
     
    )  
  }

  registerParent(){  
    Swal.fire(
      'Success!',
      'Added Successfully!',
     
    ).then(res => this.addStudent())  
  }


}
