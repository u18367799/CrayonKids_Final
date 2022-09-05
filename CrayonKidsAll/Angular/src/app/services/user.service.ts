import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { environment } from 'src/environments/environment';
import { User } from '../shared/user';
const httpOptions = {
  headers: new HttpHeaders({
    'Content-Type':  'application/json',
    "Access-Control-Allow-Origin": '*'
  })
};

const httpText = {
  headers: new HttpHeaders({
    'Content-Type':  'text/plain',
    "Access-Control-Allow-Origin": '*'
  })
};

@Injectable({
  providedIn: 'root'
})
export class UserService {

  constructor(private http : HttpClient) { }

  public registerUser(obj: User){
    return this.http.post<User>(environment.url + '/User/registerNewUser',obj,httpOptions);
  }
  public LoginParent(user : User) {
    return this.http.post<User>(environment.url + '/ParentLogin',user, httpOptions);
  }
}
