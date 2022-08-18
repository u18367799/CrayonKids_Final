import { Component, OnInit } from '@angular/core';
import { MatTableDataSource } from '@angular/material/table';
import { Router } from '@angular/router';
import Swal from 'sweetalert2';
import { Menu_ItemService } from '../services/menu-item.service';
import { Menu_Item } from '../shared/menu-item';



@Component({
  selector: 'app-menu_Item',
  templateUrl: './menu-Item.component.html',
  styleUrls: ['./menu-Item.component.css']
})
export class Menu_ItemComponent implements OnInit {


  menu_Item: any; 
  menu_ItemData: Menu_Item

  public displayedColumns = ['Menu_Item_Description', 'Menu_Items_Purchased', 'Menu_Item_Purchase_Date', 'update', 'delete'];
  public dataSource = new MatTableDataSource<Menu_Item>();
	constructor(private menu_ItemService: Menu_ItemService, private router: Router) {}
  
 

	 ngOnInit(): void{ 
    this.getMenu_Items();

  }
  getMenu_Items(){
    this.menu_ItemService
    .getMenu_Item()
    .then((res) => {(this.dataSource.data = res as Menu_Item[]), console.log(this.dataSource.data)});
  }
  search(event: Event) {
    this.dataSource.filter = (event.target as HTMLInputElement).value
  }
  deleteMenu_Item(){
    this.menu_ItemService.deleteMenu_Item(localStorage['Menu_Item_ID']).subscribe((res) => {
      location.reload()
    })
  }
  getID(id){
    localStorage['Menu_Item_ID'] = id
    this.confirmDelete(id)
  }
  setEditID(id){
    localStorage['Menu_Item'] = id
    this.router.navigate(["/updatemenu_Item/" +id]);
  }

  editMenu_Item(id: number,p: Menu_Item) {
    this.menu_ItemService.menu_ItemData = p;
    localStorage['Menu_Item_ID'] = id
    this.router.navigate(["/updatemenu_Item/" +id]);
    
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
        this.menu_ItemService.deleteMenu_Item(id).subscribe((res) => {
          this.deleteMenu_Item()
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
