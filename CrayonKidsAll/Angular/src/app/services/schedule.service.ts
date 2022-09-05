import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import {Schedule} from '../shared/schedule';

@Injectable({
  providedIn: 'root'
})
export class ScheduleService {
  url = "https://localhost:44365/api";  //copy and paste the new api address

  scheduleData: Schedule
  constructor(private http: HttpClient) { }

  getSchedule() {
    return this.http.get(this.url+ '/Schedules/getSchedules').toPromise();
  }

  addSchedule(obj: Schedule) {
    return this.http.post(this.url + '/Schedules', obj);
  }

  updateSchedule(obj: Schedule) {
    return this.http.put(this.url+ '/Schedules/' + localStorage['Schedule_ID'], obj);
  }

  deleteSchedule(id: number) {
    return this.http.delete(this.url + '/Schedules/' + localStorage['Schedule_ID']);
  }
  viewSchedule(id: string) {
    return this.http.get(this.url + '/Schedules/' + id);
  }
}
