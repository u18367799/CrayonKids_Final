import { Component, OnInit } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { Router } from '@angular/router';
import Swal from 'sweetalert2';
import { Menu_ItemService } from 'src/app/services/menu-item.service';
import { Menu_Item } from 'src/app/shared/menu-item';

@Component({
  selector: 'app-add-menu_item-details',
  templateUrl: './add-menu-item.component.html',
  styleUrls: ['./add-menu-item.component.scss']
})
export class AddMenu_ItemComponent implements OnInit {

  menu_itemData: Menu_Item
  menu_itemList: Menu_Item[];
  addUpdate;
  menu_itemForm: FormGroup;

  
  constructor(private menu_itemService: Menu_ItemService, private router: Router) { }

  ngOnInit(): void {
    this.initialiseForm()
    this.menu_itemForm = new FormGroup({  
      description: new FormControl(''),
      purchased: new FormControl(''),    
         
    }
    )
  }

  public hasError = (controlName: string, errorName: string) => {
    return this.menu_itemForm.controls[controlName].hasError(errorName);
  }
  
  initialiseForm() {
    this.menu_itemData = {
      Menu_Item_ID: 0,
      Menu_Item_Description: '',
      Menu_Items_Purchased: 0,
      Menu_Item_Purchase_Date:new Date() ,
      
    };
    this.menu_itemList = [];
    this.addUpdate = 'Add menu_item';
  }


  onSubmit() {
    if (this.menu_itemData. Menu_Item_ID === 0) {
      this.menu_itemService
        .addMenu_Item(this.menu_itemData)
        .subscribe((res) => {
          this.initialiseForm(); 
          this.successfullAdd()        
        });
    } else {
      this.menu_itemService
        .updateMenu_Item(this.menu_itemData)
        .subscribe((res) => {
          this.initialiseForm();
        });
    }

  }
  successfullAdd(){  
    Swal.fire(
      'Success!',
      'Added Successfully!',
     
    ).then(res => this.router.navigate(['/menu_itemlist']))   
  }



}
