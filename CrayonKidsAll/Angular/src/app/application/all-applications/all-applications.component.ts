import { Component, OnInit } from '@angular/core';
import { MatTableDataSource } from '@angular/material/table';
import { Router } from '@angular/router';
import { ApplicationService } from 'src/app/services/application.service';
import { Application } from 'src/app/shared/application';
import { Parent } from 'src/app/shared/parent';

@Component({
  selector: 'app-all-applications',
  templateUrl: './all-applications.component.html',
  styleUrls: ['./all-applications.component.scss']
})
export class AllApplicationsComponent implements OnInit {

  application: any; 
  applicationData: Application

  public displayedColumns = ['Application Number', 'Date', 'Student Name', 'Student Surname', 'Grade', 'Status', 'View'];
  public dataSource = new MatTableDataSource<Application>();
	constructor(private applicationService: ApplicationService, private router: Router) {}

	 ngOnInit(): void{ 
    this.getParents();

  }
  getParents(){
    this.applicationService
    .getApplications()
    .then((res) => {(this.dataSource.data = res as Application[]), console.log(this.dataSource.data)});
  }
  search(event: Event) {
    this.dataSource.filter = (event.target as HTMLInputElement).value
  }

  getID(id){
    localStorage['Application_ID'] = id
    this.router.navigate(['/viewapplication'])
  }


  

}


