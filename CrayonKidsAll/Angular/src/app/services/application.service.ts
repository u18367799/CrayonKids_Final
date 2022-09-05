import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { environment } from 'src/environments/environment';
import { Application } from '../shared/application';

@Injectable({
  providedIn: 'root'
})
export class ApplicationService {

  constructor(private http: HttpClient) { }

  createApplication(obj: Application) {
    return this.http.post(environment.url + '/Applications', obj);
  }
  getApplications() {
    return this.http.get(environment.url+ '/GetApplications').toPromise();
  }
  getApplication() {
    return this.http.get(environment.url+ '/GetApplication/' + localStorage['Application_ID']).toPromise();
  }
}
