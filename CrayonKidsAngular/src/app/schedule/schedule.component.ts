import { Component, OnInit } from '@angular/core';
import { MatTableDataSource } from '@angular/material/table';
import { Router } from '@angular/router';
import { ScheduleService } from 'src/app/services/schedule.service';
import { Schedule } from 'src/app/shared/schedule';
import Swal from 'sweetalert2';

@Component({
  selector: 'app-schedule',
  templateUrl: './schedule.component.html',
  styleUrls: ['./schedule.component.scss']
})
export class ScheduleComponent implements OnInit {

  
  schedule: any;
  scheduleData: Schedule


  public displayedColumns = ['Schedule_ID', 'Schedule_Details', 'Event_Date', 'update', 'delete'];
  public dataSource = new MatTableDataSource<Schedule>();
	constructor(private scheduleService: ScheduleService, private router: Router) {}

  ngOnInit(): void {
    this.getSchedules();
  }

  getSchedules(){
    this.scheduleService
    .getSchedule()
    .then((res) => {(this.dataSource.data = res as Schedule[]), console.log(this.dataSource.data)});
  }
  search(event: Event) {
    this.dataSource.filter = (event.target as HTMLInputElement).value
  }
  deleteSchedule(){
    this.scheduleService.deleteSchedule(localStorage['Schedule_ID']).subscribe((res) => {
      location.reload()
    })
  }
  getID(id){
    localStorage['Schedule_ID'] = id
    this.confirmDelete(id)
  }
  setEditID(id){
    localStorage['Schedule'] = id
    this.router.navigate(["/updateschedule/" +id]);
  }
  editSchedule(id: number,p: Schedule) {
    this.scheduleService.scheduleData = p;
    localStorage['Schedule_ID'] = id
    this.router.navigate(["/updateschedule/" +id]);
    
  }

  confirmDelete(id: number) {
    Swal.fire({
      title: 'Are you sure you want to delete this record?',
      showCancelButton: true,
      confirmButtonColor: '#3085d6',
      cancelButtonColor: '#d33',
      confirmButtonText: 'Delete'
    }).then((result) => {
      if (result.isConfirmed) {
        this.scheduleService.deleteSchedule(id).subscribe((res) => {
          this.deleteSchedule()
          Swal.fire(
            'Deleted!',
            'The record has been deleted.',
            'success'
          ).then(res => location.reload())
        },
        (error) => {

          console.log(error)
        });
      }
    })
   
  }
}
