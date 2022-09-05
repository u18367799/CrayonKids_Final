import { Component, OnInit } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { Router } from '@angular/router';
import Swal from 'sweetalert2';
import { ApplicationService } from '../services/application.service';
import { Application } from '../shared/application';

@Component({
  selector: 'app-application',
  templateUrl: './application.component.html',
  styleUrls: ['./application.component.scss']
})
export class ApplicationComponent implements OnInit {

  applicationData: Application
  // parentList: Parent[];
  addUpdate;
  applicationForm: FormGroup;
  studentForm: FormGroup;
  
  constructor(private applicationService: ApplicationService, private router: Router) { }

  ngOnInit(): void {
    this.initialiseForm()
    this.applicationForm = new FormGroup({  
      Name: new FormControl('', [Validators.required, Validators.maxLength(50), Validators.pattern(/^[A-Za-z]+$/)]),
      surname: new FormControl('', [Validators.required, Validators.maxLength(50), Validators.pattern(/^[A-Za-z]+$/)]),    
      email: new FormControl('', [Validators.required, Validators.email]),
      contactNr: new FormControl('', [Validators.required, Validators.pattern("^[0-9]*$")]),      
      SName: new FormControl('', [Validators.required, Validators.maxLength(50), Validators.pattern(/^[A-Za-z]+$/)]),
      Ssurname: new FormControl('', [Validators.required, Validators.maxLength(50), Validators.pattern(/^[A-Za-z]+$/)]),    
      grade: new FormControl('', [Validators.required, Validators.max(100), Validators.min(0)]), 
    }
    );
    
  }

  
  initialiseForm() {
    this.applicationData = {
      Application_ID : 0,
      Application_Status_ID: 1,
      Application_Date : new Date(),
      Parent_Name : '',
      Parent_Surname:'',
      Parent_Contact_No: '',
      Parent_Email: '',
      Student_Name: '',
      Student_Surname: '',
      Student_Grade: 0
    };
  }


  onSubmit() {
      this.applicationService
        .createApplication(this.applicationData)
        .subscribe((res) => {
          this.initialiseForm(); 
          this.successfullAdd()        
        });


  }
  successfullAdd(){  
    Swal.fire(
      'Success!',
      'Application has been created!',
     
    ).then(res => location.reload())   
  }



}

