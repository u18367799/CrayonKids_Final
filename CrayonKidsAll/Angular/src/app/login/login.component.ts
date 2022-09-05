import { Component, OnInit } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { ActivatedRoute, Router } from '@angular/router';
import Swal from 'sweetalert2';
import { UserService } from '../services/user.service';
import { User } from '../shared/user';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.scss']
})
export class LoginComponent implements OnInit {
  userForm: FormGroup;
  userData: User;


  public username = "";
  public password = "";

  // username : string;
  // password : string;

  constructor(private userService: UserService, private router:Router) { }

  userObj = new User;
  succLogin = false;
  emptyUSR=false;
  emptyPSR=false;
  invPass = false;
  ee:boolean;
  loggednIn : Object=null;


  ngOnInit() {
  }  

  login()
  {
   
    this.userObj.Username = this.username;
    this.userObj.Password = this.password;
    console.log(JSON.stringify(this.userObj));
    
    console.log(JSON.stringify(this.userObj))
    this.userService.LoginParent(this.userObj).subscribe((response: any)=> {
      if(response.Message){
        this.succLogin=false;
        this.emptyPSR=false;
        this.emptyUSR=false;
        if(this.password=="" && this.username=="")
        {
          this.emptyPSR=true;
          this.emptyUSR=true;
          this.error()
          return;
        }
        if(this.username=="")
        {
          this.emptyUSR=true;
          this.error()
          return;
        }
        if(this.password=="")
        {
          this.emptyPSR=true;
          this.error()
          return;
        }
    else
    this.error()
      }
      else{
        this.loggednIn = response
        this.router.navigate(['/employeelist'])
        localStorage.setItem('ParentLoggedIn', 'ParentLoggedIn')
      }
      localStorage['Parent_Guardian_ID'] = response['Parent_Guardian_ID']
      localStorage['Parent_Name'] = response['Parent_Name']
      localStorage['Parent_Surname'] = response['Parent_Surname']
      console.log(response);
    })  

  }

  error(){  
    Swal.fire(
      'Error!',
      'Invalid User Credentials',
     
    )  
  }

}



