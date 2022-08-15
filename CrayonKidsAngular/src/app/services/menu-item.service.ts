import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Menu_Item } from '../shared/menu-item';

@Injectable({
  providedIn: 'root'
})
export class Menu_ItemService {

  url = "https://localhost:44365/api";

  parentData: Menu_Item
  menu_ItemData: Menu_Item;
  constructor(private http: HttpClient) { }

  getMenu_Item() {
    return this.http.get(this.url+ '/Menu_Item').toPromise();
  }

  addMenu_Item(obj: Menu_Item) {
    return this.http.post(this.url + '/Menu_Item', obj);
  }

  updateMenu_Item(obj: Menu_Item) {
    return this.http.put(this.url+ '/Menu_Item/' + localStorage['Menu_Item_ID'], obj);
  }

  deleteMenu_Item(id: number) {
    return this.http.delete(this.url + '/Menu_Item/' + localStorage['Menu_Item_ID']);
  }
  viewMenu_Item(id: string) {
    return this.http.get(this.url + '/Menu_Item/' + id);
  }

}
